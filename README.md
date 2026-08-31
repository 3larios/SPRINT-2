# Algomed

Projeto desenvolvido para o Challenge 2026 da FIAP.

O **Algomed** é uma solução voltada para análise de dados públicos de saúde, com foco em informações hospitalares, internações, leitos e UTIs.

A proposta é transformar dados técnicos e dispersos em informações mais acessíveis para análise, utilizando dashboards e consultas em linguagem natural com apoio de Inteligência Artificial.

## Objetivo

O principal objetivo do Algomed é facilitar a análise de dados de saúde pública, permitindo visualizar indicadores de forma simples e consultar informações sem a necessidade de conhecimento técnico em SQL.

A solução foi desenvolvida com foco em dados do estado de São Paulo.

## Funcionalidades

- Dashboard com indicadores de saúde
- Visualização de internações por região
- Comparação de leitos SUS e UTIs SUS
- Indicador de UTIs SUS por 100 mil habitantes
- Indicador de internações por leito SUS
- Consulta de dados por linguagem natural
- Assistente integrado ao Oracle Select AI

## Tecnologias Utilizadas

- Oracle Autonomous Database
- Oracle APEX
- Oracle Select AI
- Google Gemini
- SQL
- GitHub

## Fontes de Dados

Foram utilizadas bases públicas relacionadas à saúde, incluindo:

- SIH/SUS
- CNES
- Dados de internações hospitalares
- Dados de leitos hospitalares
- Dados de UTIs
- Dados populacionais
- Regiões de Saúde do Estado de São Paulo

## Arquitetura da Solução

O fluxo principal da solução segue a seguinte estrutura:

Dados públicos de saúde  
↓  
Tratamento e padronização dos dados  
↓  
Oracle Autonomous Database  
↓  
Tabelas e Views Analíticas  
↓  
Oracle APEX  
↓  
Dashboard Algomed

Além disso, a solução possui integração com IA:

Oracle Autonomous Database  
↓  
Oracle Select AI  
↓  
Google Gemini  
↓  
Assistente Algomed  
↓  
Consultas em linguagem natural

## Tratamento dos Dados

Durante o desenvolvimento foram realizadas etapas de preparação dos dados, como:

- Limpeza dos dados
- Padronização de nomes de municípios
- Tratamento de duplicidades
- Filtragem por competência
- Integração entre diferentes bases
- Criação de métricas analíticas
- Criação de views para consolidação dos indicadores

## Indicadores Utilizados

Entre os principais indicadores analisados estão:

- Total de internações
- Total de leitos existentes
- Total de leitos SUS
- Total de UTIs existentes
- Total de UTIs SUS
- População analisada
- UTIs SUS por 100 mil habitantes
- Internações por leito SUS

## Resultados

O MVP permite analisar dados de saúde de forma centralizada por meio de dashboards e realizar consultas utilizando linguagem natural.

Entre os dados analisados no projeto:

- 43.995.130 habitantes
- 105.923 leitos existentes
- 58.867 leitos SUS
- 7.252 UTIs SUS
- 2.767.673 internações em 2025

## Assistente Algomed

O Assistente Algomed utiliza o Oracle Select AI integrado ao Google Gemini.

Com essa integração, o usuário pode realizar perguntas como:

> Qual região de saúde possui mais leitos SUS?

E receber uma resposta baseada diretamente nos dados armazenados no banco.

Isso permite que usuários que não possuem conhecimento em SQL possam consultar informações utilizando linguagem natural.

## Estrutura do Repositório

```text
SPRINT-2/
│
├── README.md
├── logo.png
│
├── sql/
│   ├── views.sql
│   ├── consultas_dashboard.sql
│   ├── select_ai.sql
│   └── grants.sql
│
├── docs/
│   ├── arquitetura.png
│   └── screenshots/
│
└── dados/
