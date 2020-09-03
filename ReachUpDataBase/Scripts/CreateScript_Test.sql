/* Table Local */
INSERT INTO local (cd_local, cd_tipo_local, nm_local, cd_andar) VALUES (1, 0, "Renner", 1);
INSERT INTO local (cd_local, cd_tipo_local, nm_local, cd_andar) VALUES (2, 0, "Marabraz", 1);
INSERT INTO local (cd_local, cd_tipo_local, nm_local, cd_andar) VALUES (3, 0, "Boticario", 2);
INSERT INTO local (cd_local, cd_tipo_local, nm_local, cd_andar) VALUES (4, 0, "Marisa", 2);
INSERT INTO local (cd_local, cd_tipo_local, nm_local, cd_andar) VALUES (5, 0, "Subway", 3);
INSERT INTO local (cd_local, cd_tipo_local, nm_local, cd_andar) VALUES (6, 0, "Havan", 3);
INSERT INTO local (cd_local, cd_tipo_local, nm_local, cd_andar) VALUES (7, 0, "Polishop", 4);
INSERT INTO local (cd_local, cd_tipo_local, nm_local, cd_andar) VALUES (8, 0, "Dicico", 4);
INSERT INTO local (cd_local, cd_tipo_local, nm_local, cd_andar) VALUES (9, 0, "Carrefour", 5);
INSERT INTO local (cd_local, cd_tipo_local, nm_local, cd_andar) VALUES (10, 0, "Vivara", 5);
INSERT INTO local (cd_local, cd_tipo_local, nm_local, cd_andar) VALUES (11, 0, "Americanas", 1);
INSERT INTO local (cd_local, cd_tipo_local, nm_local, cd_andar) VALUES (12, 0, "Saraiva", 1);
INSERT INTO local (cd_local, cd_tipo_local, nm_local, cd_andar) VALUES (13, 0, "Netshoes", 2);
INSERT INTO local (cd_local, cd_tipo_local, nm_local, cd_andar) VALUES (14, 0, "Starbucks", 2);
INSERT INTO local (cd_local, cd_tipo_local, nm_local, cd_andar) VALUES (15, 0, "C&A", 3);
INSERT INTO local (cd_local, cd_tipo_local, nm_local, cd_andar) VALUES (16, 0, "Maze", 3);
INSERT INTO local (cd_local, cd_tipo_local, nm_local, cd_andar) VALUES (17, 0, "MC Donalds", 4);
INSERT INTO local (cd_local, cd_tipo_local, nm_local, cd_andar) VALUES (18, 0, "Center Castillo", 4);
INSERT INTO local (cd_local, cd_tipo_local, nm_local, cd_andar) VALUES (19, 0, "Samsung", 5);
INSERT INTO local (cd_local, cd_tipo_local, nm_local, cd_andar) VALUES (20, 0, "Ponto Frio", 5);
INSERT INTO local (cd_local, cd_tipo_local, nm_local, cd_andar) VALUES (21, 1, "Banheiro", 1);
INSERT INTO local (cd_local, cd_tipo_local, nm_local, cd_andar) VALUES (22, 1, "Banheiro2", 2); 
INSERT INTO local (cd_local, cd_tipo_local, nm_local, cd_andar) VALUES (23, 1, "Banheiro3", 3);
INSERT INTO local (cd_local, cd_tipo_local, nm_local, cd_andar) VALUES (24, 1, "Banheiro4", 4);
INSERT INTO local (cd_local, cd_tipo_local, nm_local, cd_andar) VALUES (25, 1, "Banheiro5", 5);
INSERT INTO local (cd_local, cd_tipo_local, nm_local, cd_andar) VALUES (26, 2, "Bebedouro", 1);
INSERT INTO local (cd_local, cd_tipo_local, nm_local, cd_andar) VALUES (27, 2, "Bebedouro2", 2); 
INSERT INTO local (cd_local, cd_tipo_local, nm_local, cd_andar) VALUES (28, 2, "Bebedouro3", 3);
INSERT INTO local (cd_local, cd_tipo_local, nm_local, cd_andar) VALUES (29, 2, "Bebedouro4", 4);
INSERT INTO local (cd_local, cd_tipo_local, nm_local, cd_andar) VALUES (30, 2, "Bebedouro5", 5);
INSERT INTO local (cd_local, cd_tipo_local, nm_local, cd_andar) VALUES (31, 3, "Escada", 1);
INSERT INTO local (cd_local, cd_tipo_local, nm_local, cd_andar) VALUES (32, 3, "Escada2", 1); 
INSERT INTO local (cd_local, cd_tipo_local, nm_local, cd_andar) VALUES (33, 3, "Escada3", 2);
INSERT INTO local (cd_local, cd_tipo_local, nm_local, cd_andar) VALUES (34, 3, "Escada4", 2);
INSERT INTO local (cd_local, cd_tipo_local, nm_local, cd_andar) VALUES (35, 3, "Escada5", 3);
INSERT INTO local (cd_local, cd_tipo_local, nm_local, cd_andar) VALUES (36, 3, "Escada6", 3);
INSERT INTO local (cd_local, cd_tipo_local, nm_local, cd_andar) VALUES (37, 3, "Escada7", 4);
INSERT INTO local (cd_local, cd_tipo_local, nm_local, cd_andar) VALUES (38, 3, "Escada8", 4);
INSERT INTO local (cd_local, cd_tipo_local, nm_local, cd_andar) VALUES (39, 4, "Elevador", 1);
INSERT INTO local (cd_local, cd_tipo_local, nm_local, cd_andar) VALUES (40, 4, "Elevador2", 1); 
INSERT INTO local (cd_local, cd_tipo_local, nm_local, cd_andar) VALUES (41, 4, "Elevador3", 2);
INSERT INTO local (cd_local, cd_tipo_local, nm_local, cd_andar) VALUES (42, 4, "Elevador4", 2);
INSERT INTO local (cd_local, cd_tipo_local, nm_local, cd_andar) VALUES (43, 4, "Elevador5", 3);
INSERT INTO local (cd_local, cd_tipo_local, nm_local, cd_andar) VALUES (44, 4, "Elevador6", 3);
INSERT INTO local (cd_local, cd_tipo_local, nm_local, cd_andar) VALUES (45, 4, "Elevador7", 4);
INSERT INTO local (cd_local, cd_tipo_local, nm_local, cd_andar) VALUES (46, 4, "Elevador8", 4);
INSERT INTO local (cd_local, cd_tipo_local, nm_local, cd_andar) VALUES (47, 5, "Praça", 2);
INSERT INTO local (cd_local, cd_tipo_local, nm_local, cd_andar) VALUES (48, 5, "Praça2", 4);


/* Table Administrador */

/* Administradores */
INSERT INTO administrador (nm_email_administrador, cd_tipo_administrador, cd_local, nm_administrador, nm_senha_administrador)
VALUES ("renanstopa@hotmail.com", 0, null, "Renan Stopa", MD5("123"));
INSERT INTO administrador (nm_email_administrador, cd_tipo_administrador, cd_local, nm_administrador, nm_senha_administrador)
VALUES ("carlosalberto@hotmail.com", 0, null, "Carlos Alberto", MD5("12463"));

/* Lojistas */
INSERT INTO administrador (nm_email_administrador, cd_tipo_administrador, cd_local, nm_administrador, nm_senha_administrador)
VALUES ("richarmelo@hotmail.com", 1, 1, "Richard Souza", MD5("764587"));
INSERT INTO administrador (nm_email_administrador, cd_tipo_administrador, cd_local, nm_administrador, nm_senha_administrador)
VALUES ("beatrizbea@hotmail.com", 1, 2, "Beatriz Santos", MD5("646"));
INSERT INTO administrador (nm_email_administrador, cd_tipo_administrador, cd_local, nm_administrador, nm_senha_administrador)
VALUES ("joaojao@hotmail.com", 1, 3, "João Costa", MD5("31265"));
INSERT INTO administrador (nm_email_administrador, cd_tipo_administrador, cd_local, nm_administrador, nm_senha_administrador)
VALUES ("willzao@hotmail.com", 1, 4, "William Santos", MD5("78789"));
INSERT INTO administrador (nm_email_administrador, cd_tipo_administrador, cd_local, nm_administrador, nm_senha_administrador)
VALUES ("aafonsopint@hotmail.com", 1, 5, "Afonso Pinto", MD5("40089"));
INSERT INTO administrador (nm_email_administrador, cd_tipo_administrador, cd_local, nm_administrador, nm_senha_administrador)
VALUES ("pedronunes@hotmail.com", 1, 6, "Pedro Nunes", MD5("4600"));
INSERT INTO administrador (nm_email_administrador, cd_tipo_administrador, cd_local, nm_administrador, nm_senha_administrador)
VALUES ("tbtcarol@hotmail.com", 1, 7, "Tabatha Carolina", MD5("789"));
INSERT INTO administrador (nm_email_administrador, cd_tipo_administrador, cd_local, nm_administrador, nm_senha_administrador)
VALUES ("lucihang@hotmail.com", 1, 8, "Luciano Hang", MD5("65654"));
INSERT INTO administrador (nm_email_administrador, cd_tipo_administrador, cd_local, nm_administrador, nm_senha_administrador)
VALUES ("adeoliveira@hotmail.com", 1, 9, "Ademario Oliveira", MD5("9783"));
INSERT INTO administrador (nm_email_administrador, cd_tipo_administrador, cd_local, nm_administrador, nm_senha_administrador)
VALUES ("bartomlomeugus@hotmail.com", 1, 10, "Bartolomeu Gusmão", MD5("7489"));
INSERT INTO administrador (nm_email_administrador, cd_tipo_administrador, cd_local, nm_administrador, nm_senha_administrador)
VALUES ("danielveiga@hotmail.com", 1, 11, "Daniel Veiga", MD5("65423"));
INSERT INTO administrador (nm_email_administrador, cd_tipo_administrador, cd_local, nm_administrador, nm_senha_administrador)
VALUES ("lemuelferreira@hotmail.com", 1, 12, "Lemuel Ferreira", MD5("12423"));
INSERT INTO administrador (nm_email_administrador, cd_tipo_administrador, cd_local, nm_administrador, nm_senha_administrador)
VALUES ("luizcarlos@hotmail.com", 1, 13, "Luiz Carlos", MD5("32123"));
INSERT INTO administrador (nm_email_administrador, cd_tipo_administrador, cd_local, nm_administrador, nm_senha_administrador)
VALUES ("mariaedu@hotmail.com", 1, 14, "Maria Eduarda", MD5("65423"));
INSERT INTO administrador (nm_email_administrador, cd_tipo_administrador, cd_local, nm_administrador, nm_senha_administrador)
VALUES ("gabrielsouza@hotmail.com", 1, 15, "Gabriel Souza", MD5("78923"));
INSERT INTO administrador (nm_email_administrador, cd_tipo_administrador, cd_local, nm_administrador, nm_senha_administrador)
VALUES ("marcosvinicius@hotmail.com", 1, 16, "Marcos Vinicius", MD5("64512"));
INSERT INTO administrador (nm_email_administrador, cd_tipo_administrador, cd_local, nm_administrador, nm_senha_administrador)
VALUES ("guilhermeian@hotmail.com", 1, 17, "Guilherme Ian", MD5("46587"));
INSERT INTO administrador (nm_email_administrador, cd_tipo_administrador, cd_local, nm_administrador, nm_senha_administrador)
VALUES ("filipedj@hotmail.com", 1, 18, "Filipe Djrjrjn", MD5("49877"));
INSERT INTO administrador (nm_email_administrador, cd_tipo_administrador, cd_local, nm_administrador, nm_senha_administrador)
VALUES ("cleitonrodri@hotmail.com", 1, 19, "Cleiton Rodriguez", MD5("446587"));
INSERT INTO administrador (nm_email_administrador, cd_tipo_administrador, cd_local, nm_administrador, nm_senha_administrador)
VALUES ("josefa@hotmail.com", 1, 20, "Josefa souza", MD5("75587"));


/* Table Clientes */
INSERT INTO cliente (nm_email_cliente, nm_cliente, nm_senha_cliente)
 VALUES ("mariju@hotmail.com","Maria Julia", MD5("123456"));
INSERT INTO cliente (nm_email_cliente, nm_cliente, nm_senha_cliente)
 VALUES ("anajuulia@hotmail.com","Ana Julia", MD5("1234"));
INSERT INTO cliente (nm_email_cliente, nm_cliente, nm_senha_cliente)
 VALUES ("mariozinho@hotmail.com","Mario Costa", MD5("123457"));
INSERT INTO cliente (nm_email_cliente, nm_cliente, nm_senha_cliente)
 VALUES ("marbispo@hotmail.com","Marcelo Bispo", MD5("123"));
INSERT INTO cliente (nm_email_cliente, nm_cliente, nm_senha_cliente)
 VALUES ("mathiaslulu@hotmail.com","Mathias Lucas", MD5("1423456"));
INSERT INTO cliente (nm_email_cliente, nm_cliente, nm_senha_cliente)
 VALUES ("luluferreira@hotmail.com","Luisa Ferreira", MD5("1234556"));
INSERT INTO cliente (nm_email_cliente, nm_cliente, nm_senha_cliente)
 VALUES ("allefzinho@hotmail.com","Allef Ferreira", MD5("1243456"));
INSERT INTO cliente (nm_email_cliente, nm_cliente, nm_senha_cliente)
 VALUES ("melschel@hotmail.com","Melissa Schell", MD5("123447"));
INSERT INTO cliente (nm_email_cliente, nm_cliente, nm_senha_cliente)
 VALUES ("matinhoos@hotmail.com","Vinicius Maatos", MD5("1234756"));
INSERT INTO cliente (nm_email_cliente, nm_cliente, nm_senha_cliente)
 VALUES ("hilda.dantas@hotmail.com","Hilda Dantas", MD5("12346556"));
INSERT INTO cliente (nm_email_cliente, nm_cliente, nm_senha_cliente)
 VALUES ("cmcarlos@hotmail.com","Carlos Marques", MD5("12357456"));
INSERT INTO cliente (nm_email_cliente, nm_cliente, nm_senha_cliente)
 VALUES ("beccafreitas@hotmail.com","Rebeca Freitas", MD5("123454566"));
INSERT INTO cliente (nm_email_cliente, nm_cliente, nm_senha_cliente)
 VALUES ("danysenalol@hotmail.com","Danyel Sena", MD5("12345746"));
INSERT INTO cliente (nm_email_cliente, nm_cliente, nm_senha_cliente)
 VALUES ("murilomuca@hotmail.com","Murilo Cervi", MD5("123456"));
INSERT INTO cliente (nm_email_cliente, nm_cliente, nm_senha_cliente)
 VALUES ("aurelionsol@hotmail.com","Aurelio Batista", MD5("12355"));
INSERT INTO cliente (nm_email_cliente, nm_cliente, nm_senha_cliente)
 VALUES ("nat556@hotmail.com","Natalia Moreira", MD5("12456"));
INSERT INTO cliente (nm_email_cliente, nm_cliente, nm_senha_cliente)
 VALUES ("cassiobarreira@hotmail.com","Cassio Ramos", MD5("1243456"));
INSERT INTO cliente (nm_email_cliente, nm_cliente, nm_senha_cliente)
 VALUES ("katmonrol@hotmail.com","Katarina Monrol", MD5("1234546"));
INSERT INTO cliente (nm_email_cliente, nm_cliente, nm_senha_cliente)
 VALUES ("thithialto@hotmail.com","Tiago Alcantara", MD5("1456"));
INSERT INTO cliente (nm_email_cliente, nm_cliente, nm_senha_cliente)
 VALUES ("gugumew@hotmail.com","Gustavo Mewko", MD5("5546"));
INSERT INTO cliente (nm_email_cliente, nm_cliente, nm_senha_cliente)
 VALUES ("lalasam@hotmail.com","Larissa Sampaio", MD5("12546"));
INSERT INTO cliente (nm_email_cliente, nm_cliente, nm_senha_cliente)
 VALUES ("gigimendezz@hotmail.com","Giovana Mendes", MD5("12344756"));
INSERT INTO cliente (nm_email_cliente, nm_cliente, nm_senha_cliente)
 VALUES ("dudapalmeiras@hotmail.com","Maria Eduarda", MD5("1237456"));
INSERT INTO cliente (nm_email_cliente, nm_cliente, nm_senha_cliente)
 VALUES ("theutheu@hotmail.com","Matheus Santana", MD5("12345623"));
INSERT INTO cliente (nm_email_cliente, nm_cliente, nm_senha_cliente)
 VALUES ("sarinhah@hotmail.com","Sarah Honorio", MD5("1253456"));
INSERT INTO cliente (nm_email_cliente, nm_cliente, nm_senha_cliente)
 VALUES ("aninha231@hotmail.com","Ana Clara", MD5("12344556"));
INSERT INTO cliente (nm_email_cliente, nm_cliente, nm_senha_cliente)
 VALUES ("eogkuwahara@hotmail.com","Igor Kuwahara", MD5("123456"));
INSERT INTO cliente (nm_email_cliente, nm_cliente, nm_senha_cliente)
 VALUES ("fideliz@hotmail.com","Micaela Macedo", MD5("123123456"));
INSERT INTO cliente (nm_email_cliente, nm_cliente, nm_senha_cliente)
 VALUES ("gutunes@hotmail.com","Gustavo Tunes", MD5("12345326"));
INSERT INTO cliente (nm_email_cliente, nm_cliente, nm_senha_cliente)
 VALUES ("bernadaocamp@hotmail.com","Bernado Campos", MD5("12345643"));
INSERT INTO cliente (nm_email_cliente, nm_cliente, nm_senha_cliente)
 VALUES ("felipetshow@hotmail.com","Filipe Ret", MD5("1234"));
INSERT INTO cliente (nm_email_cliente, nm_cliente, nm_senha_cliente)
 VALUES ("predella@hotmail.com","Gustavo Predella", MD5("12345326"));
INSERT INTO cliente (nm_email_cliente, nm_cliente, nm_senha_cliente)
 VALUES ("bonnerlol@hotmail.com","William Bonner", MD5("12344"));
INSERT INTO cliente (nm_email_cliente, nm_cliente, nm_senha_cliente)
 VALUES ("macortesia@hotmail.com","Matheus Courtesy", MD5("164"));
INSERT INTO cliente (nm_email_cliente, nm_cliente, nm_senha_cliente)
 VALUES ("angelshow@hotmail.com","Angela Vieira", MD5("12345876"));


/* Table Feedback */
INSERT INTO feedback (cd_feedback, cd_tipo_feedback, nm_email_cliente, ds_feedback, dt_feedback, qt_estrelas_feedback)
VALUES (1, 0, "mariju@hotmail.com", "Muito bom! Espero melhorias no atendimento apenas.", '2020-07-27', "4");
INSERT INTO feedback (cd_feedback, cd_tipo_feedback, nm_email_cliente, ds_feedback, dt_feedback, qt_estrelas_feedback)
VALUES (2, 0, "anajuulia@hotmail.com", "Muito ruim! Espero melhorias.", '2020-07-20', "1");
INSERT INTO feedback (cd_feedback, cd_tipo_feedback, nm_email_cliente, ds_feedback, dt_feedback, qt_estrelas_feedback)
VALUES (3, 0, "mariozinho@hotmail.com", "Muito bom!", '2020-07-15', "5");
INSERT INTO feedback (cd_feedback, cd_tipo_feedback, nm_email_cliente, ds_feedback, dt_feedback, qt_estrelas_feedback)
VALUES (4, 0, "marbispo@hotmail.com", "Precisa de melhorias", '2020-07-13', "3");
INSERT INTO feedback (cd_feedback, cd_tipo_feedback, nm_email_cliente, ds_feedback, dt_feedback, qt_estrelas_feedback)
VALUES (5, 0, "marbispo@hotmail.com", "Belos produtos, porém péssimo atendimento", '2020-07-08', "2");
INSERT INTO feedback (cd_feedback, cd_tipo_feedback, nm_email_cliente, ds_feedback, dt_feedback, qt_estrelas_feedback)
VALUES (6, 0, "luluferreira@hotmail.com", "Muito ruim, não recomendo,", '2020-07-08', "1");
INSERT INTO feedback (cd_feedback, cd_tipo_feedback, nm_email_cliente, ds_feedback, dt_feedback, qt_estrelas_feedback)
VALUES (7, 0, "allefzinho@hotmail.com", "Loja perfeita!", '2020-07-02', "5");
INSERT INTO feedback (cd_feedback, cd_tipo_feedback, nm_email_cliente, ds_feedback, dt_feedback, qt_estrelas_feedback)
VALUES (8, 1, "melschel@hotmail.com", "Não estou conseguindo avaliar as lojas!", '2020-07-27', null);
INSERT INTO feedback (cd_feedback, cd_tipo_feedback, nm_email_cliente, ds_feedback, dt_feedback, qt_estrelas_feedback)
VALUES (9, 1, "matinhoos@hotmail.com", "Estou no 2º andar, porém está falando que estou no 1º", '2020-07-24', null);
INSERT INTO feedback (cd_feedback, cd_tipo_feedback, nm_email_cliente, ds_feedback, dt_feedback, qt_estrelas_feedback)
VALUES (11, 1, "hilda.dantas@hotmail.com", "Não consigo pesquisar por lojas", '2020-07-19', null);
INSERT INTO feedback (cd_feedback, cd_tipo_feedback, nm_email_cliente, ds_feedback, dt_feedback, qt_estrelas_feedback)
VALUES (12, 1, "cmcarlos@hotmail.com", "O App tem travado muito", '2020-07-13', null);
INSERT INTO feedback (cd_feedback, cd_tipo_feedback, nm_email_cliente, ds_feedback, dt_feedback, qt_estrelas_feedback)
VALUES (13, 1, "beccafreitas@hotmail.com", "Minhas promoções não estão aparecendo", '2020-07-09', null);
INSERT INTO feedback (cd_feedback, cd_tipo_feedback, nm_email_cliente, ds_feedback, dt_feedback, qt_estrelas_feedback)
VALUES (14, 1, "danysenalol@hotmail.com", "Não consigo dar feedback na loja", '2020-07-05', null);
INSERT INTO feedback (cd_feedback, cd_tipo_feedback, nm_email_cliente, ds_feedback, dt_feedback, qt_estrelas_feedback)
VALUES (15, 2, "murilomuca@hotmail.com", "Starbucks está enviando promoções falsas!", '2020-07-27', null);
INSERT INTO feedback (cd_feedback, cd_tipo_feedback, nm_email_cliente, ds_feedback, dt_feedback, qt_estrelas_feedback)
VALUES (16, 2, "aurelionsol@hotmail.com", "Recebi ofensas gatruitas do dono da Saraiva", '2020-07-25', null);
INSERT INTO feedback (cd_feedback, cd_tipo_feedback, nm_email_cliente, ds_feedback, dt_feedback, qt_estrelas_feedback)
VALUES (17, 2, "nat556@hotmail.com", "Segurança da Americanas foi racista comigo!", '2020-07-20', null);
INSERT INTO feedback (cd_feedback, cd_tipo_feedback, nm_email_cliente, ds_feedback, dt_feedback, qt_estrelas_feedback)
VALUES (18, 2, "cassiobarreira@hotmail.com", "Fui expluso do Ponto Frio por nada!", '2020-07-15', null);
INSERT INTO feedback (cd_feedback, cd_tipo_feedback, nm_email_cliente, ds_feedback, dt_feedback, qt_estrelas_feedback)
VALUES (19, 2, "katmonrol@hotmail.com", "Recebi ofensas gratuitas de um segurança da praça do 4º andar", '2020-07-12', null);
INSERT INTO feedback (cd_feedback, cd_tipo_feedback, nm_email_cliente, ds_feedback, dt_feedback, qt_estrelas_feedback)
VALUES (20, 2, "thithialto@hotmail.com", "Acabei de sofrer racismo na C&A!", '2020-07-06', null);

/* Table Beacon */
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2222", 0, 1);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2223", 0, 2);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2224", 0, 3);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2225", 0, 4);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2226", 0, 5);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2227", 0, 6);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2228", 0, 7);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2229", 0, 8);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2210", 0, 9);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2211", 0, 10);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2212", 0, 11);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2213", 0, 12);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2214", 0, 13);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2215", 0, 14);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2216", 0, 15);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2217", 0, 16);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2218", 0, 17);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2219", 0, 18);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2220", 0, 19);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2221", 0, 20);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2022", 0, 21);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2023", 0, 22);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2024", 0, 23);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2025", 0, 24);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2026", 0, 25);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2027", 0, 26);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2028", 0, 27);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2029", 0, 28);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2230", 0, 29);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2231", 0, 30);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2232", 0, 31);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2233", 0, 32);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2234", 0, 33);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2249", 0, 34);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2235", 0, 35);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2236", 0, 36);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2237", 0, 37);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2238", 0, 38);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2239", 0, 39);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2240", 0, 40);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2241", 0, 41);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2242", 0, 42);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2243", 0, 43);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2244", 0, 44);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2245", 0, 45);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2246", 0, 46);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2247", 0, 47);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2248", 0, 48);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2250", 1,40);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2251", 1,41);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2252", 1, 32);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2253", 1, 23);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2254", 1, 25);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2255", 1, 12);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2256", 1,23);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2257", 1,12);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2258", 1,23);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2259", 1,32);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2260", 1,21);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2261", 1,12);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2262", 1,13);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2263", 1,14);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2264", 1,15);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2265", 2,15);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2266", 2,17);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2267", 2, 18);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2268", 2,19);
INSERT INTO beacon VALUES ("12345678-abcd-88cc-abcd-1111aaaa2269", 2,20);


/* Table Categoria */
INSERT INTO categoria (cd_categoria, nm_categoria, ds_categoria) VALUES (1, "Roupas", "Blusas, calças, tênis, acessórios para o corpo...");
INSERT INTO categoria (cd_categoria, nm_categoria, ds_categoria) VALUES (2, "Produtos para casa", "Eletrodomésticos, móveis, utensílios...");
INSERT INTO categoria (cd_categoria, nm_categoria, ds_categoria) VALUES (3, "Perfumaria", "Perfumes, maquiagens, produtos de beleza...");
INSERT INTO categoria (cd_categoria, nm_categoria, ds_categoria) VALUES (4, "Fast-Food", "Lanches, sorvetes, bebidas...");
INSERT INTO categoria (cd_categoria, nm_categoria, ds_categoria) VALUES (5, "Geral", "Produtos para a casa, roupas, acessorios, etec...");
INSERT INTO categoria (cd_categoria, nm_categoria, ds_categoria) VALUES (6, "Material de contrução", "Materiais para contrução/reforma de sua casa...");
INSERT INTO categoria (cd_categoria, nm_categoria, ds_categoria) VALUES (7, "Alimentos em geral", "Bebidas, frutas, legumes...");
INSERT INTO categoria (cd_categoria, nm_categoria, ds_categoria) VALUES (8, "Acessórios de beleza", "Correntes, brincos, coláres...");
INSERT INTO categoria (cd_categoria, nm_categoria, ds_categoria) VALUES (9, "Livros", "Livros, revistas, quadrinhos...");
INSERT INTO categoria (cd_categoria, nm_categoria, ds_categoria) VALUES (10, "Cafeteria", "Café, lanches leves...");
INSERT INTO categoria (cd_categoria, nm_categoria, ds_categoria) VALUES (11, "Tecnologia", "Jogos, celulares, computadores...");

/* Table Comunicado */
INSERT INTO comunicado (cd_comunicado, cd_local, cd_tipo_comunicado, cd_categoria, ds_comunicado, dt_inicio_comunicado, dt_fim_comunicado)
VALUES (1, 1, 0, 1, "Todas as bermudas da loja saindo por apenas R$$39,90!", '2020-07-27', '2020-07-28');
INSERT INTO comunicado (cd_comunicado, cd_local, cd_tipo_comunicado, cd_categoria, ds_comunicado, dt_inicio_comunicado, dt_fim_comunicado)
VALUES (2, 14, 0, 10, "Todo café expresso no Starbuck está por apenas R$15,00 essa semana!", '2020-07-20', '2020-07-25');
INSERT INTO comunicado (cd_comunicado, cd_local, cd_tipo_comunicado, cd_categoria, ds_comunicado, dt_inicio_comunicado, dt_fim_comunicado)
VALUES (3, 6, 0, 5, "Utensilios de cozinha saindo por apenas R$$70,00!", '2020-07-15', '2020-07-17');
INSERT INTO comunicado (cd_comunicado, cd_local, cd_tipo_comunicado, cd_categoria, ds_comunicado, dt_inicio_comunicado, dt_fim_comunicado)
VALUES (4, 12, 0, 9, "Sessão de livros infantis saindo por apenas R$20,00!", '2020-07-10', '2020-07-20');
INSERT INTO comunicado (cd_comunicado, cd_local, cd_tipo_comunicado, cd_categoria, ds_comunicado, dt_inicio_comunicado, dt_fim_comunicado)
VALUES (5, 12, 0, 9, "Sessão de livros infantis saindo por apenas R$20,00!", '2020-07-10', '2020-07-20');
INSERT INTO comunicado (cd_comunicado, cd_local, cd_tipo_comunicado, cd_categoria, ds_comunicado, dt_inicio_comunicado, dt_fim_comunicado)
VALUES (6, 20, 1, 5, "Ponto Frio irá fechar!", '2020-07-01', '2020-07-31');
INSERT INTO comunicado (cd_comunicado, cd_local, cd_tipo_comunicado, cd_categoria, ds_comunicado, dt_inicio_comunicado, dt_fim_comunicado)
VALUES (7, 17, 1, 4, "MC Donalds também vai ter almoço agora.", '2020-07-01', '2020-07-31');
INSERT INTO comunicado (cd_comunicado, cd_local, cd_tipo_comunicado, cd_categoria, ds_comunicado, dt_inicio_comunicado, dt_fim_comunicado)
VALUES (8, 19, 1, 11, "Lançamento do novo Samsung AJ5000.", '2020-07-01', '2020-07-10');
INSERT INTO comunicado (cd_comunicado, cd_local, cd_tipo_comunicado, cd_categoria, ds_comunicado, dt_inicio_comunicado, dt_fim_comunicado)
VALUES (9, 15, 1, 3, "C&A contratando.", '2020-07-01', '2020-07-31');
INSERT INTO comunicado (cd_comunicado, cd_local, cd_tipo_comunicado, cd_categoria, ds_comunicado, dt_inicio_comunicado, dt_fim_comunicado)
VALUES (10, 10, 2, 8, "Vivara não irá abrir essa semana.", '2020-07-15', '2020-07-21');
INSERT INTO comunicado (cd_comunicado, cd_local, cd_tipo_comunicado, cd_categoria, ds_comunicado, dt_inicio_comunicado, dt_fim_comunicado)
VALUES (11, 3, 2, 4, "Boticario vai fechar.", '2020-07-01', '2020-07-31');
INSERT INTO comunicado (cd_comunicado, cd_local, cd_tipo_comunicado, cd_categoria, ds_comunicado, dt_inicio_comunicado, dt_fim_comunicado)
VALUES (12, 4, 4, 1, "Marisa com o piso molhado!", '2020-07-04', '2020-07-04');
INSERT INTO comunicado (cd_comunicado, cd_local, cd_tipo_comunicado, cd_categoria, ds_comunicado, dt_inicio_comunicado, dt_fim_comunicado)
VALUES (13, 16, 4, 1, "Vidraça quebrada na loja, cuidado!", '2020-07-06', '2020-07-06');

/* Table Categoria_Local */
INSERT INTO categoria_local (cd_local, cd_categoria) VALUES (1,1);
INSERT INTO categoria_local (cd_local, cd_categoria) VALUES (2,2);
INSERT INTO categoria_local (cd_local, cd_categoria) VALUES (3,3);
INSERT INTO categoria_local (cd_local, cd_categoria) VALUES (4,1);
INSERT INTO categoria_local (cd_local, cd_categoria) VALUES (5,4);
INSERT INTO categoria_local (cd_local, cd_categoria) VALUES (6,5);
INSERT INTO categoria_local (cd_local, cd_categoria) VALUES (7,2);
INSERT INTO categoria_local (cd_local, cd_categoria) VALUES (8,6);
INSERT INTO categoria_local (cd_local, cd_categoria) VALUES (9,7);
INSERT INTO categoria_local (cd_local, cd_categoria) VALUES (10,8);
INSERT INTO categoria_local (cd_local, cd_categoria) VALUES (11,5);
INSERT INTO categoria_local (cd_local, cd_categoria) VALUES (12,9);
INSERT INTO categoria_local (cd_local, cd_categoria) VALUES (13,1);
INSERT INTO categoria_local (cd_local, cd_categoria) VALUES (14,10);
INSERT INTO categoria_local (cd_local, cd_categoria) VALUES (15,1);
INSERT INTO categoria_local (cd_local, cd_categoria) VALUES (16,1);
INSERT INTO categoria_local (cd_local, cd_categoria) VALUES (17,4);
INSERT INTO categoria_local (cd_local, cd_categoria) VALUES (18,6);
INSERT INTO categoria_local (cd_local, cd_categoria) VALUES (19,11);
INSERT INTO categoria_local (cd_local, cd_categoria) VALUES (20,5);

/*Table sub_categoria */
INSERT INTO sub_categoria (cd_sub_categoria, cd_categoria, nm_sub_categoria) VALUES (1, 1, "Blusa");
INSERT INTO sub_categoria (cd_sub_categoria, cd_categoria, nm_sub_categoria) VALUES (2, 1, "Camiseta");
INSERT INTO sub_categoria (cd_sub_categoria, cd_categoria, nm_sub_categoria) VALUES (3, 1, "Bermuda");
INSERT INTO sub_categoria (cd_sub_categoria, cd_categoria, nm_sub_categoria) VALUES (4, 1, "Sapato");
INSERT INTO sub_categoria (cd_sub_categoria, cd_categoria, nm_sub_categoria) VALUES (5, 1, "Chinelo");
INSERT INTO sub_categoria (cd_sub_categoria, cd_categoria, nm_sub_categoria) VALUES (6, 2, "Cadeira");
INSERT INTO sub_categoria (cd_sub_categoria, cd_categoria, nm_sub_categoria) VALUES (7, 2, "Geladeira");
INSERT INTO sub_categoria (cd_sub_categoria, cd_categoria, nm_sub_categoria) VALUES (8, 2, "Fogão");
INSERT INTO sub_categoria (cd_sub_categoria, cd_categoria, nm_sub_categoria) VALUES (9, 2, "Televisão");
INSERT INTO sub_categoria (cd_sub_categoria, cd_categoria, nm_sub_categoria) VALUES (10, 2, "Sofá");
INSERT INTO sub_categoria (cd_sub_categoria, cd_categoria, nm_sub_categoria) VALUES (11, 2, "Mesa");
INSERT INTO sub_categoria (cd_sub_categoria, cd_categoria, nm_sub_categoria) VALUES (12, 3, "Perfume");
INSERT INTO sub_categoria (cd_sub_categoria, cd_categoria, nm_sub_categoria) VALUES (13, 3, "Hidratante");
INSERT INTO sub_categoria (cd_sub_categoria, cd_categoria, nm_sub_categoria) VALUES (14, 3, "Maquiagem");
INSERT INTO sub_categoria (cd_sub_categoria, cd_categoria, nm_sub_categoria) VALUES (15, 4, "Lanches");
INSERT INTO sub_categoria (cd_sub_categoria, cd_categoria, nm_sub_categoria) VALUES (16, 4, "Refrigerantes");
INSERT INTO sub_categoria (cd_sub_categoria, cd_categoria, nm_sub_categoria) VALUES (17, 4, "Combos");
INSERT INTO sub_categoria (cd_sub_categoria, cd_categoria, nm_sub_categoria) VALUES (18, 4, "Petiscos");
INSERT INTO sub_categoria (cd_sub_categoria, cd_categoria, nm_sub_categoria) VALUES (19, 5, "Utensilios");
INSERT INTO sub_categoria (cd_sub_categoria, cd_categoria, nm_sub_categoria) VALUES (21, 5, "Talheres");
INSERT INTO sub_categoria (cd_sub_categoria, cd_categoria, nm_sub_categoria) VALUES (22, 5, "Xicaras");
INSERT INTO sub_categoria (cd_sub_categoria, cd_categoria, nm_sub_categoria) VALUES (23, 5, "Fones");
INSERT INTO sub_categoria (cd_sub_categoria, cd_categoria, nm_sub_categoria) VALUES (24, 5, "Barras de chocolate");
INSERT INTO sub_categoria (cd_sub_categoria, cd_categoria, nm_sub_categoria) VALUES (25, 6, "Pisos");
INSERT INTO sub_categoria (cd_sub_categoria, cd_categoria, nm_sub_categoria) VALUES (26, 6, "Portas");
INSERT INTO sub_categoria (cd_sub_categoria, cd_categoria, nm_sub_categoria) VALUES (27, 6, "Janelas");
INSERT INTO sub_categoria (cd_sub_categoria, cd_categoria, nm_sub_categoria) VALUES (28, 6, "Pias");
INSERT INTO sub_categoria (cd_sub_categoria, cd_categoria, nm_sub_categoria) VALUES (29, 7, "Bebidas");
INSERT INTO sub_categoria (cd_sub_categoria, cd_categoria, nm_sub_categoria) VALUES (30, 7, "Frutas");
INSERT INTO sub_categoria (cd_sub_categoria, cd_categoria, nm_sub_categoria) VALUES (31, 7, "Legumes");
INSERT INTO sub_categoria (cd_sub_categoria, cd_categoria, nm_sub_categoria) VALUES (32, 7, "Misturas");
INSERT INTO sub_categoria (cd_sub_categoria, cd_categoria, nm_sub_categoria) VALUES (33, 7, "Temperos");
INSERT INTO sub_categoria (cd_sub_categoria, cd_categoria, nm_sub_categoria) VALUES (34, 7, "Sobremesas");
INSERT INTO sub_categoria (cd_sub_categoria, cd_categoria, nm_sub_categoria) VALUES (35, 8, "Correntes");
INSERT INTO sub_categoria (cd_sub_categoria, cd_categoria, nm_sub_categoria) VALUES (36, 8, "Brincos");
INSERT INTO sub_categoria (cd_sub_categoria, cd_categoria, nm_sub_categoria) VALUES (37, 8, "Colares");
INSERT INTO sub_categoria (cd_sub_categoria, cd_categoria, nm_sub_categoria) VALUES (38, 9, "Livros");
INSERT INTO sub_categoria (cd_sub_categoria, cd_categoria, nm_sub_categoria) VALUES (39, 9, "Revistas");
INSERT INTO sub_categoria (cd_sub_categoria, cd_categoria, nm_sub_categoria) VALUES (40, 9, "Quadrinhos");
INSERT INTO sub_categoria (cd_sub_categoria, cd_categoria, nm_sub_categoria) VALUES (41, 10, "Café");
INSERT INTO sub_categoria (cd_sub_categoria, cd_categoria, nm_sub_categoria) VALUES (42, 10, "Suco");
INSERT INTO sub_categoria (cd_sub_categoria, cd_categoria, nm_sub_categoria) VALUES (43, 10, "Biscoito");
INSERT INTO sub_categoria (cd_sub_categoria, cd_categoria, nm_sub_categoria) VALUES (44, 11, "Calulares");
INSERT INTO sub_categoria (cd_sub_categoria, cd_categoria, nm_sub_categoria) VALUES (45, 11, "Videogames");
INSERT INTO sub_categoria (cd_sub_categoria, cd_categoria, nm_sub_categoria) VALUES (46, 11, "Jogos");
INSERT INTO sub_categoria (cd_sub_categoria, cd_categoria, nm_sub_categoria) VALUES (47, 11, "Perifericos");

/* Table preferencia_cliente */
INSERT INTO preferencia_cliente (nm_email_cliente, cd_sub_categoria, cd_categoria) VALUES ("mariju@hotmail.com", 23, 5);
INSERT INTO preferencia_cliente (nm_email_cliente, cd_sub_categoria, cd_categoria) VALUES ("anajuulia@hotmail.com", 24, 5);
INSERT INTO preferencia_cliente (nm_email_cliente, cd_sub_categoria, cd_categoria) VALUES ("mariozinho@hotmail.com", 38, 9);
INSERT INTO preferencia_cliente (nm_email_cliente, cd_sub_categoria, cd_categoria) VALUES ("marbispo@hotmail.com", 27, 6 );
INSERT INTO preferencia_cliente (nm_email_cliente, cd_sub_categoria, cd_categoria) VALUES ("luluferreira@hotmail.com", 40, 9);
INSERT INTO preferencia_cliente (nm_email_cliente, cd_sub_categoria, cd_categoria) VALUES ("allefzinho@hotmail.com", 40, 9);
INSERT INTO preferencia_cliente (nm_email_cliente, cd_sub_categoria, cd_categoria) VALUES ("melschel@hotmail.com", 38, 9);
INSERT INTO preferencia_cliente (nm_email_cliente, cd_sub_categoria, cd_categoria) VALUES ("matinhoos@hotmail.com", 44, 11);
INSERT INTO preferencia_cliente (nm_email_cliente, cd_sub_categoria, cd_categoria) VALUES ("hilda.dantas@hotmail.com", 29, 7);
INSERT INTO preferencia_cliente (nm_email_cliente, cd_sub_categoria, cd_categoria) VALUES ("cmcarlos@hotmail.com", 44, 11);
INSERT INTO preferencia_cliente (nm_email_cliente, cd_sub_categoria, cd_categoria) VALUES ("beccafreitas@hotmail.com", 17, 4);
INSERT INTO preferencia_cliente (nm_email_cliente, cd_sub_categoria, cd_categoria) VALUES ("danysenalol@hotmail.com", 23, 5);
INSERT INTO preferencia_cliente (nm_email_cliente, cd_sub_categoria, cd_categoria) VALUES ("murilomuca@hotmail.com", 40, 9);
INSERT INTO preferencia_cliente (nm_email_cliente, cd_sub_categoria, cd_categoria) VALUES ("aurelionsol@hotmail.com", 39, 9);
INSERT INTO preferencia_cliente (nm_email_cliente, cd_sub_categoria, cd_categoria) VALUES ("nat556@hotmail.com", 12, 3);
INSERT INTO preferencia_cliente (nm_email_cliente, cd_sub_categoria, cd_categoria) VALUES ("cassiobarreira@hotmail.com", 17, 4);
INSERT INTO preferencia_cliente (nm_email_cliente, cd_sub_categoria, cd_categoria) VALUES ("katmonrol@hotmail.com", 18, 4);
INSERT INTO preferencia_cliente (nm_email_cliente, cd_sub_categoria, cd_categoria) VALUES ("thithialto@hotmail.com", 6, 2);
INSERT INTO preferencia_cliente (nm_email_cliente, cd_sub_categoria, cd_categoria) VALUES ("gugumew@hotmail.com", 13, 3);
INSERT INTO preferencia_cliente (nm_email_cliente, cd_sub_categoria, cd_categoria) VALUES ("lalasam@hotmail.com", 24, 5);
INSERT INTO preferencia_cliente (nm_email_cliente, cd_sub_categoria, cd_categoria) VALUES ("gigimendezz@hotmail.com", 34, 7);
INSERT INTO preferencia_cliente (nm_email_cliente, cd_sub_categoria, cd_categoria) VALUES ("dudapalmeiras@hotmail.com", 41, 10);
INSERT INTO preferencia_cliente (nm_email_cliente, cd_sub_categoria, cd_categoria) VALUES ("theutheu@hotmail.com", 37, 8);
INSERT INTO preferencia_cliente (nm_email_cliente, cd_sub_categoria, cd_categoria) VALUES ("sarinhah@hotmail.com", 44, 11);
INSERT INTO preferencia_cliente (nm_email_cliente, cd_sub_categoria, cd_categoria) VALUES ("aninha231@hotmail.com", 40, 9);
INSERT INTO preferencia_cliente (nm_email_cliente, cd_sub_categoria, cd_categoria) VALUES ("eogkuwahara@hotmail.com",4, 1);
INSERT INTO preferencia_cliente (nm_email_cliente, cd_sub_categoria, cd_categoria) VALUES ("fideliz@hotmail.com", 5, 1);
INSERT INTO preferencia_cliente (nm_email_cliente, cd_sub_categoria, cd_categoria) VALUES ("gutunes@hotmail.com", 33, 7);
INSERT INTO preferencia_cliente (nm_email_cliente, cd_sub_categoria, cd_categoria) VALUES ("bernadaocamp@hotmail.com", 35, 8);
INSERT INTO preferencia_cliente (nm_email_cliente, cd_sub_categoria, cd_categoria) VALUES ("felipetshow@hotmail.com", 36, 8);
INSERT INTO preferencia_cliente (nm_email_cliente, cd_sub_categoria, cd_categoria) VALUES ("predella@hotmail.com", 27, 6);
INSERT INTO preferencia_cliente (nm_email_cliente, cd_sub_categoria, cd_categoria) VALUES ("bonnerlol@hotmail.com", 46, 11);
INSERT INTO preferencia_cliente (nm_email_cliente, cd_sub_categoria, cd_categoria) VALUES ("macortesia@hotmail.com", 46, 11);
INSERT INTO preferencia_cliente (nm_email_cliente, cd_sub_categoria, cd_categoria) VALUES ("angelshow@hotmail.com", 13, 3);