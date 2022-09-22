USE oficina;

-- Cliente
SELECT *
FROM Cliente;

-- Clientes que pediram apenas revisão
SELECT concat(c.Primeiro_Nome, " ", c.Sobrenome) AS Cliente, v.Revisao, v.Conserto
FROM Cliente c INNER JOIN Veiculo v
	ON c.idCliente = v.idCliente
HAVING v.Revisao = TRUE AND v.Conserto = FALSE;

-- Clientes que pediram conserto e revisão
SELECT concat(c.Primeiro_Nome, " ", c.Sobrenome) AS Cliente, v.idVeiculo, v.Revisao, v.Conserto
FROM Cliente c INNER JOIN Veiculo v
	ON c.idCliente = v.idCliente
HAVING v.Revisao = TRUE AND v.Conserto = TRUE;

-- Clientes que pediram apenas conserto
SELECT concat(c.Primeiro_Nome, " ", c.Sobrenome) AS Cliente, v.Revisao, v.Conserto
FROM Cliente c INNER JOIN Veiculo v
	ON c.idCliente = v.idCliente
HAVING v.Revisao = FALSE AND v.Conserto = TRUE;

-- Veiculos
SELECT *
FROM Veiculo;

-- Veiculos que estao na oficina em data X
SELECT os.idOrdemdeServico, os.Data_de_Emissão, os.Data_de_Entrega, v.idVeiculo
FROM Veiculo v INNER JOIN Avaliacao a
	ON v.idVeiculo = a.idVeiculo
    INNER JOIN OrdemdeServico os
    ON a.idAvaliacao = os.idAvaliacao
HAVING os.Data_de_Emissão <= "2022-09-13" AND "2022-09-13" <= os.Data_de_Entrega;

-- Mecanico
SELECT *
FROM Mecanico;

-- Grupos de mecanicos
SELECT e.idEquipe, m.Primeiro_Nome, m.Especialidade
FROM Equipe e INNER JOIN MecanicosdaEquipe me 
	ON e.idEquipe = me.idEquipe
    INNER JOIN Mecanico m
    ON me.idMecanico = m.idMecanico
GROUP BY e.idEquipe, m.Primeiro_Nome, m.Especialidade
ORDER BY e.idEquipe, m.Primeiro_Nome;

-- Equipe
SELECT *
FROM Equipe;

-- Mecanicos da equipe
SELECT me.idEquipe, me.idMecanico
FROM Equipe e INNER JOIN MecanicosdaEquipe me
	ON e.idEquipe = me.idEquipe
    INNER JOIN Mecanico m
    ON me.idMecanico = m.idMecanico;

-- Avaliação
SELECT *
FROM Avaliacao;

-- Ordem de Serviço
SELECT *
FROM OrdemdeServico;

-- Peças
SELECT *
FROM Peca;

-- Pecas mais compradas
SELECT cp.idPeca, count(*) AS QTD_de_Compras
FROM CompradePeca cp INNER JOIN Peca p
	ON cp.idPeca = p.idPeca
GROUP BY cp.idPeca
ORDER BY QTD_de_Compras DESC;

-- Compra de peças
SELECT *
FROM CompradePeca;