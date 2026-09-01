/* ============================================================
   ALGOMED - CRIAÇÃO DAS TABELAS PRINCIPAIS
   ============================================================ */


/* ============================================================
   TABELA: INTERNACOES
   ============================================================ */

CREATE TABLE ADMIN.INTERNACOES
(
    MUNICIPIO          VARCHAR2(4000),

    "2024_Jan"         NUMBER,
    "2024_Fev"         NUMBER,
    "2024_Mar"         NUMBER,
    "2024_Abr"         NUMBER,
    "2024_Mai"         NUMBER,
    "2024_Jun"         NUMBER,
    "2024_Jul"         NUMBER,
    "2024_Ago"         NUMBER,
    "2024_Set"         NUMBER,
    "2024_Out"         NUMBER,
    "2024_Nov"         NUMBER,
    "2024_Dez"         NUMBER,

    "2025_Jan"         NUMBER,
    "2025_Fev"         NUMBER,
    "2025_Mar"         NUMBER,
    "2025_Abr"         NUMBER,
    "2025_Mai"         NUMBER,
    "2025_Jun"         NUMBER,
    "2025_Jul"         NUMBER,
    "2025_Ago"         NUMBER,
    "2025_Set"         NUMBER,
    "2025_Out"         NUMBER,
    "2025_Nov"         NUMBER,
    "2025_Dez"         NUMBER,

    TOTAL              NUMBER,
    MUNICIPIO_LIMPO    VARCHAR2(200)
);


/* ============================================================
   TABELA: LEITOS_2024
   ============================================================ */

CREATE TABLE ADMIN.LEITOS_2024
(
    COMP                     NUMBER,
    REGIAO                   VARCHAR2(4000),
    UF                       VARCHAR2(4000),
    MUNICIPIO                VARCHAR2(4000),
    MOTIVO_DESABILITACAO     VARCHAR2(4000),
    CNES                     NUMBER,
    NOME_ESTABELECIMENTO     VARCHAR2(4000),
    RAZAO_SOCIAL             VARCHAR2(4000),
    TP_GESTAO                VARCHAR2(4000),
    CO_TIPO_UNIDADE          NUMBER,
    DS_TIPO_UNIDADE          VARCHAR2(4000),
    NATUREZA_JURIDICA        NUMBER,
    DESC_NATUREZA_JURIDICA   VARCHAR2(4000),
    NO_LOGRADOURO            VARCHAR2(4000),
    NU_ENDERECO              VARCHAR2(4000),
    NO_COMPLEMENTO           VARCHAR2(4000),
    NO_BAIRRO                VARCHAR2(4000),
    CO_CEP                   NUMBER,
    NU_TELEFONE              VARCHAR2(4000),
    NO_EMAIL                 VARCHAR2(4000),
    LEITOS_EXISTENTES        NUMBER,
    LEITOS_SUS               NUMBER,
    UTI_TOTAL_EXIST          NUMBER,
    UTI_TOTAL_SUS            NUMBER,
    UTI_ADULTO_EXIST         NUMBER,
    UTI_ADULTO_SUS           NUMBER,
    UTI_PEDIATRICO_EXIST     NUMBER,
    UTI_PEDIATRICO_SUS       NUMBER,
    UTI_NEONATAL_EXIST       NUMBER,
    UTI_NEONATAL_SUS         NUMBER,
    UTI_QUEIMADO_EXIST       NUMBER,
    UTI_QUEIMADO_SUS         NUMBER,
    UTI_CORONARIANA_EXIST    NUMBER,
    UTI_CORONARIANA_SUS      NUMBER
);


/* ============================================================
   TABELA: LEITOS_2025
   ============================================================ */

CREATE TABLE ADMIN.LEITOS_2025
(
    COMP                     NUMBER,
    REGIAO                   VARCHAR2(4000),
    UF                       VARCHAR2(4000),
    CO_IBGE                  NUMBER,
    MUNICIPIO                VARCHAR2(4000),
    MOTIVO_DESABILITACAO     VARCHAR2(4000),
    CNES                     NUMBER,
    NOME_ESTABELECIMENTO     VARCHAR2(4000),
    RAZAO_SOCIAL             VARCHAR2(4000),
    TP_GESTAO                VARCHAR2(4000),
    CO_TIPO_UNIDADE          NUMBER,
    DS_TIPO_UNIDADE          VARCHAR2(4000),
    NATUREZA_JURIDICA        NUMBER,
    DESC_NATUREZA_JURIDICA   VARCHAR2(4000),
    NO_LOGRADOURO            VARCHAR2(4000),
    NU_ENDERECO              VARCHAR2(4000),
    NO_COMPLEMENTO           VARCHAR2(4000),
    NO_BAIRRO                VARCHAR2(4000),
    CO_CEP                   NUMBER,
    NU_TELEFONE              VARCHAR2(4000),
    NO_EMAIL                 VARCHAR2(4000),
    LEITOS_EXISTENTES        NUMBER,
    LEITOS_SUS               NUMBER,
    UTI_TOTAL_EXIST          NUMBER,
    UTI_TOTAL_SUS            NUMBER,
    UTI_ADULTO_EXIST         NUMBER,
    UTI_ADULTO_SUS           NUMBER,
    UTI_PEDIATRICO_EXIST     NUMBER,
    UTI_PEDIATRICO_SUS       NUMBER,
    UTI_NEONATAL_EXIST       NUMBER,
    UTI_NEONATAL_SUS         NUMBER,
    UTI_QUEIMADO_EXIST       NUMBER,
    UTI_QUEIMADO_SUS         NUMBER,
    UTI_CORONARIANA_EXIST    NUMBER,
    UTI_CORONARIANA_SUS      NUMBER
);


/* ============================================================
   TABELA: MUNICIPIOS_SP_REGIOES_SAUDE
   ============================================================ */

CREATE TABLE ADMIN.MUNICIPIOS_SP_REGIOES_SAUDE
(
    MUNICIPIO      VARCHAR2(4000),
    POPULACAO      NUMBER,
    REGIAO_SAUDE   VARCHAR2(4000)
);


/* ============================================================
   TABELA: VALOR_MEDIO_INTERNACAO
   ============================================================ */

CREATE TABLE ADMIN.VALOR_MEDIO_INTERNACAO
(
    "Município"    VARCHAR2(4000),

    "2024_Jan"     VARCHAR2(4000),
    "2024_Fev"     VARCHAR2(4000),
    "2024_Mar"     VARCHAR2(4000),
    "2024_Abr"     VARCHAR2(4000),
    "2024_Mai"     VARCHAR2(4000),
    "2024_Jun"     VARCHAR2(4000),
    "2024_Jul"     VARCHAR2(4000),
    "2024_Ago"     VARCHAR2(4000),
    "2024_Set"     VARCHAR2(4000),
    "2024_Out"     VARCHAR2(4000),
    "2024_Nov"     VARCHAR2(4000),
    "2024_Dez"     VARCHAR2(4000),

    "2025_Jan"     VARCHAR2(4000),
    "2025_Fev"     VARCHAR2(4000),
    "2025_Mar"     VARCHAR2(4000),
    "2025_Abr"     VARCHAR2(4000),
    "2025_Mai"     VARCHAR2(4000),
    "2025_Jun"     VARCHAR2(4000),
    "2025_Jul"     VARCHAR2(4000),
    "2025_Ago"     VARCHAR2(4000),
    "2025_Set"     VARCHAR2(4000),
    "2025_Out"     VARCHAR2(4000),
    "2025_Nov"     VARCHAR2(4000),
    "2025_Dez"     VARCHAR2(4000),

    TOTAL          VARCHAR2(4000)
);


/* ============================================================
   TABELA: DATA_MEDIA_PERMANENCIA
   ============================================================ */

CREATE TABLE ADMIN.DATA_MEDIA_PERMANENCIA
(
    MUNICIPIO          VARCHAR2(4000),
    PERIODO            TIMESTAMP(6),
    MEDIA_PERMANENCIA  NUMBER
);
