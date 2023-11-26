USE PlacasSC;

-- Procedure que retorna os pedidos em aberto
-- Incrementei algumas coisa, como colocar o nome do cliente, telefone e nome do funcionario
CREATE PROCEDURE pedidosPendentes()
BEGIN
    SELECT Cliente.Nome     AS Nome_Cliente,
           CLiente.Telefone AS Contato,
           Funcionario.Nome AS Funcionario_Responsavel,
           Status_Encomenda
    FROM Encomenda
             JOIN Cliente ON Encomenda.CPF_Cliente = Cliente.CPF_Cliente
             JOIN Funcionario ON Encomenda.ID_Funcionario = Funcionario.ID_Funcionario
    WHERE Status_Encomenda = 'Pendente';
END;

-- Procedure que retorna os dados do recibo
CREATE PROCEDURE geraRecibo(IN encomenda_id INT)
BEGIN
    SELECT *
    FROM Encomenda,
         Recibo,
         Placas
    WHERE Encomenda.ID_Encomenda = encomenda_id
      AND Recibo.ID_Encomenda = Encomenda.ID_Encomenda
      AND Encomenda.ID_Placa = Placas.ID_Placa;
END;