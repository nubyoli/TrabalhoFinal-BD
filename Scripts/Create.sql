CREATE DATABASE PlacasSC;

USE PlacasSC;

CREATE TABLE Cliente
(
    CPF_Cliente BIGINT NOT NULL,
    Nome        VARCHAR(255),
    Telefone    VARCHAR(15),
    Endereco    VARCHAR(255),
    PRIMARY KEY (CPF_Cliente)
);

CREATE TABLE Funcionario
(
    ID_Funcionario INT    NOT NULL AUTO_INCREMENT,
    Nome           VARCHAR(255),
    CPF_Cliente    BIGINT NOT NULL,
    PRIMARY KEY (ID_Funcionario),
    FOREIGN KEY (CPF_Cliente) REFERENCES Cliente (CPF_Cliente)
);

CREATE TABLE Placas
(
    ID_Placa     INT NOT NULL AUTO_INCREMENT,
    Altura       INT NOT NULL,
    Largura      INT NOT NULL,
    Frase        TEXT,
    Cor_Placa    ENUM ('Branca', 'Cinza'),
    Cor_Frase    ENUM ('Azul', 'Vermelho', 'Amarelo', 'Preto', 'Verde'),
    Data_Pedido  DATE,
    Data_Entrega DATE,
    Valor_Total  DECIMAL(10, 2),
    Valor_Sinal  DECIMAL(10, 2),
    PRIMARY KEY (ID_Placa)
);

CREATE TABLE Encomenda
(
    ID_Encomenda     INT    NOT NULL AUTO_INCREMENT,
    Data_Encomenda   DATE,
    Status_Encomenda ENUM ('Concluída','Em processo','Pendente'),
    ID_Placa         INT    NOT NULL,
    CPF_Cliente      BIGINT NOT NULL,
    ID_Funcionario   INT    NOT NULL,
    PRIMARY KEY (ID_Encomenda),
    FOREIGN KEY (CPF_Cliente) REFERENCES Cliente (CPF_Cliente),
    FOREIGN KEY (ID_Funcionario) REFERENCES Funcionario (ID_Funcionario),
    FOREIGN KEY (ID_Placa) REFERENCES Placas (ID_Placa)
);

CREATE TABLE Recibo
(
    ID_Recibo        INT NOT NULL AUTO_INCREMENT,
    ID_Encomenda     INT NOT NULL,
    Status_Pagamento ENUM ('Pago', 'Pendente'),
    PRIMARY KEY (ID_Recibo),
    FOREIGN KEY (ID_Encomenda) REFERENCES Encomenda (ID_Encomenda)
);


