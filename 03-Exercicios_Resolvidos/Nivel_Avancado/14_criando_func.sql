-- =================================================================================
--Crie uma função chamada fn_TempoDeCasa que recebe a
--data de admissão de um funcionário como parâmetro e retorna o número de anos
--completos que ele tem na empresa.
-- =================================================================================
CREATE OR REPLACE FUNCTION fn_TempoDeCasa(data_admissao DATE)
RETURNS INT
LANGUAGE plpgsql
AS $$
DECLARE
    anos INT;
BEGIN
    SELECT EXTRACT(YEAR FROM AGE(CURRENT_DATE, data_admissao))::INT
    INTO anos;

    RETURN anos;
END;
$$;
