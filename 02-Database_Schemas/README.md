# 🗄️ Scripts de Banco de Dados (Schemas)

Esta pasta contém todos os scripts SQL necessários para criar a estrutura (DDL) e popular com dados (DML) os bancos de dados utilizados nos projetos e exercícios deste repositório.

Para utilizar qualquer projeto ou exercício, execute primeiro o script de schema correspondente no seu ambiente PostgreSQL.

## Conteúdo

### 📄 [exercicio_schema_postgres.sql](./exercicio_schema_postgres.sql)
* **Propósito:** Cria um schema simples de RH com as tabelas `Departamentos`, `Funcionarios` e `Projetos`.
* **Utilizado em:** Exercícios da pasta `03-Exercicios_Resolvidos`.

### 📄 [hr_dashboard_schema_postgres.sql](./hr_dashboard_schema_postgres.sql)
* **Propósito:** Cria um schema de RH mais robusto e realista, modelado para análise de dados e criação de dashboards. Inclui tabelas fato e dimensão (`f_Funcionarios`, `d_Cargos`, `d_Departamentos`, `d_Localizacao`).
* **Utilizado em:** `Projeto_1_Analise_RH` na pasta `04-Projetos_Portfolio`.

### 📄 [functions_triggers_schema.sql](./functions_triggers_schema.sql)
* **Propósito:** Cria um ambiente específico para a prática de `Functions` e `Triggers` no PostgreSQL. Contém as tabelas `funcionarios`, `auditoria_salarios` e `log_operacoes`.
* **Utilizado em:** Exercícios avançados de automação e lógica de banco de dados.