use ecommerce;

-- Inserindo dados na tabela Cliente
INSERT INTO Cliente (idCliente, `Nome_completo`, contato, perfil) VALUES
(1, 'Carlos Silva', '1198765432', 'Comum'),
(2, 'Ana Souza', '2198765432', 'VIP'),
(3, 'Mariana Lima', '3198765432', 'Comum'),
(4, 'Pedro Henrique', '4198765432', 'VIP'),
(5, 'Juliana Costa', '5198765432', 'Comum'),
(6, 'Roberto Almeida', '6198765432', 'Comum');

-- Inserindo dados na tabela Pedido
INSERT INTO Pedido VALUES
(1, 1, 'Problema no software', 'Erro de Sistema', 'Software', 'Alta'),
(2, 2, 'Troca de peça', 'HD queimado', 'Hardware', 'Média'),
(3, 3, 'Atualização do sistema', 'Upgrade', 'Software', 'Baixa'),
(4, 4, 'Tela quebrada', 'Substituir display', 'Hardware', 'Alta'),
(5, 5, 'Instalação de programa', 'Novo software', 'Software', 'Média'),
(6, 6, 'Placa-mãe com defeito', 'Troca completa', 'Hardware', 'Alta');

-- Inserindo dados na tabela Produto
INSERT INTO Produto VALUES
(1, 'Computador', 'Notebook Dell', '4500'),
(2, 'Celular', 'iPhone 13', '7000'),
(3, 'Acessório', 'Mouse sem fio', '150'),
(4, 'Hardware', 'Placa de vídeo RTX 3060', '2800'),
(5, 'Software', 'Licença Windows 10', '600'),
(6, 'Hardware', 'Memória RAM 16GB', '500');

-- Inserindo dados na tabela Fornecedor
INSERT INTO Fornecedor VALUES
(1, 'Tech Distribuidora', '12345678000199', '1133224455'),
(2, 'Global Eletrônicos', '22345678000288', '2133224455'),
(3, 'Digital Solutions', '32345678000377', '3133224455'),
(4, 'PC Hardware Ltda', '42345678000466', '4133224455'),
(5, 'Soft Tech Brasil', '52345678000555', '5133224455'),
(6, 'Mega Informática', '62345678000644', '6133224455');

-- Inserindo dados na tabela Produto_fornecedor
INSERT INTO Produto_fornecedor VALUES
(1, 1, 50),
(2, 2, 30),
(3, 3, 100),
(4, 4, 20),
(5, 5, 60),
(6, 6, 40);

-- Inserindo dados na tabela Estoque
INSERT INTO Estoque VALUES
(1, 'Depósito Central', 500),
(2, 'Filial Zona Sul', 200),
(3, 'Filial Zona Norte', 300),
(4, 'Filial Centro', 250),
(5, 'Depósito Externo', 150),
(6, 'Armazém Virtual', 100);

-- Inserindo dados na tabela Produto_em_Estoque
INSERT INTO `Produto_em_Estoque` VALUES
(1, 1, 10),
(2, 2, 20),
(3, 3, 30),
(4, 4, 40),
(5, 5, 50),
(6, 6, 60);

-- Inserindo dados na tabela Produto/pedido
INSERT INTO `Produto_pedido` VALUES
(1, 1, '2', 'disponível'),
(2, 2, '1', 'sem estoque'),
(3, 3, '5', 'disponível'),
(4, 4, '3', 'disponível'),
(5, 5, '4', 'sem estoque'),
(6, 6, '2', 'disponível');

-- Inserindo dados na tabela Terceiro - Vendedor
INSERT INTO `Terceiro_Vendedor` VALUES
(1, 'Vendedor 1 Ltda', 'São Paulo', 'Tech Store', '78945612000155', '123456789'),
(2, 'Vendedor 2 Ltda', 'Rio de Janeiro', 'Eletrônicos RJ', '78945612000244', '223456789'),
(3, 'Vendedor 3 Ltda', 'Belo Horizonte', 'BH Tech', '78945612000333', '323456789'),
(4, 'Vendedor 4 Ltda', 'Curitiba', 'Curitiba Cell', '78945612000422', '423456789'),
(5, 'Vendedor 5 Ltda', 'Salvador', 'Bahia Eletrônicos', '78945612000511', '523456789'),
(6, 'Vendedor 6 Ltda', 'Porto Alegre', 'RS Informática', '78945612000600', '623456789');

-- Inserindo dados na tabela Produtos_vendedor
INSERT INTO `Produtos_vendedor` VALUES
(1, 1, 5),
(2, 2, 10),
(3, 3, 15),
(4, 4, 20),
(5, 5, 25),
(6, 6, 30);