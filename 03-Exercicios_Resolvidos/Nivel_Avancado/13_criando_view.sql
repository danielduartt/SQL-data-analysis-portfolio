-- =================================================================================
--Crie uma VIEW chamada v_DetalhesFuncionario que exiba o
--ID do funcionário, nome completo, salário, data de admissão e nome do departamento.
-- =================================================================================
CREATE VIEW v_DetalhesFuncionario AS   
SELECT f.id_func as id, CONCAT(f.nome, ' ', f.sobrenome) as nome_completo,  f.salario, f.data_admissao, d.nome_depto 
FROM rh.funcionarios f 
INNER JOIN rh.departamentos d ON f.id_depto = d.id_depto
ORDER BY nome_completo ASC; 