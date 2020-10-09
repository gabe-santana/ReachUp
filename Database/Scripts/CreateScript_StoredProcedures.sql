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
-- Script // Stored Procedures                   --
-- -----------------------------------------------------


USE  ReachUp;
DELIMITER $$
/* Cliente */

DROP PROCEDURE IF EXISTS atualizarUsuario$$
CREATE PROCEDURE atualizarUsuario(pRole varchar(3), pEmail varchar(100), pNome varchar(45), pSenha varchar(60))
BEGIN
	IF (pRole = "cli") THEN
		UPDATE cliente SET nm_cliente = pNome WHERE nm_email_cliente = pEmail;
		UPDATE cliente SET nm_senha_cliente = md5(pSenha) WHERE nm_email_cliente = pEmail;
   ELSE
	UPDATE administrador SET nm_administrador = pNome WHERE nm_email_administrador = pEmail;
	UPDATE administrador SET nm_senha_administrador = md5(pSenha) WHERE nm_email_administrador = pEmail;
  END IF;
END$$

DROP PROCEDURE IF EXISTS deletarUsuario$$
CREATE PROCEDURE deletarUsuario(pRole varchar(3), pEmail varchar(100))
BEGIN
	IF (pRole = "cli") THEN
		DELETE FROM cliente WHERE nm_email_cliente = pEmail;
   ELSE
	DELETE FROM administrador WHERE nm_email_administrador = pEmail;
  END IF;

END$$

DROP PROCEDURE IF EXISTS pegarUsuario$$
CREATE PROCEDURE pegarUsuario(pRole varchar(3), pEmail varchar(100))
BEGIN
	IF (pRole = "cli") THEN
		SELECT nm_cliente as "nm_user", nm_email_cliente as "nm_email_user", 
		nm_senha_cliente as "nm_senha_user"
		FROM cliente WHERE nm_email_cliente  = pEmail;
	END IF;
	
	IF (pRole = "loj") THEN
		SELECT nm_administrador as "nm_user", nm_email_administrador as "nm_email_user", 
		nm_senha_administrador as "nm_senha_user", cd_local 
		FROM administrador WHERE cd_tipo_administrador = 1 AND nm_email_administrador = pEmail;
	END IF;
	
	IF (pRole = "adm") THEN
		SELECT nm_administrador as "nm_user", nm_email_administrador as "nm_email_user", 
		nm_senha_administrador as "nm_senha_user"
		FROM administrador WHERE cd_tipo_administrador = 0 AND nm_email_administrador = pEmail;	
	END IF;
	
END$$

DROP PROCEDURE IF EXISTS pegarUsuarios$$
CREATE PROCEDURE pegarUsuarios(pRole varchar(3))
BEGIN
	IF (pRole = "cli") THEN
		SELECT 
		nm_cliente as "nm_user", nm_email_cliente as "nm_email_user", 
		nm_senha_cliente as "nm_senha_user"
		FROM cliente;
	END IF;
	
	IF (pRole = "loj") THEN
		SELECT 
		nm_administrador as "nm_user", nm_email_administrador as "nm_email_user", 
		nm_senha_administrador as "nm_senha_user", cd_local 
		FROM administrador where cd_tipo_administrador = 1;
	END IF;
	
	IF (pRole = "adm") THEN
		SELECT 
		nm_administrador as "nm_user", nm_email_administrador as "nm_email_user", 
		nm_senha_administrador as "nm_senha_user"
		FROM administrador where cd_tipo_administrador = 0;	
	END IF;
END$$
DROP PROCEDURE IF EXISTS cadastrarUsuario$$
CREATE PROCEDURE cadastrarUsuario(pEmail varchar(100), pNome varchar(45), pSenha varchar(60), pRole varchar(3), pLocal INT)
BEGIN
	IF (pRole = "cli") THEN
	INSERT INTO cliente VALUES (pEmail, pNome,md5(pSenha));
	END IF;
	
	IF (pRole = "loj") THEN
	INSERT INTO administrador VALUES (pEmail, 1, pLocal, pNome, md5(pSenha));
	END IF;
	
	IF (pRole = "adm") THEN
	INSERT INTO administrador VALUES (pEmail, 0, null, pNome, md5(pSenha));
	END IF;
	
	
END$$

DROP PROCEDURE IF EXISTS logarUsuario$$
CREATE PROCEDURE logarUsuario(pEmail varchar(100), pSenha varchar(60), pRole varchar(3))
BEGIN
	IF(pRole = "cli") THEN
		SELECT 
		 nm_cliente as "nm_user", nm_email_cliente as "nm_email_user", 
		nm_senha_cliente as "nm_senha_user"
		FROM cliente WHERE nm_email_cliente = pEmail 
		AND nm_senha_cliente = md5 (pSenha);
	ELSE
		SELECT 
		 nm_administrador as "nm_user", nm_email_administrador as "nm_email_user", 
		nm_senha_administrador as "nm_senha_user"
		FROM administrador WHERE nm_email_administrador= pEmail 
		AND nm_senha_administrador = md5 (pSenha);
	END IF;
END$$

DROP PROCEDURE IF EXISTS cadastrarCategoria$$
CREATE PROCEDURE cadastrarCategoria(pNome varchar(45), pDs varchar(200))
BEGIN
	DECLARE _cd int;
	SELECT COUNT(cd_categoria) INTO @_cd FROM categoria;
	INSERT INTO categoria VALUES
	(
		@_cd ,
		pNome,
		pDs
	);
END$$

DROP PROCEDURE IF EXISTS cadastrarSubCategoria$$
CREATE PROCEDURE cadastrarSubCategoria(pCdCategoria int, pNome varchar(45))
BEGIN
	DECLARE _cd int;
	SELECT COUNT(cd_sub_categoria) INTO @_cd FROM sub_categoria;
	INSERT INTO sub_categoria VALUES
	(
		@_cd,
		pCdCategoria,
		pNome
	);
END$$

DROP PROCEDURE IF EXISTS definirPreferencia$$
CREATE PROCEDURE definirPreferencia(pEmail varchar(100), pCdSubCategoria int, pCdCategoria int)
BEGIN
	INSERT INTO preferencia_cliente VALUES(pEmail, pCdSubCategoria, pCdCategoria);
END$$

DROP PROCEDURE IF EXISTS clientePrefere$$
CREATE PROCEDURE clientePrefere(pEmail varchar(100))
BEGIN
	SELECT 
	cl.nm_email_cliente , 
	cl.nm_cliente,
	group_concat(c.cd_categoria) as "cd_categories" , 
	group_concat(c.nm_categoria) as "nm_categories" , 
	group_concat(sc.cd_sub_categoria) as "cd_sub_categories", 
	group_concat(sc.nm_sub_categoria) as "nm_sub_categories"  
	FROM preferencia_cliente AS pc 
	INNER JOIN sub_categoria AS sc 
	ON pc.cd_sub_categoria = sc.cd_sub_categoria 
	INNER JOIN cliente as cl
	ON cl.nm_email_cliente = pc.nm_email_cliente
	INNER JOIN categoria AS c 
	ON sc.cd_categoria = c.cd_categoria 
	WHERE pc.nm_email_cliente = pEmail
	GROUP BY c.cd_categoria AND   sc.cd_sub_categoria; 
END$$

DROP PROCEDURE IF EXISTS criarFeedback$$
CREATE PROCEDURE criarFeedback(pTipo int, pEmail varchar(100),  pDs text, pQt int(1)) 
BEGIN	
	DECLARE 	_cd int;
	SELECT COUNT(cd_feedback) INTO @_cd FROM feedback WHERE cd_tipo_feedback = pTipo;
	INSERT INTO feedback VALUES (@_cd, pTipo, pEmail, pDs, curdate(), pQt) ;
END$$

DROP PROCEDURE IF EXISTS deletarFeedback$$ 
CREATE PROCEDURE deletarFeedback(pFeedback int)
BEGIN
	DELETE FROM feedback WHERE cd_feedback = pFeedback;
END$$

DROP PROCEDURE IF EXISTS pegarFeedback$$
CREATE PROCEDURE pegarFeedback(pFeedback int)
BEGIN
	SELECT * FROM 	feedback WHERE cd_feedback = pFeedback;
END$$

DROP PROCEDURE IF EXISTS conectarBeacon$$
CREATE PROCEDURE conectarBeacon(pUUID varchar(36))
BEGIN
	SELECT tb.nm_tipo_beacon, l.cd_local, tl.cd_tipo_local, l.cd_andar, l.nm_local,
	l.cd_andar  FROM beacon AS b
	INNER JOIN tipo_beacon AS tb
	ON b.cd_tipo_beacon  = tb.cd_tipo_beacon
	INNER JOIN `local` as l 
	ON b.cd_local = l.cd_local
	INNER JOIN  tipo_local AS tl
	ON  l.cd_tipo_local =  tl.cd_tipo_local
	WHERE cd_uuid_beacon = pUUID;
END$$

DROP PROCEDURE IF EXISTS receberComunicados$$
CREATE PROCEDURE receberComunicados(pLocal int)
BEGIN
	SELECT * FROM comunicado as c 
	INNER JOIN `local` as l 
	ON l.cd_local = 	c.cd_local 
	WHERE c.cd_tipo_comunicado <> 0
	AND l.cd_local = pLocal;
END$$
DROP PROCEDURE IF EXISTS receberPromocoesDirecionadas$$
CREATE PROCEDURE  receberPromocoesDirecionadas(pLocal int, pCliente varchar(100))
BEGIN
			SELECT l.nm_local , c.ds_comunicado , ca.nm_categoria, 
			sc.nm_sub_categoria , c.dt_inicio_comunicado, c.dt_fim_comunicado 
			FROM `local` as l
			INNER JOIN comunicado as c
			ON l.cd_local = c.cd_local 
			INNER JOIN comunicado_sub_categoria as csc
			ON c.cd_comunicado = csc.cd_comunicado
			INNER JOIN sub_categoria as sc
			ON csc.cd_categoria = sc.cd_categoria
			AND csc.cd_sub_categoria = sc.cd_sub_categoria
			INNER JOIN categoria as ca
			ON sc.cd_categoria = ca.cd_categoria
			INNER JOIN preferencia_cliente as pc
			ON sc.cd_categoria = pc.cd_categoria
			AND sc.cd_sub_categoria = pc.cd_sub_categoria
			WHERE sc.cd_categoria = pc.cd_categoria AND sc.cd_sub_categoria = pc.cd_sub_categoria
			AND pc.nm_email_cliente = pCliente
			AND curdate() BETWEEN c.dt_inicio_comunicado AND c.dt_fim_comunicado
			AND c.cd_tipo_comunicado = 0
			AND c.cd_local = pLocal
			GROUP BY c.cd_comunicado;
END$$

DROP PROCEDURE IF EXISTS pegarComunicados$$
CREATE PROCEDURE pegarComunicados(pLocal int)
BEGIN
	SELECT * FROM comunicado WHERE cd_local = pLocal;
END$$

DROP PROCEDURE IF EXISTS atualizarComunicado$$
CREATE PROCEDURE atualizarComunicado(pComunicado int, pLocal int, pTipo int, pDs text, pDataInicio datetime, pDataFim datetime)
BEGIN
	UPDATE comunicado SET cd_local = pLocal WHERE cd_comunicado = pComunicado;
	UPDATE comunicado SET cd_tipo_comunicado = pTipo WHERE cd_comunicado = pComunicado;
	UPDATE comunicado SET ds_comunicado = pDs WHERE cd_comunicado = pComunicado;
	UPDATE comunicado SET dt_inicio_comunicado = pDataInicio WHERE cd_comunicado = pComunicado;
	UPDATE comunicado SET dt_fim_comunicado = pDataFim WHERE cd_comunicado = pComunicado;
END$$

DROP PROCEDURE IF EXISTS deletarComunicado$$
CREATE PROCEDURE deletarComunicado(pComunicado int )
BEGIN
	DELETE FROM comunicado WHERE cd_comunicado = pComunicado;
END$$

DROP PROCEDURE IF EXISTS pesquisar$$
CREATE PROCEDURE pesquisar(search varchar(50))
BEGIN
	SELECT 
	l.nm_local, tl.nm_tipo_local, l.cd_andar,
	substring_index(group_concat(DISTINCT ca.nm_categoria SEPARATOR ','), ',', 3) as categorias,
	substring_index(group_concat(DISTINCT sc.nm_sub_categoria SEPARATOR ','), ',', 3) as sub_categorias
	FROM `local` AS l
	JOIN tipo_local AS tl 
	ON l.cd_tipo_local = tl.cd_tipo_local
	JOIN sub_categoria_local as scl
	ON l.cd_local = scl.cd_local
	JOIN sub_categoria as sc
	ON scl.cd_categoria = sc.cd_categoria
	AND scl.cd_sub_categoria = sc.cd_sub_categoria
	JOIN categoria as ca
	ON sc.cd_categoria = ca.cd_categoria
	WHERE 
	formatString(l.nm_local)    LIKE formatString(concat("%",search,"%"))
	OR 
	formatString(ca.nm_categoria)    LIKE formatString(concat("%",search,"%"))
	OR 
	(formatString(sc.nm_sub_categoria)    LIKE formatString(concat("%",search,"%")) AND (l.cd_tipo_local = 0  OR l.cd_tipo_local = 7))
	OR
	formatString(tl.nm_tipo_local)            LIKE formatString(concat("%",search,"%"))
	OR
	formatString(l.cd_andar)                     LIKE formatString(concat("%",search,"%"))

	GROUP BY l.cd_local;
END$$

/* Lojista e Administrador */

DROP PROCEDURE IF EXISTS cadastrarLocal$$
CREATE PROCEDURE cadastrarLocal(pTipo int, pNome varchar(45), pAndar int(3), pAbertura time , pFechamento time, pUUIDBeacon varchar(36))
BEGIN
	DECLARE _cd int;
	SELECT COUNT(cd_local) INTO @_cd FROM `local`;
	INSERT INTO `local` VALUES (@_cd, pTipo, pNome, pAndar, pAbertura, pFechamento);
	INSERT INTO beacon VALUES (pUUIDBeacon, 0,  @_cd);
END$$

DROP PROCEDURE IF EXISTS defSubCategoriaLocal$$
CREATE PROCEDURE defSubCategoriaLocal(plocal int, pCategoria int, pSubCategoria int)
BEGIN
	INSERT INTO sub_categoria_local VALUES (plocal, pCategoria, pSubCategoria);
END$$

DROP PROCEDURE IF EXISTS darAdm$$
CREATE PROCEDURE darAdm(pEmail varchar(100), pCdLocal int)
BEGIN
		UPDATE administrador SET  cd_local = pCdLocal 
		WHERE nm_email_administrador = pEmail;
END$$

DROP PROCEDURE IF EXISTS publicarComunicado$$
CREATE PROCEDURE publicarComunicado(pLocal int, pTipo int, pCategoria int, pSubCategoria int, pDs text, pDataInicio datetime, pDataFim datetime)
BEGIN
		DECLARE 	_cd int;
		SELECT COUNT(cd_comunicado) INTO @_cd FROM comunicado;
		INSERT INTO comunicado VALUES (@_cd, pLocal, pTipo, pDs, pDataInicio, pDataFim);
		INSERT INTO comunicado_sub_categoria VALUES (@_cd, pCategoria, pSubCategoria);
		
END$$

DROP PROCEDURE IF EXISTS cadastrarBeacon$$
CREATE PROCEDURE cadastrarBeacon(pUUID varchar(36), pTipo int, pLocal int)
BEGIN
	INSERT INTO beacon VALUES (pUUID, pTipo, pLocal);
END$$

DROP PROCEDURE IF EXISTS atualizarBeacon$$
CREATE PROCEDURE atualizarBeacon(pUUID varchar(36), pTipo int, pLocal int)
BEGIN
	UPDATE beacon SET cd_tipo_beacon = pTipo WHERE cd_uuid_beacon = pUUID;
	UPDATE beacon SET cd_local = pLocal WHERE cd_uuid_beacon = pUUID;
END$$

DROP PROCEDURE IF EXISTS atualizarFeedback$$
CREATE PROCEDURE atualizarFeedback(pFeedback int, pTipo int, pEmail varchar(100),  pDs text, pQt int(1)) 
BEGIN
	UPDATE feedback SET cd_tipo_feedback = pTipo WHERE cd_feedback = pFeedback;
	UPDATE feedback SET nm_email_cliente = pEmail WHERE cd_feedback = pFeedback;
	UPDATE feedback SET ds_feedback = pDs WHERE cd_feedback = pFeedback;
	UPDATE feedback SET dt_feedback = now() WHERE cd_feedback = pFeedback;
	UPDATE feedback SET qt_estrelas_feedback = pQt WHERE cd_feedback = pFeedback;

END$$

DROP PROCEDURE IF EXISTS FeedbackPorCliente$$
CREATE PROCEDURE FeedbackPorCliente(pEmail varchar(100))
BEGIN
	SELECT * FROM feedback WHERE nm_email_cliente = pEmail;
END$$

DROP PROCEDURE IF EXISTS acessoFeedbacks$$
CREATE PROCEDURE acessoFeedbacks(pTipo int, dataInicio date , dataFim date, pGeral bool)
BEGIN
	IF pGeral = false THEN
		IF pTipo = 0 THEN
				SELECT nm_email_cliente, ds_feedback, qt_estrelas_feedback, dt_feedback FROM feedback 
				WHERE dt_feedback BETWEEN  dataInicio AND dataFim
				AND cd_tipo_feedback = pTipo;
		ELSE
				SELECT nm_email_cliente, ds_feedback,dt_feedback FROM feedback 
				WHERE dt_feedback BETWEEN  dataInicio AND dataFim
				AND cd_tipo_feedback = pTipo;
		END IF;
	ELSE
		IF pTipo = 0 THEN
				SELECT nm_email_cliente, ds_feedback, qt_estrelas_feedback,dt_feedback FROM feedback 
				WHERE cd_tipo_feedback = pTipo;
		ELSE
				SELECT nm_email_cliente, ds_feedback, dt_feedback FROM feedback 
				WHERE cd_tipo_feedback = pTipo;
		END IF;
	END IF;
END$$

DROP FUNCTION IF EXISTS mediaFeedbacks$$
CREATE FUNCTION mediaFeedbacks( dataInicio date, dataFim date, pGeral bool) RETURNS INT(1)
BEGIN
	DECLARE media INT(1);
	IF pGeral = false THEN
		SELECT  avg(qt_estrelas_feedback)INTO @media FROM feedback 	
		WHERE cd_tipo_feedback = 0 AND dt_feedback BETWEEN  dataInicio AND dataFim;
	ELSE
		SELECT avg(qt_estrelas_feedback) INTO @media FROM feedback
		 WHERE cd_tipo_feedback = 0 ;
	END IF;
	RETURN  @media;
END$$

DROP PROCEDURE IF EXISTS pegarLocal$$
CREATE PROCEDURE pegarLocal(pID INT)
BEGIN
	SELECT l.cd_local, tl.nm_tipo_local, l.nm_local, l.cd_andar, 
	l.hr_abertura, l.hr_fechamento,
	substring_index(group_concat(DISTINCT c.nm_categoria SEPARATOR ','), ',', 3) as  categorias,
	group_concat(b.cd_uuid_beacon) AS  Beacons FROM `local` AS l 
	INNER JOIN tipo_local AS tl
	ON l.cd_tipo_local = tl.cd_tipo_local
	INNER JOIN beacon AS b
	ON l.cd_local = b.cd_local
	INNER JOIN sub_categoria_local as scl
	ON l.cd_local = cl.cd_local
	INNER JOIN sub_categoria as sc
	ON scl.cd_categoria = sc.cd_categoria
	AND scl.cd_sub_categoria = sc.cd_sub_categoria
	INNER JOIN categoria as c
	ON sc.cd_categoria = c.cd_categoria
	WHERE l.cd_local = pID;
END$$

DROP PROCEDURE IF EXISTS pegarLocais$$
CREATE PROCEDURE pegarLocais(pTipo VARCHAR(45))
BEGIN
	SELECT l.cd_local, tl.cd_tipo_local, l.nm_local, l.cd_andar,group_concat(b.cd_uuid_beacon) AS  Beacons FROM `local` AS l 
	INNER JOIN tipo_local AS tl
	ON l.cd_tipo_local = tl.cd_tipo_local
	INNER JOIN beacon AS b
	ON  l.cd_local = b.cd_local
	WHERE tl.nm_tipo_local = pTipo
	GROUP BY l.cd_local;
END$$

DROP PROCEDURE IF EXISTS atualizarLocal$$
CREATE PROCEDURE atualizarLocal(pLocal int, pTipo int, pNome varchar(45), pAndar int(3))
BEGIN
	UPDATE  `local`  SET cd_tipo_local = pTipo WHERE cd_local = pLocal;
	UPDATE  `local`  SET nm_local = pNome WHERE cd_local = pLocal;
	UPDATE  `local`  SET cd_andar = pAndar WHERE cd_local = pLocal;
END$$

DROP PROCEDURE IF EXISTS deletarLocal$$
CREATE PROCEDURE deletarLocal(pLocal int)
BEGIN
	DELETE FROM categoria_local WHERE cd_local = pLocal;
	DELETE FROM comunicado WHERE cd_local = pLocal;
	DELETE FROM beacon WHERE cd_local = pLocal;
	DELETE FROM `local` WHERE cd_local = pLocal;
END$$

DROP PROCEDURE IF EXISTS pegarBeacon$$
CREATE PROCEDURE pegarBeacon(pUUID varchar(36))
BEGIN
	SELECT * FROM beacon WHERE cd_uuid_beacon = pUUID;
END$$

DROP PROCEDURE IF EXISTS pegarBeacon$$
CREATE PROCEDURE pegarBeacon(pUUID varchar(36))
BEGIN
	SELECT * FROM beacon WHERE cd_uuid_beacon = pUUID;
END$$

DROP PROCEDURE IF EXISTS pegarBeaconsDeLocal$$
CREATE PROCEDURE pegarBeaconsDeLocal(pLocal int )
BEGIN
	SELECT * FROM beacon WHERE cd_local = pLocal;
END$$



DROP PROCEDURE IF EXISTS deletarBeacon$$
CREATE PROCEDURE deletarBeacon(pUUID VARCHAR(36))
BEGIN
	DELETE FROM beacon WHERE cd_uuid_beacon = pUUID;
END$$

DROP PROCEDURE IF EXISTS lojistasLoja$$
CREATE PROCEDURE lojistasLoja(pLocal INT)
BEGIN
		SELECT adm.nm_administrador, adm.nm_email_administrador FROM `local` AS l
		INNER JOIN administrador AS adm ON l.cd_local = adm.cd_local
		WHERE adm.cd_local = pLocal;
END$$

DROP PROCEDURE IF EXISTS pegarCategoria$$
CREATE PROCEDURE pegarCategoria(pCategoria INT )
BEGIN
	SELECT * FROM categoria WHERE cd_categoria = pCategoria;
END$$

DROP PROCEDURE IF EXISTS removerCategoria$$
CREATE PROCEDURE removerCategoria(pCategoria int)
BEGIN
	DELETE FROM categoria WHERE cd_categoria = pCategoria;
END$$

DROP PROCEDURE IF EXISTS pegarSubCategorias$$
CREATE PROCEDURE pegarSubCategorias()
BEGIN
 SELECT sc.cd_categoria, sc.cd_sub_categoria, sc.nm_sub_categoria, c.nm_categoria 
	FROM sub_categoria as sc 
	INNER JOIN categoria as c
	ON sc.cd_categoria = c.cd_categoria
	GROUP BY sc.cd_categoria;
END$$

DROP PROCEDURE IF EXISTS pegarSubCategoriasComunicado$$
CREATE PROCEDURE pegarSubCategoriasComunicado(pComunicado int)
BEGIN
 SELECT sc.cd_categoria, sc.cd_sub_categoria, sc.nm_sub_categoria, c.nm_categoria
	FROM comunicado_sub_categoria csc
	INNER JOIN sub_categoria as sc 
	ON csc.cd_categoria = sc.cd_categoria
	AND csc.cd_sub_categoria = sc.cd_sub_categoria
	INNER JOIN categoria as c
	ON sc.cd_categoria = c.cd_categoria
	WHERE csc.cd_comunicado = pComunicado
	GROUP BY sc.cd_categoria;
END$$

DROP PROCEDURE IF EXISTS pegarSubcategoriasLocal$$
CREATE PROCEDURE 	pegarSubcategoriasLocal(pLocal int)
BEGIN
	SELECT sc.cd_categoria, sc.cd_sub_categoria, sc.nm_sub_categoria, c.nm_categoria 
	FROM sub_categoria_local as scl
	INNER JOIN sub_categoria as sc
	ON scl.cd_categoria = sc.cd_categoria
	AND scl.cd_sub_categoria = sc.cd_sub_categoria
	INNER JOIN categoria as c
	ON sc.cd_categoria = c.cd_categoria
	WHERE scl.cd_local = pLocal;	
END$$



DROP FUNCTION IF EXISTS formatString$$
CREATE FUNCTION formatString(str varchar(50) ) 	RETURNS  varchar(50)
BEGIN
	DECLARE lowerCaseStr varchar(50);
	SET @lowerCaseStr =  lower(str);
	
	SET @lowerCaseStr = REPLACE(@lowerCaseStr, 'á','a');
	SET @lowerCaseStr = REPLACE(@lowerCaseStr, 'à','a');
	SET @lowerCaseStr = REPLACE(@lowerCaseStr, 'ã','a');
	
	SET @lowerCaseStr = REPLACE(@lowerCaseStr, 'é','e');
	SET @lowerCaseStr = REPLACE(@lowerCaseStr, 'è','e');
	SET @lowerCaseStr = REPLACE(@lowerCaseStr, 'ê','e');
	
	SET @lowerCaseStr = REPLACE(@lowerCaseStr, 'Í','i');
	SET @lowerCaseStr = REPLACE(@lowerCaseStr, 'ì','i');

	SET @lowerCaseStr = REPLACE(@lowerCaseStr, 'ó','o');
	SET @lowerCaseStr = REPLACE(@lowerCaseStr, 'ò','ò');
	SET @lowerCaseStr = REPLACE(@lowerCaseStr, 'õ','o');

	SET @lowerCaseStr = REPLACE(@lowerCaseStr, 'ú','u');
	SET @lowerCaseStr = REPLACE(@lowerCaseStr, 'ù','u');
	
	SET @lowerCaseStr = REPLACE(@lowerCaseStr,'|','');
	return @lowerCaseStr;
END$$
DELIMITER ;
SHOW PROCEDURE STATUS WHERE db = "reachup";