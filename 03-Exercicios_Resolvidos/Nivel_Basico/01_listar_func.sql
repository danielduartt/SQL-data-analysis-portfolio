-- =================================================================================
-- Listar Todos os Funcionários: Escreva uma query para selecionar o nome completo (nome e sobrenome) e o salário de todos os 
-- funcionários, ordenados pelo nome em ordem alfabética.
-- =================================================================================
SELECT CONCAT(nome, ' ', sobrenome) AS nome_completo
FROM rh.funcionarios
ORDER BY nome_completo;