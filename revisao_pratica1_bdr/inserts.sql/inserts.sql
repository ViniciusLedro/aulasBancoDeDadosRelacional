INSERT INTO loja (nome, cidade) VALUES
('GameShop', 'São Paulo'),
('Green Man Gaming', 'Rio de Janeiro'),
('Nuuuvem', 'São Paulo');

INSERT INTO cliente (nome, email, cidade) VALUES
('Vinicius Ledro', 'vinicius.ledro@gmail.com', 'Santa Branca'),
('Eric Souza', 'eric.souza@gmail.com', 'São José dos Campos'),
('Marcio Bueno', 'marcio.bueno@gmail.com', 'Jacareí');

INSERT INTO jogo (titulo, ano_lancamento, genero) VALUES
('Battlefield 6', 2025, 'Ação'),
('Bomba Patch', 2025, 'Esporte'),
('Squad', 2022, 'Ação');

-- Compra 1
INSERT INTO compra (data_compra, id_cliente, id_loja) VALUES
('2025-09-01', 1, 1);

-- Compra 2
INSERT INTO compra (data_compra, id_cliente, id_loja) VALUES
('2025-09-02', 2, 2);

-- Compra 1, cliente 1 comprou dois jogos
INSERT INTO compra_jogo (id_compra, id_jogo, quantidade) VALUES
(1, 1, 1), 
(1, 2, 2); 

-- Compra 2, cliente 2 comprou dois jogos
INSERT INTO compra_jogo (id_compra, id_jogo, quantidade) VALUES
(2, 2, 1), 
(2, 3, 3); 
