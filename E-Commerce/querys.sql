USE ecommerce;

-- Clientes
SELECT concat(nome, " ", sobrenome) AS Nome, rg AS RG, num_cartao AS `Nº Cartão` 
FROM Cliente
ORDER BY nome, sobrenome;

-- Quantidade de clientes
SELECT count(*) AS `QTD de Cliente` FROM Cliente;

-- Cliente Jurídico
SELECT concat(c.nome, " ", c.sobrenome) as Nome, c.rg AS RG
FROM Cliente c INNER JOIN Cliente_Pessoa_Juridica cpj
	ON c.idCliente = cpj.idCliente;

-- Cliente Físico
SELECT concat(c.nome, " ", c.sobrenome) as Nome, c.rg AS RG
FROM Cliente c INNER JOIN Cliente_Pessoa_Fisica cpj
	ON c.idCliente = cpj.idCliente;

-- Fornecedores
SELECT razao_social AS `Razão Social`, cnpj AS CNPJ
FROM Fornecedor;

-- Terceiros Vendedor
SELECT razao_social AS `Razão Social`, cnpj AS CNPJ
FROM Fornecedor f INNER JOIN Terceiro_Vendedor tv
	ON f.idTerceiro_Vendedor = tv.idTerceiro_Vendedor;

-- Fornecedores e seus produtos
SELECT f.razao_social AS Fornecedor, p.nome AS Produto
FROM Fornecedor f INNER JOIN Produto p
	ON p.idFornecedor = f.idFornecedor;

-- Quantidade de produto por forncedores
SELECT f.razao_social AS Fornecedor, count(p.nome) AS `QTD de Produtos`
FROM Fornecedor f INNER JOIN Produto p
	ON p.idFornecedor = f.idFornecedor
GROUP BY f.razao_social;

-- Produtos
SELECT nome AS Nome, valor AS Valor, categoria AS Categoria, status_ AS Status
FROM Produto;

-- Produtos usados
SELECT nome AS Nome, valor AS Valor, categoria AS Categoria, status_ AS Status
FROM Produto
WHERE status_ = "Usado";

-- Produtos acima de 5000
SELECT nome AS Nome, valor AS Valor
FROM Produto
HAVING valor > 5;

-- Produtos e seus fornecedores
SELECT f.razao_social AS Fornecedor, nome AS Nome, valor AS Valor, categoria AS Categoria, status_ AS Status
FROM Produto p INNER JOIN Fornecedor f
	ON p.idFornecedor = f.idFornecedor;

-- Media de produtos por fornecedores
SELECT f.razao_social AS Fornecedor, avg(p.valor) AS `Valor Médio`
FROM Produto p INNER JOIN Fornecedor f
	ON p.idFornecedor = f.idFornecedor
GROUP BY f.razao_social;

-- Produtos e seus estoques
SELECT p.nome AS Nome, p.valor AS Valor, p.categoria AS Categoria, p.status_ AS Status, 
	e.local_ AS `Local de Estoque`, pe.quantidade_em_estoque AS `QTD em Estoque`
FROM Produto p INNER JOIN Produto_Em_Estoque pe
	ON pe.idProduto = p.idProduto 
    INNER JOIN Estoque e
    ON pe.idEstoque = e.idEstoque
ORDER BY p.nome;

-- Produtos, seus forncedores e seus estoques
SELECT f.razao_social AS Fornecedor, p.nome AS Nome, p.valor AS Valor, p.categoria AS Categoria, p.status_ AS Status, 
	e.local_ AS `Local de Estoque`, pe.quantidade_em_estoque AS `QTD em Estoque`
FROM Produto p INNER JOIN Fornecedor f
	ON p.idFornecedor = f.idFornecedor
    INNER JOIN Produto_Em_Estoque pe
    ON pe.idProduto = p.idProduto
    INNER JOIN Estoque e
    ON pe.idEstoque = e.idEstoque
ORDER BY f.razao_social, p.nome;

-- Pedido
SELECT *
FROM Pedido;

-- Pedidos entregues
SELECT *
FROM Pedido
WHERE status_ = "Entregue";

-- Clientes que ainda não realizaram pedido
SELECT DISTINCT c.nome
FROM Pedido p INNER JOIN Cliente c
	ON c.idCliente NOT IN (
	SELECT DISTINCT p.idCliente
    FROM Pedido p
);

-- Produtos que ainda não foram comprados
SELECT DISTINCT nome
FROM Pedido pe INNER JOIN Produto pr
	ON pr.idProduto NOT IN (
	SELECT DISTINCT pe.idProduto
    FROM Pedido pe
);