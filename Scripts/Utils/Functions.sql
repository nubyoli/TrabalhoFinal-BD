USE PlacasSC;

-- Função que retorna o status do pedido pelo telefone e CPF do Cliente
CREATE FUNCTION statusPedido(Telefone VARCHAR(15), CPF BIGINT)
    RETURNS VARCHAR(255)
BEGIN
    DECLARE statusEncomenda VARCHAR(255);

    SET statusEncomenda = (SELECT Status_Encomenda
                           FROM Encomenda
                                    JOIN Cliente
                           WHERE Encomenda.CPF_Cliente = Cliente.CPF_Cliente
                             AND CPF = Encomenda.CPF_Cliente
                             AND Telefone = Cliente.Telefone);

    RETURN statusEncomenda;
END;
