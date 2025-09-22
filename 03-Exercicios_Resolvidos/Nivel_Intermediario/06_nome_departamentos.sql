-- =================================================================================
--Escreva uma query que liste o  nome completo do funcionário e o nome do 
-- seu respectivo departamento. Use um JOIN.
-- =================================================================================
SELECT 
    CONCAT(f.nome, ' ', f.sobrenome) AS nome_completo, 
    d.nome_depto
FROM rh.funcionarios f
INNER JOIN rh.departamentos d 
    ON f.id_depto = d.id_depto
ORDER BY nome_completo ASC;

