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


-- -----------------------------------------------------
-- Table `equipe473532`.`autores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `equipe473532`.`autores` (
  `email` VARCHAR(45) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `nacionalidade` VARCHAR(45) NULL,
  PRIMARY KEY (`email`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `equipe473532`.`livros_tem_autores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `equipe473532`.`livros_tem_autores` (
  `ISBN` BIGINT(13) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  UNIQUE INDEX `ISBN_UNIQUE` (`ISBN` ASC) VISIBLE,
  UNIQUE INDEX `email_autor_UNIQUE` (`email` ASC) VISIBLE,
  CONSTRAINT `email`
    FOREIGN KEY (`email`)
    REFERENCES `equipe473532`.`autores` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
