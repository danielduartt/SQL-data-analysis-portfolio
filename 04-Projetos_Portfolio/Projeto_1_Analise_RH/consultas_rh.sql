-- =================================================================================
-- ARQUIVO DE CONSULTAS - PROJETO DE ANÁLISE DE RH
-- =================================================================================


-- 1. VISÃO GERAL: Headcount Ativo por Departamento e Nível de Cargo
-- Esta query nos dá uma visão da distribuição atual de talentos na empresa.
SELECT
    d.Nome_Depto AS Departamento,
    c.Nivel,
    COUNT(f.ID_Func) AS Total_Funcionarios_Ativos
FROM f_Funcionarios f
JOIN d_Departamentos d ON f.ID_Depto = d.ID_Depto
JOIN d_Cargos c ON f.ID_Cargo = c.ID_Cargo
WHERE f.DataTermino IS NULL -- Filtra apenas funcionários ativos
GROUP BY d.Nome_Depto, c.Nivel
ORDER BY d.Nome_Depto, Total_Funcionarios_Ativos DESC;


-- 2. ANÁLISE DE TURNOVER: Contagem de Saídas por Motivo
-- Essencial para entender por que estamos perdendo talentos.
SELECT
    MotivoTermino AS Motivo_Saida,
    COUNT(ID_Func) AS Total_Saidas
FROM f_Funcionarios
WHERE DataTermino IS NOT NULL -- Filtra apenas funcionários que já saíram
GROUP BY MotivoTermino
ORDER BY Total_Saidas DESC;


-- 3. ANÁLISE DE COMPENSAÇÃO: Salário Médio por Nível e Gênero
-- Ajuda a identificar possíveis disparidades salariais e a planejar orçamentos.
SELECT
    c.Nivel,
    f.Genero,
    ROUND(AVG(f.Salario), 2) AS Salario_Medio
FROM f_Funcionarios f
JOIN d_Cargos c ON f.ID_Cargo = c.ID_Cargo
WHERE f.DataTermino IS NULL
GROUP BY c.Nivel, f.Genero
ORDER BY c.Nivel, Salario_Medio DESC;


-- 4. ANÁLISE DE PERFORMANCE: Distribuição dos Scores de Desempenho
-- Mostra a distribuição da performance dos funcionários ativos.
SELECT
    PerformanceScore,
    COUNT(ID_Func) AS Numero_De_Funcionarios
FROM f_Funcionarios
WHERE DataTermino IS NULL
GROUP BY PerformanceScore
ORDER BY PerformanceScore;