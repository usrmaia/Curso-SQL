CREATE DATABASE oficina;
USE oficina;

CREATE TABLE IF NOT EXISTS `Cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `Autorizacao` BOOLEAN NOT NULL,
  `Primeiro_Nome` VARCHAR(45) NOT NULL,
  `Sobrenome` VARCHAR(45) NULL,
  
  PRIMARY KEY (`idCliente`)
);

CREATE TABLE IF NOT EXISTS `Veiculo` (
  `idVeiculo` INT NOT NULL AUTO_INCREMENT,
  `Conserto` BOOLEAN NOT NULL,
  `Revisao` BOOLEAN NOT NULL,
  `idCliente` INT NOT NULL,
  
  PRIMARY KEY (`idVeiculo`, `idCliente`),
  CONSTRAINT `fk_Veiculo_Cliente1`
    FOREIGN KEY (`idCliente`)
    REFERENCES `Cliente` (`idCliente`)
);

CREATE TABLE IF NOT EXISTS `Mecanico` (
  `idMecanico` INT NOT NULL AUTO_INCREMENT,
  `Primeiro_Nome` VARCHAR(45) NOT NULL,
  `Valor_da_Mao_de_Obra` FLOAT NULL DEFAULT 260,
  `Endereco` VARCHAR(45) NULL,
  `Especialidade` ENUM("Carro", "Moto", "Caminhão") NOT NULL,
  `Sobrenome` VARCHAR(45) NOT NULL,
  
  PRIMARY KEY (`idMecanico`)
);

CREATE TABLE IF NOT EXISTS `Equipe` (
  `idEquipe` INT NOT NULL AUTO_INCREMENT,
  `Resultado_da_Execucao` VARCHAR(255) NOT NULL,
  
  PRIMARY KEY (`idEquipe`)
);

CREATE TABLE IF NOT EXISTS `MecanicosdaEquipe` (
  `idMecanico` INT NOT NULL,
  `idEquipe` INT NOT NULL,
  
  PRIMARY KEY (`idMecanico`, `idEquipe`),
  CONSTRAINT `fk_Mecanico_has_Equipe_Mecânico1`
    FOREIGN KEY (`idMecanico`)
    REFERENCES `Mecanico` (`idMecanico`),
  CONSTRAINT `fk_Mecanico_has_Equipe_Equipe1`
    FOREIGN KEY (`idEquipe`)
    REFERENCES `Equipe` (`idEquipe`)
);

CREATE TABLE IF NOT EXISTS `Avaliacao` (
  `idAvaliacao` INT NOT NULL AUTO_INCREMENT,
  `idEquipe` INT NOT NULL,
  `Resultado` VARCHAR(255) NOT NULL,
  `idVeiculo` INT NOT NULL,
  
  PRIMARY KEY (`idAvaliacao`, `idEquipe`, `idVeiculo`),
  CONSTRAINT `fk_Avaliacao_Equipe1`
    FOREIGN KEY (`idEquipe`)
    REFERENCES `Equipe` (`idEquipe`),
  CONSTRAINT `fk_Avaliacao_Veiculo1`
    FOREIGN KEY (`idVeiculo`)
    REFERENCES `Veiculo` (`idVeiculo`)
);

CREATE TABLE IF NOT EXISTS `OrdemdeServico` (
  `idOrdemdeServico` INT NOT NULL AUTO_INCREMENT,
  `idAvaliacao` INT NOT NULL,
  `Data_de_Entrega` DATE NOT NULL,
  `Data_de_Emissão` DATE NOT NULL,
  `Valor_Total` FLOAT NOT NULL,
  `Status` ENUM("Ok", "Erro") NOT NULL,
  
  PRIMARY KEY (`idOrdemdeServico`, `idAvaliacao`),
  CONSTRAINT `fk_OrdemdeServiço_Avaliacao1`
    FOREIGN KEY (`idAvaliacao`)
    REFERENCES `Avaliacao` (`idAvaliacao`)
);

CREATE TABLE IF NOT EXISTS `Peca` (
  `idPeca` INT NOT NULL AUTO_INCREMENT,
  `Valor` FLOAT NOT NULL,
  
  PRIMARY KEY (`idPeca`)
);

CREATE TABLE IF NOT EXISTS `CompradePeca` (
  `idOrdemdeServico` INT NOT NULL,
  `idPeca` INT NOT NULL,
  
  PRIMARY KEY (`idOrdemdeServico`, `idPeca`),
  CONSTRAINT `fk_CompradePeca_OrdemdeServiço`
    FOREIGN KEY (`idOrdemdeServico`)
    REFERENCES `OrdemdeServico` (`idOrdemdeServico`),
  CONSTRAINT `fk_CompradePeca_Peça`
    FOREIGN KEY (`idPeca`)
    REFERENCES `Peca` (`idPeca`)
);