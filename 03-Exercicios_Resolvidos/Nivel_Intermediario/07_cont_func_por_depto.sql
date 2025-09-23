-- =================================================================================
--Escreva uma query que mostre
--o nome de cada departamento e o número de funcionários que trabalham nele.
-- =================================================================================
SELECT d.nome_depto, COUNT(f.id_func) AS numero_funcionarios 
FROM rh.departamentos d 
INNER JOIN rh.funcionarios f ON d.id_depto = f.id_depto 
GROUP BY d.nome_depto 
ORDER BY d.nome_depto ASC;