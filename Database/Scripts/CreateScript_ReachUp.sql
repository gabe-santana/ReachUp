-- -----------------------------------------------------
-- Schema ReachUp                                  --
-- Banco de dados do sistema ReachUp  --
-- -----------------------------------------------------
/*
  _____                 _     _    _       _ 
 |  __ \               | |   | |  | |     | |
 | |__) |___  __ _  ___| |__ | |  | |_ __ | |
 |  _  // _ \/ _` |/ __| '_ \| |  | | '_ \| |
 | | \ \  __/ (_| | (__| | | | |__| | |_) |_|
 |_|  \_\___|\__,_|\___|_| |_|\____/| .__/(_)
                                    | |      
                                    |_|      
*/
-- -----------------------------------------------------
-- Script // Schema                                    --
-- -----------------------------------------------------

DROP SCHEMA IF EXISTS ReachUp ;
CREATE SCHEMA IF NOT EXISTS ReachUp ;
USE ReachUp ;

/* VARIÁVEIS GLOBAIS */

/*SET GLOBAL hr_abertura_shopping = '10:00:00';
SET GLOBAL hr_fechamento_shopping = '20:00:00';*/

-- -----------------------------------------------------
-- Tabela tipo_administrador
-- -----------------------------------------------------
DROP TABLE IF EXISTS tipo_administrador ;

CREATE TABLE IF NOT EXISTS tipo_administrador (
  cd_tipo_administrador INT NOT NULL,
  nm_tipo_administrador VARCHAR(45) NOT NULL,
  PRIMARY KEY (cd_tipo_administrador));

-- -----------------------------------------------------
-- Tabela tipo_local
-- -----------------------------------------------------
DROP TABLE IF EXISTS tipo_local ;

CREATE TABLE IF NOT EXISTS tipo_local (
  cd_tipo_local INT NOT NULL,
  nm_tipo_local VARCHAR(45) NOT NULL,
  PRIMARY KEY (cd_tipo_local));

-- -----------------------------------------------------
-- Tabela local
-- -----------------------------------------------------
DROP TABLE IF EXISTS local ;

CREATE TABLE IF NOT EXISTS local (
  cd_local INT NOT NULL,
  cd_tipo_local INT NOT NULL,
  nm_local VARCHAR(45) NOT NULL,
  cd_andar INT(3) NOT NULL,
  hr_abertura TIME,
  hr_fechamento TIME,
  PRIMARY KEY (cd_local),
  CONSTRAINT fk_local_tipo_local
    FOREIGN KEY (cd_tipo_local)
    REFERENCES tipo_local (cd_tipo_local)
    
    );

-- -----------------------------------------------------
-- Tabela horario
-- -----------------------------------------------------
DROP TABLE IF EXISTS horario;
CREATE TABLE IF NOT EXISTS horario (
  cd_dia_semana INT NOT NULL,
  hr_abertura TIME,
  hr_fechamento TIME,
  PRIMARY KEY (cd_dia_semana, hr_abertura, hr_fechamento)

);

-- -----------------------------------------------------
-- Tabela horario_local
-- -----------------------------------------------------
DROP TABLE IF EXISTS horario_local;
CREATE TABLE IF NOT EXISTS horario_local (
  cd_local INT NOT NULL,
  cd_dia_semana INT NOT NULL,
  hr_abertura TIME,
  hr_fechamento TIME,
  PRIMARY KEY (cd_local, cd_dia_semana, hr_abertura, hr_fechamento),
  CONSTRAINT fk_local_horario_local
	FOREIGN KEY (cd_local)
    REFERENCES `local` (cd_local),
  CONSTRAINT fk_horario_horario_local
    FOREIGN KEY (cd_dia_semana, hr_abertura, hr_fechamento)
    REFERENCES horario (cd_dia_semana, hr_abertura, hr_fechamento)
);


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
  
  CONSTRAINT fk_administrador_tipo_administrador
    FOREIGN KEY (cd_tipo_administrador)
    REFERENCES tipo_administrador (cd_tipo_administrador),
  CONSTRAINT fk_administrador_local
    FOREIGN KEY (cd_local)
    REFERENCES local (cd_local)
    );


-- -----------------------------------------------------
-- Tabela cliente
-- -----------------------------------------------------
DROP TABLE IF EXISTS cliente ;

CREATE TABLE IF NOT EXISTS cliente (
  nm_email_cliente VARCHAR(100) NOT NULL,
  nm_cliente VARCHAR(45) NOT NULL,
  nm_senha_cliente VARCHAR(60) NULL,
  PRIMARY KEY (nm_email_cliente));

-- -----------------------------------------------------
-- Tabela recuperacao_senha
-- -----------------------------------------------------
DROP TABLE IF EXISTS recuperacao_senha ;

CREATE TABLE IF NOT EXISTS recuperacao_senha (
  nm_email_usuario VARCHAR(100) NOT NULL,
  cd_validacao VARCHAR(16) NOT NULL,
  dt_validade DATETIME,
  PRIMARY KEY (nm_email_usuario, cd_validacao));



-- -----------------------------------------------------
-- Tabela tipo_feedback
-- -----------------------------------------------------
DROP TABLE IF EXISTS tipo_feedback ;

CREATE TABLE IF NOT EXISTS tipo_feedback (
  cd_tipo_feedback INT NOT NULL,
  nm_tipo_feedback VARCHAR(45) NOT NULL,
  PRIMARY KEY (cd_tipo_feedback));


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
  CONSTRAINT fk_feedback_cliente
    FOREIGN KEY (nm_email_cliente)
    REFERENCES cliente (nm_email_cliente),
  CONSTRAINT fk_feedback_tipo_feedback1
    FOREIGN KEY (cd_tipo_feedback)
    REFERENCES tipo_feedback (cd_tipo_feedback)
    );

-- -----------------------------------------------------
-- Tabela tipo_beacon
-- -----------------------------------------------------
DROP TABLE IF EXISTS tipo_beacon ;

CREATE TABLE IF NOT EXISTS tipo_beacon (
  cd_tipo_beacon INT NOT NULL,
  nm_tipo_beacon VARCHAR(45) NOT NULL,
  PRIMARY KEY (cd_tipo_beacon));


-- -----------------------------------------------------
-- Tabela beacon
-- -----------------------------------------------------
DROP TABLE IF EXISTS beacon ;

CREATE TABLE IF NOT EXISTS beacon (
  cd_uuid_beacon VARCHAR(36) NOT NULL,
  cd_tipo_beacon INT NOT NULL,
  cd_local INT NOT NULL,
  PRIMARY KEY (cd_uuid_beacon),
  CONSTRAINT fk_beacon_local
    FOREIGN KEY (cd_local)
    REFERENCES local (cd_local),
  CONSTRAINT fk_beacon_tipo_beacon1
    FOREIGN KEY (cd_tipo_beacon)
    REFERENCES tipo_beacon (cd_tipo_beacon)
    );

-- -----------------------------------------------------
-- Tabela tipo_comunicado
-- -----------------------------------------------------
DROP TABLE IF EXISTS tipo_comunicado ;

CREATE TABLE IF NOT EXISTS tipo_comunicado (
  cd_tipo_comunicado INT NOT NULL,
  nm_tipo_comunicado VARCHAR(45) NOT NULL,
  PRIMARY KEY (cd_tipo_comunicado));


-- -----------------------------------------------------
-- Tabela categoria
-- -----------------------------------------------------
DROP TABLE IF EXISTS categoria ;

CREATE TABLE IF NOT EXISTS categoria (
  cd_categoria INT NOT NULL,
  nm_categoria VARCHAR(45) NOT NULL,
  ds_categoria VARCHAR(200) NOT NULL,
  PRIMARY KEY (cd_categoria));


-- -----------------------------------------------------
-- Tabela comunicado
-- -----------------------------------------------------
DROP TABLE IF EXISTS comunicado ;

CREATE TABLE IF NOT EXISTS comunicado (
  cd_comunicado INT NOT NULL,
  cd_local INT NOT NULL,
  cd_tipo_comunicado INT NOT NULL,
  ds_comunicado TEXT NOT NULL,
  dt_inicio_comunicado DATETIME NOT NULL,
  dt_fim_comunicado DATETIME NULL,
  PRIMARY KEY (cd_comunicado),
  CONSTRAINT fk_comunicado_local
    FOREIGN KEY (cd_local)
    REFERENCES local (cd_local),
  CONSTRAINT fk_comunicado_tipo_comunicado
    FOREIGN KEY (cd_tipo_comunicado)
    REFERENCES tipo_comunicado (cd_tipo_comunicado)
    );

-- -----------------------------------------------------
-- Tabela sub_categoria
-- -----------------------------------------------------
DROP TABLE IF EXISTS sub_categoria ;

CREATE TABLE IF NOT EXISTS sub_categoria (
  cd_sub_categoria INT NOT NULL,
  cd_categoria INT NOT NULL,
  nm_sub_categoria VARCHAR(45) NOT NULL,
  PRIMARY KEY (cd_sub_categoria, cd_categoria),

  CONSTRAINT fk_sub_categoria_categoria
    FOREIGN KEY (cd_categoria)
    REFERENCES categoria (cd_categoria)
    );

-- -----------------------------------------------------
-- Tabela sub_categoria_local
-- -----------------------------------------------------
DROP TABLE IF EXISTS sub_categoria_local ;

CREATE TABLE IF NOT EXISTS sub_categoria_local (
  cd_local INT NOT NULL,
  cd_categoria INT NOT NULL,
  cd_sub_categoria INT NOT NULL,
  PRIMARY KEY (cd_local, cd_categoria, cd_sub_categoria),

  CONSTRAINT fk_local_has_categoria_local
    FOREIGN KEY (cd_local)
    REFERENCES local (cd_local),

  CONSTRAINT fk_local_has_categoria_categoria
    FOREIGN KEY (cd_categoria, cd_sub_categoria)
    REFERENCES sub_categoria (cd_categoria, cd_sub_categoria)
    );


-- -----------------------------------------------------
-- Tabela preferencia_cliente
-- -----------------------------------------------------
DROP TABLE IF EXISTS preferencia_cliente ;

CREATE TABLE IF NOT EXISTS preferencia_cliente (
  nm_email_cliente VARCHAR(100) NOT NULL,
  cd_sub_categoria INT NOT NULL,
  cd_categoria INT NOT NULL,
  PRIMARY KEY (nm_email_cliente, cd_sub_categoria, cd_categoria),
  CONSTRAINT fk_cliente_has_sub_categoria_cliente
    FOREIGN KEY (nm_email_cliente)
    REFERENCES cliente (nm_email_cliente),
  CONSTRAINT fk_cliente_has_sub_categoria_sub_categoria
    FOREIGN KEY (cd_sub_categoria , cd_categoria)
    REFERENCES sub_categoria (cd_sub_categoria , cd_categoria)
    );

-- -----------------------------------------------------
-- Tabela comunicado_sub_categoria
-- -----------------------------------------------------
DROP TABLE IF EXISTS comunicado_sub_categoria;

CREATE TABLE IF NOT EXISTS comunicado_sub_categoria (
  cd_comunicado INT NOT NULL,
  cd_categoria INT NOT NULL,
  cd_sub_categoria INT NOT NULL,
  PRIMARY KEY (cd_comunicado, cd_categoria, cd_sub_categoria),
  CONSTRAINT fk_comunicado_comunicado_sub_categoria
    FOREIGN KEY (cd_comunicado)
    REFERENCES comunicado (cd_comunicado),
  CONSTRAINT fk_sub_categoria_comunicado_sub_categoria
    FOREIGN KEY (cd_categoria , cd_sub_categoria)
    REFERENCES sub_categoria (cd_categoria , cd_sub_categoria)
);