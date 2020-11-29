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

DROP PROCEDURE IF EXISTS pegarInfoShopping$$
CREATE PROCEDURE pegarInfoShopping(pShopping int)
BEGIN
  SELECT s.cd_shopping, nm_shopping, ds_mensagem, 
  GROUP_CONCAT(CONCAT(hs.cd_dia_semana, '-', hs.hr_abertura, '-', hs.hr_fechamento)) 
  as horarios_funcionamento
  FROM shopping s
  INNER JOIN horario_shopping hs
  ON s.cd_shopping = hs.cd_shopping
  WHERE s.cd_shopping = pShopping;
END$$

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

    IF (pRole = "dev") THEN
		SELECT nm_administrador as "nm_user", nm_email_administrador as "nm_email_user", 
		nm_senha_administrador as "nm_senha_user"
		FROM administrador WHERE cd_tipo_administrador = 2 AND nm_email_administrador = pEmail;	
	END IF;
	
END$$

DROP PROCEDURE IF EXISTS pegarUsuarios$$
CREATE PROCEDURE pegarUsuarios(pRole varchar(3))
BEGIN
	IF (pRole = "cli") THEN
		SELECT 
		nm_cliente as "nm_user", 
        nm_email_cliente as "nm_email_user"
		FROM cliente;
	END IF;
	
	IF (pRole = "loj") THEN
		SELECT 
		nm_administrador as "nm_user", 
        nm_email_administrador as "nm_email_user",
		cd_local 
		FROM administrador where cd_tipo_administrador = 1;
	END IF;
	
	IF (pRole = "adm") THEN
		SELECT 
		nm_administrador as "nm_user", 
        nm_email_administrador as "nm_email_user"
		FROM administrador where cd_tipo_administrador = 0;	
	END IF;

    IF (pRole = "dev") THEN
		SELECT 
		nm_administrador as "nm_user", 
        nm_email_administrador as "nm_email_user" 
		FROM administrador where cd_tipo_administrador = 2;	
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

    IF (pRole = "dev") THEN
	INSERT INTO administrador VALUES (pEmail, 2, null, pNome, md5(pSenha));
	END IF;
	
	
END$$

DROP PROCEDURE IF EXISTS pesquisarUsuarioPorNome$$
CREATE PROCEDURE pesquisarUsuarioPorNome(pNome varchar(45), pRole varchar(3))
BEGIN
 IF (pRole = "loj") THEN
  SELECT nm_email_administrador, cd_local, nm_administrador, nm_senha_administrador
  FROM administrador
  WHERE formatString(nm_administrador) LIKE formatString(concat("%", pNome,"%"))
  AND cd_local IS NOT NULL
  GROUP BY cd_local;
 END IF;
END$$

DROP PROCEDURE IF EXISTS checarEmail$$
CREATE PROCEDURE checarEmail(pEmail varchar(100), pRole varchar(3))
BEGIN
  declare _count int;
  IF (pRole = "cli") THEN
    SELECT count(*) INTO @_count FROM cliente WHERE nm_email_cliente = pEmail;
  ELSE IF (pRole = "loj" OR pRole = "adm" OR pRole = "dev") THEN 
         SELECT count(*) INTO @_count FROM administrador WHERE nm_email_administrador = pEmail;
       END IF;
  END IF;

  IF (@_count = 1) THEN 
    SELECT 1 as result;
  ELSE
    SELECT 0 as result;
  END IF;
END$$

DROP PROCEDURE IF EXISTS pegarCategorias$$
CREATE PROCEDURE pegarCategorias(pGeral bool) 
BEGIN
   IF (pGeral) THEN
     SELECT * from categoria;
   ELSE
     SELECT * FROM categoria WHERE ic_especial = 0;
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

DROP PROCEDURE IF EXISTS pegarLocalLojista$$
CREATE PROCEDURE pegarLocalLojista(pEmail varchar(100))
BEGIN
  SELECT cd_local FROM administrador WHERE nm_email_administrador = pEmail;
END$$

DROP PROCEDURE IF EXISTS recuperarSenha$$
CREATE PROCEDURE recuperarSenha(pEmail varchar(100), pCdValidacao varchar(16))
BEGIN
  INSERT INTO recuperacao_senha VALUES (pEmail, pCdValidacao, DATE_ADD(now(), INTERVAL 1 hour));
END$$


DROP PROCEDURE IF EXISTS verificarRecuperacaoSenha$$
CREATE PROCEDURE verificarRecuperacaoSenha(pEmail varchar(100), pCdValidacao varchar(16))
BEGIN
  declare _count int;
  declare _validade DATETIME;
  SELECT count(*) INTO @_count FROM recuperacao_senha
  WHERE nm_email_usuario = pEmail AND cd_validacao = pCdValidacao;

  IF (@_count = 1) THEN
    SELECT dt_validade INTO @_validade FROM recuperacao_senha
    WHERE nm_email_usuario = pEmail AND cd_validacao = pCdValidacao;
	IF (@_validade >= now()) THEN
      SELECT 1 as result;
    ELSE
      SELECT 0 as result;
    END IF;
  ELSE
    SELECT 0 as result;
  END IF;
END$$

DROP PROCEDURE IF EXISTS atualizarSenha$$
CREATE PROCEDURE atualizarSenha(pEmail varchar(100), pRole varchar(3), pSenha varchar(60))
BEGIN
	IF (pRole = "cli") THEN
      UPDATE cliente SET nm_senha_cliente = md5(pSenha) WHERE nm_email_cliente = pEmail;
    ELSE 
	  UPDATE administrador SET nm_senha_administrador = md5(pSenha) WHERE nm_email_administrador = pEmail;
    END IF;
END$$

DROP PROCEDURE IF EXISTS adicionarTipo$$
CREATE PROCEDURE adicionarTipo(pNome varchar(45), pTipo varchar(3))
BEGIN
   declare _cd int;
   IF (pTipo = "adm") THEN
     SELECT count(*) INTO @_cd FROM tipo_administrador;
     INSERT INTO tipo_administrador VALUES (@_cd, pNome);
   END IF;
   IF (pTipo = "b") THEN 
	 SELECT count(*) INTO @_cd FROM tipo_beacon;
	 INSERT INTO tipo_beacon VALUES (@_cd, pNome);
   END IF;
   IF (pTipo = "c") THEN
	 SELECT count(*) INTO @_cd FROM tipo_comunicado;
	 INSERT INTO tipo_comunicado VALUES (@_cd, pNome);
   END IF;
   IF (pTipo = "f") THEN
     SELECT count(*) INTO @_cd FROM tipo_feedback;
     INSERT INTO tipo_feedback VALUES (@_cd, pNome);
   END IF;
   IF (pTipo = "l") THEN
     SELECT count(*) INTO @_cd FROM tipo_local;
     INSERT INTO tipo_local VALUES (@_cd, pNome);
   END IF;
END$$

DROP PROCEDURE IF EXISTS atualizarTipo$$
CREATE PROCEDURE atualizarTipo(pCd int, pNome varchar(45), pTipo varchar(3))
BEGIN
   IF (pTipo = "adm") THEN
     UPDATE tipo_administrador SET nm_tipo_administrador = pNome  
     WHERE cd_tipo_administrador = pCd;
   END IF;
   IF (pTipo = "b") THEN 
	 UPDATE tipo_beacon SET nm_tipo_beacon = pNome  
     WHERE cd_tipo_beacon = pCd;
   END IF;
   IF (pTipo = "c") THEN
	 UPDATE tipo_comunicado SET nm_tipo_comunicado = pNome  
     WHERE cd_tipo_comunicado = pCd;
   END IF;
   IF (pTipo = "f") THEN
     UPDATE tipo_feedback SET nm_tipo_feedback = pNome  
     WHERE cd_tipo_feedback = pCd;
   END IF;
   IF (pTipo = "l") THEN
     UPDATE tipo_local SET nm_tipo_local = pNome  
     WHERE cd_tipo_local = pCd;
   END IF;
END$$

DROP PROCEDURE IF EXISTS deletarTipo$$
CREATE PROCEDURE deletarTipo(pCd int, pTipo varchar(3))
BEGIN
   IF (pTipo = "adm") THEN
     DELETE FROM administrador WHERE cd_tipo_administrador = pCd;
     DELETE FROM tipo_administrador WHERE cd_tipo_administrador = pCd;
   END IF;
   IF (pTipo = "b") THEN 
	 DELETE FROM beacon WHERE cd_tipo_beacon = pCd;
     DELETE FROM tipo_beacon WHERE cd_tipo_beacon = pCd;
   END IF;
   IF (pTipo = "c") THEN
	 DELETE FROM comunicado WHERE cd_tipo_comunicado = pCd;
     DELETE FROM tipo_comunicado WHERE cd_tipo_comunicado = pCd;
   END IF;
   IF (pTipo = "f") THEN
     DELETE FROM feedback WHERE cd_tipo_feedback = pCd;
     DELETE FROM tipo_feedback WHERE cd_tipo_feedback = pCd;
   END IF;
   IF (pTipo = "l") THEN
     DELETE FROM `local` WHERE cd_tipo_local = pCd;
     DELETE FROM tipo_local WHERE cd_tipo_local = pCd;
   END IF;
END$$

/* Alterada */
DROP PROCEDURE IF EXISTS cadastrarCategoria$$
CREATE PROCEDURE cadastrarCategoria(pNome varchar(45), pDs varchar(200), pEspecial bool)
BEGIN
	DECLARE _cd int;
	SELECT COUNT(cd_categoria) INTO @_cd FROM categoria;
	INSERT INTO categoria VALUES
	(
		@_cd ,
		pNome,
		pDs,
        pEspecial
	);
END$$

DROP PROCEDURE IF EXISTS cadastrarSubCategoria$$
CREATE PROCEDURE cadastrarSubCategoria(pCdCategoria int, pNome varchar(45))
BEGIN
	DECLARE _cd int;
	SELECT COUNT(cd_sub_categoria) INTO @_cd FROM sub_categoria WHERE cd_categoria = pCdCategoria;
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

DROP PROCEDURE IF EXISTS removerPreferencia$$
CREATE PROCEDURE removerPreferencia(pEmail varchar(100), pCdSubCategoria int, pCdCategoria int)
BEGIN
	DELETE FROM preferencia_cliente
    WHERE nm_email_cliente = pEmail
    AND cd_sub_categoria = pCdSubCategoria
    AND cd_categoria = pCdCategoria;
END$$


DROP PROCEDURE IF EXISTS clientePrefere$$
CREATE PROCEDURE clientePrefere(pEmail varchar(100))
BEGIN
	SELECT 
	cl.nm_email_cliente , 
	cl.nm_cliente,
	pc.cd_categoria, pc.cd_sub_categoria,
    sc.nm_sub_categoria
	FROM preferencia_cliente AS pc 
	INNER JOIN sub_categoria AS sc 
	ON pc.cd_sub_categoria = sc.cd_sub_categoria 
    AND pc.cd_categoria = sc.cd_categoria
	INNER JOIN cliente as cl
	ON cl.nm_email_cliente = pc.nm_email_cliente
	INNER JOIN categoria AS c 
	ON sc.cd_categoria = c.cd_categoria 
	WHERE pc.nm_email_cliente = pEmail
	ORDER BY pc.cd_categoria;
END$$

DROP PROCEDURE IF EXISTS criarFeedback$$
CREATE PROCEDURE criarFeedback(pTipo int, pEmail varchar(100),  pDs text, pQt int(1)) 
BEGIN	
	DECLARE 	_cd int;
	SELECT COUNT(*) INTO @_cd FROM feedback WHERE cd_tipo_feedback = pTipo;
	INSERT INTO feedback VALUES (@_cd, pTipo, pEmail, pDs, curdate(), pQt) ;
END$$

DROP PROCEDURE IF EXISTS deletarFeedback$$ 
CREATE PROCEDURE deletarFeedback(pFeedback int, pTipo int)
BEGIN
	DELETE FROM feedback 
    WHERE cd_feedback = pFeedback
    AND cd_tipo_feedback = pTipo;
END$$

DROP PROCEDURE IF EXISTS pegarFeedback$$
CREATE PROCEDURE pegarFeedback(pFeedback int, pTipo int)
BEGIN
	SELECT * FROM 	feedback 
    WHERE cd_feedback = pFeedback
    AND cd_tipo_feedback = pTipo;
END$$

DROP PROCEDURE IF EXISTS conectarBeacon$$
CREATE PROCEDURE conectarBeacon(pUUID varchar(36))
BEGIN
	SELECT l.cd_local, tl.nm_tipo_local, l.cd_andar, l.nm_local
	FROM beacon AS bc
	INNER JOIN tipo_beacon AS tb
	ON bc.cd_tipo_beacon  = tb.cd_tipo_beacon
    INNER JOIN box as b
    ON bc.cd_box = b.cd_box
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
	ON l.cd_local = c.cd_local 
    INNER JOIN tipo_comunicado tc
    ON c.cd_tipo_comunicado = tc.cd_tipo_comunicado
	WHERE c.cd_tipo_comunicado <> 0
    AND now() BETWEEN c.dt_inicio_comunicado AND c.dt_fim_comunicado
	AND l.cd_local = pLocal;
END$$

DROP PROCEDURE IF EXISTS receberPromocoesDirecionadas$$
CREATE PROCEDURE  receberPromocoesDirecionadas(pLocal int, pCliente varchar(100))
BEGIN
			SELECT l.cd_local, l.nm_local , c.cd_comunicado, c.cd_tipo_comunicado, c.ds_comunicado, 
			GROUP_CONCAT(CONCAT(csc.cd_categoria, '-', csc.cd_sub_categoria, '-', sc.nm_sub_categoria)) 
            as subCategorias_preferidas, 
            c.dt_inicio_comunicado, c.dt_fim_comunicado 
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
			WHERE csc.cd_categoria = pc.cd_categoria 
            AND csc.cd_sub_categoria = pc.cd_sub_categoria
			AND pc.nm_email_cliente = pCliente
			/*AND now() BETWEEN c.dt_inicio_comunicado AND c.dt_fim_comunicado
				OR c.dt_fim_comunicado = null*/
            AND now() BETWEEN c.dt_inicio_comunicado AND c.dt_fim_comunicado
			AND c.cd_tipo_comunicado = 0
			AND c.cd_local = pLocal
			GROUP BY c.cd_comunicado;
END$$

DROP PROCEDURE IF EXISTS pegarTodasPromocoesDirecionadasLocal$$
CREATE PROCEDURE pegarTodasPromocoesDirecionadasLocal(pLocal int)
BEGIN
   SELECT l.cd_local, l.nm_local , c.cd_comunicado, c.cd_tipo_comunicado, c.ds_comunicado, 
			GROUP_CONCAT(CONCAT(csc.cd_categoria, '-', csc.cd_sub_categoria)) as subCategorias, 
            c.dt_inicio_comunicado, c.dt_fim_comunicado 
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
			WHERE 
			/*AND now() BETWEEN c.dt_inicio_comunicado AND c.dt_fim_comunicado
				OR c.dt_fim_comunicado = null*/
            now() BETWEEN c.dt_inicio_comunicado AND c.dt_fim_comunicado
			AND c.cd_tipo_comunicado = 0
			AND c.cd_local = pLocal
			GROUP BY c.cd_comunicado;
END$$

DROP PROCEDURE IF EXISTS pegarHistoricoPromocoesLocal$$
CREATE PROCEDURE pegarHistoricoPromocoesLocal(pLocal int, pGeral bool)
BEGIN
   IF (pGeral) THEN
     SELECT * FROM comunicado as c 
	INNER JOIN `local` as l 
	ON l.cd_local = c.cd_local 
    INNER JOIN tipo_comunicado tc
    ON c.cd_tipo_comunicado = tc.cd_tipo_comunicado
	WHERE c.cd_tipo_comunicado <> 0
	AND l.cd_local = pLocal;
   ELSE
     SELECT l.cd_local, l.nm_local , c.cd_comunicado, c.cd_tipo_comunicado, c.ds_comunicado, 
			GROUP_CONCAT(CONCAT(csc.cd_categoria, '-', csc.cd_sub_categoria)) as subCategorias, 
            c.dt_inicio_comunicado, c.dt_fim_comunicado 
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
			WHERE c.cd_tipo_comunicado = 0
			AND c.cd_local = pLocal
			GROUP BY c.cd_comunicado;
	END IF;
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
CREATE PROCEDURE deletarComunicado(pComunicado int, pTipo int)
BEGIN
    IF (pTipo = 0) THEN
	DELETE FROM comunicado_sub_categoria WHERE cd_comunicado = pComunicado;
    END IF;
    DELETE FROM comunicado WHERE cd_comunicado = pComunicado;
END$$

DROP FUNCTION IF EXISTS pesquisarNomeCategoria$$
CREATE FUNCTION pesquisarNomeCategoria(pCategoria int) RETURNS varchar(45)
BEGIN

    DECLARE nomeCategoria varchar(45);
    SELECT nm_categoria INTO @nomeCategoria 
    FROM categoria
    WHERE cd_categoria = pCategoria;

    RETURN nomeCategoria;
END$$

DROP FUNCTION IF EXISTS pesquisarDescricaoCategoria$$
CREATE FUNCTION pesquisarDescricaoCategoria(pCategoria int) RETURNS varchar(200)
BEGIN

    DECLARE descricaoCategoria varchar(200);
    SELECT ds_categoria INTO descricaoCategoria
    FROM categoria
    WHERE cd_categoria = pCategoria;

    RETURN descricaoCategoria;
END$$

DROP FUNCTION IF EXISTS pesquisarNomeSubCategoria$$
CREATE FUNCTION pesquisarNomeSubCategoria(pCategoria int, pSubCategoria int) RETURNS varchar(45)
BEGIN

    DECLARE nomeSubCategoria varchar(45);
    SELECT nm_sub_categoria INTO nomeSubCategoria 
    FROM sub_categoria
    WHERE cd_categoria = pCategoria
    AND cd_sub_categoria = pSubCategoria;

    RETURN nomeSubCategoria;
END$$


DROP PROCEDURE IF EXISTS buscarHorarioAlternativoLocal$$
CREATE PROCEDURE buscarHorarioAlternativoLocal(pLocal int, pDia int)
BEGIN 

/*DECLARE isDiaAlternativo boolean;*/
DECLARE qtLinhasHorarioAlternativoLocal int;

 /*SELECT EXISTS (
    SELECT * FROM horario_local 
    WHERE cd_local = pLocal
    AND cd_dia_semana = pDia
    )
    INTO @isDiaAlternativo;*/

    SELECT count(*) into qtLinhasHorarioAlternativoLocal
    from horario_local
    WHERE cd_local = pLocal
    AND cd_dia_semana = pDia;

   /*IF isDiaAlternativo THEN
     SELECT hr_abertura, hr_fechamento FROM horario_local
     WHERE cd_dia_semana = pDia 
     AND cd_local = pLocal;
   END IF;*/

    IF qtLinhasHorarioAlternativoLocal = 1 then
	 SELECT hr_abertura, hr_fechamento FROM horario_local
     WHERE cd_dia_semana = pDia 
     AND cd_local = pLocal;
    END IF;
END$$

/* Lojista e Administrador */

DROP PROCEDURE IF EXISTS defHorarioShopping$$
CREATE PROCEDURE defHorarioShopping(pDia int, pAbertura time, pFechamento time)
BEGIN
   DELETE FROM horario_shopping
   WHERE cd_dia_semana = pDia
   AND cd_shopping = 0;

   INSERT INTO horario_shopping values (0, pDia, pAbertura, pFechamento);
END$$

DROP PROCEDURE IF EXISTS atualizarShopping$$
CREATE PROCEDURE atualizarShopping(pNome varchar(100), pMensagem TEXT)
BEGIN
  UPDATE shopping 
  SET nm_shopping = pNome,
  ds_mensagem = pMensagem
  WHERE cd_shopping = 0; 
END$$ 

DROP PROCEDURE IF EXISTS checarBeacon$$
CREATE PROCEDURE checarBeacon(pUUID varchar(36))
BEGIN
  SELECT (SELECT COUNT(*) FROM beacon WHERE cd_uuid_beacon = pUUID) as result;
END$$

DROP PROCEDURE IF EXISTS cadastrarBox$$
CREATE PROCEDURE cadastrarBox(pNome varchar(200), pLocal INT, pBeacon varchar(36))
BEGIN
   DECLARE _cd int;

   SELECT count(*) INTO @_cd FROM box;
   INSERT INTO box values (@_cd, pNome, pLocal);
   INSERT INTO beacon values (pBeacon, 0, @_cd);
END$$

DROP PROCEDURE IF EXISTS atualizarBox$$
CREATE PROCEDURE atualizarBox(pBox INT, pNome varchar(200), pLocal INT)
BEGIN
   UPDATE box
   SET nm_box = pNome,
       cd_local = pLocal
   WHERE cd_box = pBox;
END$$

DROP PROCEDURE IF EXISTS deletarBox$$
CREATE PROCEDURE deletarBox(pBox INT)
BEGIN
  DELETE FROM beacon where cd_box = pBox;
  DELETE FROM box WHERE cd_box = pBox; 
END$$

DROP PROCEDURE IF EXISTS cadastrarLocal$$
CREATE PROCEDURE cadastrarLocal(pTipo int, pNome varchar(45), pAndar int(3), pAbertura time , pFechamento time)
BEGIN
	DECLARE _cd int;
    DECLARE qtLinhasTabelaComEsseHorarioDom int;
    DECLARE qtLinhasTabelaComEsseHorarioSeg int;
    DECLARE qtLinhasTabelaComEsseHorarioTer int;
    DECLARE qtLinhasTabelaComEsseHorarioQua int;
    DECLARE qtLinhasTabelaComEsseHorarioQui int;
    DECLARE qtLinhasTabelaComEsseHorarioSex int;
    DECLARE qtLinhasTabelaComEsseHorarioSab int;

	SELECT COUNT(cd_local) INTO @_cd FROM `local`;
	INSERT INTO `local` VALUES (@_cd, pTipo, pNome, pAndar, pAbertura, pFechamento, 1);

    SELECT count(*) into qtLinhasTabelaComEsseHorarioDom
    from horario 
    WHERE cd_dia_semana = 0
    AND hr_abertura = pAbertura
    AND hr_fechamento = pFechamento;

    SELECT count(*) into qtLinhasTabelaComEsseHorarioSeg
    from horario 
    WHERE cd_dia_semana = 1
    AND hr_abertura = pAbertura
    AND hr_fechamento = pFechamento;

     SELECT count(*) into qtLinhasTabelaComEsseHorarioTer
    from horario 
    WHERE cd_dia_semana = 2
    AND hr_abertura = pAbertura
    AND hr_fechamento = pFechamento;

     SELECT count(*) into qtLinhasTabelaComEsseHorarioQua
    from horario 
    WHERE cd_dia_semana = 3
    AND hr_abertura = pAbertura
    AND hr_fechamento = pFechamento;

     SELECT count(*) into qtLinhasTabelaComEsseHorarioQui
    from horario 
    WHERE cd_dia_semana = 4
    AND hr_abertura = pAbertura
    AND hr_fechamento = pFechamento;

     SELECT count(*) into qtLinhasTabelaComEsseHorarioSex
    from horario 
    WHERE cd_dia_semana = 5
    AND hr_abertura = pAbertura
    AND hr_fechamento = pFechamento;

     SELECT count(*) into qtLinhasTabelaComEsseHorarioSab
    from horario 
    WHERE cd_dia_semana = 6
    AND hr_abertura = pAbertura
    AND hr_fechamento = pFechamento;

    IF qtLinhasTabelaComEsseHorarioDom = 0 then
      INSERT INTO horario
     VALUES (0, pAbertura, pFechamento);
   END IF;

   IF qtLinhasTabelaComEsseHorarioSeg = 0 then
      INSERT INTO horario
     VALUES (1, pAbertura, pFechamento);
   END IF;

   IF qtLinhasTabelaComEsseHorarioTer = 0 then
      INSERT INTO horario
     VALUES (2, pAbertura, pFechamento);
   END IF;

   IF qtLinhasTabelaComEsseHorarioQua = 0 then
      INSERT INTO horario
     VALUES (3, pAbertura, pFechamento);
   END IF;

   IF qtLinhasTabelaComEsseHorarioQui = 0 then
      INSERT INTO horario
     VALUES (4, pAbertura, pFechamento);
   END IF;

   IF qtLinhasTabelaComEsseHorarioSex = 0 then
      INSERT INTO horario
     VALUES (5, pAbertura, pFechamento);
   END IF;

   IF qtLinhasTabelaComEsseHorarioSab = 0 then
      INSERT INTO horario
     VALUES (6, pAbertura, pFechamento);
   END IF;

   INSERT INTO horario_local
   VALUES (@_cd, 0, pAbertura, pFechamento);
   INSERT INTO horario_local
   VALUES (@_cd, 1, pAbertura, pFechamento);
   INSERT INTO horario_local
   VALUES (@_cd, 2, pAbertura, pFechamento);
   INSERT INTO horario_local
   VALUES (@_cd, 3, pAbertura, pFechamento);
   INSERT INTO horario_local
   VALUES (@_cd, 4, pAbertura, pFechamento);
   INSERT INTO horario_local
   VALUES (@_cd, 5, pAbertura, pFechamento);
   INSERT INTO horario_local
   VALUES (@_cd, 6, pAbertura, pFechamento);
END$$

DROP PROCEDURE IF EXISTS defHorarioAlternativoLocal$$
CREATE PROCEDURE defHorarioAlternativoLocal(pLocal int, pDia int, pAbertura time, pFechamento time)
BEGIN

  /*DECLARE horarioNaoExiste boolean;*/
  DECLARE qtLinhasTabelaComEsseHorario int;
  /*SELECT NOT EXISTS (
    SELECT 1 from horario 
    WHERE cd_dia_semana = pDia
    AND hr_abertura = pAbertura
    AND hr_fechamento = pFechamento 
    LIMIT 1
    )
    INTO @horarioNaoExiste;*/

    SELECT count(*) into qtLinhasTabelaComEsseHorario
    from horario 
    WHERE cd_dia_semana = pDia
    AND hr_abertura = pAbertura
    AND hr_fechamento = pFechamento;

   /*IF horarioNaoExiste THEN
     INSERT INTO horario
     VALUES (pDia, pAbertura, pFechamento);
   END IF;*/

    IF qtLinhasTabelaComEsseHorario = 0 then
      INSERT INTO horario
     VALUES (pDia, pAbertura, pFechamento);
   END IF;

   DELETE FROM horario_local
   WHERE cd_local = pLocal
   AND cd_dia_semana = pDia;
    
 
   INSERT INTO horario_local
   VALUES (pLocal, pDia, pAbertura, pFechamento);
END$$

DROP PROCEDURE IF EXISTS removerHorarioAlternativoLocal$$
CREATE PROCEDURE removerHorarioAlternativoLocal(pLocal int, pDia int)
BEGIN
   DELETE FROM horario_local
   WHERE cd_local = pLocal
   AND cd_dia_semana = pDia;
END$$

DROP PROCEDURE IF EXISTS defSubCategoriaLocal$$
CREATE PROCEDURE defSubCategoriaLocal(plocal int, pCategoria int, pSubCategoria int)
BEGIN
	INSERT INTO sub_categoria_local VALUES (plocal, pCategoria, pSubCategoria);
END$$

DROP PROCEDURE IF EXISTS removerSubCategoriaLocal$$
CREATE PROCEDURE removerSubCategoriaLocal(plocal int, pCategoria int, pSubCategoria int)
BEGIN
    DELETE FROM sub_categoria_local
    WHERE cd_local = pLocal
    AND cd_categoria = pCategoria
    AND cd_sub_categoria = pSubCategoria;
END$$

DROP PROCEDURE IF EXISTS darAdm$$
CREATE PROCEDURE darAdm(pEmail varchar(100), pCdLocal int)
BEGIN
		UPDATE administrador SET  cd_local = pCdLocal 
		WHERE nm_email_administrador = pEmail;
END$$

DROP PROCEDURE IF EXISTS publicarComunicado$$
CREATE PROCEDURE publicarComunicado(
	pLocal int, pTipo int,
	pDs text, pDataInicio datetime, 
	pDataFim datetime)
BEGIN
		DECLARE 	_cd int;
		SELECT max(cd_comunicado)+1 INTO @_cd FROM comunicado;
	    
		IF (@_cd is NULL) THEN
		 SELECT 0 INTO @_cd;
		END IF;
        /*IF (pDataInicio is null AND pDataFim is null) THEN
		INSERT INTO comunicado VALUES (@_cd, pLocal, pTipo, pDs, now(), null);
        ELSE 
             IF (pDataInicio is null) THEN
             INSERT INTO comunicado VALUES (@_cd, pLocal, pTipo, pDs, now(), pDataFim);
             ELSE
                  IF (pDataFim is null) THEN 
                  INSERT INTO comunicado VALUES (@_cd, pLocal, pTipo, pDs, pDataInicio, null);
                  ELSE
					  INSERT INTO comunicado VALUES (@_cd, pLocal, pTipo, pDs, pDataInicio, pDataFim);
                  END IF;
             END IF;
	    END IF;*/


	INSERT INTO comunicado VALUES (@_cd, pLocal, pTipo, pDs, pDataInicio, pDataFim);
	

END$$

DROP PROCEDURE IF EXISTS relacionarComunicadoSubCategoria$$
CREATE PROCEDURE relacionarComunicadoSubCategoria(pComunicado int,
          pCategoria int, pSubCategoria int)
BEGIN
  INSERT INTO comunicado_sub_categoria VALUES (pComunicado, pCategoria, pSubCategoria);
END$$

DROP PROCEDURE IF EXISTS editarDisponibilidadeLocal$$
CREATE PROCEDURE editarDisponibilidadeLocal(pLocal int)
BEGIN
   DECLARE local_esta_disponivel int;

   SELECT ic_disponivel INTO @local_esta_disponivel FROM `local`
   WHERE cd_local = pLocal;

   IF (@local_esta_disponivel) THEN 
      UPDATE `local` SET ic_disponivel = 0 
      WHERE cd_local = pLocal;
   ELSE
      UPDATE `local` SET ic_disponivel = 1 
      WHERE cd_local = pLocal;
   END IF;
END$$

DROP PROCEDURE IF EXISTS removerSubCategoriaComunicado$$
CREATE PROCEDURE removerSubCategoriaComunicado(pComunicado int,
          pCategoria int, pSubCategoria int)
BEGIN
   DELETE FROM comunicado_sub_categoria
   WHERE cd_comunicado = pComunicado
   AND cd_categoria = pCategoria
   AND cd_sub_categoria = pSubCategoria;
END$$

/* mudei */
DROP PROCEDURE IF EXISTS cadastrarBeacon$$
CREATE PROCEDURE cadastrarBeacon(pUUID varchar(36), pTipo int, pBox int)
BEGIN
	INSERT INTO beacon VALUES (pUUID, pTipo, pBox);
END$$

DROP PROCEDURE IF EXISTS atualizarFeedback$$
CREATE PROCEDURE atualizarFeedback(pFeedback int, pTipo int, pDs text, pQt int(1)) 
BEGIN
	UPDATE feedback 
    SET ds_feedback = pDs,
    qt_estrelas_feedback = pQt
    WHERE cd_tipo_feedback = pTipo
    AND cd_feedback = pFeedback;

END$$

DROP PROCEDURE IF EXISTS FeedbackPorCliente$$
CREATE PROCEDURE FeedbackPorCliente(pEmail varchar(100))
BEGIN
	SELECT f.cd_feedback, f.cd_tipo_feedback, tf.nm_tipo_feedback,
    f.nm_email_cliente, f.ds_feedback, f.dt_feedback, f.qt_estrelas_feedback 
    FROM feedback f
    INNER JOIN tipo_feedback tf
    ON f.cd_tipo_feedback = tf.cd_tipo_feedback
    WHERE nm_email_cliente = pEmail
    ORDER BY cd_tipo_feedback;
END$$

DROP PROCEDURE IF EXISTS acessoFeedbacks$$
CREATE PROCEDURE acessoFeedbacks(pTipo int, dataInicio date , dataFim date, pGeral bool)
BEGIN
	IF pGeral = false THEN
				SELECT tf.cd_tipo_feedback, tf.nm_tipo_feedback, nm_email_cliente, ds_feedback, qt_estrelas_feedback, dt_feedback 
				FROM feedback f
                INNER JOIN tipo_feedback tf
				ON f.cd_tipo_feedback = tf.cd_tipo_feedback
				WHERE dt_feedback BETWEEN  dataInicio AND dataFim
				AND tf.cd_tipo_feedback = pTipo;
	ELSE
				SELECT tf.cd_tipo_feedback, tf.nm_tipo_feedback, nm_email_cliente, ds_feedback, qt_estrelas_feedback,dt_feedback 
                FROM feedback f
                INNER JOIN tipo_feedback tf
				ON f.cd_tipo_feedback = tf.cd_tipo_feedback
				WHERE tf.cd_tipo_feedback = pTipo;
	END IF;
END$$

DROP PROCEDURE IF EXISTS pegarBoxesLocal$$
CREATE PROCEDURE pegarBoxesLocal(pLocal INT)
BEGIN
  SELECT b.cd_box, b.nm_box,
  GROUP_CONCAT(CONCAT(bc.cd_uuid_beacon, '-', bc.cd_tipo_beacon))
  as box_beacons
  FROM box as b
  INNER JOIN beacon as bc
  ON b.cd_box = bc.cd_box
  WHERE b.cd_local = pLocal
  GROUP BY b.cd_box;
END$$

DROP PROCEDURE IF EXISTS pegarLocal$$
CREATE PROCEDURE pegarLocal(pID INT)
BEGIN
	SELECT 
    tl.nm_tipo_local, l.cd_tipo_local, l.cd_local, l.nm_local, l.cd_andar, 
    l.hr_abertura, l.hr_fechamento, l.ic_disponivel,
    GROUP_CONCAT(CONCAT(hl.cd_dia_semana, '-', hl.hr_abertura, '-', hl.hr_fechamento)) 
    as horarios_alternativos
	FROM `local` AS l 
	INNER JOIN tipo_local AS tl
	ON l.cd_tipo_local = tl.cd_tipo_local
    INNER JOIN horario_local as hl
    ON l.cd_local = hl.cd_local
	WHERE l.cd_local = pID 
    GROUP BY l.cd_local;
END$$

DROP PROCEDURE IF EXISTS pegarLocais$$
CREATE PROCEDURE pegarLocais(pTipo INT)
BEGIN
	SELECT l.cd_local, l.cd_tipo_local,
	tl.nm_tipo_local, l.nm_local, 
    l.cd_andar, 
    l.hr_abertura, l.hr_fechamento, l.ic_disponivel,
    GROUP_CONCAT(CONCAT(hl.cd_dia_semana, '-', hl.hr_abertura, '-', hl.hr_fechamento))
    as horarios_alternativos
    FROM `local` AS l 
	INNER JOIN tipo_local AS tl
	ON l.cd_tipo_local = tl.cd_tipo_local
    INNER JOIN horario_local as hl
    ON l.cd_local = hl.cd_local
	WHERE l.cd_tipo_local = pTipo
	GROUP BY l.cd_local;
END$$

DROP PROCEDURE IF EXISTS atualizarLocal$$
CREATE PROCEDURE atualizarLocal(pLocal int, pTipo int, pNome varchar(45), pAndar int(3), pAbertura time, pFechamento time)
BEGIN
	UPDATE  `local`  
    SET cd_tipo_local = pTipo,
    nm_local = pNome,
    cd_andar = pAndar,
    hr_abertura = pAbertura,
    hr_fechamento = pFechamento
	WHERE cd_local = pLocal;
END$$

/* Precisa arrumar - join não funciona */
/*DROP PROCEDURE IF EXISTS deletarLocal$$
CREATE PROCEDURE deletarLocal(pLocal int)
BEGIN
	DELETE FROM sub_categoria_local WHERE cd_local = pLocal;
	DELETE FROM comunicado WHERE cd_local = pLocal;

	DELETE beacon, box FROM beacon as bc
    INNER JOIN box as b 
    ON bc.cd_box = b.cd_box
    WHERE b.cd_local = pLocal;

    UPDATE administrador SET cd_local = null WHERE cd_local = pLocal;
    DELETE FROM horario_local WHERE cd_local = pLocal;
	DELETE FROM `local` WHERE cd_local = pLocal;
END$$*/

/* mudei */
/*DROP PROCEDURE IF EXISTS pegarBeacon$$
CREATE PROCEDURE pegarBeacon(pUUID varchar(36))
BEGIN
	SELECT uuid_beacon, cd_tipo_beacon, cd_local
    FROM beacon as bc
    JOIN box as b
    ON bc.cd_box = b.cd_box
    WHERE cd_uuid_beacon = pUUID;
END$$*/

DROP PROCEDURE IF EXISTS pegarBeaconsDeLocal$$
CREATE PROCEDURE pegarBeaconsDeLocal(pLocal int )
BEGIN
	SELECT bc.cd_uuid_beacon, bc.cd_tipo_beacon, b.cd_local
    FROM box as b
	INNER JOIN beacon as bc 
    ON b.cd_box = bc.cd_box
    WHERE b.cd_local = pLocal;
END$$


DROP PROCEDURE IF EXISTS pegarBeaconsTipo$$
CREATE PROCEDURE pegarBeaconsTipo(pTipo int)
BEGIN
	SELECT bc.cd_uuid_beacon, bc.cd_tipo_beacon, b.cd_local
    FROM box as b
    INNER JOIN beacon as bc
    ON b.cd_box = bc.cd_box
    WHERE bc.cd_tipo_beacon = pTipo;
END$$


DROP PROCEDURE IF EXISTS deletarBeacon$$
CREATE PROCEDURE deletarBeacon(pUUID VARCHAR(36))
BEGIN
	DELETE FROM beacon WHERE cd_uuid_beacon = pUUID;
END$$

DROP PROCEDURE IF EXISTS lojistasLoja$$
CREATE PROCEDURE lojistasLoja(pLocal INT)
BEGIN
	DECLARE count int;
    SELECT count(*) into @count from `local` l 
    inner join administrador adm on l.cd_local = adm.cd_local 
    where adm.cd_local = pLocal;
		
    if (@count > 0) then
		SELECT adm.nm_administrador, adm.nm_email_administrador,
        1 as "ok"
        FROM `local` AS l
		INNER JOIN administrador AS adm ON l.cd_local = adm.cd_local
		WHERE adm.cd_local = pLocal;
    else 
        SELECT 0 as "ok";
    end if;
END$$

DROP PROCEDURE IF EXISTS pegarCategoria$$
CREATE PROCEDURE pegarCategoria(pCategoria INT )
BEGIN
	SELECT * FROM categoria WHERE cd_categoria = pCategoria;
END$$

DROP PROCEDURE IF EXISTS pegarSubCategoria$$
CREATE PROCEDURE pegarSubCategoria (pCategoria INT, pSubCategoria INT)
BEGIN
  SELECT nm_sub_categoria FROM sub_categoria 
  WHERE cd_categoria = pCategoria AND cd_sub_categoria = pSubCategoria;
END$$
/* Atualizada */
DROP PROCEDURE IF EXISTS atualizarCategoria$$
CREATE PROCEDURE atualizarCategoria(pCategoria INT, pNome varchar(45), pDs varchar(200), pEspecial bool)
BEGIN
	UPDATE categoria
    SET nm_categoria = pNome,
        ds_categoria = pDs,
        ic_especial = pEspecial
    WHERE cd_categoria = pCategoria;
END$$

DROP PROCEDURE IF EXISTS removerCategoria$$
CREATE PROCEDURE removerCategoria(pCategoria int)
BEGIN
	DELETE FROM categoria WHERE cd_categoria = pCategoria;
END$$


CREATE PROCEDURE removerSubCategoria(pCategoria int, pSubCategoria int)
BEGIN
   DELETE FROM preferencia_cliente WHERE cd_categoria = pCategoria AND cd_sub_categoria = pSubCategoria;
   DELETE FROM sub_categoria_local WHERE cd_categoria = pCategoria AND cd_sub_categoria = pSubCategoria;
   DELETE FROM comunicado_sub_categoria WHERE cd_categoria = pCategoria AND cd_sub_categoria = pSubCategoria;
   DELETE FROM sub_categoria  WHERE cd_categoria = pCategoria AND cd_sub_categoria = pSubCategoria;
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

DROP PROCEDURE IF EXISTS pegarSubCategoriasCategoria$$
CREATE PROCEDURE pegarSubCategoriasCategoria(pCategoria int)
BEGIN
   SELECT cd_categoria, cd_sub_categoria, nm_sub_categoria FROM sub_categoria
   WHERE cd_categoria = pCategoria;
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
	WHERE csc.cd_comunicado = pComunicado;
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


DROP PROCEDURE IF EXISTS pesquisar$$
CREATE PROCEDURE pesquisar(search varchar(50))
BEGIN

    SELECT 
    l.cd_tipo_local,
	l.cd_local,
	l.nm_local, tl.nm_tipo_local, l.cd_andar,
	l.hr_abertura,
	l.hr_fechamento,
    l.ic_disponivel,
	substring_index(group_concat(DISTINCT ca.nm_categoria SEPARATOR ','), ',', 3) as categorias,
	substring_index(group_concat(DISTINCT sc.nm_sub_categoria SEPARATOR ','), ',', 3) as sub_categorias,
    count(DISTINCT(ca.cd_categoria)) as categoriesCount,
	count(DISTINCT (sc.cd_sub_categoria)) as subCategoriesCount,
    pesquisarNomeCategoria(ca.cd_categoria) as Nome_Categoria,
    pesquisarDescricaoCategoria(ca.cd_categoria) as Descricao_Categoria,
    pesquisarNomeSubCategoria(ca.cd_categoria, sc.cd_sub_categoria) as Nome_SubCategoria
    
	FROM `local` AS l

	JOIN tipo_local AS tl 
	ON l.cd_tipo_local = tl.cd_tipo_local

    JOIN horario_local as hl
    ON l.cd_local = hl.cd_local

	JOIN sub_categoria_local as scl
	ON l.cd_local = scl.cd_local

	JOIN sub_categoria as sc
	ON scl.cd_categoria = sc.cd_categoria AND scl.cd_sub_categoria = sc.cd_sub_categoria
	
	JOIN categoria as ca
	ON sc.cd_categoria = ca.cd_categoria

	WHERE 
	formatString(l.nm_local)    LIKE formatString(concat("%",search,"%"))

	OR
	formatString(ca.nm_categoria) LIKE formatString(concat("%",search,"%"))

    OR 
	formatString(sc.nm_sub_categoria) LIKE formatString(concat("%",search,"%"))

    /*OR
	formatString(ca.nm_categoria) RLIKE formatString(concat("%", search REGEXP '.',"%"))
    AND
	formatString(sc.nm_sub_categoria) RLIKE formatString(concat("%", search RLIKE '.',"%"))*/

	OR
	formatString(tl.nm_tipo_local) LIKE formatString(concat("%", search,"%"))
	OR
	formatString(l.cd_andar) LIKE formatString(concat("%",search,"%"))

    AND l.ic_disponivel = 1
	GROUP BY l.cd_local
    ORDER BY categoriesCount DESC , subCategoriesCount DESC;
END$$



DROP PROCEDURE IF EXISTS pegarComunicados$$
CREATE PROCEDURE pegarComunicados(pLocal int, pGeral bool)
BEGIN
	if(pGeral = true) THEN
		SELECT * FROM comunicado WHERE cd_local = pLocal GROUP BY cd_comunicado;
	ELSE
		SELECT * FROM comunicado WHERE cd_local = pLocal AND 
		curdate() between dt_inicio_comunicado and dt_fim_comunicado
	GROUP BY cd_comunicado;
	END IF;
END$$

DELIMITER ;
SHOW PROCEDURE STATUS WHERE db = "reachup";