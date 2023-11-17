-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema oficinaequipe
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema oficinaequipe
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `oficinaequipe` DEFAULT CHARACTER SET utf8 ;
USE `oficinaequipe` ;

-- -----------------------------------------------------
-- Table `oficinaequipe`.`endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficinaequipe`.`endereco` (
  `idendereco` INT NOT NULL AUTO_INCREMENT,
  `uf` VARCHAR(2) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `bairro` VARCHAR(45) NOT NULL,
  `rua` VARCHAR(60) NOT NULL,
  `numero` INT NOT NULL,
  `complemento` VARCHAR(45) NOT NULL,
  `cep` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`idendereco`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficinaequipe`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficinaequipe`.`cliente` (
  `cpf` VARCHAR(14) NOT NULL,
  `nome` VARCHAR(60) NOT NULL,
  `telefone` VARCHAR(11) NULL,
  `endereco_idendereco` INT NOT NULL,
  PRIMARY KEY (`cpf`),
  INDEX `fk_cliente_endereco1_idx` (`endereco_idendereco` ASC) VISIBLE,
  CONSTRAINT `fk_cliente_endereco1`
    FOREIGN KEY (`endereco_idendereco`)
    REFERENCES `oficinaequipe`.`endereco` (`idendereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficinaequipe`.`formaPagamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficinaequipe`.`formaPagamento` (
  `idformaPagamento` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idformaPagamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficinaequipe`.`servico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficinaequipe`.`servico` (
  `idservico` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `valor` DECIMAL(6,2) NOT NULL,
  `descricao` LONGTEXT NULL,
  PRIMARY KEY (`idservico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficinaequipe`.`mecanico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficinaequipe`.`mecanico` (
  `cpf` VARCHAR(14) NOT NULL,
  `nome` VARCHAR(60) NOT NULL,
  `sexo` VARCHAR(1) NOT NULL,
  `especialidade` VARCHAR(45) NOT NULL,
  `salario` DECIMAL(6,2) NOT NULL,
  `endereco_idendereco` INT NOT NULL,
  PRIMARY KEY (`cpf`),
  INDEX `fk_mecanico_endereco1_idx` (`endereco_idendereco` ASC) VISIBLE,
  CONSTRAINT `fk_mecanico_endereco1`
    FOREIGN KEY (`endereco_idendereco`)
    REFERENCES `oficinaequipe`.`endereco` (`idendereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficinaequipe`.`veiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficinaequipe`.`veiculo` (
  `placa` VARCHAR(7) NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `descricao` LONGTEXT NULL,
  `mecanico_cpf` VARCHAR(14) NOT NULL,
  `cliente_cpf` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`placa`),
  INDEX `fk_veiculo_mecanico1_idx` (`mecanico_cpf` ASC) VISIBLE,
  INDEX `fk_veiculo_cliente1_idx` (`cliente_cpf` ASC) VISIBLE,
  CONSTRAINT `fk_veiculo_mecanico1`
    FOREIGN KEY (`mecanico_cpf`)
    REFERENCES `oficinaequipe`.`mecanico` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_veiculo_cliente1`
    FOREIGN KEY (`cliente_cpf`)
    REFERENCES `oficinaequipe`.`cliente` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

alter table veiculo drop descricao;

alter table veiculo add column RENAVAM varchar(11) not null after marca;

/*drop table veiculo;*/

-- -----------------------------------------------------
-- Table `oficinaequipe`.`os`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficinaequipe`.`os` (
  `idos` INT NOT NULL AUTO_INCREMENT,
  `dataEmissao` DATETIME NOT NULL,
  `dataConclusao` DATETIME NOT NULL,
  `dataPrevista` DATETIME NULL,
  `valorTotal` DECIMAL(6,2) NOT NULL,
  `formaPagamento_idformaPagamento` INT NOT NULL,
  `veiculo_placa` VARCHAR(7) NOT NULL,
  PRIMARY KEY (`idos`),
  INDEX `fk_os_formaPagamento1_idx` (`formaPagamento_idformaPagamento` ASC) VISIBLE,
  INDEX `fk_os_veiculo1_idx` (`veiculo_placa` ASC) VISIBLE,
  CONSTRAINT `fk_os_formaPagamento1`
    FOREIGN KEY (`formaPagamento_idformaPagamento`)
    REFERENCES `oficinaequipe`.`formaPagamento` (`idformaPagamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_os_veiculo1`
    FOREIGN KEY (`veiculo_placa`)
    REFERENCES `oficinaequipe`.`veiculo` (`placa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficinaequipe`.`fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficinaequipe`.`fornecedor` (
  `cnpj` VARCHAR(18) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(11) NULL,
  `endereco_idendereco` INT NOT NULL,
  PRIMARY KEY (`cnpj`),
  INDEX `fk_fornecedor_endereco1_idx` (`endereco_idendereco` ASC) VISIBLE,
  CONSTRAINT `fk_fornecedor_endereco1`
    FOREIGN KEY (`endereco_idendereco`)
    REFERENCES `oficinaequipe`.`endereco` (`idendereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficinaequipe`.`peca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficinaequipe`.`peca` (
  `idpeca` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `quantidade` INT NOT NULL,
  `valor` DECIMAL(6,2) NOT NULL,
  `modelo` VARCHAR(45) NOT NULL,
  `ano` DECIMAL(4) NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `os_idos` INT NOT NULL,
  `fornecedor_cnpj` VARCHAR(18) NOT NULL,
  PRIMARY KEY (`idpeca`),
  INDEX `fk_peca_os1_idx` (`os_idos` ASC) VISIBLE,
  INDEX `fk_peca_fornecedor1_idx` (`fornecedor_cnpj` ASC) VISIBLE,
  CONSTRAINT `fk_peca_os1`
    FOREIGN KEY (`os_idos`)
    REFERENCES `oficinaequipe`.`os` (`idos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_peca_fornecedor1`
    FOREIGN KEY (`fornecedor_cnpj`)
    REFERENCES `oficinaequipe`.`fornecedor` (`cnpj`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficinaequipe`.`servico_os`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficinaequipe`.`servico_os` (
  `servico_idservico` INT NOT NULL,
  `os_idos` INT NOT NULL,
  PRIMARY KEY (`servico_idservico`),
  INDEX `fk_servico_has_os_servico1_idx` (`servico_idservico` ASC) VISIBLE,
  INDEX `fk_servico_os_os1_idx` (`os_idos` ASC) VISIBLE,
  CONSTRAINT `fk_servico_has_os_servico1`
    FOREIGN KEY (`servico_idservico`)
    REFERENCES `oficinaequipe`.`servico` (`idservico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_servico_os_os1`
    FOREIGN KEY (`os_idos`)
    REFERENCES `oficinaequipe`.`os` (`idos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficinaequipe`.`mecanico_os`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficinaequipe`.`mecanico_os` (
  `os_idos` INT NOT NULL,
  `mecanico_cpf` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`os_idos`),
  INDEX `fk_mecanico_has_os_os1_idx` (`os_idos` ASC) VISIBLE,
  INDEX `fk_mecanico_os_mecanico1_idx` (`mecanico_cpf` ASC) VISIBLE,
  CONSTRAINT `fk_mecanico_has_os_os1`
    FOREIGN KEY (`os_idos`)
    REFERENCES `oficinaequipe`.`os` (`idos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_mecanico_os_mecanico1`
    FOREIGN KEY (`mecanico_cpf`)
    REFERENCES `oficinaequipe`.`mecanico` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

