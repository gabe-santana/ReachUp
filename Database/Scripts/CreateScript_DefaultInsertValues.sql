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
    "Acessibilidade dos banheiros"
);

INSERT INTO tipo_feedback 
VALUES
(
	1,
    "Acessibilidade de escadas fixas"
);


INSERT INTO tipo_feedback 
VALUES
(
	2,
    "Acessibilidade de escadas rolantes"
);

INSERT INTO tipo_feedback
VALUES
(
    3,
    "Acessibilidade de elevadores"
);

INSERT INTO tipo_feedback
VALUES
(
    4,
    "Acessibilidade de lojas"
);

INSERT INTO tipo_feedback
VALUES
(
    5,
    "Acessibilidade dos corredores"
);

INSERT INTO tipo_feedback
VALUES
(
    6,
    "Acessibilidade da praça de alimentação"
);

INSERT INTO tipo_feedback
VALUES
(
    7,
    "Acessibilidade de restaurantes"
);

INSERT INTO tipo_feedback
VALUES
(
    8,
    "Acessibilidade dos pontos de lazer"
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

INSERT INTO tipo_administrador
VALUES
(
	2,
    "Desenvolvedor"
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
    "Cinema"
);

INSERT INTO tipo_local
VALUES
(
	3,
    "Necessidades"
);

INSERT INTO tipo_local
VALUES
(
	4,
    "Escada"
);

INSERT INTO tipo_local
VALUES
(
	5,
    "Elevador"
);

INSERT INTO tipo_local
VALUES
(
	6,
    "Praça"
);

INSERT INTO tipo_local
VALUES
(
    7,
    "Serviço"

);

INSERT INTO tipo_local
VALUES
(
    8,
    "Entrada/Saída"

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
    "Alerta"
);

INSERT INTO tipo_comunicado
VALUES
(
    4,
    "Preços"
);

