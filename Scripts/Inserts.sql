USE PlacasSC;

INSERT INTO Cliente (CPF_Cliente, Nome, Telefone, Endereco)
VALUES (12345678901, 'João Silva', '(11) 9999-8888', 'Rua A, 123'),
       (23456789012, 'Maria Oliveira', '(21) 9876-5432', 'Avenida B, 456'),
       (34567890123, 'Pedro Santos', '(31) 1234-5678', 'Rua C, 789'),
       (45678901234, 'Ana Souza', '(41) 8765-4321', 'Travessa D, 321'),
       (56789012345, 'Lucas Pereira', '(51) 5555-4444', 'Rua E, 654'),
       (67890123456, 'Carla Ferreira', '(61) 3333-2222', 'Avenida F, 987'),
       (78901234567, 'Mateus Costa', '(71) 2222-1111', 'Rua G, 147'),
       (89012345678, 'Julia Martins', '(81) 7777-8888', 'Avenida H, 258'),
       (90123456789, 'Felipe Ramos', '(91) 6666-9999', 'Rua I, 369'),
       (12312312312, 'Larissa Oliveira', '(12) 4444-5555', 'Avenida J, 753'),
       (23423423423, 'Gustavo Rodrigues', '(23) 3333-4444', 'Rua K, 159'),
       (34534534534, 'Amanda Silva', '(34) 8888-7777', 'Avenida L, 852'),
       (45645645645, 'Rafaela Pereira', '(45) 5555-6666', 'Rua M, 741'),
       (56756756756, 'Fernando Souza', '(56) 3333-2222', 'Avenida N, 963'),
       (67867867867, 'Marcelo Santos', '(67) 9999-3333', 'Rua O, 258');

INSERT INTO Funcionario (Nome, CPF_Cliente)
VALUES ('Carlos Oliveira', 12345678901),
       ('Ana Santos', 23456789012),
       ('Mariana Silva', 34567890123),
       ('Rafaela Costa', 45678901234);

INSERT INTO Placas (Altura, Largura, Frase, Cor_Placa, Cor_Frase, Data_Pedido)
VALUES (50, 100, 'Bem-vindo', 'Branca', 'Azul', '2023-01-15'),
       (60, 120, 'Cuidado com o cão', 'Cinza', 'Vermelho', '2023-01-23'),
       (40, 80, 'Proibido estacionar', 'Branca', 'Amarelo', '2023-04-12'),
       (70, 140, 'Área restrita', 'Cinza', 'Preto', '2023-03-05'),
       (55, 110, 'Acesso negado', 'Branca', 'Verde', '2023-05-18'),
       (45, 90, 'Atenção: perigo', 'Cinza', 'Azul', '2023-06-22'),
       (75, 150, 'Não ultrapasse', 'Branca', 'Vermelho', '2023-07-30'),
       (65, 130, 'Cuidado: obra', 'Cinza', 'Amarelo', '2023-08-14'),
       (85, 170, 'Rota alternativa', 'Branca', 'Preto', '2023-09-05'),
       (90, 180, 'Velocidade controlada', 'Cinza', 'Verde', '2023-10-19'),
       (58, 116, 'Área de descanso', 'Branca', 'Azul', '2023-11-25'),
       (78, 156, 'Proibido acesso', 'Cinza', 'Vermelho', '2023-12-30'),
       (68, 136, 'Estacionamento pago', 'Branca', 'Amarelo', '2024-01-10'),
       (80, 160, 'Desvio obrigatório', 'Cinza', 'Preto', '2024-02-14'),
       (95, 190, 'Pare: controle', 'Branca', 'Verde', '2024-03-20');

INSERT INTO Encomenda (Data_Encomenda, Status_Encomenda, ID_Placa, CPF_Cliente, ID_Funcionario)
VALUES ('2023-01-05', 'Pendente', 1, 12345678901, 1),
       ('2023-02-10', 'Em processo', 2, 23456789012, 2),
       ('2023-03-15', 'Em processo', 3, 34567890123, 3),
       ('2023-04-20', 'Concluída', 4, 45678901234, 4),
       ('2023-05-25', 'Pendente', 5, 56789012345, 1),
       ('2023-06-30', 'Em processo', 6, 67890123456, 2),
       ('2023-07-05', 'Concluída', 7, 78901234567, 3),
       ('2023-08-10', 'Pendente', 8, 89012345678, 4),
       ('2023-09-15', 'Em processo', 9, 90123456789, 1),
       ('2023-10-20', 'Concluída', 10, 12312312312, 2),
       ('2023-11-25', 'Pendente', 11, 23423423423, 3),
       ('2023-12-30', 'Em processo', 12, 34534534534, 4),
       ('2024-01-05', 'Concluída', 13, 45645645645, 1),
       ('2024-02-10', 'Pendente', 14, 56756756756, 2),
       ('2024-03-15', 'Em processo', 15, 67867867867, 3);

INSERT INTO Recibo (ID_Recibo, ID_Encomenda, Status_Pagamento)
VALUES (1, 1, 'Pago'),
       (2, 2, 'Pago'),
       (3, 3, 'Pendente'),
       (4, 4, 'Pago'),
       (5, 5, 'Pendente'),
       (6, 6, 'Pago'),
       (7, 7, 'Pago'),
       (8, 8, 'Pendente'),
       (9, 9, 'Pago'),
       (10, 10, 'Pendente'),
       (11, 11, 'Pago'),
       (12, 12, 'Pago'),
       (13, 13, 'Pendente'),
       (14, 14, 'Pago'),
       (15, 15, 'Pendente');