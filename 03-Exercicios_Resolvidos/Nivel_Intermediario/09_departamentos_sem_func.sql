-- =================================================================================
--Escreva uma query para encontrar todos
--os departamentos que não possuem nenhum funcionário alocado. (Dica: um LEFT JOIN é ideal aqui).
-- =================================================================================
SELECT 
    d.nome_depto, COUNT(f.id_func) AS numero_funcionarios
FROM rh.departamentos d
LEFT JOIN rh.funcionarios f ON d.id_depto = f.id_depto
WHERE f.id_func IS NULL
GROUP BY d.nome_depto
ORDER BY d.nome_depto ASC;