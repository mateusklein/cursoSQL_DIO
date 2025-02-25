DROP SCHEMA IF EXISTS ecommerce;
CREATE SCHEMA IF NOT EXISTS ecommerce;
USE ecommerce;

CREATE TABLE Cliente (
  idCliente INT NOT NULL AUTO_INCREMENT,
  Nome_completo VARCHAR(45) NULL,
  contato CHAR(10) NULL,
  perfil VARCHAR(45) NULL,
  PRIMARY KEY (idCliente),
  UNIQUE INDEX Nome_completo_UNIQUE (Nome_completo ASC)
) ENGINE = InnoDB;

CREATE TABLE Pedido (
  idPedido INT NOT NULL AUTO_INCREMENT,
  Cliente_idCliente INT NOT NULL,
  Descricao VARCHAR(255) NULL,
  Titulo_pedido VARCHAR(45) NULL,
  Tipo_problema ENUM('Software', 'Hardware') NULL,
  Prioridade ENUM('Baixa', 'Média', 'Alta') NULL DEFAULT 'Baixa',
  PRIMARY KEY (idPedido),
  INDEX fk_Pedido_Cliente_idx (Cliente_idCliente ASC),
  CONSTRAINT fk_Pedido_Cliente
    FOREIGN KEY (Cliente_idCliente)
    REFERENCES Cliente (idCliente)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE Produto (
  idProduto INT NOT NULL AUTO_INCREMENT,
  Categoria VARCHAR(45) NOT NULL,
  Descricao VARCHAR(45) NULL,
  Valor DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (idProduto)
) ENGINE = InnoDB;

CREATE TABLE Fornecedor (
  idFornecedor INT NOT NULL AUTO_INCREMENT,
  Razao_Social VARCHAR(45) NULL,
  CNPJ CHAR(15) NOT NULL,
  contato VARCHAR(45) NULL,
  PRIMARY KEY (idFornecedor),
  UNIQUE INDEX CNPJ_UNIQUE (CNPJ ASC)
) ENGINE = InnoDB;

CREATE TABLE Produto_fornecedor (
  Fornecedor_idFornecedor INT NOT NULL,
  Produto_idProduto INT NOT NULL,
  Quantidade INT NULL,
  PRIMARY KEY (Fornecedor_idFornecedor, Produto_idProduto),
  CONSTRAINT fk_ProdutoFornecedor_Fornecedor
    FOREIGN KEY (Fornecedor_idFornecedor)
    REFERENCES Fornecedor (idFornecedor)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_ProdutoFornecedor_Produto
    FOREIGN KEY (Produto_idProduto)
    REFERENCES Produto (idProduto)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE Estoque (
  idEstoque INT NOT NULL AUTO_INCREMENT,
  Local VARCHAR(45) NOT NULL,
  Quantidade INT NOT NULL,
  PRIMARY KEY (idEstoque)
) ENGINE = InnoDB;

CREATE TABLE Produto_em_Estoque (
  Produto_idProduto INT NOT NULL,
  Estoque_idEstoque INT NOT NULL,
  Localizacao INT NULL,
  PRIMARY KEY (Produto_idProduto, Estoque_idEstoque),
  CONSTRAINT fk_ProdutoEstoque_Produto
    FOREIGN KEY (Produto_idProduto)
    REFERENCES Produto (idProduto)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_ProdutoEstoque_Estoque
    FOREIGN KEY (Estoque_idEstoque)
    REFERENCES Estoque (idEstoque)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE Produto_pedido (
  Produto_idProduto INT NOT NULL,
  Pedido_idPedido INT NOT NULL,
  Quantidade VARCHAR(45) NOT NULL,
  Status ENUM('disponível', 'sem estoque') NULL DEFAULT 'disponível',
  PRIMARY KEY (Produto_idProduto, Pedido_idPedido),
  CONSTRAINT fk_ProdutoPedido_Produto
    FOREIGN KEY (Produto_idProduto)
    REFERENCES Produto (idProduto)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_ProdutoPedido_Pedido
    FOREIGN KEY (Pedido_idPedido)
    REFERENCES Pedido (idPedido)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE Terceiro_Vendedor (
  idTerceiro_Vendedor INT NOT NULL AUTO_INCREMENT,
  Razao_Social VARCHAR(45) NOT NULL,
  Local VARCHAR(45) NULL,
  Nome_Fantasia VARCHAR(45) NULL,
  CNPJ CHAR(15) NULL,
  CPF CHAR(9) NULL,
  PRIMARY KEY (idTerceiro_Vendedor),
  UNIQUE INDEX Razao_Social_UNIQUE (Razao_Social ASC),
  UNIQUE INDEX CNPJ_UNIQUE (CNPJ ASC),
  UNIQUE INDEX CPF_UNIQUE (CPF ASC)
) ENGINE = InnoDB;

CREATE TABLE Produtos_vendedor (
  idPseller INT NOT NULL,
  Produto_idProduto INT NOT NULL,
  Quantidade INT NULL,
  PRIMARY KEY (idPseller, Produto_idProduto),
  CONSTRAINT fk_ProdutosVendedor_Vendedor
    FOREIGN KEY (idPseller)
    REFERENCES Terceiro_Vendedor (idTerceiro_Vendedor)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_ProdutosVendedor_Produto
    FOREIGN KEY (Produto_idProduto)
    REFERENCES Produto (idProduto)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE Responsavel (
  idResponsavel INT NOT NULL AUTO_INCREMENT,
  Setor VARCHAR(45) NULL,
  Matricula VARCHAR(45) NULL,
  Cargo VARCHAR(45) NULL,
  PRIMARY KEY (idResponsavel),
  UNIQUE INDEX Matricula_UNIQUE (Matricula ASC)
) ENGINE = InnoDB;

CREATE TABLE Pedido_gerado (
  Pedido_idPedido INT NOT NULL,
  Responsavel_idResponsavel INT NOT NULL,
  Setor_responsavel VARCHAR(45) NULL DEFAULT 'Help desk',
  Comentarios VARCHAR(45) NULL,
  Setor_encaminhado VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (Pedido_idPedido, Responsavel_idResponsavel),
  CONSTRAINT fk_PedidoGerado_Pedido
    FOREIGN KEY (Pedido_idPedido)
    REFERENCES Pedido (idPedido)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_PedidoGerado_Responsavel
    FOREIGN KEY (Responsavel_idResponsavel)
    REFERENCES Responsavel (idResponsavel)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE Ordem_de_Servico (
  idOrdem_de_Servico INT NOT NULL AUTO_INCREMENT,
  Descricao VARCHAR(45) NULL,
  Prioridade VARCHAR(45) NULL,
  Pedido_has_Responsavel_Pedido_idPedido INT NOT NULL,
  Pedido_has_Responsavel_Responsavel_idResponsavel INT NOT NULL,
  PRIMARY KEY (idOrdem_de_Servico),
  CONSTRAINT fk_OS_PedidoGerado
    FOREIGN KEY (Pedido_has_Responsavel_Pedido_idPedido, Pedido_has_Responsavel_Responsavel_idResponsavel)
    REFERENCES Pedido_gerado (Pedido_idPedido, Responsavel_idResponsavel)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;
