-- =================================================================================
--Liste os funcionários cujo salário
--é maior que a média de todos os salários da empresa. (Dica: use uma subquery na
--cláusula WHERE).
-- =================================================================================
SELECT 
    CONCAT(nome, ' ', sobrenome) AS nome_completo, 
    salario from rh.funcionarios WHERE salario > (
        SELECT AVG(salario) FROM rh.funcionarios
    )   
ORDER BY nome_completo ASC;