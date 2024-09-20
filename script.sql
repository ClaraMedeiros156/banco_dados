-- MySQL Script generated by MySQL Workbench
-- Fri Sep 20 07:44:01 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema vendas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema vendas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `vendas` DEFAULT CHARACTER SET utf8 ;
USE `vendas` ;

-- -----------------------------------------------------
-- Table `vendas`.`CATEGORIA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendas`.`CATEGORIA` (
  `idcategorias` INT	    NOT NULL,
  `dscategoria` VARCHAR(45) NOT NULL,
	PRIMARY KEY (`idcategorias`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vendas`.`PRODUTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendas`.`PRODUTO` (
	`idprodutos` INT 		 NOT NULL,
	`dsproduto`  VARCHAR(45) NOT NULL,
	`preco` 	 FLOAT 	     NOT NULL,
	`qtde` 	     INT 		 NOT NULL,
	`foto` 	     LONGBLOB    NOT NULL,
	`CATEGORIA_idcategorias` INT NOT NULL,
  PRIMARY KEY (`idprodutos`),
  -- INDEX `fk_PRODUTO_CATEGORIA_idx` (`CATEGORIA_idcategorias` ASC) VISIBLE,
  CONSTRAINT `fk_PRODUTO_CATEGORIA`
    FOREIGN KEY (`CATEGORIA_idcategorias`)
    REFERENCES `vendas`.`CATEGORIA` (`idcategorias`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vendas`.`CLIENTES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendas`.`CLIENTES` (
	`idCLIENTES` INT 		  NOT NULL,
	`nome`       VARCHAR(45)  NOT NULL,
	`email` 	 VARCHAR(100) NOT NULL,
	`senha`      VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idCLIENTES`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vendas`.`PEDIDOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendas`.`PEDIDOS` (
	`idPEDIDOS` INT         NOT NULL,
	`data`      DATE        NOT NULL,
	`status`    VARCHAR(50) NOT NULL,
	`sessao`    VARCHAR(45) NOT NULL,
	`CLIENTES_idCLIENTES` INT NOT NULL,
	PRIMARY KEY (`idPEDIDOS`),
 -- INDEX `fk_PEDIDOS_CLIENTES1_idx` (`CLIENTES_idCLIENTES` ASC) VISIBLE,
	CONSTRAINT `fk_PEDIDOS_CLIENTES1`
    FOREIGN KEY (`CLIENTES_idCLIENTES`)
    REFERENCES `vendas`.`CLIENTES` (`idCLIENTES`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vendas`.`PEDIDO ITENS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendas`.`PEDIDO ITENS` (
	`idPEDIDO ITENS` INT     NOT NULL,
	`qtde` 		     INT     NOT NULL,
	`preco` 		 FLOAT   NOT NULL,
	`total`          FLOAT   NOT NULL,
	`PRODUTO_idprodutos` INT NOT NULL,
	`PEDIDOS_idPEDIDOS` INT  NOT NULL,
  PRIMARY KEY (`idPEDIDO ITENS`),
  -- INDEX `fk_PEDIDO ITENS_PRODUTO1_idx` (`PRODUTO_idprodutos` ASC) VISIBLE,
  -- INDEX `fk_PEDIDO ITENS_PEDIDOS1_idx` (`PEDIDOS_idPEDIDOS` ASC) VISIBLE,
CONSTRAINT `fk_PEDIDO ITENS_PRODUTO1`
    FOREIGN KEY (`PRODUTO_idprodutos`)
    REFERENCES `vendas`.`PRODUTO` (`idprodutos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PEDIDO ITENS_PEDIDOS1`
    FOREIGN KEY (`PEDIDOS_idPEDIDOS`)
    REFERENCES `vendas`.`PEDIDOS` (`idPEDIDOS`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
