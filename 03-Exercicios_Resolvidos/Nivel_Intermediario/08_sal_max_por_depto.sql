-- =================================================================================
--Mostre o maior salário pago em cada departamento. 
--A saída deve conter o nome do departamento e o valor do salário máximo.
-- =================================================================================
SELECT 
    d.nome_depto, MAX(f.salario) AS salario_maximo
FROM rh.departamentos d INNER JOIN rh.funcionarios f ON d.id_depto = f.id_depto
GROUP BY d.nome_depto
ORDER BY d.nome_depto ASC;