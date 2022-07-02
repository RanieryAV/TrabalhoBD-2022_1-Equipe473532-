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

-- -----------------------------------------------------
-- Povoamento das tabelas
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Data for table `equipe473532`.`categoria`
-- -----------------------------------------------------
START TRANSACTION;
USE `equipe473532`;
INSERT INTO `equipe473532`.`categoria` (`codigo_da_categoria`, `descricao`) VALUES (1, 'Ação');
INSERT INTO `equipe473532`.`categoria` (`codigo_da_categoria`, `descricao`) VALUES (2, 'Ficção');
INSERT INTO `equipe473532`.`categoria` (`codigo_da_categoria`, `descricao`) VALUES (3, 'Romance');
INSERT INTO `equipe473532`.`categoria` (`codigo_da_categoria`, `descricao`) VALUES (4, 'Infantil');
INSERT INTO `equipe473532`.`categoria` (`codigo_da_categoria`, `descricao`) VALUES (5, 'Fantasia');
INSERT INTO `equipe473532`.`categoria` (`codigo_da_categoria`, `descricao`) VALUES (6, 'Auto-Ajuda');
INSERT INTO `equipe473532`.`categoria` (`codigo_da_categoria`, `descricao`) VALUES (7, 'Administração');
INSERT INTO `equipe473532`.`categoria` (`codigo_da_categoria`, `descricao`) VALUES (8, 'Terror');

COMMIT;

-- -----------------------------------------------------
-- Data for table `equipe473532`.`livros`
-- -----------------------------------------------------
START TRANSACTION;
USE `equipe473532`;
INSERT INTO `equipe473532`.`livros` (`ISBN`, `titulo`, `ano_lancamento`, `editora`, `quantidade_copias`, `categoria_codigo_da_categoria`, `autores`) VALUES (9788525058393, 'Mentes Inquietas', 2009, 'Principium', 105000, 6, 'Ana Beatriz Barbosa Silva');
INSERT INTO `equipe473532`.`livros` (`ISBN`, `titulo`, `ano_lancamento`, `editora`, `quantidade_copias`, `categoria_codigo_da_categoria`, `autores`) VALUES (9788543101972, 'O Segredo', 2006, 'Editora Sextante', 35000000, 6, 'Rhonda Byrne');
INSERT INTO `equipe473532`.`livros` (`ISBN`, `titulo`, `ano_lancamento`, `editora`, `quantidade_copias`, `categoria_codigo_da_categoria`, `autores`) VALUES (9788532530783, 'Harry Potter e a Pedra Filosofal', 1997, 'Rocco', 40000000, 6, 'J. K. Rowling');
INSERT INTO `equipe473532`.`livros` (`ISBN`, `titulo`, `ano_lancamento`, `editora`, `quantidade_copias`, `categoria_codigo_da_categoria`, `autores`) VALUES (9789722342391, 'Os jogos da fome', 2009, 'Editorial Presenca', 60000000, 1, 'Suzanne Collins');
INSERT INTO `equipe473532`.`livros` (`ISBN`, `titulo`, `ano_lancamento`, `editora`, `quantidade_copias`, `categoria_codigo_da_categoria`, `autores`) VALUES (9788579800511, 'Ela disse, Ele disse', 2011, 'Rocco Jovens Leitores', 930000, 3, 'Thalita Rebouças');
COMMIT;

-- -----------------------------------------------------
-- Data for table `equipe473532`.`usuarios`
-- -----------------------------------------------------
START TRANSACTION;
USE `equipe473532`;
INSERT INTO `equipe473532`.`usuarios` (`id`, `login`, `senha`, `tipo_usuario`) VALUES (01, 'Admin', 'root', 'administrador');
INSERT INTO `equipe473532`.`usuarios` (`id`, `login`, `senha`, `tipo_usuario`) VALUES (02, 'claraC', 'cla202', 'bibliotecario');
INSERT INTO `equipe473532`.`usuarios` (`id`, `login`, `senha`, `tipo_usuario`) VALUES (03, 'samualM', 'samu222', 'alunos');
INSERT INTO `equipe473532`.`usuarios` (`id`, `login`, `senha`, `tipo_usuario`) VALUES (04, 'raissaR', 'rai569','alunos');
INSERT INTO `equipe473532`.`usuarios` (`id`, `login`, `senha`, `tipo_usuario`) VALUES (05, 'natanielN', 'natan036', 'alunos');
INSERT INTO `equipe473532`.`usuarios` (`id`, `login`, `senha`, `tipo_usuario`) VALUES (06, 'andreA', 'andre378', 'alunos');
INSERT INTO `equipe473532`.`usuarios` (`id`, `login`, `senha`, `tipo_usuario`) VALUES (07, 'virginiaV', 'vi459', 'alunos');
INSERT INTO `equipe473532`.`usuarios` (`id`, `login`, `senha`, `tipo_usuario`) VALUES (08, 'lucasL', 'lucas941', 'alunos');
INSERT INTO `equipe473532`.`usuarios` (`id`, `login`, `senha`, `tipo_usuario`) VALUES (09, 'leviL', 'levi058', 'funcionarios');
INSERT INTO `equipe473532`.`usuarios` (`id`, `login`, `senha`, `tipo_usuario`) VALUES (10, 'paulaP', 'paula654', 'funcionarios');
INSERT INTO `equipe473532`.`usuarios` (`id`, `login`, `senha`, `tipo_usuario`) VALUES (11, 'sandroS', 'sandro875', 'funcionarios');
INSERT INTO `equipe473532`.`usuarios` (`id`, `login`, `senha`, `tipo_usuario`) VALUES (12, 'iolandaI', 'iol369', 'funcionarios');
INSERT INTO `equipe473532`.`usuarios` (`id`, `login`, `senha`, `tipo_usuario`) VALUES (13, 'rebecaR', 'reb147', 'funcionarios');
INSERT INTO `equipe473532`.`usuarios` (`id`, `login`, `senha`, `tipo_usuario`) VALUES (14, 'yagoY', 'yago258', 'funcionarios');

COMMIT;

-- -----------------------------------------------------
-- Data for table `equipe473532`.`cursos`
-- -----------------------------------------------------
START TRANSACTION;
USE `equipe473532`;
INSERT INTO `equipe378981`.`cursos` (`cod_curso`, `nome_curso`) VALUES (01, 'Engenharia de Computação');
INSERT INTO `equipe378981`.`cursos` (`cod_curso`, `nome_curso`) VALUES (02, 'Engenharia Elétrica');
INSERT INTO `equipe378981`.`cursos` (`cod_curso`, `nome_curso`) VALUES (03, 'Psicologia');
INSERT INTO `equipe378981`.`cursos` (`cod_curso`, `nome_curso`) VALUES (04, 'Música');
INSERT INTO `equipe378981`.`cursos` (`cod_curso`, `nome_curso`) VALUES (05, 'Artes Cênicas');
INSERT INTO `equipe378981`.`cursos` (`cod_curso`, `nome_curso`) VALUES (06, 'Filosofia');

COMMIT;

-- -----------------------------------------------------
-- Data for table `equipe473532`.`alunos`
-- -----------------------------------------------------
START TRANSACTION;
USE `equipe473532`;
INSERT INTO `equipe473532`.`alunos` (`matricula_aluno`, `nome`, `cod_curso`, `endereco`, `data_de_ingresso`, `data_de_conclusao`, `id_usuario`) VALUES (0000001, 'Samuel Falcão Xavier', 01, 'Rua A', '2015-02-25', '2019-12-31', 03);
INSERT INTO `equipe473532`.`alunos` (`matricula_aluno`, `nome`, `cod_curso`, `endereco`, `data_de_ingresso`, `data_de_conclusao`, `id_usuario`) VALUES(0000002, 'Raíssa Frois Camarinho', 02, 'Rua B', '2016-07-25', '2021-07-15', 04);
INSERT INTO `equipe473532`.`alunos` (`matricula_aluno`, `nome`, `cod_curso`, `endereco`, `data_de_ingresso`, `data_de_conclusao`, `id_usuario`) VALUES(0000003, 'Nataniel Sardo Grilo', 03, 'Rua C', '2016-02-25', '2020-12-31', 05);
INSERT INTO `equipe473532`.`alunos` (`matricula_aluno`, `nome`, `cod_curso`, `endereco`, `data_de_ingresso`, `data_de_conclusao`, `id_usuario`) VALUES(0000004, 'André Mourão Taveiros', 04, 'Rua D', '2017-02-25', '2022-12-31', 06);
INSERT INTO `equipe473532`.`alunos` (`matricula_aluno`, `nome`, `cod_curso`, `endereco`, `data_de_ingresso`, `data_de_conclusao`, `id_usuario`) VALUES(0000005, 'Virgínia Vaz Caeira', 05, 'Rua E', '2018-07-25', '2022-07-15', 07);
INSERT INTO `equipe473532`.`alunos` (`matricula_aluno`, `nome`, `cod_curso`, `endereco`, `data_de_ingresso`, `data_de_conclusao`, `id_usuario`)VALUES(0000006, 'Lucas Dantas Abranches', 06, 'Rua F', '2019-02-25', '2022-12-31', 08);
COMMIT;

-- -----------------------------------------------------
-- Data for table `equipe473532`.`professores`
-- -----------------------------------------------------
START TRANSACTION;
USE `equipe473532`;
INSERT INTO `equipe473532`.`professores` (`mat_siape`, `nome`, `endereco`, `telefone_celular`, `codigo_curso`, `data_de_contratacao`, `regime_de_trabalho`, `usuarios_id`) VALUES (000001, 'Priscila Cachoeira Velasco', 'Rua G', '+5504188975498632', 01, '2016-04-03', 'DE');
INSERT INTO `equipe473532`.`professores` (`mat_siape`, `nome`, `endereco`, `telefone_celular`, `codigo_curso`, `data_de_contratacao`, `regime_de_trabalho`, `usuarios_id`) VALUES(000002, 'Janilson Toscano Freire', 'Rua H', '+5504188964821975', 02, '2008-09-24', 'DE');
INSERT INTO `equipe473532`.`professores` (`mat_siape`, `nome`, `endereco`, `telefone_celular`, `codigo_curso`, `data_de_contratacao`, `regime_de_trabalho`, `usuarios_id`) VALUES(000003, 'Manuela Lagos Peixoto', 'Rua I', '+5504188998547135', 03, '2011-01-17', '20h');
INSERT INTO `equipe473532`.`professores` (`mat_siape`, `nome`, `endereco`, `telefone_celular`, `codigo_curso`, `data_de_contratacao`, `regime_de_trabalho`, `usuarios_id`) VALUES(000004, 'Reinaldo Reino Ponte', 'Rua J', '+5504188935748912', 04, '2008-05-16', '20h');
INSERT INTO `equipe473532`.`professores` (`mat_siape`, `nome`, `endereco`, `telefone_celular`, `codigo_curso`, `data_de_contratacao`, `regime_de_trabalho`, `usuarios_id`) VALUES(000005, 'Melina Rodrigues Mondragão', 'Rua K', '+5504188958497621', 05, '2008-08-23', '40h');
INSERT INTO `equipe473532`.`professores` (`mat_siape`, `nome`, `endereco`, `telefone_celular`, `codigo_curso`, `data_de_contratacao`, `regime_de_trabalho`, `usuarios_id`) VALUES(000006, 'Silvana Serro Lampreia', 'Rua L', '+5504188974851296', 06, '2008-10-02', '40h');

COMMIT;

-- -----------------------------------------------------
-- Data for table `equipe473532`.`funcionarios`
-- -----------------------------------------------------
START TRANSACTION;
USE `equipe473532`;
INSERT INTO `equipe473532`.`funcionarios` (`matricula_funcionario`, `nome`, `endereco`, `id_usuario`) VALUES (498756, 'Levi Vaz Sousa', 'Rua A', 09);
INSERT INTO `equipe473532`.`funcionarios` (`matricula_funcionario`, `nome`, `endereco`, `id_usuario`) VALUES(421589, 'Paula Amorim Ferreira', 'Rua B', 10);
INSERT INTO `equipe473532`.`funcionarios` (`matricula_funcionario`, `nome`, `endereco`, `id_usuario`) VALUES(432517, 'Sandro Meneses Moura', 'Rua C', 11);
INSERT INTO `equipe473532`.`funcionarios` (`matricula_funcionario`, `nome`, `endereco`, `id_usuario`) VALUES(406731, 'Iolanda Rodrigues Silva', 'Rua D', 12);
INSERT INTO `equipe473532`.`funcionarios` (`matricula_funcionario`, `nome`, `endereco`, `id_usuario`) VALUES(457328, 'Rebeca Fragoso Mesquita', 'Rua E', 13);
INSERT INTO `equipe473532`.`funcionarios` (`matricula_funcionario`, `nome`, `endereco`, `id_usuario`) VALUES(416574, 'Yago Pires Cardoso', 'Rua F', 14);

COMMIT;

-- -----------------------------------------------------
-- Data for table `equipe473532`.`telefones_funcionarios`
-- -----------------------------------------------------
START TRANSACTION;
USE `equipe473532`;
INSERT INTO `equipe473532`.`telefones_funcionarios` (`telefone_ID`, `numero_telefone`, `matricula_funcionario`) VALUES (001, '+5502185994367854', 406731);
INSERT INTO `equipe473532`.`telefones_funcionarios` (`telefone_ID`, `numero_telefone`, `matricula_funcionario`) VALUES(002, '+5502185992587941', 406731);
INSERT INTO `equipe473532`.`telefones_funcionarios` (`telefone_ID`, `numero_telefone`, `matricula_funcionario`) VALUES(003, '+5502185991369428', 432517);
INSERT INTO `equipe473532`.`telefones_funcionarios` (`telefone_ID`, `numero_telefone`, `matricula_funcionario`) VALUES(004, '+5502185994798203', 432517);
INSERT INTO `equipe473532`.`telefones_funcionarios` (`telefone_ID`, `numero_telefone`, `matricula_funcionario`) VALUES(005, '+5502185992009866', 457328);
INSERT INTO `equipe473532`.`telefones_funcionarios` (`telefone_ID`, `numero_telefone`, `matricula_funcionario`) VALUES(006, '+5502185994362069', 457328);

COMMIT;

-- -----------------------------------------------------
-- Data for table `equipe473532`.`telefones_alunos`
-- -----------------------------------------------------
START TRANSACTION;
USE `equipe473532`;
INSERT INTO `equipe473532`.`telefones_alunos` (`telefone_ID`, `numero_telefone`, `matricula_aluno`) VALUES (001, '+5504188912345678', 0000001);
INSERT INTO `equipe473532`.`telefones_alunos` (`telefone_ID`, `numero_telefone`, `matricula_aluno`) VALUES(002, '+5504188998765432', 0000001);
INSERT INTO `equipe473532`.`telefones_alunos` (`telefone_ID`, `numero_telefone`, `matricula_aluno`) VALUES(003, '+5504188951697843', 0000002);
INSERT INTO `equipe473532`.`telefones_alunos` (`telefone_ID`, `numero_telefone`, `matricula_aluno`) VALUES(004, '+5504188961475298', 0000003);
INSERT INTO `equipe473532`.`telefones_alunos` (`telefone_ID`, `numero_telefone`, `matricula_aluno`) VALUES(005, '+5504188995387459', 0000004);
INSERT INTO `equipe473532`.`telefones_alunos` (`telefone_ID`, `numero_telefone`, `matricula_aluno`) VALUES(006, '+5504188994381576', 0000005);
INSERT INTO `equipe473532`.`telefones_alunos` (`telefone_ID`, `numero_telefone`, `matricula_aluno`) VALUES(007, '+5504188957894314', 0000006);

COMMIT;

-- -----------------------------------------------------
-- Data for table `equipe473532`.`escreve`
-- -----------------------------------------------------
START TRANSACTION;
USE `equipe473532`;
INSERT INTO `equipe473532`.`escreve` (`autores_email`, `livros_ISBN`) VALUES ('anabeatrizbarbosa@hotmail.com', 9788525058393);
INSERT INTO `equipe473532`.`escreve` (`autores_email`, `livros_ISBN`) VALUES('thalitareboucas@hotmail.com', 9788579800511);
INSERT INTO `equipe473532`.`escreve` (`autores_email`, `livros_ISBN`) VALUES('jkrowling@hotmail.com', 9788532530783);
INSERT INTO `equipe473532`.`escreve` (`autores_email`, `livros_ISBN`) VALUES('suzannecollins@hotmail.com', 9789722342391);
INSERT INTO `equipe473532`.`escreve` (`autores_email`, `livros_ISBN`) VALUES('rhondabyrne@hotmail.com', 9788543101972);

COMMIT;