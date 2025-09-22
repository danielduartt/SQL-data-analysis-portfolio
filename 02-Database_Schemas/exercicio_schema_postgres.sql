-- =====================================================================
-- SCRIPT DE CRIACAO DE SCHEMA E CARGA DE DADOS PARA POSTGRESQL
-- =====================================================================

-- Limpando o ambiente (opcional, mas bom para testes)
-- CUIDADO: Os comandos abaixo apagam as tabelas se elas existirem!
DROP TABLE IF EXISTS Projetos;
DROP TABLE IF EXISTS Funcionarios;
DROP TABLE IF EXISTS Departamentos;

-- =====================================================================
-- Parte 1: Criacao das Tabelas (DDL)
-- =====================================================================

-- 1. Tabela de Departamentos
-- Usamos SERIAL para criar uma chave primaria auto-incremental.
CREATE TABLE Departamentos (
    ID_Depto SERIAL PRIMARY KEY,
    Nome_Depto VARCHAR(100) NOT NULL UNIQUE
);

-- 2. Tabela de Funcionarios
CREATE TABLE Funcionarios (
    ID_Func INT PRIMARY KEY, -- Usaremos IDs manuais aqui para facilitar os exemplos
    Nome VARCHAR(50) NOT NULL,
    Sobrenome VARCHAR(50) NOT NULL,
    Salario NUMERIC(10, 2) CHECK (Salario > 0),
    Data_Admissao DATE NOT NULL,
    ID_Depto INT,
    CONSTRAINT fk_departamento
        FOREIGN KEY (ID_Depto)
        REFERENCES Departamentos(ID_Depto)
);

-- 3. Tabela de Projetos
CREATE TABLE Projetos (
    ID_Proj SERIAL PRIMARY KEY,
    Nome_Proj VARCHAR(150) NOT NULL,
    ID_Depto_Resp INT,
    CONSTRAINT fk_depto_responsavel
        FOREIGN KEY (ID_Depto_Resp)
        REFERENCES Departamentos(ID_Depto)
);

-- =====================================================================
-- Parte 2: Insercao de Dados de Exemplo (DML)
-- =====================================================================

-- Inserindo dados na tabela Departamentos
-- Note que não precisamos especificar o ID_Depto, pois ele é SERIAL.
INSERT INTO Departamentos (Nome_Depto) VALUES
('Tecnologia'),
('Recursos Humanos'),
('Marketing'),
('Vendas'),
('Financeiro'),
('Diretoria'); -- Departamento sem funcionarios para o exercicio

-- Inserindo dados na tabela Funcionarios
-- O ID_Depto aqui precisa corresponder aos IDs gerados acima (1 para Tecnologia, 2 para RH, etc.)
INSERT INTO Funcionarios (ID_Func, Nome, Sobrenome, Salario, Data_Admissao, ID_Depto) VALUES
(101, 'Ana', 'Silva', 7500.00, '2022-03-15', 1),
(102, 'Bruno', 'Costa', 8200.00, '2021-11-20', 1),
(103, 'Carla', 'Martins', 5500.00, '2023-01-10', 2),
(104, 'Daniel', 'Pereira', 6200.00, '2023-05-25', 3),
(105, 'Eduarda', 'Lima', 9100.00, '2020-08-01', 4),
(106, 'Fabio', 'Ribeiro', 4800.00, '2023-02-18', 2),
(107, 'Gabriela', 'Alves', 11500.00, '2019-07-30', 1),
(108, 'Heitor', 'Mendes', 7100.00, '2022-09-05', 4),
(109, 'Isabela', 'Nunes', 6800.00, '2021-12-12', 3),
(110, 'Joao', 'Santos', 8900.00, '2022-06-01', 5);

-- Inserindo dados na tabela Projetos
INSERT INTO Projetos (Nome_Proj, ID_Depto_Resp) VALUES
('Desenvolvimento do Novo App Mobile', 1),
('Campanha de Marketing Digital Q4', 3),
('Reestruturacao do Plano de Carreira', 2),
('Expansao de Vendas para a Regiao Sul', 4),
('Migracao do Servidor para a Nuvem', 1);

-- =====================================================================
-- Verificacao
-- =====================================================================
SELECT * FROM Departamentos ORDER BY ID_Depto;
SELECT * FROM Funcionarios;
SELECT * FROM Projetos;