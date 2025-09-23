-- =================================================================================
-- Escreva uma query que liste o nome
--de cada projeto e o nome do departamento responsável por ele.
-- =================================================================================
SELECT p.nome_proj, d.nome_depto AS departamento_responsavel
FROM projetos.projetos p 
INNER JOIN rh.departamentos d ON p.id_depto_resp = d.id_depto
ORDER BY p.nome_proj ASC;