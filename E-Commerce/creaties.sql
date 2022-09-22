CREATE DATABASE ecommerce;
USE ecommerce;

CREATE TABLE Cliente (
  idCliente INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  sobrenome VARCHAR(45) NOT NULL,
  rg INT NOT NULL,
  num_cartao INT NOT NULL,
  
  PRIMARY KEY (idCliente)
);

CREATE TABLE Cliente_Pessoa_Juridica (
	idCliente INT NOT NULL,
  
	FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

CREATE TABLE Cliente_Pessoa_Fisica (
	idCliente INT NOT NULL,
  
	FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

CREATE TABLE Terceiro_Vendedor (
  idTerceiro_Vendedor INT NOT NULL AUTO_INCREMENT,
  
  PRIMARY KEY (idTerceiro_Vendedor)
);

CREATE TABLE Fornecedor (
  idFornecedor INT NOT NULL AUTO_INCREMENT,
  razao_social VARCHAR(45) NOT NULL,
  cnpj INT NOT NULL,
  
  idTerceiro_Vendedor INT NULL,
  
  PRIMARY KEY (idFornecedor),
  CONSTRAINT fk_Fornecedor_Terceiro_Vendedor
    FOREIGN KEY (idTerceiro_Vendedor)
    REFERENCES Terceiro_Vendedor (idTerceiro_Vendedor)
);

CREATE TABLE Produto (
  idProduto INT NOT NULL AUTO_INCREMENT,
  categoria VARCHAR(45) NULL,
  descricao VARCHAR(45) NOT NULL,
  valor FLOAT NOT NULL,
  status_ ENUM("Novo", "Usado") NOT NULL,
  
  idFornecedor INT NOT NULL,
  
  PRIMARY KEY (idProduto, idFornecedor),
  CONSTRAINT fk_Produto_Fornecedor
    FOREIGN KEY (idFornecedor)
    REFERENCES Fornecedor (idFornecedor)
);

ALTER TABLE Produto
	ADD nome varchar(100) NOT NULL;

CREATE TABLE Estoque (
  idEstoque INT NOT NULL AUTO_INCREMENT,
  local_ VARCHAR(20),
  
  PRIMARY KEY (idEstoque)
);

CREATE TABLE Produto_Em_Estoque (
  idProduto INT NOT NULL,
  idEstoque INT NOT NULL,
  quantidade_em_estoque INT NOT NULL,
  
  PRIMARY KEY (idProduto, idEstoque),
  CONSTRAINT fk_Produto_Em_Estoque_Produto
    FOREIGN KEY (idProduto) 
    REFERENCES Produto (idProduto),
  CONSTRAINT fk_Produto_Em_Estoque_Estoque
    FOREIGN KEY (idEstoque)
    REFERENCES Estoque (idEstoque)
);

CREATE TABLE Pedido (
  idPedido INT NOT NULL AUTO_INCREMENT,
  status_ ENUM("A caminho", "Entregue", "Pendente") NOT NULL DEFAULT "Pendente",
  descricao VARCHAR(100) NOT NULL,
  frete FLOAT NOT NULL DEFAULT 0.0,
  codigo_de_rastreio VARCHAR(45) NOT NULL,
  
  idProduto INT NOT NULL,
  idCliente INT NOT NULL,
  
  PRIMARY KEY (idPedido, idProduto, idCliente),
  CONSTRAINT fk_Pedido_Produto
    FOREIGN KEY (idProduto)
    REFERENCES Produto (idProduto),
  CONSTRAINT fk_Pedido_Cliente
    FOREIGN KEY (idCliente)
    REFERENCES Cliente (idCliente)
);