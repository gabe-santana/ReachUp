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
-- Script // Populate                                         --
-- -----------------------------------------------------

/* Nota de desenvolvimento - CUIDADO: Categorias + subcategorias são independentes (não têm ligação alguma) com tipos de local */
/*Todos os locais, independente do tipo, possuem categorias, e não apenas lojas.*/

/* Categorias aplicáveis em lojas (e suas subcategorias) */

CALL cadastrarCategoria("Informática",  'Produtos tecnólogicos de uso geral e específico no mundo da tecnologia da informação');
CALL cadastrarSubCategoria(0, "Hardware");
CALL cadastrarSubCategoria(0, "Software");
CALL cadastrarSubCategoria(0, "Periféricos");

CALL cadastrarCategoria("Jogos","Jogos e semelhantes, ao entretenimento de diversos tipos");
CALL cadastrarSubCategoria(1, "RPG");
CALL cadastrarSubCategoria(1, "Aventura");
CALL cadastrarSubCategoria(1, "Ação");
CALL cadastrarSubCategoria(1, "Mundo aberto");
CALL cadastrarSubCategoria(1, "Tabuleiro");
CALL cadastrarSubCategoria(1, "Cartas");
CALL cadastrarSubCategoria(1, "Infantil");
CALL cadastrarSubCategoria(1, "Para computadores");
CALL cadastrarSubCategoria(1, "Para consoles");

CALL cadastrarCategoria("Eletrônicos","Hardwares e máquinas");

CALL cadastrarCategoria("Eletrodomésticos","Hardwares e máquinas");

CALL cadastrarCategoria("Roupas","Vestimentas gerais");
CALL cadastrarSubCategoria(4, "Calçados");
CALL cadastrarSubCategoria(4, "Blusas, camisas e camisetas");
CALL cadastrarSubCategoria(4, "Calças e bermudas");
CALL cadastrarSubCategoria(4, "Lingerie e roupas íntimas");
CALL cadastrarSubCategoria(4, "Tênis e sapatênis");
CALL cadastrarSubCategoria(4, "Roupas para frio intenso");
CALL cadastrarSubCategoria(4, "Roupas esportivas");
CALL cadastrarSubCategoria(4, "Tênis esportivos");
CALL cadastrarSubCategoria(4, "Roupas de praia");
CALL cadastrarSubCategoria(4, "Acessórios");

CALL cadastrarCategoria("Acessórios","Vestimentas icônicas");

CALL cadastrarCategoria("Categoria 1,99","Produtos de preço acessíveis e com funcionalidades distintas ");

CALL cadastrarCategoria("Alimentação","Alimentação");
CALL cadastrarSubCategoria(7, "Doceria");
CALL cadastrarSubCategoria(7, "Chocolateria");
CALL cadastrarSubCategoria(7, "Bolos e tortas");
CALL cadastrarSubCategoria(7, "Cafés");
CALL cadastrarSubCategoria(7, "Padaria");

CALL cadastrarCategoria("Cultura","Cultura");

CALL cadastrarCategoria("Literatura","Produtos envolvendo entretimento no mundo dos livros");
CALL cadastrarSubCategoria(9, "Livraria");
CALL cadastrarSubCategoria(9, "Comic store");
CALL cadastrarSubCategoria(9, "Mangá Store");

CALL cadastrarCategoria("Hipermercado", "Mercados, hipermercados e quitandas");

CALL cadastrarCategoria("Drogaria", "Farmácias e lojas farmaucêticas");
CALL cadastrarSubCategoria(11, "Farmácia");
CALL cadastrarSubCategoria(11, "Loja de manipulados");

CALL cadastrarCategoria("Casa", "Acessórios para casa");

CALL cadastrarCategoria("Pet-shop", "Lojas para seu querido animalzinho");

/* Categorias aplicáveis em restaurantes */

CALL cadastrarCategoria("Frutos do mar", "Frutos do mar");
CALL cadastrarCategoria("Self-service", "Monte seu prato e pague por kilo");
CALL cadastrarCategoria("Lanchonete", "Lanchonetes... huummm");
CALL cadastrarCategoria("Comida japonesa", "Experimente o incrível sabor da culinária japonesa");
CALL cadastrarCategoria("Pastelaria", "Pastéis.... quero de flango!");
CALL cadastrarCategoria("Fast-food", "Locais perfeitos para você matar sua fome sem perder tempo");
CALL cadastrarCategoria("Churrascaria", "Carnes suculentas... mal-passado, ao ponto ou bem-passado? À sua vontade");
CALL cadastrarCategoria("Casa de massas", "Spaghetti, nhoque, lasanha, ravioli, etc.");
CALL cadastrarCategoria("Pizzaria", "Pizzas quentinhas e deliciosas");
CALL cadastrarCategoria("Esfiharia", "Não tem dinheiro para comer pizza? Então compre esfihas!");

/*Categorias aplicáveis em cinema */

CALL cadastrarCategoria("Cinema", "O local mais amado do shopping!");

/*Categorias aplicáveis em necessidades */

CALL cadastrarCategoria("Banheiro", "Banheiros limpos e confortáveis");
CALL cadastrarCategoria("Berçário", "Berçários para você amamentar ou trocar a fralda do seu bebê");
CALL cadastrarCategoria("Bebedouro", "Bebedouros com água fria, morna ou quente");
CALL cadastrarCategoria("Telefone", "Telefones para você se comunicar com o mundo lá fora");

/*Categorias aplicáveis em escada */

CALL cadastrarCategoria("Escada fixa", "Escadas fixas para sua locomoção entre os andares do shopping");
CALL cadastrarCategoria("Escada rolante", "Escadas rolantes para sua locomoção entre os andares do shopping");

/*Categorias aplicáveis em elevador */

CALL cadastrarCategoria("Elevador", "Elevadores para sua locomoção entre os andares do shopping");

/* Categorias aplicáveis em praça */ 

CALL cadastrarCategoria("Praça de alimentação", "Praças de alimentação, com inúmeros restaurantes e lanchonetes, para você matar sua fome");
CALL cadastrarCategoria("Praça de lazer", "Praças de lazer com Wi-Fi grátis, assentos aconchegantes, fontes e estátuas para você descansar do barulho do shopping ou do seu grande tour de compras");

/* Categorias aplicáveis em serviços */

CALL cadastrarCategoria("Beleza e cuidado pessoal", "Serviços de beleza, higiene e cuidado pessoal; tatuagens; etc");
CALL cadastrarSubCategoria(34, "Salão de beleza");
CALL cadastrarSubCategoria(34, "Pedicure");
CALL cadastrarSubCategoria(34, "Manicure");
CALL cadastrarSubCategoria(34, "SPA");
CALL cadastrarSubCategoria(34, "Salão de tatuagem");

CALL cadastrarCategoria("Medicina", "Serviços médicos");
CALL cadastrarSubCategoria(35, "Clínica Geral");
CALL cadastrarSubCategoria(35, "Odontologia");
CALL cadastrarSubCategoria(35, "Oftalmologia");




CALL cadastrarUsuario("adm@email.com", "Administrator", "123", "adm", null);

CALL cadastrarUsuario("Carlos@email.com", "Carlos Roberto", "1234", "loj", null);
CALL cadastrarUsuario("Bianca@email.com", "Bianca Silva", "12345", "loj", null);
CALL cadastrarUsuario("Ricardo@email.com", "Ricardo Gumões", "123456", "loj", null);
CALL cadastrarUsuario("Pablo@email.com", "Pablo Gonçalves", "1234567", "loj", null);
CALL cadastrarUsuario("Gabriel@email.com", "Gabriel Santana", "12345678", "loj", null);
CALL cadastrarUsuario("Viera@email.com", "Viera", "12365", "loj", null);
CALL cadastrarUsuario("Morangues@email.com", "Morangues", "1237456", "loj", null);
CALL cadastrarUsuario("Eduardo@email.com", "Eduardo Carlos", "152543", "loj", null);
CALL cadastrarUsuario("Fernadno@email.com", "Fernando Marcos", "15623", "loj", null);
CALL cadastrarUsuario("FernandoOliveira@email.com", "Fernando Oliveira", "1523", "loj", null);
CALL cadastrarUsuario("JoseSilva@gmail.com", "José Silva", "125463", "loj", null);
CALL cadastrarUsuario("JoaoSilvino@gmail.com", "João Silvino", "125463", "loj", null);
CALL cadastrarUsuario("Roberta@email.com", "Roberta Lima", "125463", "loj", null);
CALL cadastrarUsuario("anaMoreno@email.com", "Ana Moreno", "125463", "loj", null);
CALL cadastrarUsuario("FrancieleReis@email.com", "Franciele Reis", "125463", "loj", null);
CALL cadastrarUsuario("eduardoBatista@email.com", "Eduardo Batista", "125463", "loj", null);
CALL cadastrarUsuario("silvana123@email.com", "Silvana", "125463", "loj", null);
CALL cadastrarUsuario("rodrigoMatiasGomes@email.com", "Rodrigo Matias Gomes", "125463", "loj", null);
CALL cadastrarUsuario("evelyn@email.com", "Evelyn", "125463", "loj", null);
CALL cadastrarUsuario("yanFasto@email.com", "Yan Fausto", "125463", "loj", null);
CALL cadastrarUsuario("deboraconceicaodasilva@email.com", "Débora Conceição da Silva", "125463", "loj", null);
CALL cadastrarUsuario("fabiolimapedefava@email.com", "Fábio Lima", "125463", "loj", null);
CALL cadastrarUsuario("rodney@email.com", "Rodney", "125463", "loj", null);
CALL cadastrarUsuario("damasioPereira@email.com", "Damásio Pereira", "125463", "loj", null);
CALL cadastrarUsuario("faustosilva@email.com", "Fausto Silva", "125463", "loj", null);
CALL cadastrarUsuario("baratamatias@email.com", "Barata Matias", "125463", "loj", null);
CALL cadastrarUsuario("diobrando@email.com", "Dio Brando", "125463", "loj", null);
CALL cadastrarUsuario("johannsebastian@email.com", "Johann Sebastian", "125463", "loj", null);
CALL cadastrarUsuario("cucabeludo@email.com", "Cuca Beludo", "125463", "loj", null);
CALL cadastrarUsuario("vitaoamado@email.com", "Vitão Amado", "125463", "loj", null);
CALL cadastrarUsuario("antonetemoura@email.com", "Antonete Moura", "125463", "loj", null);
CALL cadastrarUsuario("aurorabraz@email.com", "Aurora Braz Passos de Oliveira Lima", "125463", "loj", null);
CALL cadastrarUsuario("emanuellydamasco@email.com", "Emanuelly Damasco", "125463", "loj", null);
CALL cadastrarUsuario("stelladomingues@email.com", "Stella Domingues", "125463", "loj", null);
CALL cadastrarUsuario("fredericoespada@email.com", "Frederico Espada", "125463", "loj", null);
CALL cadastrarUsuario("daniloconceicaobenedito@email.com", "Danilo Conceição Benedito", "125463", "loj", null);
CALL cadastrarUsuario("adampark@email.com", "Adam Park", "125463", "loj", null);
CALL cadastrarUsuario("felipefilho@email.com", "Felipe Filho", "125463", "loj", null);
CALL cadastrarUsuario("BenjaminLola@email.com", "Benjamin Lola", "125463", "loj", null);
CALL cadastrarUsuario("helderinacio@email.com", "Helder Inácio", "125463", "loj", null);
CALL cadastrarUsuario("zanderrodrigues@email.com", "Zander Rodrigues", "125463", "loj", null);
CALL cadastrarUsuario("adamsandler@email.com", "Adam Sandler", "125463", "loj", null);

CALL cadastrarUsuario("jonathanjoestar@email.com", "Jonathan Joestar", "125463", "cli", null);
CALL cadastrarUsuario("josephjoestar@email.com", "Joseph Joestar", "125463", "cli", null);
CALL cadastrarUsuario("jotarokujo@email.com", "Jotaro Kujo", "125463", "cli", null);
CALL cadastrarUsuario("josukehigashikata@email.com", "Josuke Higashikata", "125463", "cli", null);
CALL cadastrarUsuario("giornogiovanna@email.com", "Giorno Giovanna", "125463", "cli", null);
CALL cadastrarUsuario("jolynecujoh@email.com", "Jolyne Cujoh", "125463", "cli", null);

CALL cadastrarUsuario("email@email.com", "Pedro Ian Brito da Silva", "125463", "cli", null);

CALL cadastrarUsuario("jessicafonseca@email.com", "Jéssica Fonseca", "125463", "cli", null);
CALL cadastrarUsuario("guilhermedjrdjrjan@email.com", "Guilherme Djrdjrjan", "125463", "cli", null);
CALL cadastrarUsuario("fabianacruz@email.com", "Fabiana Cruz", "125463", "cli", null);
CALL cadastrarUsuario("reginaweber@email.com", "Regina Weber", "125463", "cli", null);
CALL cadastrarUsuario("thiagoklein@email.com", "Thiago Klein", "125463", "cli", null);
CALL cadastrarUsuario("doloresfuertesdabarriga@email.com", "Dolores Fuertes da Barriga", "125463", "cli", null);
CALL cadastrarUsuario("inocenciogoes@email.com", "Inocêncio Goes", "125463", "cli", null);
CALL cadastrarUsuario("leandrokarmal@email.com", "Leandro Karmal", "125463", "cli", null);

CALL criarFeedback(5, "jonathanjoestar@email.com", "Os corredores são bem espaçosos, mas em alguns pontos não há piso tátil.", 3);
CALL criarFeedback(6, "jonathanjoestar@email.com", "Os corredores entre as mesas são muito apertados, eu sempre acabo esbarrando em algumas.", 2);
CALL criarFeedback(8, "jonathanjoestar@email.com", "A praça de lazer no último andar é muito aconchegante e acessível, gostei", 5);
CALL criarFeedback(7, "jessicafonseca@email.com", "O restaurante Pé de Fava é muito ruim para se locomover.", 1);
CALL criarFeedback(7, "jessicafonseca@email.com", "A Cafeteria Plaza está de parabéns! O garçom me atendeu super bem, atencioso, e consegui caminhar pelo local sem nenhum problema", 5);
CALL criarFeedback(4, "thiagoklein@email.com", "O piso tátil da Besni está muito esburacado, e algumas partes faltam no meio do caminho, acabo me perdendo.", 2);
CALL criarFeedback(4, "reginaweber@email.com", "A Samsung está de parabéns! Amo seus celulares, e a loja é muito acessível!", 2);
CALL criarFeedback(3, "leandrokarmal@email.com", "Os elevadores são bem acessíveis, parabéns!", 4);
CALL criarFeedback(1, "leandrokarmal@email.com", "Os degraus que vão do segundo ao terceiro andar são muito altos, eu quase caí uma vez!", 1);
CALL criarFeedback(1, "leandrokarmal@email.com", "Alguns locais de transição entre escadas fixas têm piso tátil, mas outros não. Essa falta de padronização incomoda, quando eu esperava continuar com piso tátil, eles sumiram do nada.", 2);
CALL criarFeedback(2, "inocenciogoes@email.com", "Poderia haver uma sinalização, sonora ou tátil, que indicasse que o fim da escada rolante está perto.", 2);

CALL criarFeedback(0, "giornogiovanna@email.com", "Os banheiros são bem iluminados, o que é bem importante pra uma pessoa como eu, que tem baixa visão.", 5);
CALL criarFeedback(0, "fabianacruz@email.com", "As cabines dos banheiros são apertadas, e eles não têm piso tátil. Isso é um absurdo.", 1);



CALL cadastrarLocal(2, "Livraria Praiamar Shopping ",  0,  '09:25:00', '19:35:00', "77ab0e0c-f928-11ea-eee1-0242ac120002");
CALL cadastrarLocal(2, "Livraria Saraiva",  3, '10:00:00', '19:59:59',"adeafe8a-f928-11ea-adc1-0242ac120002");
CALL cadastrarLocal(2, "Livraria Cultura",  2, '11:00:00', '18:59:59',"7beafe8a-f928-11ea-adc1-0242ac120002");
CALL cadastrarLocal(2, "Livraria Nobel",  1, '10:00:00', '17:59:59',"7deace8a-f928-11ea-adc1-0242ac120002");
CALL cadastrarLocal(2, "Livraria Martins Fontes",  1, '10:00:00', '22:59:59',"fdeafe8a-f928-11ea-adc1-0242ac120002");

	
CALL cadastrarLocal(0, "Lojas Americanas",  0, '09:00:00', '22:30:00', "7deaf908-f928-11ea-adc1-0242ac120002");


CALL cadastrarLocal(0, "Rihappy",  2, '08:35:00', '22:00:00', "7deafb92-f928-11ea-adc1-0242ac120002");



CALL cadastrarLocal(0, "Samsung",  1, '09:45:00', '23:00:00', "7deafd68-f928-11ea-adc1-0242ac120002");


CALL cadastrarLocal(0, "MM Santos",  0, '08:00:00', '23:30:00', "7deaff8e-f928-11ea-adc1-0242ac120002");


CALL cadastrarLocal(0, "Life's Good LG",  0, '09:25:00', '19:35:00', "7deb1582-f928-11ea-adc1-0242ac120002");


CALL cadastrarLocal(0, "Shoulder",  1, '09:25:00', '19:35:00', "7deb1582-f928-11ea-adc1-0242ac12000a");
CALL cadastrarLocal(0, "Havaianas",  0, '09:25:00', '19:35:00', "7deb1582-f928-11ea-adc1-0242ac1200a2");
CALL cadastrarLocal(0, "Carmen Steffens",  0, '09:25:00', '19:35:00', "7deb1582-f928-11ea-adc1-0242aa120002");
CALL cadastrarLocal(0, "Sthill",  0, '09:25:00', '19:35:00', "7deb1582-f928-11ea-adc1-0242ac1a0002");
CALL cadastrarLocal(0, "SPOT",  0, '09:25:00', '19:35:00', "7deb1582-f928-11ea-adc1-024bac120002");
CALL cadastrarLocal(0, "Mahogany",  0, '09:25:00', '19:35:00', "7deb1582-f928-11ea-adca-0242ac120002");
CALL cadastrarLocal(0, "Program Moda",  0, '09:25:00', '19:35:00', "7deb1582-f928-a1ea-adc1-0242ac120002");
CALL cadastrarLocal(0, "Belliótica",  0, '09:25:00', '19:35:00', "7deb1582-f928-11aa-adc1-0242ac120002");
CALL cadastrarLocal(0, "Mão Única",  0, '09:25:00', '19:35:00', "7deb1582-fa28-11ea-adc1-0242ac120002");
CALL cadastrarLocal(0, "Pontal",  0, '09:25:00', '19:35:00', "7deb1592-fab8-11ea-adc1-0242ac120002");
CALL cadastrarLocal(0, "Stilleto",  0, '09:25:00', '19:35:00', "7deb15a2-f928-11ea-adc1-0242ac120002");
CALL cadastrarLocal(0, "Clube Melissa",  0, '09:25:00', '19:35:00', "adeb1582-f928-11ea-adc1-0242ac120002");
CALL cadastrarLocal(0, "Hawaii Surf Point",  0, '09:25:00', '19:35:00', "7ceb1582-f928-11ea-adc1-0242ac120002");
CALL cadastrarLocal(0, "RetrôMania",  0, '09:25:00', '19:35:00', "7deb1582-fc28-11ea-adc1-0242ac120002");
CALL cadastrarLocal(0, "Reserva",  0, '09:25:00', '19:35:00', "7deb1582-f92c-11ea-adc1-0242ac120002");
CALL cadastrarLocal(0, "Polo Play",  0, '09:25:00', '19:35:00', "7debf58a-fc28-11ea-adc1-0242ac120002");
CALL cadastrarLocal(0, "Maybelline NY",  0, '09:25:00', '19:35:00', "7dcb1582-f928-11ea-adc1-0242ac120002");
CALL cadastrarLocal(0, "Arezzo",  0, '09:25:00', '19:35:00', "7deb1582-f928-11ea-adc1-1242ac120002");
CALL cadastrarLocal(0, "Authentic Feet",  0, '09:25:00', '19:35:00', "7deb1582-f928-11ea-2dc1-0242ac120002");
CALL cadastrarLocal(0, "Tennis Station",  0, '09:25:00', '19:35:00', "7deb1582-f928-11ea-a3c1-0242ac120002");
CALL cadastrarLocal(0, "Piticas",  0, '09:25:00', '19:35:00', "7deb1582-f928-11ea-adc1-02424c160002");
CALL cadastrarLocal(0, "Casa das Cuecas",  0, '09:25:00', '19:35:00', "7deb1582-f928-11ea-5dc1-0262ac120002");
CALL cadastrarLocal(0, "Puket",  0, '09:25:00', '19:35:00', "7deb1582-f928-11ea-adc1-0242ac1c0a02");
CALL cadastrarLocal(0, "Brooksfield",  0, '09:25:00', '19:35:00', "7deb1582-f928-11ea-adc1-024dac120002");
CALL cadastrarLocal(0, "Sapataria do Futuro",  0, '09:25:00', '19:35:00', "7deb1582-f928-11ea-fdc1-0242ac120002");
CALL cadastrarLocal(0, "Coisas da Casa",  0, '09:25:00', '19:35:00', "7deb1582-fe28-11ea-adc1-0242ac120002");
CALL cadastrarLocal(0, "Simplesmente Bárbara",  0, '09:25:00', '19:35:00', "7deb1582-f928-11ef-adc1-0242ac120002");
CALL cadastrarLocal(0, "Fast Shop",  0, '09:25:00', '19:35:00', "7deb1582-19e8-11ea-adc1-0242ac120002");
CALL cadastrarLocal(0, "A Esportiva",  0, '09:25:00', '19:35:00', "1deb1582-f928-11ea-adc1-0242ac120002");
CALL cadastrarLocal(0, "Cacau Show",  0, '09:25:00', '19:35:00', "2deb1582-f928-11ea-adc1-0242ac120002");
CALL cadastrarLocal(0, "LOFT",  0, '09:25:00', '19:35:00', "3deb1582-f928-11ea-adc1-0242ac120002");
CALL cadastrarLocal(0, "Relicário",  0, '09:25:00', '19:35:00', "4deb1582-f928-11ea-adc1-0242ac120002");
CALL cadastrarLocal(0, "Andisport Futebol",  0, '09:25:00', '19:35:00', "5deb1582-f928-11ea-adc1-0242ac120002");
CALL cadastrarLocal(0, "Le Postiche",  0, '09:25:00', '19:35:00', "6deb1582-f928-11ea-adc1-0242ac120002");
CALL cadastrarLocal(0, "Crocs",  0, '09:25:00', '19:35:00', "afeb1582-f928-11ea-adc1-0242ac120002");
CALL cadastrarLocal(0, "Criatiff",  0, '09:25:00', '19:35:00', "faeb1582-f928-11ea-adc1-0242ac120002");
CALL cadastrarLocal(0, "Bluebeach",  0, '09:25:00', '19:35:00', "afeb1513-f928-11ea-adc1-0242ac120002");
CALL cadastrarLocal(0, "SIDE WALK",  0, '09:25:00', '19:35:00', "bdeb1582-f928-11ea-adc1-0242ac120002");
CALL cadastrarLocal(0, "Usaflex",  0, '09:25:00', '19:35:00', "cdeb1582-f928-11ea-adc1-0242ac120002");
CALL cadastrarLocal(0, "Beautybox",  0, '09:25:00', '19:35:00', "ddeb1582-f928-11ea-adc1-0242ac120002");
CALL cadastrarLocal(0, "Kyowa",  0, '09:25:00', '19:35:00', "edeb1582-f928-11ea-adc1-0242ac120002");
CALL cadastrarLocal(0, "Chilli Beans",  0, '09:25:00', '19:35:00', "fdeb1582-f928-11ea-adc1-0242ac120002");
CALL cadastrarLocal(0, "Adcos",  0, '09:25:00', '19:35:00', "456a1582-f928-11ea-adc1-0242ac120002");
CALL cadastrarLocal(0, "PUC",  0, '09:25:00', '19:35:00', "7deba5ff-f928-11ea-adc1-0242ac120002");
CALL cadastrarLocal(0, "M&M Santos",  0, '09:25:00', '19:35:00', "7ffabc82-f928-11ea-adc1-0242ac120002");
CALL cadastrarLocal(0, "Maze",  0, '09:25:00', '19:35:00', "7deb1581-aaf8-11ea-adc1-0242ac120002");
CALL cadastrarLocal(12, "Estúdio de Sombrancelha",  0, '09:25:00', '19:35:00', "faeb1582-f928-11ea-adc1-0242ac120005");
CALL cadastrarLocal(0, "Quem disse, Berenice?",  0, '09:25:00', '19:35:00', "7deb1582-f928-11ea-adc1-0242ac120004");
CALL cadastrarLocal(12, "AngioCorpore",  0, '09:25:00', '19:35:00', "7deb1582-f928-11ea-adc1-0242ac120003");
CALL cadastrarLocal(0, "O'Clus Personal Ótica",  0, '09:25:00', '19:35:00', "7deb1582-f928-11ea-adc1-0242ac1200a0");
CALL cadastrarLocal(0, "Fabiana Zaitun",  0, '09:25:00', '19:35:00', "7deb1582-f928-11ea-adc1-0242ac1200b0");
CALL cadastrarLocal(12, "Doctor Feet",  0, '09:25:00', '19:35:00', "7deb1582-f928-11ea-adc1-0242ac120ba2");
CALL cadastrarLocal(0, "Nutty Bavarian",  0, '09:25:00', '19:35:00', "7deb1582-f928-11ea-adc1-0242ac12af04");
CALL cadastrarLocal(0, "L'Occitane en Provence",  0, '09:25:00', '19:35:00', "7deb1582-f928-11ea-adc1-0242ac1e0002");
CALL cadastrarLocal(0, "Planet Girls",  0, '09:25:00', '19:35:00', "7deb1582-f928-11ea-adc1-0242ac150ab2");
CALL cadastrarLocal(0, "Kopenhagen",  0, '09:25:00', '19:35:00', "7deb1582-f928-11ea-adc1-0242ac140202");
CALL cadastrarLocal(0, "Mr. CAT",  0, '09:25:00', '19:35:00', "7deb1582-f928-11ea-adc1-0242ac120ffa");
CALL cadastrarLocal(0, "Club Pitanga",  0, '09:25:00', '19:35:00', "7deb1582-f928-11ea-adc1-0242ac177002");
CALL cadastrarLocal(0, "Mega Body Store",  0, '09:25:00', '19:35:00', "7deb1582-f928-11ea-adc1-0242ac120077");
CALL cadastrarLocal(0, "Regalo's",  0, '09:25:00', '19:35:00', "7deb1582-f928-11ea-adc1-0242ac12077a");
CALL cadastrarLocal(0, "Relojoaria Zenith",  0, '09:25:00', '19:35:00', "7deb1582-f928-11ea-adc1-0242ba120502");
CALL cadastrarLocal(0, "John John",  0, '09:25:00', '19:35:00', "7deb1582-f928-11ea-adc1-0242ac1200ff");
CALL cadastrarLocal(0, "Cia Marítima",  0, '09:25:00', '19:35:00', "7deb1582-f928-11ea-adc1-0242ac12a002");


CALL cadastrarLocal(12, "Claro",  0, '09:25:00', '19:35:00', "7deb00e2-f928-11ea-adc1-0242ac120002");
CALL cadastrarLocal(12, "Vivo",  1, '12:15:00', '20:45:00', "7deb022c-f928-11ea-adc1-0242ac120002");
CALL cadastrarLocal(12, "Oi",  2, '08:00:00', '23:30:00', "7deb033a-f928-11ea-adc1-0242ac120002");
CALL cadastrarLocal(12, "Nextel",  2, '08:00:00', '23:30:00', "7deb033a-f928-11ea-adc1-ffa2ac120002");

CALL cadastrarLocal(0, "Chocolatey",  0, '10:00:00', '23:59:59', "7deb16ae-f928-11ea-adc1-0242ac120002");


CALL cadastrarLocal(1, "McDonald's Sorveteria",  0, '09:25:00', '19:35:00', "7deb06be-f928-11ea-adc1-0242ac120002");

CALL cadastrarLocal(12, "Banco Caixa",  0, '09:00:00', '22:30:00', "7deb1442-f928-11ea-adc1-0242ac120002");
CALL cadastrarLocal(12, "Banco Itaú",  0,  '09:25:00', '19:35:00', "7deb132a-f928-11ea-adc1-0242ac120002");
CALL cadastrarLocal(12, "Banco do Brasil",  1,  '11:00:00', '21:30:00', "ab7b132a-f928-11ea-adc1-0242ac120002");
CALL cadastrarLocal(12, "Banco Pan",  1,  '09:25:00', '21:00:00', "7deb132a-f928-1e77-adc1-0242ac120002");
CALL cadastrarLocal(12, "Lotérica Praiamar Shopping",  0,  '09:25:00', '18:00:00', "ac7b132a-f928-11ea-adc1-0242ac120002");

CALL cadastrarLocal(1, "Cafeteria Praiamar Shopping ",  0,  '09:25:00', '19:35:00', "7deb1244-f928-11ea-adc1-0242ac120002");
CALL cadastrarLocal(1, "Padaria Praiamar Shopping ",  0,  '09:25:00', '19:35:00', "7deb1104-f928-11ea-adc1-0242ac120002");

CALL cadastrarLocal(4, "Carrefour ",  0,  '08:25:00', '19:35:00', "7deb0fb0-f928-11ea-adc1-0242ac120002");

CALL cadastrarLocal(2, "Livraria Praiamar Shopping ",  0,  '09:25:00', '19:35:00', "7deb0e0c-f928-11ea-adc1-0242ac120002");

CALL cadastrarLocal(6, "Banheiro Praiamar Shopping | Térreo ",  0,  '08:00:00', '23:59:59', "7deb0cfe-f928-11ea-adc1-0242ac120002");
CALL cadastrarLocal(7, "Bebedouro Praiamar Shopping | Térreo ",  0,  '09:25:00', '19:35:00', "7deb0ba0-f928-11ea-adc1-0242ac120002");
CALL cadastrarLocal(8, "Escada Fixa Praiamar Shopping | Térreo ",  0,  '08:00:00', '23:59:59', "7deb0cf1-a928-11ea-adc1-0242ac120002");
CALL cadastrarLocal(9, "Escada Rolante Praiamar Shopping | Térreo ",  0,  '09:25:00', '19:35:00', "7deb0ba1-a928-11ea-adc1-0242ac120002");
CALL cadastrarLocal(10, "Elevador Praiamar Shopping | Térreo ",  0,  '09:25:00', '19:35:00', "7deb0ba0-f921-a1ea-adc1-0242ac120002");

CALL cadastrarLocal(0, "Adidas ",  1,  '09:25:00', '19:35:00', "7deb0bd0-f928-11ea-adc1-0242ac120092");


CALL cadastrarLocal(12, "Agaxtur Viagens ",  1,  '09:25:00', '20:35:00', "7deb0bd0-f9d8-11ea-adc1-0242ac120092");

CALL cadastrarLocal(0, "Apple ",  1,  '09:25:00', '23:35:00', "7daa0bd0-f9d8-11ea-adc1-0242ac121092");


CALL cadastrarLocal(12, "Barbearia  Corleone",  1,  '09:25:00', '23:35:00', "9daa0bd0-f9d8-11ea-adc1-0242ac121092");

CALL cadastrarLocal(0, "Bayard Esportes",  1,  '09:25:00', '23:35:00', "9daa0bd0-a9d8-11ea-adc1-0242ac121092");


CALL cadastrarLocal(0, "Bel Cosméticos",  1,  '08:00:00', '23:35:00', "9dca0bd0-a9d8-11ea-adc1-0242ac121092");


CALL cadastrarLocal(0, "Bibi Calçados",  1,  '09:00:00', '23:35:00', "9ffa0bd0-a9d8-11ea-adc1-0242ac121092");

CALL cadastrarLocal(1, "Biscoitê",  1,  '09:00:00', '23:35:00', "9ffacad0-a1d8-11ea-adc1-0242bc121092");

CALL cadastrarLocal(0, "Riachuelo",  1,  '09:00:00', '23:35:00', "9ffacad0-a1d8-19ea-adc1-0242bc121092");

CALL cadastrarLocal(0, "Marisa",  1,  '09:00:00', '23:35:00', "9ffacad0-a1d8-1bea-adc1-0a42bc121092");

CALL cadastrarLocal(0, "Renner",  1,  '09:30:00', '23:35:00', "9ffacad0-a1d8-1bea-adc1-0a42cd121092");

CALL cadastrarLocal(5, "Drogasil",  1,  '09:30:00', '23:35:00', "9ffacad0-a1d8-1bea-adc1-0a4aad121092");
CALL cadastrarLocal(5, "Drogaria São Paulo",  1,  '08:35:00', '19:35:00', "9ffacad0-a1a8-1bea-adc1-0a4aad121092");
CALL cadastrarLocal(5,  "Ultrafarma",  2,  '08:35:00', '23:35:00', "7afbfad0-a1a8-1bfa-aaba-ba4baf121091");

CALL cadastrarLocal(0, "Dudalina",  1,  '08:35:00', '19:35:00', "9ffacad0-a1a8-1bea-fff1-0a4aad121092");


CALL cadastrarLocal(0, "Estrela Beauty",  1,  '08:35:00', '19:35:00', "9ffacad0-a1a8-1bfa-adc1-0a4aad121090");


CALL cadastrarLocal(0, "Petshop Santos",  1,  '08:35:00', '19:35:00', "9ffacad0-a1a8-1bfa-aab1-0a4aad121090");


CALL cadastrarLocal(0, "Fit",  1,  '08:35:00', '19:35:00', "9ffacad0-a1a8-1bfa-aab1-0a4aaf121090");


CALL cadastrarLocal(1, "Fom - Quiosque",  1,  '08:35:00', '19:35:00', "9afacad0-a1a8-1bfa-aab1-0a4aaf121090");
CALL cadastrarLocal(1, "Rei do Frango",  1,  '08:35:00', '19:35:00', "9afbcad0-a1a8-1bfa-aab1-0a4aaf121090");

CALL cadastrarLocal(0, "Casas Bahia",  1,  '08:35:00', '23:35:00', "9acbcad0-a1a8-1bfa-aab1-0a4aaf121090");


CALL cadastrarLocal(6, "Banheiro Praiamar Shopping | 1º Andar ",  1,  '08:00:00', '23:59:59', "9deb0cfe-f928-11ea-adc1-0242ac120002");
CALL cadastrarLocal(7, "Bebedouro Praiamar Shopping | 1º Andar ",  1,  '09:25:00', '19:35:00', "adeb0ba0-f928-11ea-adc1-0242ac120002");
CALL cadastrarLocal(8, "Escada Fixa Praiamar Shopping | 1º Andar ",  1,  '08:00:00', '23:59:59', "adeb0cf1-a928-11ea-adc1-0242ac120002");
CALL cadastrarLocal(9, "Escada Rolante Praiamar Shopping | 1º Andar ",  1,  '09:25:00', '19:35:00', "adeb0ba1-a928-11ea-adc1-0242ac120002");
CALL cadastrarLocal(10, "Elevador Praiamar Shopping | 1º Andar ",  1,  '09:25:00', '19:35:00', "adeb0ba0-f921-a1ea-adc1-0242ac120002");


CALL cadastrarLocal(0, "Nike",  2,  '08:35:00', '23:35:00', "9afbcad0-a1a8-1bfa-aaba-ba4aaf121090");


CALL cadastrarLocal(0, "Netshoes",  2,  '08:35:00', '23:35:00', "9afbcad0-a1a8-1bfa-aaba-ba4baf121091");


CALL cadastrarLocal(0, "Dafiti",  2,  '08:35:00', '23:35:00', "7afbcad0-a1a8-1bfa-aaba-ba4baf121091");


CALL cadastrarLocal(4, "Walmart",  2,  '08:35:00', '23:35:00', "7afbcad0-a1a8-1bfa-aa7a-fffbaf121091");

CALL cadastrarLocal(0,  "Grupo SBF",  2,  '08:35:00', '23:35:00', "aaa777d0-a1a8-1bfa-aaba-ba4baf121091");

CALL cadastrarLocal(0,  "Passarela",  2,  '08:35:00', '23:35:00', "7afbfad0-a1a8-1bfa-baba-ba4bff121091");

CALL cadastrarLocal(1,  "Varando",  2,  '08:35:00', '23:35:00', "7afbdad0-a1a8-1bfa-baba-ba4bff121091");

CALL cadastrarLocal(0,  "Kalunga",  2,  '08:35:00', '23:35:00', "7affdad0-a1a8-1bfa-baba-ba4bff121091");


CALL cadastrarLocal(0,  "Natura",  2,  '08:35:00', '23:35:00', "7affdad0-a1a8-1afa-baba-ba4bff121091");

CALL cadastrarLocal(0,  "Mobly",  2,  '08:35:00', '23:35:00', "7affdbb0-a1a8-1afa-baba-ba4bff121091");

CALL cadastrarLocal(0,  "Polishop",  2,  '08:35:00', '23:35:00', "7affdbb0-a1a8-1afa-bdbf-ba4bff121091");


CALL cadastrarLocal(6, "Banheiro Praiamar Shopping | 2º Andar ",  2,  '08:00:00', '23:59:59', "9deb0cfe-f928-11ea-adc1-0242ac120012");
CALL cadastrarLocal(7, "Bebedouro Praiamar Shopping | 2º Andar ",  2,  '09:25:00', '19:35:00', "adeb0ba0-f928-11ea-adc1-0242ac120022");
CALL cadastrarLocal(8, "Escada Fixa Praiamar Shopping | 2º Andar ",  2,  '08:00:00', '23:59:59', "adeb0cf1-a928-11ea-adc1-0242ac120032");
CALL cadastrarLocal(9, "Escada Rolante Praiamar Shopping | 2º Andar ",  2,  '09:25:00', '19:35:00', "adeb0ba1-a928-11ea-adc1-0242ac120042");
CALL cadastrarLocal(10, "Elevador Praiamar Shopping | 2º Andar ",  2,  '09:25:00', '19:35:00', "adeb0ba0-f921-a1ea-adc1-0242ac120052");



CALL cadastrarLocal(1, "McDonald's",  3,  '09:25:00', '23:35:00', "adeb0ba0-f921-affa-adc1-0242ac120052");
CALL cadastrarLocal(1, "Burger King",  3,  '09:25:00', '23:35:00', "affb0ba0-f921-affa-adc1-0242ac120052");
CALL cadastrarLocal(1, "Subway",  3,  '09:25:00', '23:35:00', "ffacdba0-f921-affa-adc1-0242ac120052");
CALL cadastrarLocal(1, "Rock Café",  3,  '09:25:00', '23:35:00', "adeffba0-f921-affa-adc1-0242ac120052");
CALL cadastrarLocal(1, "Rock Burguer",  3,  '09:25:00', '23:35:00', "adefaaa0-f921-affa-adc1-0242ac120052");
CALL cadastrarLocal(1, "Girafas",  3,  '09:25:00', '23:35:00', "adefaaa0-f921-affa-adc1-0342ac120052");
CALL cadastrarLocal(1, "Rockabilly",  3,  '09:25:00', '23:35:00', "adefab10-f921-affa-adc1-0342ac120052");
CALL cadastrarLocal(1, "NAMI Temakeria",  3,  '09:25:00', '23:35:00', "adefab10-f921-afb1-adc1-0342ac120052");
CALL cadastrarLocal(1, "Temakeria No Shey",  3,  '09:25:00', '23:35:00', "adefab10-f921-afb1-a121-0342ac120052");
CALL cadastrarLocal(1, "Domino's Pizza",  3,  '09:25:00', '23:35:00', "adefab10-f921-bdb1-a121-0342ac120052");
CALL cadastrarLocal(1, "Pizzaria California",  3,  '09:25:00', '23:35:00', "adefff10-f921-bdb1-a121-0342ac120052");
CALL cadastrarLocal(1, "Sobremesas Docinho",  3,  '09:25:00', '23:35:00', "adef2310-f921-bdb1-a121-0342ac120052");
CALL cadastrarLocal(1,"Big Esfiha", 3, '09:25:00', '23:35:00', "afaf2310-f921-bdb1-a121-0342ac120052");
CALL cadastrarLocal(1,"A Casa do Porco", 3, '09:25:00', '23:35:00', "edef2310-f921-bdb1-a121-0342ac120052");
CALL cadastrarLocal(1,"Mocotó", 3, '09:25:00', '23:35:00', "adea2310-f921-bdb1-a121-0342ac120052");
CALL cadastrarLocal(1,"Olympe", 3, '09:25:00', '23:35:00', "aeef2310-f921-bdb1-a121-0342ac120052");
CALL cadastrarLocal(1,"Tuju", 3, '09:25:00', '23:35:00', "adefe310-f921-bdb1-a121-0342ac120052");

CALL cadastrarLocal(1,"Pariji Bistrot", 3, '09:25:00', '23:35:00', "aeea2310-f921-bdb1-a121-0342ac120052");

CALL cadastrarLocal(1,"Pé de Fava", 3, '09:25:00', '23:35:00', "afef2310-f921-bdb1-a121-0342ac120052");
CALL cadastrarLocal(1,"Sujinho", 3, '09:25:00', '23:35:00', "adef2310-f921-bdb1-a121-e342ac120052");
CALL cadastrarLocal(1,"Pé pra fora", 3, '09:25:00', '23:35:00', "adef2310-f921-bdb1-ab21-0e42ac120052");
CALL cadastrarLocal(1,"Faceburger", 3, '09:25:00', '23:35:00', "adef2310-f921-bdb1-a121-03e2ac120052");
CALL cadastrarLocal(1,"Churassic Park", 3, '09:25:00', '23:35:00', "adef2310-f921-bdb1-aae1-0342ac120052");
CALL cadastrarLocal(1,"Bon Apetit", 3, '09:25:00', '23:35:00', "adef2310-f921-bdb1-a121-0342ec120052");
CALL cadastrarLocal(1,"O Senhor dos Pasteis", 3, '09:25:00', '23:35:00', "adef2310-f921-bdb1-e121-0342ac120052");
CALL cadastrarLocal(1,"Facefood", 3, '09:25:00', '23:35:00', "adef2310-f921-bdb1-a121-0342ace20052");
CALL cadastrarLocal(1,"Demorô", 3, '09:25:00', '23:35:00', "adef2310-f921-bdb1-a121-034eac120052");
CALL cadastrarLocal(1,"Bar dos Otários", 3, '09:25:00', '23:35:00', "adef2310-f921-bdb1-ae21-0342ac120052");
CALL cadastrarLocal(1,"Restaurante Manioca", 3, '09:25:00', '23:35:00', "adef2310-f9cc-edb1-a121-0342ac120052");
CALL cadastrarLocal(1,"Ritz", 3, '09:25:00', '23:35:00', "adef2310-f921-bdb1-a1e1-eab2ac120052");
CALL cadastrarLocal(1,"Nagarê Sushi", 3, '09:25:00', '23:35:00', "adef2310-f9e1-bdb1-a121-0342ac120052");
CALL cadastrarLocal(1,"Churrascaria Rodeio", 3, '09:25:00', '23:35:00', "adeffaaa-f921-bdb1-a121-0342ac120052");
CALL cadastrarLocal(1,"Frevo", 3, '09:25:00', '23:35:00', "adef2310-f921-bdeb-a121-0342ac120052");
CALL cadastrarLocal(1,"Terraço Santista", 3, '09:25:00', '23:35:00', "adef2e10-f921-bdb1-a121-0342ac120052");
CALL cadastrarLocal(1,"Outback", 3, '09:25:00', '23:35:00', "adef2310-f9a1-eeb1-ee21-0342ac120052");
CALL cadastrarLocal(1,"Madero Steak House", 3, '09:25:00', '23:35:00', "adef2310-e921-bdb1-a121-0342ac120052");
CALL cadastrarLocal(1,"Papinha da Vovó", 3, '09:25:00', '23:35:00', "adef2310-f921-afb1-a121-0342ac120052");
CALL cadastrarLocal(1,"Mania de Churrasco", 3, '09:25:00', '23:35:00', "adef2310-faf1-bdb1-a121-0342ac120052");
CALL cadastrarLocal(1,"Spoleto", 3, '09:25:00', '23:35:00', "adef2310-f921-bdb1-a1ff-0342ac120052");
CALL cadastrarLocal(1,"Varanda Grill", 3, '09:25:00', '23:35:00', "adef2310-f921-bdf1-a121-0342ac120052");
CALL cadastrarLocal(1,"Restaurante Kitchin", 3, '09:25:00', '23:35:00', "adef2d10-f921-bdb1-a121-0342ac120052");
CALL cadastrarLocal(1,"Bullger", 3, '09:25:00', '23:35:00', "adef2310-f921-bdbd-a121-0342ac120052");
CALL cadastrarLocal(1,"Croasonho", 3, '09:25:00', '23:35:00', "adef2310-f921-ddb1-a121-0342ac120052");
CALL cadastrarLocal(1,"Casa do Chocolate", 3, '09:25:00', '23:35:00', "adefd310-f921-bdb1-a121-0342ac120052");
CALL cadastrarLocal(1,"Amaretto", 3, '09:25:00', '23:35:00', "adef2310-f92d-bdb1-a121-0342ac120052");
CALL cadastrarLocal(1,"Seiko Temakeria", 3, '09:25:00', '23:35:00', "adefd310-f921-bdb1-a121-0342ac111a52");
CALL cadastrarLocal(1,"The Max Grill", 3, '09:25:00', '23:35:00', "adef23d0-f921-bdb1-a121-0342ac120052");
CALL cadastrarLocal(1,"Oakberry", 3, '09:25:00', '23:35:00', "adef2310-f9a1-cdb1-a121-0342ac120052");
CALL cadastrarLocal(1,"Restaurante Bambu", 3, '09:25:00', '23:35:00', "adefc310-f921-bdb1-a121-0342ac120052");
CALL cadastrarLocal(1,"Beduíno", 3, '09:25:00', '23:35:00', "adef2310-f921-bdbc-a121-0342ac120052");
CALL cadastrarLocal(1,"Nutri's Grill", 3, '09:25:00', '23:35:00', "adef2310-f921-cdb1-a121-0342ac120052");
CALL cadastrarLocal(1,"Motoburger", 3, '09:25:00', '23:35:00', "adef2310-f9c1-bdb1-a121-0342ac120052");
CALL cadastrarLocal(1,"Old Harbour", 3, '09:25:00', '23:35:00', "adef2310-c921-bdb1-a121-0342ac120052");
CALL cadastrarLocal(1,"Japa Ral Restaurante", 3, '09:25:00', '23:35:00', "cdef2310-f921-bdb1-a121-0342ac120052");
CALL cadastrarLocal(1,"Yuki", 3, '09:25:00', '23:35:00', "adef2310-f921-bcb1-a121-c3a2ac120052");
CALL cadastrarLocal(1,"Suco Bagaço", 3, '09:25:00', '23:35:00', "adef2310-f921-bdba-a121-0342ac120052");
CALL cadastrarLocal(1,"Sushi Garden", 3, '09:25:00', '23:35:00', "adef2310-f921-aab1-a121-0342ac120052");
CALL cadastrarLocal(1,"Patroni Pizzas", 3, '09:25:00', '23:35:00', "adef2310-fa21-bdb1-a121-0342ac120052");
CALL cadastrarLocal(1,"Casa do Pão de Queijo", 3, '09:25:00', '23:35:00', "aaef2310-f921-bdb1-a121-0342ac120052");
CALL cadastrarLocal(1,"Salada Paulista", 3, '09:25:00', '23:35:00', "adef2a10-f921-bdb1-a121-0342ac120052");
CALL cadastrarLocal(1,"Sabores do Mar", 3, '09:25:00', '23:35:00', "adefa310-f921-bdb1-a121-0342ac120052");
CALL cadastrarLocal(1,"Jerônimo", 3, '09:25:00', '23:35:00', "adef2310-f92a-bdb1-a121-0342ac120052");
CALL cadastrarLocal(1,"KFC", 3, '09:25:00', '23:35:00', "adef2310-f921-bab1-a121-0342ac120052");
CALL cadastrarLocal(1,"Villa Di Pasta", 3, '09:25:00', '23:35:00', "adef231a-f921-bdb1-a121-0342ac120052");
CALL cadastrarLocal(1,"Vivenda do Camarão", 3, '09:25:00', '23:35:00', "adaf2310-f921-bdb1-a121-0342ac120052");
CALL cadastrarLocal(1,"Divino Fogão", 3, '09:25:00', '23:35:00', "adef2310-f921-adb1-a121-0342ac120052");
CALL cadastrarLocal(1,"Pizza Hut", 3, '09:25:00', '23:35:00', "adef2310-f921-bda1-a121-0342ac120052");
CALL cadastrarLocal(1,"Nebuta Temakeria", 3, '09:25:00', '23:35:00', "adefabc7-fa21-bdb1-a121-0342ac120052");
CALL cadastrarLocal(1,"Raízes da Terra", 3, '09:25:00', '23:35:00', "afffbbc7-fa21-bdb1-a121-0342ac120052");
CALL cadastrarLocal(1,"Junglê", 3, '09:25:00', '23:35:00', "adaf2310-f921-fdb1-a121-1112ac120052");
CALL cadastrarLocal(1,"Pede mais!", 3, '09:25:00', '23:35:00', "adef2310-f921-bdb1-a121-03a2ac120052");
CALL cadastrarLocal(1,"Cafeteria Plaza", 3, '09:25:00', '23:35:00', "adef2310-f921-bdb1-a121-a342ac120052");
CALL cadastrarLocal(1,"Quero BIS", 3, '09:25:00', '23:35:00', "adef2310-f921-bdb1-a121-0342aca20052");
CALL cadastrarLocal(1,"Gostosuras ou gostosuras", 3, '09:25:00', '23:35:00', "adef2310-f921-bdb1-a121-0342ac12a052");
CALL cadastrarLocal(1,"A Grande Garfada", 3, '09:25:00', '23:35:00', "adef2310-f921-bdb1-a121-0342ac12005a");
CALL cadastrarLocal(1,"Veg e Veg Burger", 3, '09:25:00', '23:35:00', "adef2310-f921-bdb1-a121-7849ac120052");

CALL cadastrarLocal(6, "Banheiro Praiamar Shopping | 3º Andar ",  3,  '08:00:00', '23:59:59', "7deb0cfe-f928-11ea-adc1-0242ac1200a9");
CALL cadastrarLocal(7, "Bebedouro Praiamar Shopping | 3º Andar ",  3,  '09:25:00', '19:35:00', "7deb0ba0-f928-11ea-adc1-0242ac120087");
CALL cadastrarLocal(8, "Escada Fixa Praiamar Shopping | 3º Andar ",  3,  '08:00:00', '23:59:59', "7feb0cfa-a928-11ea-adc1-0242ac120089");
CALL cadastrarLocal(9, "Escada Rolante Praiamar Shopping | 3º Andar ",  3,  '09:25:00', '19:35:00', "7deb0ba1-a928-11ea-adc1-0242ac1200f9");
CALL cadastrarLocal(10, "Elevador Praiamar Shopping | 3º Andar ",  3,  '09:25:00', '19:35:00', "7deb0ba0-f921-a1ea-adc1-0242ac120092");

CALL cadastrarLocal(3, "Cinema Roxy | Recepção",  4,  '08:00:00', '23:59:59', "8deafff1-f928-11ea-adc1-0242ac120013");

CALL cadastrarLocal(3, "Cinema Roxy | Sala 1",  4,  '08:00:00', '23:59:59', "8aeafcfe-f928-11ea-adc1-0242ac120013");
CALL cadastrarLocal(3, "Cinema Roxy | Sala 2",  4,  '08:00:00', '23:59:59', "8beafcfe-f928-11ea-adc1-0242ac120013");
CALL cadastrarLocal(3, "Cinema Roxy | Sala 3",  4,  '08:00:00', '23:59:59', "8ceafcfe-f928-11ea-adc1-0242ac120013");

CALL cadastrarLocal(3, "Cinema Roxy | Sala 4",  4,  '08:00:00', '23:59:59', "8deafcfe-f928-11ea-adc1-0242ac120013");
CALL cadastrarLocal(3, "Cinema Roxy | Sala 5",  4,  '08:00:00', '23:59:59', "8eeafcfe-f928-11ea-adc1-0242ac120013");
CALL cadastrarLocal(3, "Cinema Roxy | Sala 6",  4,  '08:00:00', '23:59:59', "8feafcfe-f928-11ea-adc1-0242ac120013");
CALL cadastrarLocal(3, "Cinema Roxy | Sala 7",  4,  '08:00:00', '23:59:59', "8e1afcfe-f928-11ea-adc1-0242ac120013");

CALL cadastrarLocal(3, "Cinema Roxy | Sala 8",  4,  '08:00:00', '23:59:59', "8dsafcfe-f928-11ea-adc1-0242ac120013");
CALL cadastrarLocal(3, "Cinema Roxy | Sala 9",  4,  '08:00:00', '23:59:59', "8d4afcfe-f928-11ea-adc1-0242ac120013");
CALL cadastrarLocal(3, "Cinema Roxy | Sala 10",  4,  '08:00:00', '23:59:59', "85eafcfe-f928-11ea-adc1-0242ac120013");

CALL cadastrarLocal(6, "Banheiro Praiamar Shopping | 4º Andar ",  4,  '08:00:00', '23:59:59', "8deb0cfe-f928-11ea-adc1-0242ac120013");
CALL cadastrarLocal(2, "Bebedouro Praiamar Shopping | 4º Andar ",  4,  '09:25:00', '19:35:00', "8deb0ba0-f928-11ea-adc1-0242ac120023");
CALL cadastrarLocal(8, "Escada Fixa Praiamar Shopping | 4º Andar ",  4,  '08:00:00', '23:59:59', "8deb0cf1-a928-11ea-adc1-0242ac120032");
CALL cadastrarLocal(9, "Escada Rolante Praiamar Shopping | 4º Andar ",  4,  '09:25:00', '19:35:00', "8deb0ba1-a928-11ea-adc1-0242ac130042");
CALL cadastrarLocal(10, "Elevador Praiamar Shopping | 4º Andar ",  4,  '09:25:00', '19:35:00', "8deb0ba0-f921-a1ea-adc1-0242ac120053");

CALL cadastrarLocal(11, "Praça de Alimentação", 3, '09:00:00', '23:00:00', "8deb0ba0-f921-a1ea-adc1-02bfac120053");
CALL cadastrarLocal(11, "Praça de Descanso (com Wi-Fi)", 4, '09:00:00', '23:00:00', "81eb0ba0-f921-a1ea-adc1-02bfac120053");

CALL cadastrarLocal(13, "TLocal 1 | Térreo ",  0,  '00:00:00','00:00:00', "8deb0fa0-f921-a1ea-adc1-02bfac120053");
CALL cadastrarLocal(13, "TLocal 2 | Térreo ",  0,  '00:00:00','00:00:00', "2deb0ba0-f921-a1ea-adc1-02bfac120053");
CALL cadastrarLocal(13, "TLocal 3 | Térreo ",  0,  '00:00:00','00:00:00', "3deb0ba0-f921-a1ea-adc1-02bfac120053");

CALL cadastrarLocal(13, "TLocal 1 | 1º Andar ",   1,  '00:00:00','00:00:00', "8aeb0ba0-f921-a1ea-adc1-02bfac120053");
CALL cadastrarLocal(13, "TLocal 2 | 1º Andar  ",  1,  '00:00:00','00:00:00', "2aeb0ba0-f921-a1ea-adc1-02bfac120053");
CALL cadastrarLocal(13, "TLocal 3 | 1º Andar  ",  1,  '00:00:00','00:00:00', "3aeb0ba0-f921-a1ea-adc1-02bfac120053");

CALL cadastrarLocal(13, "TLocal 1 | 2º Andar ",   2,  '00:00:00','00:00:00', "8aeb0ba0-f921-a1ea-adc1-02ffac120053");
CALL cadastrarLocal(13, "TLocal 2 | 2º Andar  ",  2,  '00:00:00','00:00:00', "2aeb0ba0-f921-a1ea-adc1-02ffac120053");
CALL cadastrarLocal(13, "TLocal 3 | 2º Andar  ",  2,  '00:00:00','00:00:00', "3aeb0ba0-f921-a1ea-adc1-02ffac120053");

CALL cadastrarLocal(13, "TLocal 1 | 3º Andar ",   3,  '00:00:00','00:00:00', "8aeb0ba0-f921-a1ea-adc1-02ffac120153");
CALL cadastrarLocal(13, "TLocal 2 | 3º Andar  ",  3,  '00:00:00','00:00:00', "2aeb0ba0-f921-a1ea-adc1-02ffac120153");
CALL cadastrarLocal(13, "TLocal 3 | 3º Andar  ",  3,  '00:00:00','00:00:00', "3aeb0ba0-f921-a1ea-adc1-02ffac120153");

CALL cadastrarLocal(13, "TLocal 1 | 4º Andar ",   4,  '00:00:00','00:00:00', "8afb0ba0-f921-a1ea-adc1-02ffac120153");
CALL cadastrarLocal(13, "TLocal 2 | 4º Andar  ",  4,  '00:00:00','00:00:00', "2afb0ba0-f921-a1ea-adc1-02ffac120153");
CALL cadastrarLocal(13, "TLocal 3 | 4º Andar  ",  4,  '00:00:00','00:00:00', "3afb0ba0-f921-a1ea-adc1-02ffac120153");

CALL cadastrarLocal(8, "Escada Fixa Praiamar Shopping | 3º Andar ",  3,  '08:00:00', '23:59:59', "adeb0cf1-a928-11ea-adc1-0242ac120032");

CALL defSubCategoriaLocal(6, 0);
CALL defSubCategoriaLocal(6, 1);
CALL defSubCategoriaLocal(6, 2);
CALL defSubCategoriaLocal(6, 3);
CALL defSubCategoriaLocal(6, 4);
CALL defSubCategoriaLocal(6, 5);
CALL defSubCategoriaLocal(6, 6);
CALL defSubCategoriaLocal(6, 7);
CALL defSubCategoriaLocal(6, 8);
CALL defSubCategoriaLocal(6, 9);
CALL defSubCategoriaLocal(7, 1);
CALL defSubCategoriaLocal(7, 2);
CALL defSubCategoriaLocal(7, 5);
CALL defSubCategoriaLocal(7, 6);
CALL defSubCategoriaLocal(7, 8);
CALL defSubCategoriaLocal(7, 9);
CALL defSubCategoriaLocal(8, 0);
CALL defSubCategoriaLocal(8, 2);
CALL defSubCategoriaLocal(9, 0);
CALL defSubCategoriaLocal(9, 2);
CALL defSubCategoriaLocal(10, 0);
CALL defSubCategoriaLocal(10, 2);
CALL defSubCategoriaLocal(11, 4);

CALL defSubCategoriaLocal(12, 4);
CALL defSubCategoriaLocal(13, 4);
CALL defSubCategoriaLocal(14, 4);
CALL defSubCategoriaLocal(15, 4);
CALL defSubCategoriaLocal(16, 4);
CALL defSubCategoriaLocal(17, 4);
CALL defSubCategoriaLocal(18, 4);

CALL defSubCategoriaLocal(19, 1);
CALL defSubCategoriaLocal(19, 2);
CALL defSubCategoriaLocal(19, 5);
CALL defSubCategoriaLocal(19, 6);
CALL defSubCategoriaLocal(19, 8);
CALL defSubCategoriaLocal(19, 9);


CALL defSubCategoriaLocal(20, 4);
CALL defSubCategoriaLocal(21, 4);
CALL defSubCategoriaLocal(22, 4);
CALL defSubCategoriaLocal(23, 4);
CALL defSubCategoriaLocal(24, 4);
CALL defSubCategoriaLocal(25, 4);
CALL defSubCategoriaLocal(26, 4);
CALL defSubCategoriaLocal(27, 4);
CALL defSubCategoriaLocal(28, 4);
CALL defSubCategoriaLocal(29, 4);
CALL defSubCategoriaLocal(30, 4);
CALL defSubegoriaLocal(31, 4);
CALL defSubCategoriaLocal(32, 4);
CALL defSubCategoriaLocal(33, 4);
CALL defSubCategoriaLocal(34, 4);
CALL defSubCategoriaLocal(35, 4);

CALL defSubCategoriaLocal(36, 6);
CALL defSubCategoriaLocal(37, 4);
CALL defSubCategoriaLocal(38, 0);
CALL defSubCategoriaLocal(38, 2);
CALL defSubCategoriaLocal(38, 3);


CALL defSubCategoriaLocal(39, 4);
CALL defSubCategoriaLocal(40, 7);
CALL defSubCategoriaLocal(41, 4);
CALL defSubCategoriaLocal(42, 4);
CALL defSubCategoriaLocal(43, 4);
CALL defSubCategoriaLocal(44, 4);
CALL defSubCategoriaLocal(45, 4);
CALL defSubCategoriaLocal(46, 4);

CALL defSubCategoriaLocal(47, 4);
CALL defSubCategoriaLocal(48, 4);
CALL defSubCategoriaLocal(49, 4);
CALL defSubCategoriaLocal(50, 11);
CALL defSubCategoriaLocal(51, 13);
CALL defSubCategoriaLocal(52, 4);
CALL defSubCategoriaLocal(53, 11);
CALL defSubCategoriaLocal(54, 4);
CALL defSubCategoriaLocal(55, 0);
CALL defSubCategoriaLocal(55, 2);


CALL defSubCategoriaLocal(56, 4);
CALL defSubCategoriaLocal(58, 4);
CALL defSubCategoriaLocal(60, 4);
CALL defSubCategoriaLocal(61, 4);
CALL defSubCategoriaLocal(63, 7);
CALL defSubCategoriaLocal(64, 4);
CALL defSubCategoriaLocal(65, 4);
CALL defSubCategoriaLocal(66, 7);
CALL defSubCategoriaLocal(67, 4);
CALL defSubCategoriaLocal(68, 4);
CALL defSubCategoriaLocal(69, 4);
CALL defSubCategoriaLocal(70, 4);
CALL defSubCategoriaLocal(71, 5);
CALL defSubCategoriaLocal(72, 4);
CALL defSubCategoriaLocal(73, 4);
CALL defSubCategoriaLocal(78, 7);
CALL defSubCategoriaLocal(94, 4);
CALL defSubCategoriaLocal(96, 4);
CALL defSubCategoriaLocal(98, 4);
CALL defSubCategoriaLocal(99, 11);
CALL defSubCategoriaLocal(100, 4);
CALL defSubCategoriaLocal(102, 4);

CALL defSubCategoriaLocal(103, 4);
CALL defSubCategoriaLocal(104, 4);
CALL defSubCategoriaLocal(108, 4);
CALL defSubCategoriaLocal(109, 4);
CALL defSubCategoriaLocal(110, 14);
CALL defSubCategoriaLocal(111, 4);

CALL defSubCategoriaLocal(114, 0);
CALL defSubCategoriaLocal(114, 2);
CALL defSubCategoriaLocal(114, 3);

CALL defSubCategoriaLocal(120, 4);
CALL defSubCategoriaLocal(121, 4);
CALL defSubCategoriaLocal(122, 4);
CALL defSubCategoriaLocal(124, 4);
CALL defSubCategoriaLocal(125, 4);

CALL defSubCategoriaLocal(127, 0);
CALL defSubCategoriaLocal(127, 2);
CALL defSubCategoriaLocal(127, 3);
CALL defSubCategoriaLocal(128, 11);
CALL defSubCategoriaLocal(129, 14);

CALL defSubCategoriaLocal(130, 0);
CALL defSubCategoriaLocal(130, 2);
CALL defSubCategoriaLocal(130, 3);
CALL defSubCategoriaLocal(130, 13);

CALL publicarComunicado(7, 2, null, "Loja fechada por tempo indeterminado, devido à pandemia do novo Coronavírus", now(), null);
CALL publicarComunicado(8, 0, null, "Compre o Galaxy Note20 em até 12x sem juros, e ganhe um voucher de R$ 2000!", now(), null);
CALL publicarComunicado(9, 0, null, "Desconto de 30% em toda a loja! Aproveite, é apenas neste fim de semana!", now(), '2020-09-20 23:00:00');
CALL publicarComunicado(11, 3, null, "Cuidado! Entrada escorregadia!", now(), DATE_ADD(now(), INTERVAL 30 minute));
CALL publicarComunicado(12, 0, null, "Pagando no cartão, você ganha 15% de desconto!", now(), null);
CALL publicarComunicado(19, 1, 1, "50% de desconto em todos os jogos e HQ's!", now(), '2020-09-24 21:00:00');
CALL publicarComunicado(19, 1, 9, "50% de desconto em todos os jogos e HQ's!", now(), '2020-09-24 21:00:00');
CALL publicarComunicado(38, 0, null, "Chegou a nova TV 8K da LG, com tecnologia NanoCell e tamanho de 75 polegadas! Não se preocupe mais com distorção de cores e ângulo de visão, adquira já!", now(), null);
CALL publicarComunicado(115, 3, null, "Banheiro interditado!", now(), DATE_ADD(now(), INTERVAL 1 hour));
CALL publicarComunicado(153, 2, null, "Prato do dia: escargot ao molho madeira", now(), DATE_ADD(now(), INTERVAL 3 hour));


CALL publicarComunicado(6, 0, null, "50% de desconto em todos os produtos!", now(), '2020-09-30 22:00:00'); 
CALL publicarComunicado(6, 1, 0, "Desconto maior para produtos de informática: 80%!", now(), '2020-09-30 22:00:00'); 

CALL publicarComunicado(217, 4, null, "Preços: Meia entrada - R$ 18.00; Inteira: R$ 32.00", now(), null);
CALL publicarComunicado(217, 2, null, "Próxima sessâo: 'Sonic: O filme' - Sala 4, às 17:00. Dublado. Duração: 1h40m", now(), DATE_ADD(now(), INTERVAL 45 minute));

CALL pesquisar("Americanas");