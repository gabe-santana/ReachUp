-- -----------------------------------------------------
-- Schema ReachUp
-- 
-- Banco de dados do sistema ReachUp
-- -----------------------------------------------------
/*
		                                    __ 
 _____             _      _____    |  |
| __  |___ ___ ___| |_   |  |  |___|  |
|    -| -_| .'|  _|   |  |  |  | . |__|
|__|__|___|__,|___|_|_|  |_____|  _|__|
                               |_|     
*/

DROP SCHEMA IF EXISTS ReachUp ;
-- -----------------------------------------------------
-- Schema ReachUp
--
-- Banco de dados do sistema ReachUp
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS ReachUp DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE ReachUp ;

-- -----------------------------------------------------
-- Tabela tipo_administrador
-- -----------------------------------------------------
DROP TABLE IF EXISTS tipo_administrador ;

CREATE TABLE IF NOT EXISTS tipo_administrador (
  cd_tipo_administrador INT NOT NULL,
  nm_tipo_administrador VARCHAR(45) NOT NULL,
  PRIMARY KEY (cd_tipo_administrador))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Tabela tipo_local
-- -----------------------------------------------------
DROP TABLE IF EXISTS tipo_local ;

CREATE TABLE IF NOT EXISTS tipo_local (
  cd_tipo_local INT NOT NULL,
  nm_tipo_local VARCHAR(45) NOT NULL,
  PRIMARY KEY (cd_tipo_local))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Tabela local
-- -----------------------------------------------------
DROP TABLE IF EXISTS local ;

CREATE TABLE IF NOT EXISTS local (
  cd_local INT NOT NULL,
  cd_tipo_local INT NOT NULL,
  nm_local VARCHAR(45) NOT NULL,
  cd_andar INT(3) NOT NULL,
  PRIMARY KEY (cd_local),
  INDEX fk_local_tipo_local1_idx (cd_tipo_local ASC),
  CONSTRAINT fk_local_tipo_local1
    FOREIGN KEY (cd_tipo_local)
    REFERENCES tipo_local (cd_tipo_local)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Tabela administrador
-- -----------------------------------------------------
DROP TABLE IF EXISTS administrador ;

CREATE TABLE IF NOT EXISTS administrador (
  nm_email_administrador VARCHAR(100) NOT NULL,
  cd_tipo_administrador INT NOT NULL,
  cd_local INT NULL,
  nm_administrador VARCHAR(45) NOT NULL,
  nm_senha_administrador VARCHAR(60) NOT NULL,
  PRIMARY KEY (nm_email_administrador),
  INDEX fk_administrador_tipo_administrador_idx (cd_tipo_administrador ASC),
  INDEX fk_administrador_local1_idx (cd_local ASC),
  CONSTRAINT fk_administrador_tipo_administrador
    FOREIGN KEY (cd_tipo_administrador)
    REFERENCES tipo_administrador (cd_tipo_administrador)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_administrador_local1
    FOREIGN KEY (cd_local)
    REFERENCES local (cd_local)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Tabela cliente
-- -----------------------------------------------------
DROP TABLE IF EXISTS cliente ;

CREATE TABLE IF NOT EXISTS cliente (
  nm_email_cliente VARCHAR(100) NOT NULL,
  nm_cliente VARCHAR(45) NOT NULL,
  nm_senha_cliente VARCHAR(60) NULL,
  PRIMARY KEY (nm_email_cliente))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Tabela tipo_feedback
-- -----------------------------------------------------
DROP TABLE IF EXISTS tipo_feedback ;

CREATE TABLE IF NOT EXISTS tipo_feedback (
  cd_tipo_feedback INT NOT NULL,
  nm_tipo_feedback VARCHAR(25) NOT NULL,
  PRIMARY KEY (cd_tipo_feedback))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Tabela feedback
-- -----------------------------------------------------
DROP TABLE IF EXISTS feedback ;

CREATE TABLE IF NOT EXISTS feedback (
  cd_feedback INT NOT NULL,
  cd_tipo_feedback INT NOT NULL,
  nm_email_cliente VARCHAR(100) NOT NULL,
  ds_feedback TEXT NOT NULL,
  dt_feedback DATE NOT NULL,
  qt_estrelas_feedback INT(1) NULL,
  PRIMARY KEY (cd_feedback, cd_tipo_feedback),
  INDEX fk_feedback_cliente1_idx (nm_email_cliente ASC),
  INDEX fk_feedback_tipo_feedback1_idx (cd_tipo_feedback ASC),
  CONSTRAINT fk_feedback_cliente1
    FOREIGN KEY (nm_email_cliente)
    REFERENCES cliente (nm_email_cliente)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_feedback_tipo_feedback1
    FOREIGN KEY (cd_tipo_feedback)
    REFERENCES tipo_feedback (cd_tipo_feedback)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Tabela tipo_beacon
-- -----------------------------------------------------
DROP TABLE IF EXISTS tipo_beacon ;

CREATE TABLE IF NOT EXISTS tipo_beacon (
  cd_tipo_beacon INT NOT NULL,
  nm_tipo_beacon VARCHAR(45) NOT NULL,
  PRIMARY KEY (cd_tipo_beacon))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Tabela beacon
-- -----------------------------------------------------
DROP TABLE IF EXISTS beacon ;

CREATE TABLE IF NOT EXISTS beacon (
  cd_uuid_beacon VARCHAR(36) NOT NULL,
  cd_tipo_beacon INT NOT NULL,
  cd_local INT NOT NULL,
  PRIMARY KEY (cd_uuid_beacon),
  INDEX fk_beacon_local1_idx (cd_local ASC),
  INDEX fk_beacon_tipo_beacon1_idx (cd_tipo_beacon ASC),
  CONSTRAINT fk_beacon_local1
    FOREIGN KEY (cd_local)
    REFERENCES local (cd_local)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_beacon_tipo_beacon1
    FOREIGN KEY (cd_tipo_beacon)
    REFERENCES tipo_beacon (cd_tipo_beacon)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Tabela tipo_comunicado
-- -----------------------------------------------------
DROP TABLE IF EXISTS tipo_comunicado ;

CREATE TABLE IF NOT EXISTS tipo_comunicado (
  cd_tipo_comunicado INT NOT NULL,
  nm_tipo_comunicado VARCHAR(45) NOT NULL,
  PRIMARY KEY (cd_tipo_comunicado))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Tabela categoria
-- -----------------------------------------------------
DROP TABLE IF EXISTS categoria ;

CREATE TABLE IF NOT EXISTS categoria (
  cd_categoria INT NOT NULL,
  nm_categoria VARCHAR(45) NOT NULL,
  ds_categoria VARCHAR(200) NOT NULL,
  PRIMARY KEY (cd_categoria))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Tabela comunicado
-- -----------------------------------------------------
DROP TABLE IF EXISTS comunicado ;

CREATE TABLE IF NOT EXISTS comunicado (
  cd_comunicado INT NOT NULL,
  cd_local INT NOT NULL,
  cd_tipo_comunicado INT NOT NULL,
  cd_categoria INT NULL,
  ds_comunicado TEXT NOT NULL,
  dt_inicio_comunicado DATETIME NOT NULL,
  dt_fim_comunicado DATETIME NULL,
  PRIMARY KEY (cd_comunicado),
  INDEX fk_comunicado_local1_idx (cd_local ASC),
  INDEX fk_comunicado_tipo_comunicado1_idx (cd_tipo_comunicado ASC),
  INDEX fk_comunicado_categoria1_idx (cd_categoria ASC),
  CONSTRAINT fk_comunicado_local1
    FOREIGN KEY (cd_local)
    REFERENCES local (cd_local)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_comunicado_tipo_comunicado1
    FOREIGN KEY (cd_tipo_comunicado)
    REFERENCES tipo_comunicado (cd_tipo_comunicado)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_comunicado_categoria1
    FOREIGN KEY (cd_categoria)
    REFERENCES categoria (cd_categoria)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Tabela categoria_local
-- -----------------------------------------------------
DROP TABLE IF EXISTS categoria_local ;

CREATE TABLE IF NOT EXISTS categoria_local (
  cd_local INT NOT NULL,
  cd_categoria INT NOT NULL,
  PRIMARY KEY (cd_local, cd_categoria),
  INDEX fk_local_has_categoria_categoria1_idx (cd_categoria ASC),
  INDEX fk_local_has_categoria_local1_idx (cd_local ASC),
  CONSTRAINT fk_local_has_categoria_local1
    FOREIGN KEY (cd_local)
    REFERENCES local (cd_local)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_local_has_categoria_categoria1
    FOREIGN KEY (cd_categoria)
    REFERENCES categoria (cd_categoria)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Tabela sub_categoria
-- -----------------------------------------------------
DROP TABLE IF EXISTS sub_categoria ;

CREATE TABLE IF NOT EXISTS sub_categoria (
  cd_sub_categoria INT NOT NULL,
  cd_categoria INT NOT NULL,
  nm_sub_categoria VARCHAR(45) NOT NULL,
  PRIMARY KEY (cd_sub_categoria, cd_categoria),
  INDEX fk_sub_categoria_categoria1_idx (cd_categoria ASC),
  CONSTRAINT fk_sub_categoria_categoria1
    FOREIGN KEY (cd_categoria)
    REFERENCES categoria (cd_categoria)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Tabela preferencia_cliente
-- -----------------------------------------------------
DROP TABLE IF EXISTS preferencia_cliente ;

CREATE TABLE IF NOT EXISTS preferencia_cliente (
  nm_email_cliente VARCHAR(100) NOT NULL,
  cd_sub_categoria INT NOT NULL,
  cd_categoria INT NOT NULL,
  PRIMARY KEY (nm_email_cliente, cd_sub_categoria, cd_categoria),
  INDEX fk_cliente_has_sub_categoria_sub_categoria1_idx (cd_sub_categoria ASC, cd_categoria ASC),
  INDEX fk_cliente_has_sub_categoria_cliente1_idx (nm_email_cliente ASC),
  CONSTRAINT fk_cliente_has_sub_categoria_cliente1
    FOREIGN KEY (nm_email_cliente)
    REFERENCES cliente (nm_email_cliente)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_cliente_has_sub_categoria_sub_categoria1
    FOREIGN KEY (cd_sub_categoria , cd_categoria)
    REFERENCES sub_categoria (cd_sub_categoria , cd_categoria)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;