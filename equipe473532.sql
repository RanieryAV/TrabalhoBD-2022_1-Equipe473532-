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
-- Table `equipe473532`.`cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `equipe473532`.`cursos` (
  `cod_curso` INT NOT NULL,
  `nome_curso` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cod_curso`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `equipe473532`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `equipe473532`.`usuarios` (
  `id` INT NOT NULL,
  `login` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  `tipo_usuario` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `equipe473532`.`alunos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `equipe473532`.`alunos` (
  `matricula_aluno` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `cod_curso` INT NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  `data_de_ingresso` DATE NOT NULL,
  `data_de_conclusao_prevista` DATE NOT NULL,
  `id_usuario` INT NOT NULL,
  PRIMARY KEY (`matricula_aluno`, `id_usuario`),
  INDEX `cod_curso_idx` (`cod_curso` ASC) VISIBLE,
  INDEX `fk_alunos_usuarios1_idx` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `cod_curso`
    FOREIGN KEY (`cod_curso`)
    REFERENCES `equipe473532`.`cursos` (`cod_curso`),
  CONSTRAINT `fk_alunos_usuarios1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `equipe473532`.`usuarios` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `equipe473532`.`autores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `equipe473532`.`autores` (
  `email` VARCHAR(60) NOT NULL,
  `nome` VARCHAR(60) NOT NULL,
  `nacionalidade` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`email`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `equipe473532`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `equipe473532`.`categoria` (
  `codigo_da_categoria` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`codigo_da_categoria`))
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `equipe473532`.`livros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `equipe473532`.`livros` (
  `ISBN` BIGINT NOT NULL,
  `titulo` VARCHAR(90) NOT NULL,
  `ano_lancamento` YEAR NOT NULL,
  `editora` VARCHAR(50) NOT NULL,
  `quantidade_copias` BIGINT NOT NULL,
  `categoria_codigo_da_categoria` INT NOT NULL,
  `autores` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`ISBN`),
  UNIQUE INDEX `ISBN_UNIQUE` (`ISBN` ASC) VISIBLE,
  INDEX `fk_livros_categoria1_idx` (`categoria_codigo_da_categoria` ASC) VISIBLE,
  CONSTRAINT `fk_livros_categoria1`
    FOREIGN KEY (`categoria_codigo_da_categoria`)
    REFERENCES `equipe473532`.`categoria` (`codigo_da_categoria`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `equipe473532`.`escreve`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `equipe473532`.`escreve` (
  `autores_email` VARCHAR(60) NOT NULL,
  `livros_ISBN` BIGINT NOT NULL,
  PRIMARY KEY (`autores_email`, `livros_ISBN`),
  INDEX `fk_autores_has_livros_livros1_idx` (`livros_ISBN` ASC) VISIBLE,
  INDEX `fk_autores_has_livros_autores1_idx` (`autores_email` ASC) VISIBLE,
  CONSTRAINT `fk_autores_has_livros_autores1`
    FOREIGN KEY (`autores_email`)
    REFERENCES `equipe473532`.`autores` (`email`),
  CONSTRAINT `fk_autores_has_livros_livros1`
    FOREIGN KEY (`livros_ISBN`)
    REFERENCES `equipe473532`.`livros` (`ISBN`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `equipe473532`.`funcionarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `equipe473532`.`funcionarios` (
  `matricula_funcionario` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  `id_usuario` INT NOT NULL,
  PRIMARY KEY (`matricula_funcionario`, `id_usuario`),
  INDEX `fk_funcionarios_usuarios1_idx` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_funcionarios_usuarios1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `equipe473532`.`usuarios` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `equipe473532`.`professores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `equipe473532`.`professores` (
  `mat_siape` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(45) NULL DEFAULT NULL,
  `telefone_celular` VARCHAR(45) NULL DEFAULT NULL,
  `codigo_curso` INT NOT NULL,
  `data_de_contratacao` DATE NOT NULL,
  `regime_de_trabalho` ENUM('20h', '40h', 'DE') NOT NULL,
  `usuarios_id` INT NOT NULL,
  PRIMARY KEY (`mat_siape`, `usuarios_id`),
  INDEX `cod_curso_idx` (`codigo_curso` ASC) VISIBLE,
  INDEX `fk_professores_usuarios1_idx` (`usuarios_id` ASC) VISIBLE,
  CONSTRAINT `codigo_curso`
    FOREIGN KEY (`codigo_curso`)
    REFERENCES `equipe473532`.`cursos` (`cod_curso`),
  CONSTRAINT `fk_professores_usuarios1`
    FOREIGN KEY (`usuarios_id`)
    REFERENCES `equipe473532`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `equipe473532`.`reserva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `equipe473532`.`reserva` (
  `usuarios_id` INT NOT NULL,
  `livros_ISBN` BIGINT NOT NULL,
  `atendida` TINYINT(1) NOT NULL,
  `data_reserva` DATE NOT NULL,
  PRIMARY KEY (`usuarios_id`, `livros_ISBN`),
  INDEX `fk_usuarios_has_livros_livros1_idx` (`livros_ISBN` ASC) VISIBLE,
  INDEX `fk_usuarios_has_livros_usuarios1_idx` (`usuarios_id` ASC) VISIBLE,
  CONSTRAINT `fk_usuarios_has_livros_livros1`
    FOREIGN KEY (`livros_ISBN`)
    REFERENCES `equipe473532`.`livros` (`ISBN`),
  CONSTRAINT `fk_usuarios_has_livros_usuarios1`
    FOREIGN KEY (`usuarios_id`)
    REFERENCES `equipe473532`.`usuarios` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


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
    REFERENCES `equipe473532`.`alunos` (`matricula_aluno`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


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
    REFERENCES `equipe473532`.`funcionarios` (`matricula_funcionario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `equipe473532` ;

-- -----------------------------------------------------
-- Placeholder table for view `equipe473532`.`viewProfbyCurso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `equipe473532`.`viewProfbyCurso` (`mat_siape` INT, `nome` INT, `regime_de_trabalho` INT, `nome_curso` INT);

-- -----------------------------------------------------
-- Placeholder table for view `equipe473532`.`viewLivrosbyCategoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `equipe473532`.`viewLivrosbyCategoria` (`ISBN` INT, `titulo` INT, `ano_lancamento` INT, `editora` INT, `quantidade_copias` INT, `descricao` INT, `nome` INT);

-- -----------------------------------------------------
-- Placeholder table for view `equipe473532`.`viewLivrosbyEditora`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `equipe473532`.`viewLivrosbyEditora` (`ISBN` INT, `titulo` INT, `ano_lancamento` INT, `editora` INT, `quantidade_copias` INT, `descricao` INT, `nome` INT);

-- -----------------------------------------------------
-- Placeholder table for view `equipe473532`.`viewLivrosbyAno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `equipe473532`.`viewLivrosbyAno` (`ISBN` INT, `titulo` INT, `ano_lancamento` INT, `editora` INT, `quantidade_copias` INT, `descricao` INT, `nome` INT);

-- -----------------------------------------------------
-- Placeholder table for view `equipe473532`.`viewLivrosbyAutor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `equipe473532`.`viewLivrosbyAutor` (`ISBN` INT, `titulo` INT, `ano_lancamento` INT, `editora` INT, `quantidade_copias` INT, `descricao` INT, `nome` INT);

-- -----------------------------------------------------
-- Placeholder table for view `equipe473532`.`viewReserva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `equipe473532`.`viewReserva` (`*` INT);

-- -----------------------------------------------------
-- View `equipe473532`.`viewProfbyCurso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `equipe473532`.`viewProfbyCurso`;
USE `equipe473532`;
CREATE  OR REPLACE VIEW viewProfbyCurso AS 
SELECT mat_siape, nome, regime_de_trabalho, nome_curso
FROM ((professores NATURAL JOIN usuarios)NATURAL JOIN cursos)
GROUP BY nome_curso, nome, mat_siape, regime_de_trabalho
ORDER BY nome;

-- -----------------------------------------------------
-- View `equipe473532`.`viewLivrosbyCategoria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `equipe473532`.`viewLivrosbyCategoria`;
USE `equipe473532`;
CREATE  OR REPLACE VIEW viewLivrosbyCategoria AS
SELECT ISBN, titulo, ano_lancamento, editora, quantidade_copias, descricao, nome
FROM (((livros JOIN categoria ON categoria_codigo_da_categoria = codigo_da_categoria)
				JOIN Escreve ON livros_ISBN = ISBN)
		JOIN autores a ON autores_email = email)
GROUP BY descricao, ISBN, titulo, ano_lancamento, editora, quantidade_copias, nome
ORDER BY titulo;

-- -----------------------------------------------------
-- View `equipe473532`.`viewLivrosbyEditora`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `equipe473532`.`viewLivrosbyEditora`;
USE `equipe473532`;
CREATE  OR REPLACE VIEW viewLivrosbyEditora AS
SELECT ISBN, titulo, ano_lancamento, editora, quantidade_copias, descricao, nome
FROM (((livros JOIN categoria ON categoria_codigo_da_categoria = codigo_da_categoria)
				JOIN Escreve ON livros_ISBN = ISBN)
		JOIN autores a ON autores_email = email)
GROUP BY editora, descricao, ISBN, titulo, ano_lancamento, quantidade_copias, nome
ORDER BY titulo;

-- -----------------------------------------------------
-- View `equipe473532`.`viewLivrosbyAno`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `equipe473532`.`viewLivrosbyAno`;
USE `equipe473532`;
CREATE  OR REPLACE VIEW viewLivrosbyAno AS
SELECT ISBN, titulo, ano_lancamento, editora, quantidade_copias, descricao, nome
FROM (((livros JOIN categoria ON categoria_codigo_da_categoria = codigo_da_categoria)
				JOIN Escreve ON livros_ISBN = ISBN)
		JOIN autores a ON autores_email = email)
GROUP BY ano_lancamento, descricao, ISBN, titulo, editora, quantidade_copias, nome
ORDER BY titulo;

-- -----------------------------------------------------
-- View `equipe473532`.`viewLivrosbyAutor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `equipe473532`.`viewLivrosbyAutor`;
USE `equipe473532`;
CREATE  OR REPLACE VIEW viewLivrosbyAutor AS
SELECT ISBN, titulo, ano_lancamento, editora, quantidade_copias, descricao, nome
FROM (((livros JOIN categoria ON categoria_codigo_da_categoria = codigo_da_categoria)
				JOIN Escreve ON livros_ISBN = ISBN)
		JOIN autores a ON autores_email = email)
GROUP BY nome, ISBN, titulo, ano_lancamento, editora, quantidade_copias, descricao
ORDER BY titulo;

-- -----------------------------------------------------
-- View `equipe473532`.`viewReserva`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `equipe473532`.`viewReserva`;
USE `equipe473532`;
CREATE OR REPLACE VIEW viewReserva (usuarios_id, livros_ISBN, atendida, data_reserva, id, login, senha, tipo_usuario, ISBN, titulo, ano_lancamento, editora, quantidade_copias, codigo_categoria, autores, matricula_aluno, nome_aluno, cod_curso_aluno, endereco_aluno, data_de_ingresso, data_de_conclusao_prevista, id_usuario_aluno, mat_siape, nome_prof, endereco_prof, telefone_celular, cod_curso_prof, data_de_contratacao, regime_de_trabalho, id_usuario_prof, matricula_funcionario, nome_func, endereco_func, id_usuario_func) AS
SELECT *
FROM (((((reserva r JOIN usuarios u ON usuarios_id = u.id)
				JOIN livros l ON livros_ISBN = ISBN)
		LEFT OUTER JOIN alunos a ON a.id_usuario = u.id)
		LEFT OUTER JOIN professores p ON p.usuarios_id = u.id)
		LEFT OUTER JOIN funcionarios f ON f.id_usuario = u.id)
ORDER BY titulo;
USE `equipe473532`;

DELIMITER $$
USE `equipe473532`$$
CREATE TRIGGER alunosTriggerDataConclusao BEFORE INSERT ON alunos
FOR EACH ROW
BEGIN
	IF(NEW.data_de_conclusao_prevista <= CURDATE()) THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Erro! Data de conclusão prevista ja foi atingida!";
	END IF;
END;$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
