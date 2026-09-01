CREATE OR REPLACE VIEW ADMIN.V_DASHBOARD_REGIOES_SAUDE AS
WITH

/* =========================================================
   POPULAÇÃO
   ========================================================= */
Populacao_Calculada AS (
    SELECT
        REGIAO_SAUDE,
        SUM(NVL(POPULACAO, 0)) AS POPULACAO_TOTAL
    FROM MUNICIPIOS_SP_REGIOES_SAUDE
    GROUP BY REGIAO_SAUDE
),

/* =========================================================
   LEITOS E UTIs
   SP + COMPETÊNCIA DEZ/2025
   ========================================================= */
Leitos_Calculados AS (
    SELECT
        R.REGIAO_SAUDE,
        SUM(NVL(L.LEITOS_EXISTENTES, 0)) AS TOTAL_LEITOS_EXISTENTES,
        SUM(NVL(L.LEITOS_SUS, 0)) AS TOTAL_LEITOS_SUS,
        SUM(NVL(L.UTI_TOTAL_EXIST, 0)) AS TOTAL_UTI_EXISTENTE,
        SUM(NVL(L.UTI_TOTAL_SUS, 0)) AS TOTAL_UTI_SUS
    FROM LEITOS_2025 L
    JOIN MUNICIPIOS_SP_REGIOES_SAUDE R
      ON REGEXP_REPLACE(
            TRANSLATE(
                UPPER(TRIM(L.MUNICIPIO)),
                'ÁÀÂÃÄÉÈÊËÍÌÎÏÓÒÔÕÖÚÙÛÜÇ',
                'AAAAAEEEEIIIIOOOOOUUUUC'
            ),
            '[^A-Z0-9]',
            ''
         )
       =
         REGEXP_REPLACE(
            TRANSLATE(
                UPPER(TRIM(R.MUNICIPIO)),
                'ÁÀÂÃÄÉÈÊËÍÌÎÏÓÒÔÕÖÚÙÛÜÇ',
                'AAAAAEEEEIIIIOOOOOUUUUC'
            ),
            '[^A-Z0-9]',
            ''
         )
    WHERE UPPER(TRIM(L.UF)) = 'SP'
      AND L.COMP = 202512
    GROUP BY R.REGIAO_SAUDE
),

/* =========================================================
   INTERNAÇÕES 2025
   ========================================================= */
Internacoes_Calculadas AS (
    SELECT
        R.REGIAO_SAUDE,
        SUM(
              NVL(I."2025_Jan", 0)
            + NVL(I."2025_Fev", 0)
            + NVL(I."2025_Mar", 0)
            + NVL(I."2025_Abr", 0)
            + NVL(I."2025_Mai", 0)
            + NVL(I."2025_Jun", 0)
            + NVL(I."2025_Jul", 0)
            + NVL(I."2025_Ago", 0)
            + NVL(I."2025_Set", 0)
            + NVL(I."2025_Out", 0)
            + NVL(I."2025_Nov", 0)
            + NVL(I."2025_Dez", 0)
        ) AS INTERNACOES_2025
    FROM INTERNACOES I
    JOIN MUNICIPIOS_SP_REGIOES_SAUDE R
      ON REGEXP_REPLACE(
            TRANSLATE(
                UPPER(TRIM(I.MUNICIPIO_LIMPO)),
                'ÁÀÂÃÄÉÈÊËÍÌÎÏÓÒÔÕÖÚÙÛÜÇ',
                'AAAAAEEEEIIIIOOOOOUUUUC'
            ),
            '[^A-Z0-9]',
            ''
         )
       =
         REGEXP_REPLACE(
            TRANSLATE(
                UPPER(TRIM(R.MUNICIPIO)),
                'ÁÀÂÃÄÉÈÊËÍÌÎÏÓÒÔÕÖÚÙÛÜÇ',
                'AAAAAEEEEIIIIOOOOOUUUUC'
            ),
            '[^A-Z0-9]',
            ''
         )
    GROUP BY R.REGIAO_SAUDE
)

/* =========================================================
   RESULTADO FINAL
   ========================================================= */
SELECT
    P.REGIAO_SAUDE,
    P.POPULACAO_TOTAL,

    NVL(L.TOTAL_LEITOS_EXISTENTES, 0) AS TOTAL_LEITOS_EXISTENTES,
    NVL(L.TOTAL_LEITOS_SUS, 0) AS TOTAL_LEITOS_SUS,
    NVL(L.TOTAL_UTI_EXISTENTE, 0) AS TOTAL_UTI_EXISTENTE,
    NVL(L.TOTAL_UTI_SUS, 0) AS TOTAL_UTI_SUS,

    NVL(I.INTERNACOES_2025, 0) AS INTERNACOES_2025,

    ROUND(
        NVL(I.INTERNACOES_2025, 0)
        / NULLIF(L.TOTAL_LEITOS_SUS, 0),
        2
    ) AS PROP_INTERNACOES_POR_LEITO_SUS,

    ROUND(
        (
            NVL(L.TOTAL_UTI_SUS, 0)
            / NULLIF(P.POPULACAO_TOTAL, 0)
        ) * 100000,
        2
    ) AS UTIS_SUS_POR_100K_HAB

FROM Populacao_Calculada P
LEFT JOIN Leitos_Calculados L
    ON P.REGIAO_SAUDE = L.REGIAO_SAUDE
LEFT JOIN Internacoes_Calculadas I
    ON P.REGIAO_SAUDE = I.REGIAO_SAUDE;
