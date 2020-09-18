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
-- Script // Default Values                           --
-- -----------------------------------------------------

/* Tipos de feeddback */

INSERT INTO tipo_feedback 
VALUES
(
	0,
    "Avaliação de uso"
);

INSERT INTO tipo_feedback 
VALUES
(
	1,
    "Reporte de bug"
);


INSERT INTO tipo_feedback 
VALUES
(
	2,
    "Denúncia"
);

/* Tipos de adminsitradores */

INSERT INTO tipo_administrador
VALUES
(
	0,
    "Administrador do Shopping"
);

INSERT INTO tipo_administrador
VALUES
(
	1,
    "Lojista"
);

/* Tipo de locais */

INSERT INTO tipo_local
VALUES
(
	0,
    "Loja"
);

INSERT INTO tipo_local
VALUES
(
	1,
    "Restaurante"
);

INSERT INTO tipo_local
VALUES
(
	2,
    "Livraria"
);

INSERT INTO tipo_local
VALUES
(
	3,
    "Cinema"
);

INSERT INTO tipo_local
VALUES
(
	4,
    "Hipermercado"
);

INSERT INTO tipo_local
VALUES
(
	5,
    "Drogaria"
);

INSERT INTO tipo_local
VALUES
(
	6,
    "Banheiro"
);
	
INSERT INTO tipo_local
VALUES
(
	7,
    "Bebedouro"
);

INSERT INTO tipo_local
VALUES
(
	8,
    "Escada fixa"
);

INSERT INTO tipo_local
VALUES
(
	9,
    "Escada rolante"
);

INSERT INTO tipo_local
VALUES
(
	10,
    "Elevador"
);

INSERT INTO tipo_local
VALUES
(
	11,
    "Praça"
);

INSERT INTO tipo_local
VALUES
(
    12,
    "Serviços"

);


/* Tipo de Beacons*/

INSERT INTO tipo_beacon
VALUES
(
	"0",
    "Beacon local"
);

INSERT INTO tipo_beacon
VALUES
(
	"1",
    "Beacon trilateral"
);

/* Tipo de comunicados */
INSERT INTO tipo_comunicado
VALUES
(
	0,
    "Promoção direcionada"
);

INSERT INTO tipo_comunicado
VALUES
(
	1,
    "Promoção geral"
);


INSERT INTO tipo_comunicado
VALUES
(
	2,
    "Notificação"
);

INSERT INTO tipo_comunicado
VALUES
(
	3,
    "Alarme"
);

INSERT INTO tipo_comunicado
VALUES
(
    4,
    "Preços"
);

