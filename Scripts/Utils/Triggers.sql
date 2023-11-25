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


