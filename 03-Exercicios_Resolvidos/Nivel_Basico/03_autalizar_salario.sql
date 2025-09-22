-- =================================================================================
--Escreva um comando para dar um aumento de 15% para todos
--os funcionários do departamento de "Recursos Humanos"(ID_Depto = 2).
-- =================================================================================
UPDATE rh.funcionarios
SET salario = salario * 1.15
WHERE id_depto = 2;
