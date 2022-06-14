CREATE DATABASE equipe473532; # Criar banco de dados com o nome solicitado pelo professor
USE equipe473532; # Comando necessário para começar a criar tabelas no banco de dados

# A partir daqui, começam as definições das tabelas pedidas no descritivo do trabalho
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema equipe473532
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema equipe473532
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `equipe473532` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `equipe473532` ;

-- -----------------------------------------------------
-- Table `equipe473532`.`categoria_livro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `equipe473532`.`categoria_livro` (
  `codigo_da_categoria` INT NOT NULL,
  `descricao` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`codigo_da_categoria`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `equipe473532`.`alunos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `equipe473532`.`alunos` (
  `matricula_aluno` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `cod_curso[Curso]` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(45) NULL,
  `data_de_ingresso` VARCHAR(45) NOT NULL,
  `data_de_conclusao_prevista` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`matricula_aluno`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `equipe473532`.`telefones_alunos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `equipe473532`.`telefones_alunos` (
  `telefone_ID` INT NOT NULL,
  `numero_telefone` VARCHAR(45) NOT NULL,
  `matricula_aluno` INT NULL,
  PRIMARY KEY (`telefone_ID`),
  INDEX `matricula_aluno_idx` (`matricula_aluno` ASC) VISIBLE,
  CONSTRAINT `matricula_aluno`
    FOREIGN KEY (`matricula_aluno`)
    REFERENCES `equipe473532`.`alunos` (`matricula_aluno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
