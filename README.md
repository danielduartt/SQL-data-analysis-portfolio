# 🚀 Portfólio de Projetos e Estudos em SQL com PostgreSQL

## 👋 Olá! Bem-vindo(a) ao meu Repositório de SQL!

Este espaço é dedicado a demonstrar minhas habilidades em análise de dados e manipulação de bancos de dados utilizando **SQL**, com um foco especial no SGBD **PostgreSQL**. Aqui você encontrará desde scripts para a criação de schemas e guias de estudo, até projetos de portfólio completos que resolvem problemas de negócio do mundo real.

O objetivo deste repositório é servir como uma prova viva do meu conhecimento técnico, minha capacidade de organizar código e minha habilidade em transformar dados brutos em insights valiosos.


---

## 📂 Estrutura do Repositório

Para facilitar a navegação, o repositório está organizado da seguinte maneira:

```

/meu-repositorio-postgres/
│
├── README.md              \# Você está aqui\!
│
├── 01-Guia\_de\_Estudo/     \# Materiais de referência e guias sobre SQL e DAX.
│
├── 02-Database\_Schemas/   \# Scripts DDL e DML para criar e popular os bancos de dados dos projetos.
│
├── 03-Exercicios\_Resolvidos/ \# Soluções para desafios de SQL, organizados por nível de dificuldade.
│
└── 04-Projetos\_Portfolio/   \# Projetos práticos de análise de dados, cada um em sua própria pasta.

````

---

## 🛠️ Tecnologias Utilizadas

* **Linguagem:** SQL (Dialeto PostgreSQL)
* **Banco de Dados:** PostgreSQL 15+
* **Cliente SQL:** DBeaver (ou o de sua preferência)
* **Controle de Versão:** Git & GitHub

---

## 🚀 Como Começar

Para explorar os projetos e executar as queries, siga os passos abaixo:

1.  **Clone o Repositório**
    ```bash
    git clone [https://github.com/seu-usuario/meu-repositorio-postgres.git](https://github.com/seu-usuario/meu-repositorio-postgres.git)
    cd meu-repositorio-postgres
    ```

2.  **Configure o Banco de Dados**
    -   Navegue até a pasta `02-Database_Schemas`.
    -   Escolha o script do projeto que deseja explorar (ex: `hr_schema_postgres.sql`).
    -   Execute o script em seu ambiente PostgreSQL para criar as tabelas e inserir os dados de exemplo.

3.  **Explore os Projetos**
    -   Vá para a pasta `04-Projetos_Portfolio` e escolha um projeto.
    -   Leia o `README.md` específico do projeto para entender os objetivos e os desafios.
    -   Abra o arquivo `.sql` do projeto para ver as queries que geraram os insights. As queries são comentadas para explicar a lógica por trás de cada passo.

---

##  portfolio Projetos em Destaque

Abaixo estão os projetos desenvolvidos neste repositório, cada um focado em um domínio de negócio diferente.

### 1. 📊 Análise de Dados de Recursos Humanos
* **Objetivo:** Extrair insights sobre a força de trabalho da empresa para apoiar decisões estratégicas de RH.
* **Conceitos em Destaque:** `JOINs`, `GROUP BY`, Funções de Agregação (`AVG`, `SUM`), Funções de Data (`AGE`), e Funções de Janela (`Window Functions`) para cálculos avançados como salários versus média do departamento.
* **[Acesse o projeto aqui](./04-Projetos_Portfolio/Projeto_1_Analise_RH/)**

### 2. 🛒 Análise de Vendas (E-commerce)
* **Objetivo:** Identificar os produtos mais vendidos, os clientes mais valiosos e os principais padrões de compra em uma plataforma de e-commerce.
* **Conceitos em Destaque:** Múltiplos `JOINs`, Subqueries, CTEs (`Common Table Expressions`), `RANK()`, `SUM()`, e análises de séries temporais.
* **[Acesse o projeto aqui](./04-Projetos_Portfolio/Projeto_2_Analise_Vendas/)** *(Em breve)*

### 3. 📱 Análise de Engajamento em Plataforma Digital
* **Objetivo:** Medir a atividade e o engajamento dos usuários em uma plataforma digital fictícia para identificar power users e conteúdos populares.
* **Conceitos em Destaque:** `LEFT JOIN` (para encontrar dados ausentes), `UNION ALL`, `COUNT(DISTINCT)`, e agrupamentos complexos.
* **[Acesse o projeto aqui](./04-Projetos_Portfolio/Projeto_3_Analise_Engajamento/)** *(Em breve)*

---

## 🤝 Contribuições

Este é um repositório de portfólio pessoal, mas feedbacks, sugestões de melhoria e ideias para novos projetos são sempre bem-vindos! Sinta-se à vontade para abrir uma *Issue* para discutir suas ideias.

---

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](./LICENSE) para mais detalhes.
````