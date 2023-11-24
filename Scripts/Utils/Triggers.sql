USE PLACASSC;

-- Trigger que calcula o valor final e o preco das placas sem precisar inserir algum valor para esses campos no insert
CREATE TRIGGER calculaValorPlace
    BEFORE INSERT
    ON Placas
    FOR EACH ROW
BEGIN
    DECLARE areaPlaca INT;
    DECLARE custoMaterial FLOAT;
    DECLARE custoDesenho FLOAT;

    SET areaPlaca = NEW.Altura * NEW.Largura;
    SET custoMaterial = areaPlaca * 123.50;
    SET custoDesenho = (SELECT CHAR_LENGTH(New.Frase)) * 0.41;

    SET NEW.Valor_Total = custoMaterial + custoDesenho;
    SET NEW.Valor_Sinal = NEW.Valor_Total / 2;
END;


