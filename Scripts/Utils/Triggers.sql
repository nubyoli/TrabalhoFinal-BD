USE PLACASSC;

-- Trigger que calcula o valor final e o preco das placas sem precisar inserir algum valor para esses campos no insert
CREATE TRIGGER calculaValorPlaca
    BEFORE INSERT -- Define que antes de inserir qualquer valor na tabela algo deve ser realizado
    ON Placas
    FOR EACH ROW
BEGIN
    -- Declaracao de variaveis que sao usadas dentro da trigger
    DECLARE areaPlaca INT;
    DECLARE custoMaterial FLOAT;
    DECLARE custoDesenho FLOAT;

    -- Definindo os valores das variaveis internas com base nos valores do insert
    SET areaPlaca = NEW.Altura * NEW.Largura;
    SET custoMaterial = areaPlaca * 123.50;
    SET custoDesenho = (SELECT CHAR_LENGTH(New.Frase)) * 0.41;

    -- Define os valores da tabela usando as variaveis internas da trigger
    SET NEW.Valor_Total = custoMaterial + custoDesenho;
    SET NEW.Valor_Sinal = NEW.Valor_Total / 2;
END;

-- Trigger que define o dia de entrega da placa
CREATE TRIGGER calculaPrazoEntrega
    BEFORE INSERT
    ON Placas
    FOR EACH ROW
BEGIN
    DECLARE quantidadeProdutosDia INT;

    SELECT COUNT(*)
    INTO quantidadeProdutosDia
    FROM Placas
    WHERE Data_Pedido = NEW.Data_Pedido;

    IF quantidadeProdutosDia >= 6 THEN
        SET NEW.Data_Entrega = DATE_ADD(NEW.Data_Pedido, INTERVAL 1 DAY);
    ELSE
        SET NEW.Data_Entrega = NEW.Data_Pedido;
    END IF;
END;

-- Trigger que previne que mais de 6 placas tenha o mesmo prazo de entrega
CREATE TRIGGER verificaPrazoEntrega
    BEFORE INSERT
    ON Placas
    FOR EACH ROW
BEGIN
    DECLARE quantidadeEntregasDia INT;

    SELECT COUNT(*)
    INTO quantidadeEntregasDia
    FROM Placas
    WHERE Data_Entrega = NEW.Data_Entrega;

    IF quantidadeEntregasDia >= 6 THEN
        SET NEW.Data_Entrega = DATE_ADD(NEW.Data_Entrega, INTERVAL 1 DAY);
    ELSE
        SET NEW.Data_Entrega = NEW.Data_Entrega;
    END IF;
END;