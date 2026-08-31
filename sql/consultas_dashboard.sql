/* ============================================================
   1. CARDS PRINCIPAIS
   ============================================================ */

SELECT
    'Internações em 2025' AS titulo,
    TO_CHAR(
        SUM(INTERNACOES_2025),
        'FM999G999G999G990',
        'NLS_NUMERIC_CHARACTERS='',.'''
    ) AS valor
FROM ADMIN.V_DASHBOARD_REGIOES_SAUDE

UNION ALL

SELECT
    'Leitos SUS' AS titulo,
    TO_CHAR(
        SUM(TOTAL_LEITOS_SUS),
        'FM999G999G999G990',
        'NLS_NUMERIC_CHARACTERS='',.'''
    ) AS valor
FROM ADMIN.V_DASHBOARD_REGIOES_SAUDE

UNION ALL

SELECT
    'UTIs SUS' AS titulo,
    TO_CHAR(
        SUM(TOTAL_UTI_SUS),
        'FM999G999G999G990',
        'NLS_NUMERIC_CHARACTERS='',.'''
    ) AS valor
FROM ADMIN.V_DASHBOARD_REGIOES_SAUDE

UNION ALL

SELECT
    'Cobertura de UTIs SUS' AS titulo,
    TO_CHAR(
        ROUND(AVG(UTIS_SUS_POR_100K_HAB), 1),
        'FM999G990D0',
        'NLS_NUMERIC_CHARACTERS='',.'''
    ) || ' / 100 mil hab.' AS valor
FROM ADMIN.V_DASHBOARD_REGIOES_SAUDE

UNION ALL

SELECT
    'População analisada' AS titulo,
    TO_CHAR(
        SUM(POPULACAO_TOTAL),
        'FM999G999G999G990',
        'NLS_NUMERIC_CHARACTERS='',.'''
    ) AS valor
FROM ADMIN.V_DASHBOARD_REGIOES_SAUDE

UNION ALL

SELECT
    'Leitos existentes' AS titulo,
    TO_CHAR(
        SUM(TOTAL_LEITOS_EXISTENTES),
        'FM999G999G999G990',
        'NLS_NUMERIC_CHARACTERS='',.'''
    ) AS valor
FROM ADMIN.V_DASHBOARD_REGIOES_SAUDE;


/* ============================================================
   2. GRÁFICO - INTERNAÇÕES POR REGIÃO DE SAÚDE
   ============================================================ */

SELECT
    REGIAO_SAUDE AS REGIAO,
    SUM(INTERNACOES_2025) AS INTERNACOES
FROM ADMIN.V_DASHBOARD_REGIOES_SAUDE
GROUP BY REGIAO_SAUDE
ORDER BY INTERNACOES DESC;


/* ============================================================
   3. GRÁFICO - LEITOS SUS X UTIs SUS
   ============================================================ */

SELECT
    REGIAO_SAUDE AS REGIAO,
    TOTAL_LEITOS_SUS AS LEITOS_SUS,
    TOTAL_UTI_SUS AS UTIS_SUS
FROM ADMIN.V_DASHBOARD_REGIOES_SAUDE
ORDER BY TOTAL_LEITOS_SUS DESC;


/* ============================================================
   4. GRÁFICO - COBERTURA DE UTIs SUS POR 100 MIL HABITANTES
   ============================================================ */

SELECT
    REGIAO_SAUDE AS REGIAO,
    UTIS_SUS_POR_100K_HAB AS COBERTURA
FROM ADMIN.V_DASHBOARD_REGIOES_SAUDE
ORDER BY COBERTURA DESC;


/* ============================================================
   5. GRÁFICO - INTERNAÇÕES POR LEITO SUS
   ============================================================ */

SELECT
    REGIAO_SAUDE AS REGIAO,
    PROP_INTERNACOES_POR_LEITO_SUS AS INTERNACOES_POR_LEITO
FROM ADMIN.V_DASHBOARD_REGIOES_SAUDE
ORDER BY INTERNACOES_POR_LEITO DESC;
