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
-- Table `equipe473532`.`Categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `equipe473532`.`Categoria` (
  `codCategoria` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`codCategoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `equipe473532`.`Livros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `equipe473532`.`Livros` (
  `ISBN` INT NOT NULL,
  `titulo` VARCHAR(90) NOT NULL,
  `anoLancamento` YEAR NOT NULL,
  `editora` VARCHAR(50) NOT NULL,
  `quantidadeCopias` BIGINT NOT NULL,
  `Categoria_codCategoria` INT NOT NULL,
  PRIMARY KEY (`ISBN`),
  UNIQUE INDEX `ISBN_UNIQUE` (`ISBN` ASC),
  INDEX `fk_Livros_Categoria1_idx` (`Categoria_codCategoria` ASC),
  CONSTRAINT `fk_Livros_Categoria1`
    FOREIGN KEY (`Categoria_codCategoria`)
    REFERENCES `equipe473532`.`Categoria` (`codCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `equipe473532`.`Autores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `equipe473532`.`Autores` (
  `email` VARCHAR(60) NOT NULL,
  `nome` VARCHAR(60) NOT NULL,
  `nacionalidade` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`email`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `equipe473532`.`Escreve`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `equipe473532`.`Escreve` (
  `Autor_email` VARCHAR(60) NOT NULL,
  `Livros_ISBN` INT NOT NULL,
  PRIMARY KEY (`Autor_email`, `Livros_ISBN`),
  INDEX `fk_Autor_has_Livros_Livros1_idx` (`Livros_ISBN` ASC),
  INDEX `fk_Autor_has_Livros_Autor_idx` (`Autor_email` ASC),
  CONSTRAINT `fk_Autor_has_Livros_Autor`
    FOREIGN KEY (`Autor_email`)
    REFERENCES `equipe473532`.`Autores` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Autor_has_Livros_Livros1`
    FOREIGN KEY (`Livros_ISBN`)
    REFERENCES `equipe473532`.`Livros` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `equipe473532`.`cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `equipe473532`.`cursos` (
  `cod_curso` INT NOT NULL,
  `nome_curso` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cod_curso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `equipe473532`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `equipe473532`.`usuarios` (
  `id` INT NOT NULL,
  `login` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  `tipo_usuario` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `equipe473532`.`alunos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `equipe473532`.`alunos` (
  `matricula_aluno` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `cod_curso` INT NOT NULL,
  `endereco` VARCHAR(45) NULL,
  `data_de_ingresso` DATE NOT NULL,
  `data_de_conclusao_prevista` DATE NOT NULL,
  `id_usuario` INT NOT NULL,
  PRIMARY KEY (`matricula_aluno`, `id_usuario`),
  INDEX `cod_curso_idx` (`cod_curso` ASC) VISIBLE,
  INDEX `fk_alunos_usuarios1_idx` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `cod_curso`
    FOREIGN KEY (`cod_curso`)
    REFERENCES `equipe473532`.`cursos` (`cod_curso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_alunos_usuarios1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `equipe473532`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `equipe473532`.`telefones_alunos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `equipe473532`.`telefones_alunos` (
  `telefone_ID` INT NOT NULL,
  `numero_telefone` VARCHAR(45) NOT NULL,
  `matricula_aluno` INT NOT NULL,
  PRIMARY KEY (`telefone_ID`),
  INDEX `matricula_aluno_idx` (`matricula_aluno` ASC) VISIBLE,
  CONSTRAINT `matricula_aluno`
    FOREIGN KEY (`matricula_aluno`)
    REFERENCES `equipe473532`.`alunos` (`matricula_aluno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `equipe473532`.`professores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `equipe473532`.`professores` (
  `mat_siape` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(45) NULL,
  `telefone_celular` VARCHAR(45) NULL,
  `cod_curso` INT NOT NULL,
  `data_de_contratacao` DATE NOT NULL,
  `regime_de_trabalho` VARCHAR(45) NULL,
  `id_usuario` INT NOT NULL,
  PRIMARY KEY (`mat_siape`, `id_usuario`),
  INDEX `cod_curso_idx` (`cod_curso` ASC) VISIBLE,
  INDEX `fk_professores_usuarios1_idx` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `cod_curso`
    FOREIGN KEY (`cod_curso`)
    REFERENCES `equipe473532`.`cursos` (`cod_curso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_professores_usuarios1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `equipe473532`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `equipe473532`.`funcionarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `equipe473532`.`funcionarios` (
  `matricula_funcionario` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(45) NULL,
  `id_usuario` INT NOT NULL,
  PRIMARY KEY (`matricula_funcionario`, `id_usuario`),
  INDEX `fk_funcionarios_usuarios1_idx` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_funcionarios_usuarios1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `equipe473532`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `equipe473532`.`telefones_funcionarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `equipe473532`.`telefones_funcionarios` (
  `telefone_ID` INT NOT NULL,
  `numero_telefone` VARCHAR(45) NOT NULL,
  `matricula_funcionario` INT NOT NULL,
  PRIMARY KEY (`telefone_ID`),
  INDEX `matricula_funcionario_idx` (`matricula_funcionario` ASC) VISIBLE,
  CONSTRAINT `matricula_funcionario`
    FOREIGN KEY (`matricula_funcionario`)
    REFERENCES `equipe473532`.`funcionarios` (`matricula_funcionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


-- -----------------------------------------------------
-- Povoamento das tabelas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Povoando a tabela de categoria
-- -----------------------------------------------------

INSERT INTO categoria VALUES(1, 'Ação');
INSERT INTO categoria VALUES(2, 'Ficção');
INSERT INTO categoria VALUES(3, 'Romance');
INSERT INTO categoria VALUES(4, 'Infantil');
INSERT INTO categoria VALUES(5, 'Fantasia');
INSERT INTO categoria VALUES(6, 'Auto-Ajuda');
INSERT INTO categoria VALUES(7, 'Administração');
INSERT INTO categoria VALUES(8, 'Terror');


-- -----------------------------------------------------
-- Povoando a tabela de Autores 
-- -----------------------------------------------------

INSERT INTO autor VALUES('anabeatrizbarbosa@hotmail.com', 'Ana Beatriz Barbosa Silva', 'Brasileira');
INSERT INTO autor VALUES('rjpalacio@hotmail.com','R J Palacio', 'Americana');
INSERT INTO autor VALUES('joaquimmanuelmacedo@hotmail.com','Joaquim Manuel de Macedo', 'Brasileiro');
INSERT INTO autor VALUES('rhondabyrne@hotmail.com','Rhonda Byrne ', 'Australiana');
INSERT INTO autor VALUES('suzannecollins@hotmail.com','Suzanne Collins', 'Americana');