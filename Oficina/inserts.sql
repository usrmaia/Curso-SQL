USE oficina;

INSERT INTO `Cliente` (`Primeiro_Nome`, `Sobrenome`, `Autorizacao`) VALUES 
	("George", "Maia", TRUE),
    ("Carlo", "Miguel", FALSE),
    ("Caio", "Sousa", TRUE),
    ("Juan", "Souza", FALSE),
    ("Maria", "Costa", TRUE),
    ("Bia", "Branca", TRUE),
    ("Ana", "Silva", TRUE);

INSERT INTO `Veiculo` (`idCliente`, `Conserto`, `Revisao`) VALUES 
	(1, TRUE, TRUE), 
    (1, FALSE, TRUE), 
    (1, TRUE, FALSE), 
    (2, TRUE, TRUE),
    (2, TRUE, FALSE), 
    (2, FALSE, TRUE),
    (3, FALSE, TRUE), 
    (4, TRUE, TRUE), 
    (4, FALSE, TRUE), 
    (5, TRUE, TRUE), 
    (6, FALSE, TRUE);

INSERT INTO `Mecanico` (`Primeiro_Nome`, `Sobrenome`, `Valor_da_Mao_de_Obra`, `Especialidade`, `Endereco`) VALUES 
	("Ricardo", "Pinheiro", 220, "Carro", " "), 
    ("Bia", "Costa", 500, "Caminhão", " "), 
    ("Erick", "Maria", 400, "Caminhão", " "), 
    ("Nicolas", "Maia", 150, "Moto", " "), 
    ("Marcelo", "Filho", 300, "Carro", " "), 
    ("Henrique", "Filho", 250, "Carro", " "), 
    ("Rosa", "Sousa", 140, "Moto", " "), 
    ("Guilherme", "Costa", 170, "Moto", " ");

INSERT INTO `Equipe` (`idEquipe`, `Resultado_da_Execucao`) VALUES 
	(1, " "), 
    (2, " "), 
    (3, " "), 
    (4, " ");

INSERT INTO `MecanicosdaEquipe` (`idEquipe`, `idMecanico`) VALUES 
	(1, 2), 
    (1, 3), 
    (2, 1), 
    (2, 5), 
    (2, 6), 
    (3, 4), 
    (3, 7), 
    (3, 8), 
    (4, 2), 
    (4, 4),
    (4, 5);

INSERT INTO `Avaliacao` (`idEquipe`, `idVeiculo`, `Resultado`) VALUES 
	(1, 1, " "), 
    (1, 2, " "), 
    (2, 3, " "), 
    (1, 4, " "), 
    (3, 5, " "), 
    (2, 6, " "), 
    (2, 7, " "), 
    (4, 8, " "), 
    (4, 9, " "), 
    (4, 10, " "), 
    (4, 11, " ");

INSERT INTO `OrdemdeServico` (`idAvaliacao`, `Data_de_Emissão`, `Data_de_Entrega`, `Valor_Total`, `Status`) VALUES 
	(1, "2022-09-15", "2022-09-21", 1200, "Ok"), 
    (2, "2022-09-21", "2022-09-28", 1200, "Ok"), 
    (3, "2022-09-13", "2022-09-20", 800, "Ok"), 
    (4, "2022-09-5", "2022-09-12", 1200, "Ok"), 
    (5, "2022-09-5", "2022-09-11", 600, "Ok"), 
    (6, "2022-09-5", "2022-09-12", 800, "Ok"), 
    (7, "2022-09-8", "2022-09-14", 800, "Ok"), 
    (8, "2022-09-9", "2022-09-14", 700, "Ok"), 
    (9, "2022-09-14", "2022-09-19", 700, "Ok"), 
    (10, "2022-09-16", "2022-09-22", 700, "Ok"), 
    (11, "2022-09-16", "2022-09-23", 700, "Ok");

INSERT INTO `Peca` (`Valor`) VALUES 
	(250), 
    (300), 
    (150), 
    (170), 
    (200),
    (40), 
    (60), 
    (65);

INSERT INTO `CompradePeca` (`idOrdemdeServico`, `idPeca`) VALUES 
	(1, 1), 
    (1, 2), 
    (2, 2), 
    (3, 3), 
    (4, 1), 
    (5, 6), 
    (5, 7), 
    (6, 4), 
    (7, 5), 
    (7, 6), 
    (8, 6), 
    (8, 7), 
    (9, 8), 
    (10, 8), 
    (11, 6), 
    (11, 7);