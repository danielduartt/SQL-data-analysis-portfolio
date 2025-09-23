-- =================================================================================
--Liste os 3 maiores salários da empresa, junto com o nome
--do funcionário e do departamento.
-- =================================================================================
SELECT 
    CONCAT(nome, ' ', sobrenome) AS nome_completo, 
    salario from rh.funcionarios WHERE salario > (
        SELECT AVG(salario) FROM rh.funcionarios
    )   
ORDER BY nome_completo ASC;