-- =================================================================================
--Crie um trigger que impeça a exclusão (DELETE) de um departamento se ainda existirem funcionários alocados a ele. Se uma tentativa de
--exclusão ocorrer, o trigger deve gerar um erro com uma mensagem como "Não é
--possível excluir departamento com funcionários ativos."
-- =================================================================================
CREATE OR REPLACE FUNCTION fn_verifica_funcionarios()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
    qtd INT;
BEGIN
    SELECT COUNT(*) INTO qtd
    FROM rh.funcionarios f
    WHERE f.id_depto = OLD.id_depto;

    IF qtd > 0 THEN
        RAISE EXCEPTION 'Não é possível excluir departamento com funcionários ativos.';
    END IF;

    RETURN OLD; 
$$;

CREATE TRIGGER trg_bloqueia_delete_departamento
BEFORE DELETE ON rh.departamentos
FOR EACH ROW
EXECUTE FUNCTION fn_verifica_funcionarios();