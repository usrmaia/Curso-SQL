USE ecommerce;

INSERT INTO Cliente (nome, sobrenome, rg, num_cartao) VALUES 
	("George", "Maia", 111111111, 141414141), 
    ("Gabriel", "Silva", 222222222, 151551151), 
    ("Rodrigo", "Pereira", 333333333, 166161616), 
    ("Maria", "Costa", 444444444, 117711717), 
    ("Ana", "Rabelo", 555555555, 188888811), 
    ("Rebeca", "Rodrigues", 666666666, 919199119);

INSERT INTO Cliente_Pessoa_Fisica (idCliente) VALUES 
	(1), 
    (3), 
    (5);

INSERT INTO Cliente_Pessoa_Juridica (idCliente) VALUES 
	(2), 
    (4), 
    (6);
    
INSERT INTO Fornecedor (razao_social, cnpj) VALUES
	("Apple", 5855858), 
    ("Google", 4949449), 
    ("Motorola", 6966969);

INSERT INTO Terceiro_Vendedor (idTerceiro_Vendedor) VALUES
	(1);

INSERT INTO Fornecedor (razao_social, cnpj, idTerceiro_Vendedor) VALUES
    ("Xiaomi", 3535533, 1);
    
INSERT INTO Produto (idFornecedor, nome, valor, status_, descricao) VALUES
	(1, "IPhone 13", 8000, "Novo", " "),
    (1, "IPhone 11", 7000, "Novo", " "),
    (1, "IPhone 9", 7500, "Usado", " "),
    (2, "Pixel 4", 8000, "Novo", " "),
    (2, "Pixel 3", 7000, "Novo", " "),
    (2, "Pixel 3", 5000, "Usado", " "),
    (3, "Moto Z", 8000, "Novo", " "),
    (3, "Moto One", 2000, "Novo", " "),
    (3, "Moto One Action", 1000, "Novo", " "),
    (6, "Mi 3", 2000, "Novo", " "),
    (6, "Mi A3", 1000, "Novo", " "),
    (6, "Mi Band", 1000, "Novo", " ");

INSERT INTO Estoque (local_) VALUES 
	("Ceará"),
    ("Piauí"),
    ("Bahia"),
    ("Rio Grande do Norte");
    
INSERT INTO Produto_Em_Estoque VALUES
	(1, 1, 50),
    (1, 3, 56),
    (1, 4, 45),
    (2, 4, 21),
    (3, 1, 321),
    (3, 2, 142),
    (3, 3, 23),
    (3, 4, 52),
    (6, 1, 452),
    (6, 3, 10);

INSERT INTO Pedido (idCliente, idProduto, status_ , descricao, frete, codigo_de_rastreio) VALUES 
	(1, 1, "Pendente", " ", 20.5, "12fsgfyseufg"), 
    (1, 5, "A caminho", " ", 20.5, "15fwjfsfu"), 
    (4, 7, "Pendente", " ", 20.5, "84fsfshvfs"), 
    (2, 8, "Entregue", " ", 20.5, "fsfsfs8fsfs"), 
    (2, 12, "Pendente", " ", 20.5, "6hthfh7fsfsfsf"), 
    (3, 2, "Pendente", " ", 20.5, "82gsfgvsedghkbvfs"), 
    (3, 3, "A caminho", " ", 20.5, "9fsfkjbsfhvs"), 
    (6, 4, "Entregue", " ", 20.5, "368fsfbvfhsfs"), 
    (6, 4, "Pendente", " ", 20.5, "5+7fsfhsgfsfsfgg");