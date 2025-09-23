-- =================================================================================
-- SCRIPT DE PREPARAÇÃO DO AMBIENTE PARA EXERCÍCIOS DE FUNCTIONS E TRIGGERS
-- DIALETO: PostgreSQL
-- =================================================================================

-- Apagando as tabelas e funções antigas para garantir um ambiente limpo
DROP TABLE IF EXISTS auditoria_salarios;
DROP TABLE IF EXISTS log_operacoes;
DROP TABLE IF EXISTS funcionarios;
DROP FUNCTION IF EXISTS fn_calcular_tempo_de_casa(integer);
DROP FUNCTION IF EXISTS fn_calcular_bonus(numeric, character varying);


-- ---------------------------------
-- CRIAÇÃO DAS TABELAS
-- ---------------------------------

CREATE TABLE funcionarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(100),
    salario NUMERIC(10, 2) NOT NULL CHECK (salario > 0),
    data_admissao DATE NOT NULL,
    ultima_modificacao TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE auditoria_salarios (
    id SERIAL PRIMARY KEY,
    id_funcionario INT NOT NULL,
    salario_antigo NUMERIC(10, 2),
    salario_novo NUMERIC(10, 2),
    data_alteracao TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    usuario_alteracao VARCHAR(100)
);

CREATE TABLE log_operacoes (
    id SERIAL PRIMARY KEY,
    nome_tabela VARCHAR(100),
    tipo_operacao VARCHAR(20),
    descricao TEXT,
    data_operacao TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ---------------------------------
-- POPULAÇÃO INICIAL DAS TABELAS
-- ---------------------------------
INSERT INTO funcionarios (nome, cargo, salario, data_admissao) VALUES
('Carlos Santana', 'Desenvolvedor Senior', 12000.00, '2020-03-15'),
('Beatriz Costa', 'Analista de Dados', 7500.00, '2022-08-01'),
('Mariana Lima', 'Gerente de Projetos', 15500.00, '2019-05-20'),
('Ricardo Alves', 'Desenvolvedor Junior', 5500.00, '2024-02-10');

-- Verificação inicial
SELECT * FROM funcionarios;