-- =================================================================================
-- SCRIPT DE BANCO DE DADOS DE RH PARA DASHBOARD (POSTGRESQL)
-- EMPRESA: InnovateTech Ltda.
-- =================================================================================

-- Apagando as tabelas antigas na ordem correta para evitar erros de FK
DROP TABLE IF EXISTS f_Funcionarios;
DROP TABLE IF EXISTS d_Cargos;
DROP TABLE IF EXISTS d_Departamentos;
DROP TABLE IF EXISTS d_Localizacao;


-- =================================================================================
-- 1. CRIACAO DAS TABELAS DIMENSIONAIS (d_)
-- =================================================================================

CREATE TABLE d_Localizacao (
    ID_Local SERIAL PRIMARY KEY,
    Cidade VARCHAR(100) NOT NULL,
    Estado CHAR(2) NOT NULL
);

CREATE TABLE d_Departamentos (
    ID_Depto SERIAL PRIMARY KEY,
    Nome_Depto VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE d_Cargos (
    ID_Cargo SERIAL PRIMARY KEY,
    Nome_Cargo VARCHAR(100) NOT NULL,
    Nivel VARCHAR(50) -- Ex: Junior, Pleno, Senior, Gerente
);

-- =================================================================================
-- 2. CRIACAO DA TABELA FATO (f_)
-- =================================================================================

CREATE TABLE f_Funcionarios (
    ID_Func INT PRIMARY KEY,
    NomeCompleto VARCHAR(255) NOT NULL,
    Genero VARCHAR(20),
    DataNascimento DATE,
    ID_Cargo INT,
    ID_Depto INT,
    ID_Local INT,
    Salario NUMERIC(10, 2),
    DataAdmissao DATE,
    DataTermino DATE, -- NULL se o funcionario estiver ativo
    MotivoTermino VARCHAR(100), -- Ex: Voluntario, Involuntario, Aposentadoria
    PerformanceScore INT, -- De 1 (baixo) a 5 (alto)
    ID_Gerente INT, -- Chave que se refere a outro ID_Func na mesma tabela

    -- Definindo as chaves estrangeiras
    CONSTRAINT fk_cargo FOREIGN KEY (ID_Cargo) REFERENCES d_Cargos(ID_Cargo),
    CONSTRAINT fk_depto FOREIGN KEY (ID_Depto) REFERENCES d_Departamentos(ID_Depto),
    CONSTRAINT fk_local FOREIGN KEY (ID_Local) REFERENCES d_Localizacao(ID_Local)
);


-- =================================================================================
-- 3. INSERCAO DE DADOS FÍCTICIOS
-- =================================================================================

-- Populando Dimensoes
INSERT INTO d_Localizacao (Cidade, Estado) VALUES
('São Paulo', 'SP'),
('Rio de Janeiro', 'RJ'),
('Curitiba', 'PR');

INSERT INTO d_Departamentos (Nome_Depto) VALUES
('Engenharia'), ('Ciência de Dados'), ('Recursos Humanos'), ('Marketing'), ('Vendas');

INSERT INTO d_Cargos (Nome_Cargo, Nivel) VALUES
('Engenheiro de Software', 'Junior'), ('Engenheiro de Software', 'Pleno'), ('Engenheiro de Software', 'Senior'),
('Cientista de Dados', 'Junior'), ('Cientista de Dados', 'Pleno'), ('Cientista de Dados', 'Senior'),
('Analista de RH', 'Pleno'), ('Gerente de Marketing', 'Gerente'), ('Executivo de Vendas', 'Senior');

-- Populando Tabela Fato
INSERT INTO f_Funcionarios (ID_Func, NomeCompleto, Genero, DataNascimento, ID_Cargo, ID_Depto, ID_Local, Salario, DataAdmissao, DataTermino, MotivoTermino, PerformanceScore, ID_Gerente) VALUES
(101, 'Ana Clara Souza', 'Feminino', '1995-03-15', 2, 1, 1, 8200.00, '2022-01-10', NULL, NULL, 4, 103),
(102, 'Bruno Mattos', 'Masculino', '1992-11-20', 3, 1, 1, 12500.00, '2020-05-20', NULL, NULL, 5, 103),
(103, 'Carlos Drummond', 'Masculino', '1985-07-01', 3, 1, 1, 13100.00, '2019-02-15', NULL, NULL, 5, NULL),
(104, 'Daniela Lima', 'Feminino', '1998-01-30', 4, 2, 2, 6800.00, '2023-08-01', NULL, NULL, 3, 106),
(105, 'Eduardo Costa', 'Masculino', '1994-06-25', 5, 2, 2, 9500.00, '2021-11-12', '2024-05-20', 'Voluntário - Nova Oportunidade', 4, 106),
(106, 'Fernanda Castro', 'Feminino', '1990-09-10', 6, 2, 2, 14200.00, '2020-03-01', NULL, NULL, 5, NULL),
(107, 'Gabriel Martins', 'Masculino', '1996-04-18', 7, 3, 1, 6500.00, '2022-07-22', NULL, NULL, 3, NULL),
(108, 'Helena Oliveira', 'Feminino', '1988-12-05', 8, 4, 3, 11500.00, '2019-10-15', NULL, NULL, 4, NULL),
(109, 'Igor Ferreira', 'Masculino', '1993-02-28', 9, 5, 3, 9800.00, '2021-04-10', '2025-01-15', 'Involuntário - Performance', 2, NULL),
(110, 'Julia Almeida', 'Feminino', '1999-05-12', 1, 1, 1, 5200.00, '2024-02-01', NULL, NULL, 4, 102),
(111, 'Lucas Pereira', 'Masculino', '1991-08-08', 6, 2, 2, 13800.00, '2020-08-01', NULL, NULL, 4, 106),
(112, 'Mariana Gomes', 'Feminino', '1997-10-03', 5, 2, 1, 9900.00, '2022-09-01', NULL, NULL, 5, 106);