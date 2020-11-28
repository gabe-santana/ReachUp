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

/* Ligação do shopping com o serviço da ReachUp! */

INSERT INTO shopping VALUES (0, "Shopping Praiamar", "Bem vindo ao shopping Praiamar!");

/* Definição dos horários de funcionamento do shopping */

CALL defHorarioShopping(0, '11:00:00', '22:00:00');
CALL defHorarioShopping(1, '10:00:00', '22:00:00');
CALL defHorarioShopping(2, '10:00:00', '22:00:00');
CALL defHorarioShopping(3, '10:00:00', '22:00:00');
CALL defHorarioShopping(4, '10:00:00', '22:00:00');
CALL defHorarioShopping(5, '10:00:00', '22:00:00');
CALL defHorarioShopping(6, '10:00:00', '22:00:00');

/* Atualizar horários de funcionamento do shopping */

CALL defHorarioShopping(5, '12:00:00', '22:00:00');
CALL defHorarioShopping(0, '12:00:00', '22:00:00');

/* Atualizar nome e/ou mensagem do shopping */

CALL atualizarShopping("Praiamar", "Bem vindo!");

/* Pegar todas as informações do shopping */

CALL pegarInfoShopping(0);




/* Nota de desenvolvimento - CUIDADO: Categorias + subcategorias são independentes (não têm ligação alguma) com tipos de local */
/*Todos os locais, independente do tipo, possuem categorias, e não apenas lojas.*/

/* Categorias aplicáveis em lojas (e suas subcategorias) */

CALL cadastrarCategoria("Informática", "Produtos tecnólogicos de uso geral e específico no mundo da tecnologia da informação", 0);
CALL cadastrarSubCategoria(0, "Hardware");
CALL cadastrarSubCategoria(0, "Software");
CALL cadastrarSubCategoria(0, "Periféricos");

CALL cadastrarCategoria("Jogos","Jogos e semelhantes, ao entretenimento de diversos tipos", 0);
CALL cadastrarSubCategoria(1, "RPG");
CALL cadastrarSubCategoria(1, "Aventura");
CALL cadastrarSubCategoria(1, "Ação");
CALL cadastrarSubCategoria(1, "Mundo aberto");
CALL cadastrarSubCategoria(1, "Tabuleiro");
CALL cadastrarSubCategoria(1, "Cartas");
CALL cadastrarSubCategoria(1, "Infantil");
CALL cadastrarSubCategoria(1, "Para computadores");
CALL cadastrarSubCategoria(1, "Para consoles");

CALL cadastrarCategoria("Eletrônicos","Utensílios do mundo da eletrônica", 0);
CALL cadastrarSubCategoria(2, "Carregadores");
CALL cadastrarSubCategoria(2, "Equipamentos de medição");
CALL cadastrarSubCategoria(2, "Componentes eletrônicos");
CALL cadastrarSubCategoria(2, "Instrumentos de solda");
CALL cadastrarSubCategoria(2, "Componentes de solda");
CALL cadastrarSubCategoria(2, "Placas eletrônicas");

CALL cadastrarCategoria("Eletrodomésticos","Máquinas eletrodomésticas", 0);
CALL cadastrarSubCategoria(3, "Refrigeração em geral");
CALL cadastrarSubCategoria(3, "Refrigeração a gás");
CALL cadastrarSubCategoria(3, "Ventilação");
CALL cadastrarSubCategoria(3, "Termo elétrico");

CALL cadastrarCategoria("Roupas","Vestimentas gerais", 0);
CALL cadastrarSubCategoria(4, "Calçados simples");
CALL cadastrarSubCategoria(4, "Blusas, camisas e camisetas");
CALL cadastrarSubCategoria(4, "Calças e bermudas");
CALL cadastrarSubCategoria(4, "Lingerie e roupas íntimas");
CALL cadastrarSubCategoria(4, "Tênis e sapatênis");
CALL cadastrarSubCategoria(4, "Roupas para frio intenso");
CALL cadastrarSubCategoria(4, "Roupas esportivas");
CALL cadastrarSubCategoria(4, "Tênis esportivos");
CALL cadastrarSubCategoria(4, "Roupas de praia");
CALL cadastrarSubCategoria(4, "Pijamas");
CALL cadastrarSubCategoria(4, "Bolsas");
CALL cadastrarSubCategoria(4, "Maquiagens");
CALL cadastrarSubCategoria(4, "Perfumes");
CALL cadastrarSubCategoria(4, "Cosméticos");
CALL cadastrarSubCategoria(4, "Mochilas");
CALL cadastrarSubCategoria(4, "Malas de viagem");
CALL cadastrarSubCategoria(4, "Moda infantil");
CALL cadastrarSubCategoria(4, "Vestidos");
CALL cadastrarSubCategoria(4, "Meias");

CALL cadastrarCategoria("Acessórios","Vestimentas para o corpo", 0);
CALL cadastrarSubCategoria(5, "De mão");
CALL cadastrarSubCategoria(5, "Pulseiras");
CALL cadastrarSubCategoria(5, "Colares/Pescoço");
CALL cadastrarSubCategoria(5, "Pernas e pés");
CALL cadastrarSubCategoria(5, "Óculos de sol");
CALL cadastrarSubCategoria(5, "Relógios");
CALL cadastrarSubCategoria(5, "Bonés");
CALL cadastrarSubCategoria(5, "Brincos");
CALL cadastrarSubCategoria(5, "Lenços");
CALL cadastrarSubCategoria(5, "Anéis");


CALL cadastrarCategoria("Categoria 1,99","Produtos de preço acessíveis e com funcionalidades distintas ", 0);
CALL cadastrarSubCategoria(6, "Objetos de uso geral");
CALL cadastrarSubCategoria(6, "Objetos de cozinha");
CALL cadastrarSubCategoria(6, "Peças de roupa 1,99");
CALL cadastrarSubCategoria(6, "Alimentos 1,99");
CALL cadastrarSubCategoria(6, "Sacolas");

CALL cadastrarCategoria("Alimentação","Alimentação", 1);
CALL cadastrarSubCategoria(7, "Doceria");
CALL cadastrarSubCategoria(7, "Chocolateria");
CALL cadastrarSubCategoria(7, "Bolos e tortas");
CALL cadastrarSubCategoria(7, "Cafés");
CALL cadastrarSubCategoria(7, "Padaria");
CALL cadastrarSubCategoria(7, "Castanhas, nozes e amêndoas");
CALL cadastrarSubCategoria(7, "Sorvetes");

/* Categoria cancelada - nenhum local se associa a ela  */
CALL cadastrarCategoria("Cultura","Cultura", 1);
CALL cadastrarSubCategoria(8, "Obras literárias Cultura");
CALL cadastrarSubCategoria(8, "Obras artísticas Cultura");
CALL cadastrarSubCategoria(8, "Obras musicais Cultura");
/* ------------------ */

CALL cadastrarCategoria("Literatura","Produtos envolvendo entretimento no mundo dos livros", 0);
CALL cadastrarSubCategoria(9, "Livraria");
CALL cadastrarSubCategoria(9, "Comic store");
CALL cadastrarSubCategoria(9, "Mangá Store");

CALL cadastrarCategoria("Mercados", "Mercadinhos, hipermercados e quitandas", 1);
CALL cadastrarSubCategoria(10, "Hipermercado");
CALL cadastrarSubCategoria(10, "Mercadinho");
CALL cadastrarSubCategoria(10, "Quitanda");

CALL cadastrarCategoria("Drogaria", "Farmácias e lojas farmaucêticas", 1);
CALL cadastrarSubCategoria(11, "Farmácia");
CALL cadastrarSubCategoria(11, "Loja de manipulados");

CALL cadastrarCategoria("Casa", "Acessórios para casa", 0);
CALL cadastrarSubCategoria(12, "Móveis");
CALL cadastrarSubCategoria(12, "Lustres e abajures");
CALL cadastrarSubCategoria(12, "Quadros e esculturas");
CALL cadastrarSubCategoria(12, "Plantas");
CALL cadastrarSubCategoria(12, "Cozinha");
CALL cadastrarSubCategoria(12, "Tapetes");
CALL cadastrarSubCategoria(12, "Filtros de água");
CALL cadastrarSubCategoria(12, "Cama, mesa e banho");
CALL cadastrarSubCategoria(12, "Colchões");

CALL cadastrarCategoria("Pet-shop", "Lojas para seu querido animalzinho", 1);
CALL cadastrarSubCategoria(13, "Pet-shop");

/* Categorias aplicáveis em restaurantes */

CALL cadastrarCategoria("Frutos do mar", "Frutos do mar", 1);
CALL cadastrarSubCategoria(14, "Seafood");
CALL cadastrarCategoria("Self-service", "Monte seu prato e pague por kilo", 1);
CALL cadastrarSubCategoria(15, "Montar prato");
CALL cadastrarCategoria("Lanchonete", "Lanchonetes... huummm", 1);
CALL cadastrarSubCategoria(16, "Snack bar");
CALL cadastrarCategoria("Comida japonesa", "Experimente o incrível sabor da culinária japonesa", 1);
CALL cadastrarSubCategoria(17, "Japan Food");
CALL cadastrarCategoria("Pastelaria", "Pastéis.... quero de flango!", 1);
CALL cadastrarSubCategoria(18, "Pastry Shop");
CALL cadastrarCategoria("Fast-food", "Locais perfeitos para você matar sua fome sem perder tempo", 1);
CALL cadastrarSubCategoria(19, "Fast-food");
CALL cadastrarCategoria("Churrascaria", "Carnes suculentas... mal-passado, ao ponto ou bem-passado? À sua vontade", 1);
CALL cadastrarSubCategoria(20, "Steakhouse");
CALL cadastrarCategoria("Casa de massas", "Spaghetti, nhoque, lasanha, ravioli, etc.", 1);
CALL cadastrarSubCategoria(21, "Pasta House");
CALL cadastrarCategoria("Pizzaria", "Pizzas quentinhas e deliciosas", 1);
CALL cadastrarSubCategoria(22, "Pizzas");
CALL cadastrarCategoria("Esfiharia", "Não tem dinheiro para comer pizza? Então compre esfihas!", 1);
CALL cadastrarSubCategoria(23, "Esfihas");

/*Categorias aplicáveis em cinema */

CALL cadastrarCategoria("Cinema", "O local mais amado do shopping!", 1);
CALL cadastrarSubCategoria(24, "Movies Theater");

/*Categorias aplicáveis em necessidades */

CALL cadastrarCategoria("Banheiro", "Banheiros limpos e confortáveis", 1);
CALL cadastrarSubCategoria(25, "Toilet");
CALL cadastrarCategoria("Berçário", "Berçários para você amamentar ou trocar a fralda do seu bebê", 1);
CALL cadastrarSubCategoria(26, "Nursery");
CALL cadastrarCategoria("Bebedouro", "Bebedouros com água fria, morna ou quente", 1);
CALL cadastrarSubCategoria(27, "Fountain");
CALL cadastrarCategoria("Telefone", "Telefones para você se comunicar com o mundo lá fora", 1);
CALL cadastrarSubCategoria(28, "Telephone");

/*Categorias aplicáveis em escada */

CALL cadastrarCategoria("Escada fixa", "Escadas fixas para sua locomoção entre os andares do shopping", 1);
CALL cadastrarSubCategoria(29, "Fixed Ladder");
CALL cadastrarCategoria("Escada rolante", "Escadas rolantes para sua locomoção entre os andares do shopping", 1);
CALL cadastrarSubCategoria(30, "Moving Ladder");

/*Categorias aplicáveis em elevador */

CALL cadastrarCategoria("Elevador", "Elevadores para sua locomoção entre os andares do shopping", 1);
CALL cadastrarSubCategoria(31, "Lift");

/* Categorias aplicáveis em praça */ 

CALL cadastrarCategoria("Praça de alimentação", "Praças de alimentação, com inúmeros restaurantes e lanchonetes, para você matar sua fome", 1);
CALL cadastrarSubCategoria(32, "Food Court");
CALL cadastrarCategoria("Praça de lazer", "Praças de lazer com Wi-Fi grátis, assentos aconchegantes, fontes e estátuas para você descansar do barulho do shopping ou do seu grande tour de compras", 1);
CALL cadastrarSubCategoria(33, "Leisure Plaza");

/* Categorias aplicáveis em serviços */

CALL cadastrarCategoria("Beleza e cuidado pessoal", "Serviços e lojas especializadas de beleza, higiene e cuidado pessoal; tatuagens; etc", 0);
CALL cadastrarSubCategoria(34, "Salão de beleza");
CALL cadastrarSubCategoria(34, "Pedicure");
CALL cadastrarSubCategoria(34, "Manicure");
CALL cadastrarSubCategoria(34, "SPA");
CALL cadastrarSubCategoria(34, "Salão de tatuagem");
CALL cadastrarSubCategoria(34, "Vitaminas e suplementos");
CALL cadastrarSubCategoria(34, "Barbearia");
CALL cadastrarSubCategoria(34, "Produtos naturais");
CALL cadastrarSubCategoria(34, "Depilação a laser");

CALL cadastrarCategoria("Medicina", "Serviços médicos", 0);
CALL cadastrarSubCategoria(35, "Clínica Geral");
CALL cadastrarSubCategoria(35, "Odontologia");
CALL cadastrarSubCategoria(35, "Oftalmologia");
CALL cadastrarSubCategoria(35, "Cardiovascular");

CALL cadastrarCategoria("Finanças", "Bancos e lotéricas para você cuidar do seu dinheiro com segurança", 1);
CALL cadastrarSubCategoria(36, "Banco");
CALL cadastrarSubCategoria(36, "Lotérica");
CALL cadastrarSubCategoria(36, "Agência de câmbio");

CALL cadastrarCategoria("Telefonia celular", "Operadoras de telefone", 1);
CALL cadastrarSubCategoria(37, "Operadora de telefonia celular");

CALL cadastrarCategoria("Agenciamento de viagens", "Agências de viagem", 1);
CALL cadastrarSubCategoria(38, "Agência de viagem");

/* Categoria aplicável a lojas */

CALL cadastrarCategoria("Esportes", "Artigos e objetos esportivos", 0);
CALL cadastrarSubCategoria(39, "Bolas");
CALL cadastrarSubCategoria(39, "Redes");
CALL cadastrarSubCategoria(39, "Raquetes");
CALL cadastrarSubCategoria(39, "Artigos personalizados");
CALL cadastrarSubCategoria(39, "Mesas de ping-pong");
CALL cadastrarSubCategoria(39, "Mesas de sinuca");

/* Categoria de restaurante */

CALL cadastrarCategoria("Comida italiana", "Desfrute da maravilhosa culinária italiana!", 1);
CALL cadastrarSubCategoria(40, "Italian Food");

CALL cadastrarCategoria("Comida árabe", "Se apaixone pela gastronomia árabe!", 1);
CALL cadastrarSubCategoria(41, "Arabic Food");

CALL cadastrarCategoria("Comida australiana", "Conheça as gostosuras da Austrália!", 1);
CALL cadastrarSubCategoria(42, "Australian Food");

CALL cadastrarCategoria("Comida mineira", "Ô trem bão de comida, sô!", 1);
CALL cadastrarSubCategoria(43, "Comida de Minas Gerais");

/* -- */

CALL cadastrarCategoria("Fotografia", "Estúdios e lojas de fotografia", 0);
CALL cadastrarSubCategoria(44, "Estúdio de fotografia");
CALL cadastrarSubCategoria(44, "Loja de fotografia");

CALL cadastrarCategoria("Esoterismo", "Lojas de produtos esotéricos", 0);
CALL cadastrarSubCategoria(45, "Índia");

CALL cadastrarCategoria("Construção", "Lojas de material de construção", 0);
CALL cadastrarSubCategoria(46, "Building");

CALL cadastrarCategoria("Lava-rápido", "Lojas que lavam seu carro num passe de mágica", 1);
CALL cadastrarSubCategoria(47, "Car-wash");

CALL cadastrarCategoria("Parquinho de diversões", "A criançada vai adorar!", 1);
CALL cadastrarSubCategoria(48, "Amusement Park");

CALL cadastrarUsuario("adm@email.com", "Administrator", "123", "adm", null);

/* OS DEVS DESSA PARADA AQUI */

CALL cadastrarUsuario("guilhermedjrdjrjan@gmail.com", "Guilherme Djrdjrjan", "123", "dev", null);
CALL cadastrarUsuario("dev@email.com", "Gabriel Santana", "123", "dev", null);

/* ------------------------- */

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

/* Ordem: SubCategoria -> Categoria */

CALL definirPreferencia("leandrokarmal@email.com", 0, 0); 
CALL definirPreferencia("leandrokarmal@email.com", 0, 1); 
CALL definirPreferencia("leandrokarmal@email.com", 0, 2); 
CALL definirPreferencia("leandrokarmal@email.com", 2, 1); 
CALL definirPreferencia("leandrokarmal@email.com", 6, 4); 
CALL definirPreferencia("leandrokarmal@email.com", 7, 4); 

CALL definirPreferencia("inocenciogoes@email.com", 1, 4); 
CALL definirPreferencia("inocenciogoes@email.com", 2, 4); 

CALL clientePrefere("leandrokarmal@email.com");
CALL clientePrefere("inocenciogoes@email.com");

CALL criarFeedback(5, "jonathanjoestar@email.com", "Os corredores são bem espaçosos, mas em alguns pontos não há piso tátil.", 3);
CALL criarFeedback(6, "jonathanjoestar@email.com", "Os corredores entre as mesas são muito apertados, eu sempre acabo esbarrando em algumas.", 2);
CALL criarFeedback(4, "thiagoklein@email.com", "O piso tátil da Besni está muito esburacado, e algumas partes faltam no meio do caminho, acabo me perdendo.", 2);
CALL criarFeedback(4, "reginaweber@email.com", "A Samsung está de parabéns! Amo seus celulares, e a loja é muito acessível!", 2);
CALL criarFeedback(3, "leandrokarmal@email.com", "Os elevadores são bem acessíveis, parabéns!", 4);
CALL criarFeedback(1, "leandrokarmal@email.com", "Os degraus que vão do segundo ao terceiro andar são muito altos, eu quase caí uma vez!", 1);
CALL criarFeedback(1, "leandrokarmal@email.com", "Alguns locais de transição entre escadas fixas têm piso tátil, mas outros não. Essa falta de padronização incomoda, quando eu esperava continuar com piso tátil, eles sumiram do nada.", 2);
CALL criarFeedback(2, "inocenciogoes@email.com", "Poderia haver uma sinalização, sonora ou tátil, que indicasse que o fim da escada rolante está perto.", 2);

CALL criarFeedback(0, "giornogiovanna@email.com", "Os banheiros são bem iluminados, o que é bem importante pra uma pessoa como eu, que tem baixa visão.", 5);
CALL criarFeedback(0, "fabianacruz@email.com", "As cabines dos banheiros são apertadas, e eles não têm piso tátil. Isso é um absurdo.", 1);


/* Não existe */
CALL cadastrarLocal(0, "Livraria Praiamar Shopping ",  1,  '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Praiamar", 0, "77ab0e0c-f928-11ea-eee1-0242ac120002");


CALL cadastrarLocal(0, "Livraria Saraiva",  3, '10:00:00', '20:00:00');
CALL cadastrarBox("Box 1 Saraiva", 1, "adeafe8a-f928-11ea-adc1-0242ac120002");

/* Não existem */
CALL cadastrarLocal(0, "Livraria Cultura",  2, '11:00:00', '18:59:59');
CALL cadastrarBox("Box 1 Livraria Cultura", 2, "7beafe8a-f928-11ea-adc1-0242ac120002");

CALL cadastrarLocal(0, "Livraria Nobel",  1, '10:00:00', '17:59:59');
CALL cadastrarBox("Box 1 Livraria Nobel", 3, "7deace8a-f928-11ea-adc1-0242ac120002");

CALL cadastrarLocal(0, "Livraria Martins Fontes",  1, '10:00:00', '22:59:59');	
CALL cadastrarBox("Box 1 Martins Fontes", 4, "fdeafe8a-f928-11ea-adc1-0242ac120002");

CALL cadastrarLocal(0, "Lojas Americanas",  0, '09:00:00', '22:30:00');
CALL cadastrarBox("Box 1 Americanas", 5, "7deaf908-f928-11ea-adc1-0242ac120002");

CALL cadastrarLocal(0, "Rihappy",  2, '12:00:00', '20:00:00');
CALL cadastrarBox("Box 1 Rihappy", 6, "7deafb92-f928-11ea-adc1-0242ac120002");


CALL cadastrarLocal(0, "Samsung",  1, '12:00:00', '20:00:00');
CALL cadastrarBox("Box 1 Samsung", 7, "7deafd68-f928-11ea-adc1-0242ac120002");

CALL cadastrarLocal(0, "MM Santos",  0, '10:00:00', '22:00:00');
CALL cadastrarBox("Box 1 MM Santos", 8, "7deaff8e-f928-11ea-adc1-0242ac120002");

CALL cadastrarLocal(0, "Life's Good LG",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Life's Good LG", 9, "7deb1582-f928-11ea-adc1-0242ac120002");

CALL cadastrarLocal(0, "Shoulder",  1, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Shoulder", 10, "7deb1582-f928-11ea-adc1-0242ac12000a");

CALL cadastrarLocal(0, "Havaianas",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Havaianas", 11, "7deb1582-f928-11ea-adc1-0242ac1200a2");

CALL cadastrarLocal(0, "Carmen Steffens",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Carmen Steffens", 12, "7deb1582-f928-11ea-adc1-0242aa120002");

CALL cadastrarLocal(0, "Sthill",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Sthill", 13, "7deb1582-f928-11ea-adc1-0242ac1a0002");

CALL cadastrarLocal(0, "SPOT",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 SPOT", 14, "7deb1582-f928-11ea-adc1-024bac120002");


CALL cadastrarLocal(0, "Mahogany",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Mahogany", 15, "7deb1582-f928-11ea-adca-0242ac120002");


CALL cadastrarLocal(0, "Program Moda",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Program Moda", 16, "7deb1582-f928-a1ea-adc1-0242ac120002");


CALL cadastrarLocal(0, "Belliótica",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Belliótica", 17,  "7deb1582-f928-11aa-adc1-0242ac120002");

CALL cadastrarLocal(0, "Mão Única",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Mão Única", 18, "7deb1582-fa28-11ea-adc1-0242ac120002");

CALL cadastrarLocal(0, "Pontal",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Pontal", 19, "7deb1592-fab8-11ea-adc1-0242ac120002");

CALL cadastrarLocal(0, "Stilleto",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Stilleto", 20, "7deb15a2-f928-11ea-adc1-0242ac120002");


CALL cadastrarLocal(0, "Clube Melissa",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Clube Melissa", 21, "adeb1582-f928-11ea-adc1-0242ac120002");


CALL cadastrarLocal(0, "Hawaii Surf Point",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Hawaii Surf Point", 22, "7ceb1582-f928-11ea-adc1-0242ac120002");

CALL cadastrarLocal(0, "RetrôMania",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 RetrôMania", 23, "7deb1582-fc28-11ea-adc1-0242ac120002");


CALL cadastrarLocal(0, "Reserva",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Reserva", 24, "7deb1582-f92c-11ea-adc1-0242ac120002");

CALL cadastrarLocal(0, "Polo Play",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Polo Play", 25, "7debf58a-fc28-11ea-adc1-0242ac120002");


CALL cadastrarLocal(0, "Maybelline NY",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Maybelline NY", 26, "7dcb1582-f928-11ea-adc1-0242ac120002");

CALL cadastrarLocal(0, "Arezzo",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Arezzo", 27, "7deb1582-f928-11ea-adc1-1242ac120002");


CALL cadastrarLocal(0, "Authentic Feet",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Authentic Feet", 28, "7deb1582-f928-11ea-2dc1-0242ac120002");

CALL cadastrarLocal(0, "Tennis Station",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Tennis Station", 29, "7deb1582-f928-11ea-a3c1-0242ac120002");

CALL cadastrarLocal(0, "Piticas",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Piticas", 30, "7deb1582-f928-11ea-adc1-02424c160002");

CALL cadastrarLocal(0, "Casa das Cuecas",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Casa das Cuecas", 31, "7deb1582-f928-11ea-5dc1-0262ac120002");

CALL cadastrarLocal(0, "Puket",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Puket", 32, "7deb1582-f928-11ea-adc1-0242ac1c0a02");

CALL cadastrarLocal(0, "Brooksfield",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Brooksfield", 33, "7deb1582-f928-11ea-adc1-024dac120002");

CALL cadastrarLocal(0, "Sapataria do Futuro",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Sapataria do Futuro", 34,  "7deb1582-f928-11ea-fdc1-0242ac120002");

CALL cadastrarLocal(0, "Coisas da Casa",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Coisas da Casa", 35, "7deb1582-fe28-11ea-adc1-0242ac120002");

CALL cadastrarLocal(0, "Simplesmente Bárbara",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Simplesmente Bárbara", 36, "7deb1582-f928-11ef-adc1-0242ac120002");

CALL cadastrarLocal(0, "Fast Shop",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Fast Shop", 37, "7deb1582-19e8-11ea-adc1-0242ac120002");

CALL cadastrarLocal(0, "A Esportiva",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 A Esportiva", 38, "1deb1582-f928-11ea-adc1-0242ac120002");

CALL cadastrarLocal(0, "Cacau Show",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Cacau Show", 39, "2deb1582-f928-11ea-adc1-0242ac120002");

CALL cadastrarLocal(0, "LOFT",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 LOFT", 40, "3deb1582-f928-11ea-adc1-0242ac120002");

CALL cadastrarLocal(0, "Relicário",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Relicário", 41, "4deb1582-f928-11ea-adc1-0242ac120002");

CALL cadastrarLocal(0, "Andisport Futebol",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Andisport Futebol", 42, "5deb1582-f928-11ea-adc1-0242ac120002");

CALL cadastrarLocal(0, "Le Postiche",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Le Postiche", 43, "6deb1582-f928-11ea-adc1-0242ac120002");

CALL cadastrarLocal(0, "Crocs",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Crocs", 44, "afeb1582-f928-11ea-adc1-0242ac120002");

CALL cadastrarLocal(0, "Criatiff",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Criatiff", 45, "faeb1582-f928-11ea-adc1-0242ac120002");

CALL cadastrarLocal(0, "Bluebeach",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Bluebeach", 46, "afeb1513-f928-11ea-adc1-0242ac120002");

CALL cadastrarLocal(0, "SIDE WALK",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 SIDE WALK", 47,  "bdeb1582-f928-11ea-adc1-0242ac120002");

CALL cadastrarLocal(0, "Usaflex",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Usaflex", 48, "cdeb1582-f928-11ea-adc1-0242ac120002");

CALL cadastrarLocal(0, "Beautybox",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Beautybox", 49, "ddeb1582-f928-11ea-adc1-0242ac120002");

CALL cadastrarLocal(0, "Kyowa",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Kyowa", 50, "edeb1582-f928-11ea-adc1-0242ac120002");

CALL cadastrarLocal(0, "Chilli Beans",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Chilli Beans", 51, "fdeb1582-f928-11ea-adc1-0242ac120002");

CALL cadastrarLocal(0, "Adcos",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Adcos", 52, "456a1582-f928-11ea-adc1-0242ac120002");

CALL cadastrarLocal(0, "PUC",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 PUC", 53, "7deba5ff-f928-11ea-adc1-0242ac120002");

CALL cadastrarLocal(0, "M&M Santos",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 M&M Santos", 54, "7ffabc82-f928-11ea-adc1-0242ac120002");

CALL cadastrarLocal(0, "Maze",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Maze", 55, "7deb1581-aaf8-11ea-adc1-0242ac120002");

CALL cadastrarLocal(7, "Estúdio de Sombrancelha",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Estúdio de Sombrancelha", 56, "faeb1582-f928-11ea-adc1-0242ac120005");

CALL cadastrarLocal(0, "Quem disse, Berenice?",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Quem disse, Berenice?", 57, "7deb1582-f928-11ea-adc1-0242ac120004");

CALL cadastrarLocal(7, "AngioCorpore",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 AngioCorpore", 58, "7deb1582-f928-11ea-adc1-0242ac120003");

CALL cadastrarLocal(0, "O'Clus Personal Ótica",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 O'Clus Personal Ótica", 59, "7deb1582-f928-11ea-adc1-0242ac1200a0");

CALL cadastrarLocal(0, "Fabiana Zaitun",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Fabiana Zaitun", 60, "7deb1582-f928-11ea-adc1-0242ac1200b0");

CALL cadastrarLocal(7, "Doctor Feet",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Doctor Feet", 61, "7deb1582-f928-11ea-adc1-0242ac120ba2");

CALL cadastrarLocal(0, "Nutty Bavarian",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Nutty Bavarian", 62,  "7deb1582-f928-11ea-adc1-0242ac12af04");

CALL cadastrarLocal(0, "L'Occitane en Provence",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 L'Occitane en Provence", 63, "7deb1582-f928-11ea-adc1-0242ac1e0002");

CALL cadastrarLocal(0, "Planet Girls",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Planet Girls", 64, "7deb1582-f928-11ea-adc1-0242ac150ab2");

CALL cadastrarLocal(0, "Kopenhagen",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Kopenhagen", 65, "7deb1582-f928-11ea-adc1-0242ac140202");

CALL cadastrarLocal(0, "Mr. CAT",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Mr. CAT", 66, "7deb1582-f928-11ea-adc1-0242ac120ffa");

CALL cadastrarLocal(0, "Club Pitanga",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Club Pitanga", 67, "7deb1582-f928-11ea-adc1-0242ac177002");

CALL cadastrarLocal(0, "Mega Body Store",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Mega Body Store", 68, "7deb1582-f928-11ea-adc1-0242ac120077");

CALL cadastrarLocal(0, "Regalo's",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Regalo's", 69, "7deb1582-f928-11ea-adc1-0242ac12077a");

CALL cadastrarLocal(0, "Relojoaria Zenith",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Relojoaria Zenith", 70, "7deb1582-f928-11ea-adc1-0242ba120502");

CALL cadastrarLocal(0, "John John",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 John John", 71, "7deb1582-f928-11ea-adc1-0242ac1200ff");

CALL cadastrarLocal(0, "Cia Marítima",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Cia Marítima", 72, "7deb1582-f928-11ea-adc1-0242ac12a002");

CALL cadastrarLocal(7, "Claro",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Claro", 73, "7deb00e2-f928-11ea-adc1-0242ac120002");

CALL cadastrarLocal(7, "Vivo",  1, '12:15:00', '20:45:00');
CALL cadastrarBox("Box 1 Vivo", 74,  "7deb022c-f928-11ea-adc1-0242ac120002");

CALL cadastrarLocal(7, "Oi",  2, '08:00:00', '23:30:00');
CALL cadastrarBox("Box 1 Oi", 75, "7deb033a-f928-11ea-adc1-0242ac120002");

CALL cadastrarLocal(7, "Nextel",  2, '08:00:00', '23:30:00');
CALL cadastrarBox("Box 1 Nextel", 76, "7deb033a-f928-11ea-adc1-ffa2ac120002");

CALL cadastrarLocal(0, "Bibi Calçados",  0, '10:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Bibi Calçados", 77, "7deb16ae-f928-11ea-adc1-0242ac120002");

CALL cadastrarLocal(1, "McDonald's Sorveteria",  0, '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 McDonald's Sorveteria", 78, "7deb06be-f928-11ea-adc1-0242ac120002");

CALL cadastrarLocal(7, "Banco Caixa",  0, '09:00:00', '22:30:00');
CALL cadastrarBox("Box 1 Banco Caixa", 79, "7deb1442-f928-11ea-adc1-0242ac120002");

CALL cadastrarLocal(7, "Banco Itaú",  0,  '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Banco Itaú", 80, "7deb132a-f928-11ea-adc1-0242ac120002");

CALL cadastrarLocal(7, "Banco do Brasil",  1,  '11:00:00', '21:30:00');
CALL cadastrarBox("Box 1 Banco do Brasil", 81, "ab7b132a-f928-11ea-adc1-0242ac120002");

CALL cadastrarLocal(7, "Banco Pan",  1,  '09:25:00', '21:00:00');
CALL cadastrarBox("Box 1 Banco Pan", 82, "7deb132a-f928-1e77-adc1-0242ac120002");

CALL cadastrarLocal(7, "Lotérica Praiamar Shopping",  0,  '09:25:00', '18:00:00');
CALL cadastrarBox("Box 1 Lotérica Praiamar Shopping", 83, "ac7b132a-f928-11ea-adc1-0242ac120002");

CALL cadastrarLocal(1, "Cafeteria Praiamar Shopping",  0,  '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Cafeteria Praiamar Shopping", 84, "7deb1244-f928-11ea-adc1-0242ac120002");

CALL cadastrarLocal(1, "Padaria Praiamar Shopping",  0,  '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Padaria Praiamar Shopping", 85, "7deb1104-f928-11ea-adc1-0242ac120002");

CALL cadastrarLocal(0, "Carrefour",  0,  '08:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Carrefour", 86, "7deb0fb0-f928-11ea-adc1-0242ac120002");

CALL cadastrarLocal(2, "Livraria Praiamar Shopping",  0,  '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Livraria Praiamar Shopping", 87, "7deb0e0c-f928-11ea-adc1-0242ac120002");

CALL cadastrarLocal(3, "Banheiro Praiamar Shopping | Térreo",  0,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Banheiro Praiamar Shopping | Térreo", 88, "7deb0cfe-f928-11ea-adc1-0242ac120002");

CALL cadastrarLocal(3, "Bebedouro Praiamar Shopping | Térreo",  0,  '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Bebedouro Praiamar Shopping | Térreo", 89, "7deb0ba0-f928-11ea-adc1-0242ac120002");

CALL cadastrarLocal(4, "Escada Fixa Praiamar Shopping | Térreo",  0,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Escada Fixa Praiamar Shopping | Térreo", 90, "7deb0cf1-a928-11ea-adc1-0242ac120002");

CALL cadastrarLocal(4, "Escada Rolante Praiamar Shopping | Térreo",  0,  '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Escada Rolante Praiamar Shopping | Térreo", 91, "7deb0ba1-a928-11ea-adc1-0242ac120002");

CALL cadastrarLocal(5, "Elevador Praiamar Shopping | Térreo",  0,  '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Elevador Praiamar Shopping | Térreo", 92, "7deb0ba0-f921-a1ea-adc1-0242ac120002");

CALL cadastrarLocal(0, "Adidas ",  1,  '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Adidas", 93, "7deb0bd0-f928-11ea-adc1-0242ac120092");

CALL cadastrarLocal(7, "CVC",  1,  '09:25:00', '20:35:00');
CALL cadastrarBox("Box 1 CVC", 94, "7deb0bd0-f9d8-11ea-adc1-0242ac120092");

CALL cadastrarLocal(0, "Apple",  1,  '09:25:00', '23:35:00');
CALL cadastrarBox("Box 1 Apple", 95, "7daa0bd0-f9d8-11ea-adc1-0242ac121092");

CALL cadastrarLocal(7, "Club Men Salon",  1,  '09:25:00', '23:35:00');
CALL cadastrarBox("Box 1 Club Men Salon", 96, "9daa0bd0-f9d8-11ea-adc1-0242ac121092");

CALL cadastrarLocal(0, "Riachuelo",  1,  '09:00:00', '23:35:00');
CALL cadastrarBox("Box 1 Riachuelo", 97, "9ffacad0-a1d8-19ea-adc1-0242bc121092");


CALL cadastrarLocal(0, "Renner",  1,  '09:30:00', '23:35:00');
CALL cadastrarBox("Box 1 Renner", 98, "9ffacad0-a1d8-1bea-adc1-0a42cd121092");

CALL cadastrarLocal(0, "Drogaria São Paulo",  1,  '08:35:00', '19:35:00');
CALL cadastrarBox("Box 1 Drogaria São Paulo", 99, "9ffacad0-a1a8-1bea-adc1-0a4aad121092");

CALL cadastrarLocal(0, "Dudalina",  1,  '08:35:00', '19:35:00');
CALL cadastrarBox("Box 1 Dudalina", 100, "9ffacad0-a1a8-1bea-fff1-0a4aad121092");

CALL cadastrarLocal(1, "Fom - Quiosque",  1,  '08:35:00', '19:35:00');
CALL cadastrarBox("Box 1 Fom - Quiosque", 101, "9afacad0-a1a8-1bfa-aab1-0a4aaf121090");

CALL cadastrarLocal(3, "Banheiro Praiamar Shopping | 1º Andar",  1,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Banheiro Praiamar Shopping | 1º Andar", 102, "9deb0cfe-f928-11ea-adc1-0242ac120002");

CALL cadastrarLocal(3, "Bebedouro Praiamar Shopping | 1º Andar",  1,  '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Bebedouro Praiamar Shopping | 1º Andar", 103, "adeb0ba0-f928-11ea-adc1-0242ac120002");

CALL cadastrarLocal(4, "Escada Fixa Praiamar Shopping | 1º Andar",  1,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Escada Fixa Praiamar Shopping | 1º Andar", 104, "adeb0cf1-a928-11ea-adc1-0242ac120002");

CALL cadastrarLocal(4, "Escada Rolante Praiamar Shopping | 1º Andar",  1,  '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Escada Rolante Praiamar Shopping | 1º Andar", 105, "adeb0ba1-a928-11ea-adc1-0242ac120002");

CALL cadastrarLocal(5, "Elevador Praiamar Shopping | 1º Andar",  1,  '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Elevador Praiamar Shopping | 1º Andar", 106, "adeb0ba0-f921-a1ea-adc1-0242ac120002");

CALL cadastrarLocal(0,  "Polishop",  2,  '08:35:00', '23:35:00');
CALL cadastrarBox("Box 1 Polishop", 107, "7affdbb0-a1a8-1afa-bdbf-ba4bff121091");

CALL cadastrarLocal(3, "Banheiro Praiamar Shopping | 2º Andar",  2,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Banheiro Praiamar Shopping | 2º Andar", 108, "9deb0cfe-f928-11ea-adc1-0242ac120012");

CALL cadastrarLocal(3, "Bebedouro Praiamar Shopping | 2º Andar",  2,  '09:25:00', '19:35:00');
CALL cadastrarBox("Bebedouro Praiamar Shopping | 2º Andar", 109,  "adeb0ba0-f928-11ea-adc1-0242ac120022");

CALL cadastrarLocal(4, "Escada Fixa Praiamar Shopping | 2º Andar",  2,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Escada Fixa Praiamar Shopping | 2º Andar", 110, "adeb0cf1-a928-11ea-adc1-0242ac120032");

CALL cadastrarLocal(4, "Escada Rolante Praiamar Shopping | 2º Andar",  2,  '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Escada Rolante Praiamar Shopping | 2º Andar", 111, "adeb0ba1-a928-11ea-adc1-0242ac120042");

CALL cadastrarLocal(5, "Elevador Praiamar Shopping | 2º Andar",  2,  '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Elevador Praiamar Shopping | 2º Andar", 112, "adeb0ba0-f921-a1ea-adc1-0242ac120052");



CALL cadastrarLocal(1, "McDonald's",  3,  '09:25:00', '23:35:00');
CALL cadastrarBox("Box 1 McDonald's", 113, "adeb0ba0-f921-affa-adc1-0242ac120052");

CALL cadastrarLocal(1, "Burger King",  3,  '09:25:00', '23:35:00');
CALL cadastrarBox("Box 1 Burger King", 114, "affb0ba0-f921-affa-adc1-0242ac120052");

CALL cadastrarLocal(1, "Subway",  3,  '09:25:00', '23:35:00');
CALL cadastrarBox("Box 1 Subway", 115, "ffacdba0-f921-affa-adc1-0242ac120052");

CALL cadastrarLocal(1, "Burger + | Rizzo",  3,  '09:25:00', '23:35:00');
CALL cadastrarBox("Box 1 Burger + | Rizzo", 116, "adeffba0-f921-affa-adc1-0242ac120052");

CALL cadastrarLocal(1, "Giraffa's",  3,  '09:25:00', '23:35:00');
CALL cadastrarBox("Box 1 Giraffa's", 117, "adefaaa0-f921-affa-adc1-0342ac120052");

CALL cadastrarLocal(1, "Rockabilly",  3,  '09:25:00', '23:35:00');
CALL cadastrarBox("Box 1 Rockabilly", 118, "adefab10-f921-affa-adc1-0342ac120052");

CALL cadastrarLocal(1,"Outback", 3, '09:25:00', '23:35:00');
CALL cadastrarBox("Box 1 Outback", 119, "adef2310-f9a1-eeb1-ee21-0342ac120052");

CALL cadastrarLocal(1,"Mania de Churrasco Prime Steak House", 3, '09:25:00', '23:35:00');
CALL cadastrarBox("Box 1 Mania de Churrasco Prime Steak House", 120, "adef2310-faf1-bdb1-a121-0342ac120052");

CALL cadastrarLocal(1,"Mania de Churrasco", 3, '09:25:00', '23:35:00');
CALL cadastrarBox("Box 1 Mania de Churrasco", 121, "adrf2310-faf1-bdb1-a121-0342ac120052");

CALL cadastrarLocal(1,"Spoleto", 3, '09:25:00', '23:35:00');
CALL cadastrarBox("Box 1 Spoleto", 122, "adef2310-f961-bdb1-a1ff-0342ac120052");

CALL cadastrarLocal(1,"Bom D+", 3, '09:25:00', '23:35:00');
CALL cadastrarBox("Box 1 Bom D+", 123, "adefc310-f921-bdb1-a121-0342ac120152");

CALL cadastrarLocal(1,"All Beef's", 3, '09:25:00', '23:35:00');
CALL cadastrarBox("Box 1 All Beef's", 124, "adef2310-c921-bdb1-a124-0342ac120052");

CALL cadastrarLocal(1,"Patroni Premium", 3, '09:25:00', '23:35:00');
CALL cadastrarBox("Box 1 Patroni Premium", 125, "adef2310-fa21-bdw1-a121-0342ac120052");

CALL cadastrarLocal(1,"Liliana Pasta & Pizza", 3, '09:25:00', '23:35:00');
CALL cadastrarBox("Box 1 Liliana Pasta & Pizza", 126, "adef231a-f521-bdb1-a121-0342ac120052");

CALL cadastrarLocal(1,"Máfia di Pasta", 3, '09:25:00', '23:35:00');
CALL cadastrarBox("Box 1 Máfia di Pasta", 127, "adef271a-f921-bdb1-a121-0342ac120052");

CALL cadastrarLocal(1,"Vivenda do Camarão", 3, '09:25:00', '23:35:00');
CALL cadastrarBox("Box 1 Vivenda do Camarão", 128, "adaf2310-f921-bdb2-a121-0342ac120052");

CALL cadastrarLocal(1,"Divino Fogão", 3, '09:25:00', '23:35:00');
CALL cadastrarBox("Box 1 Divino Fogão", 129, "adef2310-f921-adb1-a421-0342ac120052");

CALL cadastrarLocal(0,"Divino Grão", 3, '09:25:00', '23:35:00');
CALL cadastrarBox("Box 1 Divino Grão", 130, "adef2310-f921-adb1-a121-0342ac120057");

CALL cadastrarLocal(1,"Pizza Hut", 3, '09:25:00', '23:35:00');
CALL cadastrarBox("Box 1 Pizza Hut", 131, "adef2310-f928-bda1-a121-0342ac120052");

CALL cadastrarLocal(1,"Haru", 3, '09:25:00', '23:35:00');
CALL cadastrarBox("Box 1 Haru", 132, "adef2310-f921-bqa1-a121-0342ac120052");

CALL cadastrarLocal(1,"Gendai", 3, '09:25:00', '23:35:00');
CALL cadastrarBox("Box 1 Gendai", 133, "adef2310-f921-bda1-a161-0342ac120052");

CALL cadastrarLocal(1,"Saluá Esfihas", 3, '09:25:00', '23:35:00');
CALL cadastrarBox("Box 1 Saluá Esfihas", 134, "adef2310-f921-bda1-a121-0342sc120052");

CALL cadastrarLocal(1,"Tottene", 3, '09:25:00', '23:35:00');
CALL cadastrarBox("Box 1 Tottene", 135,  "adef2310-f921-bda1-a121-0362ac120052");

CALL cadastrarLocal(1,"Bacio di Latte", 3, '09:25:00', '23:35:00');
CALL cadastrarBox("Box 1 Bacio di Latte", 136, "adef2310-f921-bda1-a131-0342ac120052");

CALL cadastrarLocal(3, "Banheiro Praiamar Shopping | 3º Andar",  3,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Banheiro Praiamar Shopping | 3º Andar", 137, "7deb0cfe-f928-11ea-adc1-0242ac1200a9");

CALL cadastrarLocal(3, "Bebedouro Praiamar Shopping | 3º Andar",  3,  '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Bebedouro Praiamar Shopping | 3º Andar", 138, "7deb0ba0-f928-11ea-adc1-0242ac120087");

CALL cadastrarLocal(4, "Escada Fixa Praiamar Shopping | 3º Andar",  3,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Escada Fixa Praiamar Shopping | 3º Andar", 139, "7f9b0cfa-a928-11ea-adc1-0242ac120089");

CALL cadastrarLocal(4, "Escada Rolante Praiamar Shopping | 3º Andar",  3,  '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Escada Rolante Praiamar Shopping | 3º Andar", 140, "7deb0ba1-a928-11ea-adc1-0242ac1200f9");

CALL cadastrarLocal(5, "Elevador Praiamar Shopping | 3º Andar",  3,  '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Elevador Praiamar Shopping | 3º Andar", 141, "7deb0ba0-f921-a1ea-adc1-0242ac120092");

CALL cadastrarLocal(2, "Cinemark | Recepção",  4,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Cinemark | Recepção", 142, "8deafff1-f928-11ea-adc1-0242ac120013");

CALL cadastrarLocal(2, "Cinemark | Sala 1",  4,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Cinemark | Sala 1", 143, "8aeafcfe-f928-11ea-adc1-0242ac120013");

CALL cadastrarLocal(2, "Cinemark | Sala 2",  4,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Cinemark | Sala 2", 144, "8beafcfe-f928-11ea-adc1-0242ac120013");

CALL cadastrarLocal(2, "Cinemark | Sala 3",  4,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Cinemark | Sala 3", 145, "8ceafcfe-f928-11ea-adc1-0242ac120013");

CALL cadastrarLocal(2, "Cinemark | Sala 4",  4,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Cinemark | Sala 4", 146, "8deafcfe-f928-11ea-adc1-0242ac120013");

CALL cadastrarLocal(2, "Cinemark | Sala 5",  4,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Cinemark | Sala 5", 147, "8eeafcfe-f928-11ea-adc1-0242ac120013");

CALL cadastrarLocal(2, "Cinemark | Sala 6",  4,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Cinemark | Sala 6", 148, "8feafcfe-f928-11ea-adc1-0242ac120013");

CALL cadastrarLocal(2, "Cinemark | Sala 7",  4,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Cinemark | Sala 7", 149, "8e1afcfe-f928-11ea-adc1-0242ac120013");

CALL cadastrarLocal(2, "Cinemark | Sala 8",  4,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Cinemark | Sala 8", 150, "8dsafcfe-f928-11ea-adc1-0242ac120013");

CALL cadastrarLocal(2, "Cinemark | Sala 9",  4,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Cinemark | Sala 9", 151, "8d4afcfe-f928-11ea-adc1-0242ac120013");

CALL cadastrarLocal(2, "Cinemark | Sala 10",  4,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Cinemark | Sala 10", 152, "85eafcfe-f928-11ea-adc1-0242ac120013");

CALL cadastrarLocal(3, "Banheiro Praiamar Shopping | 4º Andar",  4,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Banheiro Praiamar Shopping | 4º Andar", 153, "8deb0cfe-f928-11ea-adc1-0242ac120013");

CALL cadastrarLocal(3, "Bebedouro Praiamar Shopping | 4º Andar",  4,  '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Bebedouro Praiamar Shopping | 4º Andar", 154, "8deb0ba0-f928-11ea-adc1-0242ac120023");

CALL cadastrarLocal(4, "Escada Fixa Praiamar Shopping | 4º Andar",  4,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Escada Fixa Praiamar Shopping | 4º Andar", 155, "8deb0cf1-a928-11ea-adc1-0242ac120032");

CALL cadastrarLocal(4, "Escada Rolante Praiamar Shopping | 4º Andar",  4,  '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Escada Rolante Praiamar Shopping | 4º Andar", 156, "8deb0ba1-a928-11ea-adc1-0242ac130042");

CALL cadastrarLocal(5, "Elevador Praiamar Shopping | 4º Andar",  4,  '09:25:00', '19:35:00');
CALL cadastrarBox("Box 1 Elevador Praiamar Shopping | 4º Andar", 157, "8deb0ba0-f921-a1ea-adc1-0242ac120053");

CALL cadastrarLocal(6, "Praça de Alimentação", 3, '09:00:00', '23:00:00');
CALL cadastrarBox("Box 1 Praça de Alimentação", 158, "8deb0ba0-f921-a1ea-adc1-02bfac120053");

CALL cadastrarLocal(6, "Praça de Descanso (com Wi-Fi)", 4, '09:00:00', '23:00:00');
CALL cadastrarBox("Box 1 Praça de Descanso (com Wi-Fi)", 159, "81eb0ba0-f921-a1ea-adc1-02bfac120053");

CALL cadastrarLocal(4, "Escada Fixa Praiamar Shopping | 3º Andar",  3,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Escada Fixa Praiamar Shopping | 3º Andar", 160, "adeb0cf1-a928-11ea-adc1-0942ac120032");

CALL cadastrarLocal(0, "Santa Lolla",  0,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Santa Lolla", 161, "adeb0cf1-a928-12ea-adc1-0942ac120032");

CALL cadastrarLocal(0, "Camisaria Colombo",  0,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Camisaria Colombo", 162, "adeb0cf1-a528-11ea-adc1-0942ac120032");

CALL cadastrarLocal(0, "Colcci",  1,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Colcci", 163, "aseb0cf1-a928-11ea-adc1-0942ac120032");

CALL cadastrarLocal(0, "Calvin Klein", 1,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Calvin Klein", 164, "aaeb0cf1-a928-11ea-adc1-0942ac120032");

CALL cadastrarLocal(0, "M&M Gamer",  0,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 M&M Gamer", 165, "axeb0cf1-a928-11ea-adc1-0942ac120032");

CALL cadastrarLocal(0, "Alhambra",  2,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Alhambra", 166, "adeb0cf1-a928-11ea-acc1-0942ac120032");

CALL cadastrarLocal(0, "Anacapri", 1,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Anacapri", 167, "adeb0cf1-a928-11ea-abc1-0942ac120032");

CALL cadastrarLocal(7, "Banco 24 Horas Tecbanc (Caixa Eletrônico)",  2,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Banco 24 Horas Tecbanc (Caixa Eletrônico)", 168, "adeb0sf1-a928-11ea-adc1-0942ac120032");

CALL cadastrarLocal(0, "Bio Mundo", 1,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Bio Mundo", 169, "adeb0cf1-a928-11ee-adc1-0942ac120032");


CALL cadastrarLocal(0, "Brasil Cacau",  0,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Brasil Cacau", 170, "adeb0cf1-a924-11ea-adc1-0942ac120032");

CALL cadastrarLocal(0, "Camicado",  1,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Camicado", 171, "adeb0cf1-a928-11eq-adc1-0942ac120032");

CALL cadastrarLocal(0, "Capodarte",  0,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Capodarte", 172, "adeb0cf1-a928-11xa-adc1-0942ac120032");

CALL cadastrarLocal(0, "Caravella",  1,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Caravella", 173, "adeb0cf1-a928-11ea-aoc1-0942ac120032");

CALL cadastrarLocal(7, "Casa de Câmbio",  0,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Casa de Câmbio", 174, "adeb0cf1-a928-11ha-adc1-0942ac120032");

CALL cadastrarLocal(0, "Deny Sports",  0,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Deny Sports", 175, "adex0cf1-a928-11ea-adc1-0942ac120032");

CALL cadastrarLocal(0, "Dhemy",  1,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Dhemy", 176, "adeb0cf1-a928-11ca-adc1-0942ac120032");

CALL cadastrarLocal(7, "Espaço Laser",  0,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Espaço Laser", 177, "adeb0cf1-a928-11en-adc1-0942ac120032");

CALL cadastrarLocal(0, "Filtros Europa",  0,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Filtros Europa", 178, "adeb0cf1-a928-11ja-adc1-0942ac120032");

CALL cadastrarLocal(0, "First Class",  2,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 First Class", 179, "adeb0cf1-a928-11eç-adc1-0942ac120032");

CALL cadastrarLocal(0, "Follow up",  0,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Follow up", 180, "adeb0cf1-a928-11ez-adc1-0942ac120032");

CALL cadastrarLocal(0, "Fulgore",  1,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Fulgore", 181, "adeb0cf1-a928-11ea-adc1-0942ac125032");

CALL cadastrarLocal(0, "Garbo",  0,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Garbo", 182, "adeb0cf1-a928-11ea-adc1-0942ac123032");

CALL cadastrarLocal(0, "Gomes",  1,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Gomes", 183, "adzb0cf1-a927-11ea-adc1-0242ac120032");

CALL cadastrarLocal(0, "Granado",  1,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Granado", 184, "adeb0cf2-a928-11ea-adc1-0942ac120032");

CALL cadastrarLocal(0, "Hering Kids",  0,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Hering Kids", 185, "adeb0cf3-a928-11ea-adc1-0942ac120032");

CALL cadastrarLocal(0, "Hering Store",  1,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Hering Store", 186, "adeb0cf4-a928-11ea-adc1-0942ac120032");

CALL cadastrarLocal(0, "Hope",  0,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Hope", 187, "adeb0cf5-a928-11ea-adc1-0942ac120032");

CALL cadastrarLocal(0, "Hot Water",  1,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Hot Water", 188, "adeb0cf6-a928-11ea-adc1-0942ac120032");

CALL cadastrarLocal(0, "House",  0,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 House", 189, "adeb0cf7-a928-11ea-adc1-0942ac120032");

CALL cadastrarLocal(0, "Imaginarium",  1,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Imaginarium", 190, "adeb0cf8-a928-11ea-adc1-0942ac120032");

CALL cadastrarLocal(0, "Intimissimi",  0,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Intimissimi", 191, "adeb0cf9-a928-11ea-adc1-0942ac120032");

CALL cadastrarLocal(0, "iPlace",  2,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 iPlace", 192, "sdeb0cf1-a928-11ea-adc1-0942ac120032");

CALL cadastrarLocal(0, "Kallan",  1,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Kallan", 193, "adjb0cf1-a928-11ea-adc1-0942ac120032");

CALL cadastrarLocal(0, "Kanto Kent",  0,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Kanto Kent", 194, "aoeb0cf1-a928-11ea-adc1-0942ac120032");

CALL cadastrarLocal(0, "Kidstok",  0,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Kidstok", 195, "adea0cf1-a928-11ea-adc1-0942ac120032");

CALL cadastrarLocal(0, "Lacoste",  0,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Lacoste", 196, "aqeb0cf1-a928-11ea-adc1-0942ac120032");

CALL cadastrarLocal(0, "Le Lis Blanc",  2,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Le Lis Blanc", 197,  "areb0cf1-a928-11ea-adc1-0942ac120032");

CALL cadastrarLocal(0, "Levi's",  2,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Levi's", 198, "adib0cf1-a928-11ea-adc1-0942ac120032");

CALL cadastrarLocal(0, "Lez a Lez",  1,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Lez a Lez", 199, "adeb5cf1-a928-11ea-adc1-0942ac120032");

CALL cadastrarLocal(0, "Lilica & Tigor",  1,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Lilica & Tigor", 200, "ad2b0cf1-a928-11ea-adc1-0942ac120032");

CALL cadastrarLocal(0, "Lindt",  1,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Lindt", 201, "adeb0tf1-a928-11ea-adc1-0942ac120032");

CALL cadastrarLocal(0, "Lupo",  0,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Lupo", 202, "adeb0ci1-a928-11ea-adc1-0942ac120032");

CALL cadastrarLocal(0, "Marcia Mello",  2,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Marcia Mello", 203, "adpb0cf1-a928-11ea-adc1-0942ac120032");

CALL cadastrarLocal(7, "Marisorte Loterias",  0,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Marisorte Loterias", 204, "aweb0cf1-a928-11ea-adc1-0942ac120032");

CALL cadastrarLocal(0, "Maxxi Color",  0,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Maxxi Color", 205, "xdeb0cf1-a928-12ea-adc1-0942ac120032");

CALL cadastrarLocal(0, "Mendes Tur",  0,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Mendes Tur", 206, "adeb0cf1-a928-13ea-adc1-0942ac120032");

CALL cadastrarLocal(0, "Miró",  0,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Miró", 207, "adeb0cf1-a928-14ea-adc1-0942ac120032");

CALL cadastrarLocal(0, "MMartan",  1,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 MMartan", 208, "adeb0cf1-a928-15ea-adc1-0942ac120032");

CALL cadastrarLocal(0, "Monte Carlo",  1,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Monte Carlo", 209, "adeb0cf1-a928-16ea-adc1-0942ac120032");

CALL cadastrarLocal(0, "Morana",  0,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Morana", 210, "adeb0cf1-a928-17ea-adc1-0942ac120032");

CALL cadastrarLocal(0, "Murabak",  0,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Murabak", 211, "adeb0cf1-a928-18ea-adc1-0942ac120032");

CALL cadastrarLocal(7, "Náutica Tattoo",  0, '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Náutica Tatto", 212, "adeb0cf1-a928-19ea-adc1-0942ac120032");

CALL cadastrarLocal(0, "O Boticário",  0,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 O Boticário", 213,  "adeb0cf1-a928-20ea-adc1-0942ac120032");

CALL cadastrarLocal(0, "Organza",  0,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Organza", 214, "adeb0cf1-a928-24ea-adc1-0942ac120032");

CALL cadastrarLocal(0, "Ortobom",  0,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Ortobom", 215, "adeb0cf1-a928-32ea-adc1-0942ac120032");

CALL cadastrarLocal(0, "Ótica IX",  0,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Ótica IX", 216, "adeb0cf1-a928-34ea-adc1-0942ac120032");

CALL cadastrarLocal(0, "Ótica Martins Zeiss",  1,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Ótica Martins Zeiss", 217, "adeb0cf1-a978-11ea-adc1-0942ac120032");

CALL cadastrarLocal(0, "Ótica Occhiali",  0,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Ótica Occhiali", 218, "adxb0cf1-a928-18ea-adc1-0942ac120032");

CALL cadastrarLocal(0, "Óticas Carol",  1,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Óticas Carol", 219, "axeb0cf1-a928-19ea-adc1-0942ac120032");

CALL cadastrarLocal(0, "Kidz Shoe Store",  0,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Kidz Shoe Store", 220, "adzb0cf1-a928-11eu-adc1-0942ac120032");

CALL cadastrarLocal(0, "Pandora",  1,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Pandora", 221, "adeb0cf1-a928-11ea-adc2-0942ac120032");

CALL cadastrarLocal(0, "Pink",  1,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Pink", 222, "adeb0ff1-a928-11ea-adc1-0942ac120032");

CALL cadastrarLocal(0, "Planeta Café",  1,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Planeta Café", 223, "ader0cf1-a928-11ra-adc1-0942ac120032");

CALL cadastrarLocal(0, "Quiksilver",  1,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Quiksilver", 224, "adeb0sf1-a928-11ea-adb1-0942ac120032");

CALL cadastrarLocal(0, "Radio Nacional",  1,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Radio Nacional", 225, "adxb0cf1-a9t8-11ea-adc1-0942ac120032");

CALL cadastrarLocal(0, "Raquel Bijoux",  1,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Raquel Bijoux", 226, "adib7cf1-a928-11ea-adc1-0942ac120032");

CALL cadastrarLocal(1, "Rei do Mate",  1,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Rei do Mate", 227, "adeb2cf1-a928-12ea-adc1-0942ac120032");

CALL cadastrarLocal(0, "Schutz",  1,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Schutz", 228, "adeb0cf1-a923-11ea-ajc1-0942ac120032");

CALL cadastrarLocal(0, "Sodimac Dicico",  2,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Sodimac Dicico", 229, "adeb9cf2-a928-11ea-adc1-0942ac120032");

CALL cadastrarLocal(1, "Starbucks Coffee",  0,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Starbucks Coffee", 230, "adeb0ce1-a928-11ea-adc1-0942ac120032");

CALL cadastrarLocal(0, "Stroke",  1,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Stroke", 231, "adeb0cf1-a928-11eb-adc1-0942ac120032");

CALL cadastrarLocal(0, "Swarovski",  0,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Swarovski", 232, "adeb0cf1-a928-113a-adc1-0942ac120032");

CALL cadastrarLocal(0, "The Body Shop",  2,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 The Body Shop", 233, "adeb0cf1-a918-11ea-adc1-0942ac120032");

CALL cadastrarLocal(7, "TIM",  0,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 TIM", 234, "adeb0cf1-a928-11ea-adl1-0942ac120032");

CALL cadastrarLocal(0, "Tip Top",  1,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Tip Top", 235, "adeb0cf1-a928-11ew-adc1-0942ac120032");

CALL cadastrarLocal(7, "Top Car",  -3,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Top Car", 236, "adeb0cf1-a928-11el-adc1-0942ac120032");

CALL cadastrarLocal(0, "Tottene",  1,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Tottene", 237,  "adeb0cf1-b928-11ea-adc1-0942ac120032");

CALL cadastrarLocal(0, "Track & Field",  1,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Track & Field", 238, "adeb0cf1-c928-11ea-adc1-0942ac120032");

CALL cadastrarLocal(0, "Valisere",  1,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Valisere", 239, "adeb0cf1-d928-11ea-adc1-0942ac120032");

CALL cadastrarLocal(0, "Vermont",  1,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Vermont", 240, "adeb0cf1-e928-11ea-adc1-0942ac120032");

CALL cadastrarLocal(0, "Victor Hugo",  1,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Victor Hugo", 241,  "adeb0cf1-f928-11ea-adc1-0942ac120032");

CALL cadastrarLocal(0, "Vim Vi Venci",  0,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Vim Vi Venvi", 242,  "adeb0cf1-g928-11ea-adc1-0942ac120032");

CALL cadastrarLocal(0, "Vivara",  0,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Vivara", 243, "adeb0cf1-h928-11ea-adc1-0942ac120032");

CALL cadastrarLocal(0, "Viviane Puccinelli",  1,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Viviane Puccinelli", 244, "adeb0cf1-i928-11ea-adc1-0942ac120032");

CALL cadastrarLocal(7, "YellowCom Vivo",  0,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 YellowCom Vivo", 245, "adeb0cf1-j928-11ea-adc1-0942ac120032");

CALL cadastrarLocal(7, "You Play Space",  2,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 You Play Space", 246, "adeb0cf1-k928-11ea-adc1-0942ac120032");

CALL cadastrarLocal(0, "Yuppie",  1,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Yuppie", 247, "adeb0cf1-l928-11ea-adc1-0942ac120032");

CALL cadastrarLocal(0, "Zelo",  0,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Zelo", 248, "adeb0cf1-n928-11ea-adc1-0942ac120032");

CALL cadastrarLocal(3, "Berçário Praiamar Shopping | Térreo",  0,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Berçário Praiamar Shopping | Térreo", 249, "adeb0cf1-n928-11ea-adc1-8942ac120032");

CALL cadastrarLocal(3, "Berçário Praiamar Shopping | 1º Andar",  1,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Berçário Praiamar Shopping | 1º Andar", 250, "adeb0cf1-n928-11ea-adc1-2942ac120032");

CALL cadastrarLocal(3, "Berçário Praiamar Shopping | 2º Andar",  2,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Berçário Praiamar Shopping | 2º Andar", 251, "adeb0cf1-n928-11ea-adc1-1942ac120032");

CALL cadastrarLocal(3, "Berçário Praiamar Shopping | 3º Andar",  3,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Berçário Praiamar Shopping | 3º Andar", 252, "adeb0cf1-n928-11ea-adc1-5942ac120032");

CALL cadastrarLocal(3, "Berçário Praiamar Shopping | 4º Andar",  4,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box 1 Berçário Praiamar Shopping | 4º Andar", 253, "adeb0cf1-n928-11ea-avc1-4942ac120032");

CALL cadastrarLocal(3, "Telefone 1 Praiamar Shopping",  3,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box Telefone 1 Praiamar Shopping", 254, "adeb0cf1-n928-13ea-adc1-8942ac120032");

CALL cadastrarLocal(3, "Telefone 2 Praiamar Shopping",  3,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box Telefone 2 Praiamar Shopping ", 255, "adeb0cf1-n928-15ea-adc1-8942ac120032");

CALL cadastrarLocal(3, "Telefone 3 Praiamar Shopping",  3,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box Telefone 3 Praiamar Shopping", 256, "adeb0cf1-n928-17ea-adc1-8942ac120032");

CALL cadastrarLocal(3, "Telefone 4 Praiamar Shopping",  3,  '08:00:00', '23:59:59');
CALL cadastrarBox("Box Telefone 4 Praiamar Shopping", 257, "adeb0cf1-n928-19ea-adc1-8942ac120032");

CALL cadastrarLocal(1, "Madero",  2,  '18:00:00', '22:00:00');
CALL cadastrarBox("Box 1 Madero", 258, "adeb0cf1-n928-19ea-adc2-8942ac120032");

CALL cadastrarLocal(8, "Entrada/Saída Alexandre Martins",  0,  '10:00:00', '22:00:00');
CALL cadastrarBox("Entrada/Saída Alexandre Martins", 259, "adeb0cf1-f928-19ea-adc2-8942ac120032");

CALL cadastrarLocal(8, "Entrada/Saída Guaiaó",  0,  '10:00:00', '22:00:00');
CALL cadastrarBox("Entrada/Saída Guaiaó", 260, "adeb0cf1-n928-19ea-adm2-8942ac120032");

CALL cadastrarLocal(8, "Entrada/Saída Carrefour",  0,  '10:00:00', '22:00:00');
CALL cadastrarBox("Entrada/Saída Carrefour", 261, "adeb0cf1-n928-76ea-adc2-8942ac120032");

CALL cadastrarLocal(8, "Entrada/Saída Praiamar Corporate",  4,  '10:00:00', '22:00:00');
CALL cadastrarBox("Entrada/Saída Praiamar Corporate", 262, "adeb2cf1-n928-19ea-adc2-8942ac120032");

/* Definir horário alternativo das entradas: no domingo
o período de funcionamento do shopping é diferente */

CALL defHorarioAlternativoLocal(259, 0, '11:00:00', '22:00:00');
CALL defHorarioAlternativoLocal(260, 0, '11:00:00', '22:00:00');
CALL defHorarioAlternativoLocal(261, 0, '11:00:00', '22:00:00');
CALL defHorarioAlternativoLocal(262, 0, '11:00:00', '22:00:00');

/* Exibir a configuração de horário (dia + início + fim) que foi adicionada, pois não existia */

SELECT 
    *
from
    horario
where
    cd_dia_semana = 0
        and hr_abertura = '11:00:00'
        and hr_fechamento = '22:00:00';

/* Verificar se as entradas, no dia de hoje (suponhamos que seja domingo),
possuem um horário de funcionamento diferente/alternativo.
Se possuírem, retornar esses horários. */

CALL buscarHorarioAlternativoLocal(259, 0);
CALL buscarHorarioAlternativoLocal(260, 0);
CALL buscarHorarioAlternativoLocal(261, 0);
CALL buscarHorarioAlternativoLocal(262, 0);

/* Selects de auxílio */

/*SELECT 
    *
from
    local;
SELECT 
    *
from
    categoria;
SELECT 
    cd_categoria, cd_sub_categoria, nm_sub_categoria
from
    sub_categoria
group by cd_categoria , cd_sub_categoria;

SELECT nm_local from local where nm_local LIKE "% %";*/

/* qw */

/* Livrarias Praiamar, Saraiva, Cultura, Nobel e Martins Fontes */

CALL defSubCategoriaLocal(0, 9, 0);
CALL defSubCategoriaLocal(1, 9, 0);
CALL defSubCategoriaLocal(2, 9, 0);
CALL defSubCategoriaLocal(3, 9, 0);
CALL defSubCategoriaLocal(4, 9, 0);

/* Lojas Americanas */

CALL defSubCategoriaLocal(5, 0, 0);
CALL defSubCategoriaLocal(5, 0, 1);
CALL defSubCategoriaLocal(5, 0, 2);
CALL defSubCategoriaLocal(5, 1, 0);
CALL defSubCategoriaLocal(5, 1, 1);
CALL defSubCategoriaLocal(5, 1, 2);
CALL defSubCategoriaLocal(5, 1, 3);
CALL defSubCategoriaLocal(5, 1, 4);
CALL defSubCategoriaLocal(5, 1, 5);
CALL defSubCategoriaLocal(5, 1, 6);
CALL defSubCategoriaLocal(5, 1, 7);
CALL defSubCategoriaLocal(5, 1, 8);
CALL defSubCategoriaLocal(5, 2, 0);
CALL defSubCategoriaLocal(5, 3, 0);
CALL defSubCategoriaLocal(5, 3, 2);
CALL defSubCategoriaLocal(5, 4, 0);
CALL defSubCategoriaLocal(5, 4, 1);
CALL defSubCategoriaLocal(5, 4, 2);
CALL defSubCategoriaLocal(5, 4, 3);
CALL defSubCategoriaLocal(5, 4, 4);
CALL defSubCategoriaLocal(5, 4, 8);
CALL defSubCategoriaLocal(5, 4, 9);
CALL defSubCategoriaLocal(5, 4, 10);
CALL defSubCategoriaLocal(5, 4, 11);
CALL defSubCategoriaLocal(5, 4, 12);
CALL defSubCategoriaLocal(5, 4, 13);
CALL defSubCategoriaLocal(5, 4, 14);
CALL defSubCategoriaLocal(5, 6, 0);
CALL defSubCategoriaLocal(5, 6, 1);
CALL defSubCategoriaLocal(5, 6, 2);
CALL defSubCategoriaLocal(5, 6, 3);
CALL defSubCategoriaLocal(5, 9, 0);
CALL defSubCategoriaLocal(5, 13, 0);


/* Hihappy */
CALL defSubCategoriaLocal(6, 1,0);
CALL defSubCategoriaLocal(6, 1,1);
CALL defSubCategoriaLocal(6, 1,2);
CALL defSubCategoriaLocal(6, 1,4);
CALL defSubCategoriaLocal(6, 1,5);
CALL defSubCategoriaLocal(6, 1,6);
CALL defSubCategoriaLocal(6, 6,2);
CALL defSubCategoriaLocal(6, 6,3);
CALL defSubCategoriaLocal(6, 6,4);
CALL defSubCategoriaLocal(6, 9,1);
CALL defSubCategoriaLocal(6, 9,2);

/* Samsung */
CALL defSubCategoriaLocal(7, 0,0);
CALL defSubCategoriaLocal(7, 2,0);

/*MM Santos */
CALL defSubCategoriaLocal(8, 0,0);
CALL defSubCategoriaLocal(8, 0,1);
CALL defSubCategoriaLocal(8, 0,2);
CALL defSubCategoriaLocal(8, 1,7);
CALL defSubCategoriaLocal(8, 1,8);
CALL defSubCategoriaLocal(8, 2,0);

/*Life's Good LG*/ 

CALL defSubCategoriaLocal(9, 0,0);
CALL defSubCategoriaLocal(9, 0,1);

/* Shoulder */

CALL defSubCategoriaLocal(10, 4, 1);
CALL defSubCategoriaLocal(10, 4, 2);

/* Havaianas */

CALL defSubCategoriaLocal(11, 4, 0);
CALL defSubCategoriaLocal(11, 4, 8);

/* Carmen Steffens */ 

CALL defSubCategoriaLocal(12, 4, 0);
CALL defSubCategoriaLocal(12, 4, 1);
CALL defSubCategoriaLocal(12, 4, 2);

/* Sthill */

CALL defSubCategoriaLocal(13, 4, 0);
CALL defSubCategoriaLocal(13, 4, 1);
CALL defSubCategoriaLocal(13, 4, 2);
CALL defSubCategoriaLocal(13, 4, 4);
CALL defSubCategoriaLocal(13, 4, 6);
CALL defSubCategoriaLocal(13, 4, 7);
CALL defSubCategoriaLocal(13, 4, 9);
CALL defSubCategoriaLocal(13, 5, 1);

/* SPOT */

CALL defSubCategoriaLocal(14, 4, 0);
CALL defSubCategoriaLocal(14, 4, 4);
CALL defSubCategoriaLocal(14, 4, 9);

/* Mahogany */

CALL defSubCategoriaLocal(15, 4, 11);
CALL defSubCategoriaLocal(15, 4, 12);
CALL defSubCategoriaLocal(15, 4, 13);

/* Program Moda */ 

CALL defSubCategoriaLocal(16, 4, 1);
CALL defSubCategoriaLocal(16, 4, 2);

/* Belliótica */

CALL defSubCategoriaLocal(17, 35, 2);

/* Mão Única */

CALL defSubCategoriaLocal(18, 1, 0);
CALL defSubCategoriaLocal(18, 1, 1);
CALL defSubCategoriaLocal(18, 1, 2);
CALL defSubCategoriaLocal(18, 1, 4);
CALL defSubCategoriaLocal(18, 1, 5);
CALL defSubCategoriaLocal(18, 1, 6);
CALL defSubCategoriaLocal(18, 5, 0);
CALL defSubCategoriaLocal(18, 5, 1);
CALL defSubCategoriaLocal(18, 5, 2);
CALL defSubCategoriaLocal(18, 5, 3);
CALL defSubCategoriaLocal(18, 6,2);
CALL defSubCategoriaLocal(18, 6,3);
CALL defSubCategoriaLocal(18, 6,4);
CALL defSubCategoriaLocal(18, 9, 1);
CALL defSubCategoriaLocal(18, 9, 2);

/* Pontal */

CALL defSubCategoriaLocal(19, 4, 0);
CALL defSubCategoriaLocal(19, 4, 4);
CALL defSubCategoriaLocal(19, 4, 7);

/* Stilleto */

CALL defSubCategoriaLocal(20, 4, 0);
CALL defSubCategoriaLocal(20, 4, 4);
CALL defSubCategoriaLocal(20, 4, 10);

/* Clube Melissa */ 

CALL defSubCategoriaLocal(21, 4, 0);

/* Hawaii Surf Point */ 

CALL defSubCategoriaLocal(22, 4, 0);
CALL defSubCategoriaLocal(22, 4, 4);
CALL defSubCategoriaLocal(22, 4, 7);
CALL defSubCategoriaLocal(22, 4, 8);
CALL defSubCategoriaLocal(22, 4, 9);

/* RetrôMania */

CALL defSubCategoriaLocal(23, 4, 1);

/* Reserva */

CALL defSubCategoriaLocal(24, 4, 0);
CALL defSubCategoriaLocal(24, 4, 1);
CALL defSubCategoriaLocal(24, 4, 2);
CALL defSubCategoriaLocal(24, 4, 4);

/* Polo Play */

CALL defSubCategoriaLocal(25, 4, 1);
CALL defSubCategoriaLocal(25, 4, 2);
CALL defSubCategoriaLocal(25, 4, 3);

/* Maybelline NY */

CALL defSubCategoriaLocal(26, 4, 11);
CALL defSubCategoriaLocal(26, 4, 13);

/* Arezzo */

CALL defSubCategoriaLocal(27, 4, 0);
CALL defSubCategoriaLocal(27, 4, 4);
CALL defSubCategoriaLocal(27, 4, 9);

/* Authentic Feet */

CALL defSubCategoriaLocal(28, 4, 0);
CALL defSubCategoriaLocal(28, 4, 4);
CALL defSubCategoriaLocal(28, 4, 7);
CALL defSubCategoriaLocal(28, 4, 9);

/* Tennis Station */

CALL defSubCategoriaLocal(29, 4, 0);
CALL defSubCategoriaLocal(29, 4, 4);
CALL defSubCategoriaLocal(29, 4, 7);

/* Piticas */

CALL defSubCategoriaLocal(30, 4, 1);
CALL defSubCategoriaLocal(30, 4, 2);

/* Casa das Cuecas */

CALL defSubCategoriaLocal(31, 4, 3);
CALL defSubCategoriaLocal(31, 4, 5);
CALL defSubCategoriaLocal(31, 4, 10);

/* Puket */

CALL defSubCategoriaLocal(32, 4, 3);
CALL defSubCategoriaLocal(32, 4, 8);
CALL defSubCategoriaLocal(32, 4, 9);
CALL defSubCategoriaLocal(32, 4, 10);

/* Brooksfield */

CALL defSubCategoriaLocal(33, 4, 1);
CALL defSubCategoriaLocal(33, 4, 2);
CALL defSubCategoriaLocal(33, 4, 5);

/* Sapataria do Futuro */

CALL defSubCategoriaLocal(34, 4, 0);
CALL defSubCategoriaLocal(34, 4, 4);

/* Coisas da Casa */

CALL defSubCategoriaLocal(35, 12, 0);
CALL defSubCategoriaLocal(35, 12, 1);

/* Simplesmente Bárbara */ 

CALL defSubCategoriaLocal(36, 4, 0);
CALL defSubCategoriaLocal(36, 4, 4);
CALL defSubCategoriaLocal(36, 4, 10);

/* Fast Shop */

CALL defSubCategoriaLocal(37, 0, 0);
CALL defSubCategoriaLocal(37, 0, 1);
CALL defSubCategoriaLocal(37, 2, 0);
CALL defSubCategoriaLocal(37, 12, 4);

/* A Esportiva */

CALL defSubCategoriaLocal(38, 4, 6);
CALL defSubCategoriaLocal(38, 4, 7);
CALL defSubCategoriaLocal(38, 4, 14);

/* Cacau Show */

CALL defSubCategoriaLocal(39, 7, 1);

/* LOFT */

CALL defSubCategoriaLocal(40, 0, 2);
CALL defSubCategoriaLocal(40, 2, 0);
CALL defSubCategoriaLocal(40, 4, 14);

/* Relicário */

CALL defSubCategoriaLocal(41, 4, 11);
CALL defSubCategoriaLocal(41, 4, 13);
CALL defSubCategoriaLocal(41, 12, 1);
CALL defSubCategoriaLocal(41, 12, 2);
CALL defSubCategoriaLocal(41, 6, 0);

/* Andisport Futebol */

CALL defSubCategoriaLocal(42, 4, 6);
CALL defSubCategoriaLocal(42, 4, 7);
CALL defSubCategoriaLocal(42, 39, 0);
CALL defSubCategoriaLocal(42, 39, 1);
CALL defSubCategoriaLocal(42, 39, 2);
CALL defSubCategoriaLocal(42, 39, 3);

/* Le Postiche */

CALL defSubCategoriaLocal(43, 4, 10);
CALL defSubCategoriaLocal(43, 4, 14);
CALL defSubCategoriaLocal(43, 4, 15);

/* Crocs */

CALL defSubCategoriaLocal(44, 4, 0);

/* Criatiff */

CALL defSubCategoriaLocal(45, 4, 1);

/* Bluebeach */

CALL defSubCategoriaLocal(46, 4, 0);
CALL defSubCategoriaLocal(46, 4, 8);
CALL defSubCategoriaLocal(46, 5, 4);
CALL defSubCategoriaLocal(46, 5, 6);

/* SIDE WALK */

CALL defSubCategoriaLocal(47, 4, 1); 
CALL defSubCategoriaLocal(47, 4, 2); 
CALL defSubCategoriaLocal(47, 4, 4); 
CALL defSubCategoriaLocal(47, 4, 10); 

/* Usaflex */

CALL defSubCategoriaLocal(48, 4, 0); 
CALL defSubCategoriaLocal(48, 4, 4); 
CALL defSubCategoriaLocal(48, 4, 10); 

/* Beautybox */

CALL defSubCategoriaLocal(49, 4, 11); 
CALL defSubCategoriaLocal(49, 4, 12); 
CALL defSubCategoriaLocal(49, 4, 13); 

/* Kyowa */

CALL defSubCategoriaLocal(50, 12, 5);

/* Chilli Beans */

CALL defSubCategoriaLocal(51, 5, 4);

/* Adcos */

CALL defSubCategoriaLocal(52, 4, 13);

/* PUC */

CALL defSubCategoriaLocal(53, 4, 16);
CALL defSubCategoriaLocal(53, 4, 0);
CALL defSubCategoriaLocal(53, 4, 9);
CALL defSubCategoriaLocal(53, 4, 1);

/* MM Santos */

CALL defSubCategoriaLocal(54, 0, 0);
CALL defSubCategoriaLocal(54, 2, 0);

/* Maze */

CALL defSubCategoriaLocal(55, 4, 0);
CALL defSubCategoriaLocal(55, 4, 1);
CALL defSubCategoriaLocal(55, 4, 4);

/* Estúdio de Sombrancelha */

CALL defSubCategoriaLocal(56, 34, 1);
CALL defSubCategoriaLocal(56, 34, 3);

/* Quem disse, Berenice? */

CALL defSubCategoriaLocal(57, 4, 11);
CALL defSubCategoriaLocal(57, 4, 12);
CALL defSubCategoriaLocal(57, 4, 13);

/* AngioCorpore */

CALL defSubCategoriaLocal(58, 35, 3);

/*O'Clus Personal Ótica */

CALL defSubCategoriaLocal(59, 35, 2);

/* Fabiana Zaitun */

CALL defSubCategoriaLocal(60, 4, 1);
CALL defSubCategoriaLocal(60, 4, 10);

/* Doctor Feet */

CALL defSubCategoriaLocal(61, 34, 1);

/* Nutty Bavarian */

CALL defSubCategoriaLocal(62, 7, 5);

/* L'Occitane en Provence */

CALL defSubCategoriaLocal(63, 4, 11);
CALL defSubCategoriaLocal(63, 4, 12);
CALL defSubCategoriaLocal(63, 4, 13);

/*Planet Girls*/

CALL defSubCategoriaLocal(64, 4, 0);
CALL defSubCategoriaLocal(64, 4, 1);
CALL defSubCategoriaLocal(64, 4, 2);
CALL defSubCategoriaLocal(64, 4, 4);
CALL defSubCategoriaLocal(64, 4, 10);
CALL defSubCategoriaLocal(64, 4, 11);
CALL defSubCategoriaLocal(64, 4, 12);
CALL defSubCategoriaLocal(64, 4, 13);

/* Kopenhagen */

CALL defSubCategoriaLocal(65, 7, 1);

/* Mr. CAT */

CALL defSubCategoriaLocal(66, 4, 0);
CALL defSubCategoriaLocal(66, 4, 4);
CALL defSubCategoriaLocal(66, 4, 10);

/* Club Pitanga */

CALL defSubCategoriaLocal(67, 4, 1);
CALL defSubCategoriaLocal(67, 4, 2);
CALL defSubCategoriaLocal(67, 4, 5);

/* Mega Body Store */

CALL defSubCategoriaLocal(68, 34, 5);

/* Regalo's */

CALL defSubCategoriaLocal(69, 4, 10);
CALL defSubCategoriaLocal(69, 4, 14);

/* Relojoaria Zenith */

CALL defSubCategoriaLocal(70, 5, 5);

/* John John */

CALL defSubCategoriaLocal(71, 4, 1);
CALL defSubCategoriaLocal(71, 4, 2);
CALL defSubCategoriaLocal(71, 5, 6);

/* Cia Marítima */

CALL defSubCategoriaLocal(72, 4, 8);

/* Claro, Vivo, Oi e Nextel */

CALL defSubCategoriaLocal(73, 37, 0);
CALL defSubCategoriaLocal(74, 37, 0);
CALL defSubCategoriaLocal(75, 37, 0);
CALL defSubCategoriaLocal(76, 37, 0);

/* Bibi Calçados */

CALL defSubCategoriaLocal(77, 4, 0);
CALL defSubCategoriaLocal(77, 4, 4);
CALL defSubCategoriaLocal(77, 4, 16);

/* Mc Donald's Sorveteria */

CALL defSubCategoriaLocal(78, 7, 6);

/* Bancos Caixa, Itaú, do Brasil e Pan */

CALL defSubCategoriaLocal(79, 36, 0);
CALL defSubCategoriaLocal(80, 36, 0);
CALL defSubCategoriaLocal(81, 36, 0);
CALL defSubCategoriaLocal(82, 36, 0);

/* Lotérica Praiamar */

CALL defSubCategoriaLocal(83, 36, 1);

/* Cafeteria Praiamar */

CALL defSubCategoriaLocal(84, 7, 3);

/* Padaria Praiamar */

CALL defSubCategoriaLocal(85, 7, 4);
CALL defSubCategoriaLocal(85, 7, 2);

/* Carrefour */

CALL defSubCategoriaLocal(86, 10, 0);
CALL defSubCategoriaLocal(86, 0, 0);
CALL defSubCategoriaLocal(86, 0, 1);
CALL defSubCategoriaLocal(86, 0, 2);
CALL defSubCategoriaLocal(86, 1, 0);
CALL defSubCategoriaLocal(86, 1, 1);
CALL defSubCategoriaLocal(86, 1, 2);
CALL defSubCategoriaLocal(86, 1, 3);
CALL defSubCategoriaLocal(86, 1, 4);
CALL defSubCategoriaLocal(86, 1, 5);
CALL defSubCategoriaLocal(86, 1, 6);
CALL defSubCategoriaLocal(86, 1, 7);
CALL defSubCategoriaLocal(86, 1, 8);
CALL defSubCategoriaLocal(86, 2, 0);
CALL defSubCategoriaLocal(86, 2, 1);
CALL defSubCategoriaLocal(86, 2, 2);
CALL defSubCategoriaLocal(86, 2, 3);
CALL defSubCategoriaLocal(86, 2, 4);
CALL defSubCategoriaLocal(86, 2, 5);
CALL defSubCategoriaLocal(86, 3, 0);
CALL defSubCategoriaLocal(86, 3, 1);
CALL defSubCategoriaLocal(86, 3, 2);
CALL defSubCategoriaLocal(86, 3, 3);
CALL defSubCategoriaLocal(86, 4, 0);
CALL defSubCategoriaLocal(86, 4, 1);
CALL defSubCategoriaLocal(86, 4, 2);
CALL defSubCategoriaLocal(86, 4, 3);
CALL defSubCategoriaLocal(86, 4, 4);
CALL defSubCategoriaLocal(86, 4, 6);
CALL defSubCategoriaLocal(86, 4, 7);
CALL defSubCategoriaLocal(86, 4, 8);
CALL defSubCategoriaLocal(86, 4, 9);
CALL defSubCategoriaLocal(86, 4, 10);
CALL defSubCategoriaLocal(86, 4, 11);
CALL defSubCategoriaLocal(86, 4, 12);
CALL defSubCategoriaLocal(86, 4, 13);
CALL defSubCategoriaLocal(86, 4, 14);
CALL defSubCategoriaLocal(86, 6, 0);
CALL defSubCategoriaLocal(86, 6, 1);
CALL defSubCategoriaLocal(86, 6, 2);
CALL defSubCategoriaLocal(86, 6, 3);
CALL defSubCategoriaLocal(86, 11, 0);
CALL defSubCategoriaLocal(86, 12, 1);
CALL defSubCategoriaLocal(86, 12, 3);
CALL defSubCategoriaLocal(86, 12, 4);
CALL defSubCategoriaLocal(86, 13, 0);

/* Livraria Praiamar */

CALL defSubCategoriaLocal(87, 9, 0);
CALL defSubCategoriaLocal(87, 9, 1);
CALL defSubCategoriaLocal(87, 9, 2);

/*Banheiros Praiamar Shopping, do térreo ao terceiro andar */

CALL defSubCategoriaLocal(88, 25, 0);
CALL defSubCategoriaLocal(102, 25, 0);
CALL defSubCategoriaLocal(108, 25, 0);
CALL defSubCategoriaLocal(137, 25, 0);
CALL defSubCategoriaLocal(153, 25, 0);

/* Bebedouros Praiamar Shopping, do térreo ao terceiro andar */

CALL defSubCategoriaLocal(89, 27, 0);
CALL defSubCategoriaLocal(103, 27, 0);
CALL defSubCategoriaLocal(109, 27, 0);
CALL defSubCategoriaLocal(138, 27, 0);
CALL defSubCategoriaLocal(154, 27, 0);

/* Escadas fixas, do térreo ao terceiro andar */

CALL defSubCategoriaLocal(90, 29, 0);
CALL defSubCategoriaLocal(104, 29, 0);
CALL defSubCategoriaLocal(110, 29, 0);
CALL defSubCategoriaLocal(139, 29, 0);
CALL defSubCategoriaLocal(155, 29, 0);

/* Escadas rolantes, do térreo ao terceiro andar */

CALL defSubCategoriaLocal(91, 30, 0);
CALL defSubCategoriaLocal(105, 30, 0);
CALL defSubCategoriaLocal(111, 30, 0);
CALL defSubCategoriaLocal(140, 30, 0);
CALL defSubCategoriaLocal(156, 30, 0);

/* Elevadores, do térreo ao quarto andar */

CALL defSubCategoriaLocal(92, 31, 0);
CALL defSubCategoriaLocal(106, 31, 0);
CALL defSubCategoriaLocal(112, 31, 0);
CALL defSubCategoriaLocal(141, 31, 0);
CALL defSubCategoriaLocal(157, 31, 0);

/* Adidas */

CALL defSubCategoriaLocal(93, 4, 0);
CALL defSubCategoriaLocal(93, 4, 1);
CALL defSubCategoriaLocal(93, 4, 2);
CALL defSubCategoriaLocal(93, 4, 4);
CALL defSubCategoriaLocal(93, 4, 6);
CALL defSubCategoriaLocal(93, 4, 7);
CALL defSubCategoriaLocal(93, 5, 6);

/* CVC */

CALL defSubCategoriaLocal(94, 38, 0);

/* Apple */

CALL defSubCategoriaLocal(95, 0, 0);
CALL defSubCategoriaLocal(95, 0, 1);
CALL defSubCategoriaLocal(95, 0, 2);
CALL defSubCategoriaLocal(95, 2, 0);

/* Club Men Salon */

CALL defSubCategoriaLocal(96, 34, 6); 

/* Riachuelo */

CALL defSubCategoriaLocal(97, 4, 0); 
CALL defSubCategoriaLocal(97, 4, 1); 
CALL defSubCategoriaLocal(97, 4, 2); 
CALL defSubCategoriaLocal(97, 4, 3); 
CALL defSubCategoriaLocal(97, 4, 4); 
CALL defSubCategoriaLocal(97, 4, 5); 
CALL defSubCategoriaLocal(97, 4, 6); 
CALL defSubCategoriaLocal(97, 4, 7); 
CALL defSubCategoriaLocal(97, 4, 8); 
CALL defSubCategoriaLocal(97, 4, 9); 
CALL defSubCategoriaLocal(97, 4, 10); 
CALL defSubCategoriaLocal(97, 4, 11); 
CALL defSubCategoriaLocal(97, 4, 12); 
CALL defSubCategoriaLocal(97, 4, 13); 
CALL defSubCategoriaLocal(97, 4, 14); 
CALL defSubCategoriaLocal(97, 4, 15); 
CALL defSubCategoriaLocal(97, 4, 16); 
CALL defSubCategoriaLocal(97, 5, 4); 
CALL defSubCategoriaLocal(97, 5, 5); 
CALL defSubCategoriaLocal(97, 5, 6); 
CALL defSubCategoriaLocal(97, 6, 4); 

/* Renner */

CALL defSubCategoriaLocal(98, 4, 0); 
CALL defSubCategoriaLocal(98, 4, 1); 
CALL defSubCategoriaLocal(98, 4, 2); 
CALL defSubCategoriaLocal(98, 4, 3); 
CALL defSubCategoriaLocal(98, 4, 4); 
CALL defSubCategoriaLocal(98, 4, 5); 
CALL defSubCategoriaLocal(98, 4, 6); 
CALL defSubCategoriaLocal(98, 4, 7); 
CALL defSubCategoriaLocal(98, 4, 8); 
CALL defSubCategoriaLocal(98, 4, 9); 
CALL defSubCategoriaLocal(98, 4, 10); 
CALL defSubCategoriaLocal(98, 4, 11); 
CALL defSubCategoriaLocal(98, 4, 12); 
CALL defSubCategoriaLocal(98, 4, 13); 
CALL defSubCategoriaLocal(98, 4, 14); 
CALL defSubCategoriaLocal(98, 4, 15); 
CALL defSubCategoriaLocal(98, 4, 16); 
CALL defSubCategoriaLocal(98, 5, 4); 
CALL defSubCategoriaLocal(98, 5, 5); 
CALL defSubCategoriaLocal(98, 5, 6); 
CALL defSubCategoriaLocal(98, 6, 4); 

/* Drogaria São Paulo */

CALL defSubCategoriaLocal(99, 11, 0); 

/* Dudalina */

CALL defSubCategoriaLocal(100, 4, 1); 
CALL defSubCategoriaLocal(100, 4, 2); 

/* Fom - Quiosque */

/* ??? Esse quiosque é bem misterioso */

/* Polishop */

CALL defSubCategoriaLocal(107, 6, 0); 
CALL defSubCategoriaLocal(107, 6, 1); 

/* Acrescentar novas categorias/subs para a Polishop */

/* Mc Donald's, Burger King e Subway, a trindade da maravilha */

CALL defSubCategoriaLocal(113, 19, 0); 
CALL defSubCategoriaLocal(114, 19, 0); 
CALL defSubCategoriaLocal(115, 19, 0);

/* Burger + | Rizzo (dois restaurantes em um) */

CALL defSubCategoriaLocal(116, 16, 0);
CALL defSubCategoriaLocal(116, 40, 0);

/* Giraffa's */

CALL defSubCategoriaLocal(117, 15, 0);

/* Rockabilly */

CALL defSubCategoriaLocal(118, 16, 0);

/* Outback */

CALL defSubCategoriaLocal(119, 42, 0);
CALL defSubCategoriaLocal(119, 14, 0);
CALL defSubCategoriaLocal(119, 20, 0);

/* Mania de Churrasco Prime Steak House */

CALL defSubCategoriaLocal(120, 20, 0);

/* Mania de Churrasco */

CALL defSubCategoriaLocal(121, 20, 0);

/* Spoleto */

CALL defSubCategoriaLocal(122, 21, 0);
CALL defSubCategoriaLocal(122, 40, 0);

/* Bom D+ */

CALL defSubCategoriaLocal(123, 15, 0);
CALL defSubCategoriaLocal(123, 16, 0);

/* All Beef's */

CALL defSubCategoriaLocal(124, 15, 0);

/* Patroni Premium */

CALL defSubCategoriaLocal(125, 20, 0);
CALL defSubCategoriaLocal(125, 21, 0);
CALL defSubCategoriaLocal(125, 22, 0);
CALL defSubCategoriaLocal(125, 40, 0);

/* Liliana Pasta & Pizza */

CALL defSubCategoriaLocal(126, 20, 0);
CALL defSubCategoriaLocal(126, 21, 0);
CALL defSubCategoriaLocal(126, 22, 0);
CALL defSubCategoriaLocal(126, 40, 0);

/* Máfia di Pasta */

CALL defSubCategoriaLocal(127, 20, 0);
CALL defSubCategoriaLocal(127, 21, 0);
CALL defSubCategoriaLocal(127, 40, 0);

/* Vivenda do Camarão */

CALL defSubCategoriaLocal(128, 14, 0);

/* Divino Fogão */

CALL defSubCategoriaLocal(129, 43, 0);
CALL defSubCategoriaLocal(129, 15, 0);

/* Divino Grão */

CALL defSubCategoriaLocal(130, 34, 7);

/* Pizza Hut */

CALL defSubCategoriaLocal(131, 22, 0);

/* Haru */

CALL defSubCategoriaLocal(132, 17, 0);

/* Gendai */

CALL defSubCategoriaLocal(133, 17, 0);

/* Saluá Esfihas */

CALL defSubCategoriaLocal(134, 23, 0);
CALL defSubCategoriaLocal(134, 41, 0);

/* Tottene */

CALL defSubCategoriaLocal(135, 7, 6);

/* Bacio di Latte */

CALL defSubCategoriaLocal(136, 7, 6);

/* Cinema (recepções e salas) */

CALL defSubCategoriaLocal(142, 24, 0);
CALL defSubCategoriaLocal(143, 24, 0);
CALL defSubCategoriaLocal(144, 24, 0);
CALL defSubCategoriaLocal(145, 24, 0);
CALL defSubCategoriaLocal(146, 24, 0);
CALL defSubCategoriaLocal(147, 24, 0);
CALL defSubCategoriaLocal(148, 24, 0);
CALL defSubCategoriaLocal(149, 24, 0);
CALL defSubCategoriaLocal(150, 24, 0);
CALL defSubCategoriaLocal(151, 24, 0);
CALL defSubCategoriaLocal(152, 24, 0);

/* Praças: de alimentação; de descanso com Wi-Fi grátis */

CALL defSubCategoriaLocal(158, 32, 0);
CALL defSubCategoriaLocal(159, 33, 0);

/* Santa Lolla */

CALL defSubCategoriaLocal(161, 4, 4);
CALL defSubCategoriaLocal(161, 4, 10);

/* Camisaria Colombo */

CALL defSubCategoriaLocal(162, 4, 1);

/* Colcci */

CALL defSubCategoriaLocal(163, 4, 1);
CALL defSubCategoriaLocal(163, 4, 2);

/* Calvin Klein */

CALL defSubCategoriaLocal(164, 4, 1);
CALL defSubCategoriaLocal(164, 4, 2);
CALL defSubCategoriaLocal(164, 4, 3);

/* M&M Gamer */

CALL defSubCategoriaLocal(165, 0, 0);
CALL defSubCategoriaLocal(165, 0, 2);
CALL defSubCategoriaLocal(165, 2, 2);

/* Alhambra */

CALL defSubCategoriaLocal(166, 12, 0);
CALL defSubCategoriaLocal(166, 12, 1);
CALL defSubCategoriaLocal(166, 12, 2);

/* Anacapri */

CALL defSubCategoriaLocal(167, 4, 4);

/* Banco 24 Horas Tecbanc (Caixa Eletrônico) */

CALL defSubCategoriaLocal(168, 36, 0);

/* Bio Mundo */

CALL defSubCategoriaLocal(169, 34, 7);

/* Brasil Cacau */

CALL defSubCategoriaLocal(170, 7, 1);

/* Camicado */

CALL defSubCategoriaLocal(171, 6, 0);
CALL defSubCategoriaLocal(171, 12, 2);

/* Capodarte */

CALL defSubCategoriaLocal(172, 4, 0);
CALL defSubCategoriaLocal(172, 4, 4);
CALL defSubCategoriaLocal(172, 4, 10);

/* Caravella */

CALL defSubCategoriaLocal(173, 4, 8);

/* Casa de Câmbio */

CALL defSubCategoriaLocal(174, 36, 2);

/* Deny Sports */

CALL defSubCategoriaLocal(175, 4, 6);
CALL defSubCategoriaLocal(175, 4, 7);

/* Dhemy */

CALL defSubCategoriaLocal(176, 4, 1); 

/* Espaço Laser */

CALL defSubCategoriaLocal(177, 34, 8); 

/* Filtros Europa */

CALL defSubCategoriaLocal(178, 12, 6);

/* First Class */

CALL defSubCategoriaLocal(179, 12, 7);

/* Follow up */

CALL defSubCategoriaLocal(180, 4, 1);
CALL defSubCategoriaLocal(180, 4, 2);
CALL defSubCategoriaLocal(180, 4, 8);

/* Fulgore */

CALL defSubCategoriaLocal(181, 5, 0);
CALL defSubCategoriaLocal(181, 5, 1);
CALL defSubCategoriaLocal(181, 5, 2);

/* Garbo */

CALL defSubCategoriaLocal(182, 4, 1);
CALL defSubCategoriaLocal(182, 4, 2);

/* Gomes */

CALL defSubCategoriaLocal(183, 4, 1);
CALL defSubCategoriaLocal(183, 4, 2);
CALL defSubCategoriaLocal(183, 4, 8);
CALL defSubCategoriaLocal(183, 5, 6);

/* Granado */

CALL defSubCategoriaLocal(184, 4, 11);
CALL defSubCategoriaLocal(184, 4, 12);
CALL defSubCategoriaLocal(184, 4, 13);

/* Hering Kids */

CALL defSubCategoriaLocal(185, 4, 16);
CALL defSubCategoriaLocal(185, 4, 0);
CALL defSubCategoriaLocal(185, 4, 1);
CALL defSubCategoriaLocal(185, 4, 2);
CALL defSubCategoriaLocal(185, 4, 3);
CALL defSubCategoriaLocal(185, 4, 4);

/* Hering Store */

CALL defSubCategoriaLocal(186, 4, 0);
CALL defSubCategoriaLocal(186, 4, 1);
CALL defSubCategoriaLocal(186, 4, 2);
CALL defSubCategoriaLocal(186, 4, 3);
CALL defSubCategoriaLocal(186, 4, 4);

/* Hope */

CALL defSubCategoriaLocal(187, 4, 3);

/* Hot Water */

CALL defSubCategoriaLocal(188, 4, 0);
CALL defSubCategoriaLocal(188, 4, 1);
CALL defSubCategoriaLocal(188, 4, 2);
CALL defSubCategoriaLocal(188, 4, 4);
CALL defSubCategoriaLocal(188, 4, 6);
CALL defSubCategoriaLocal(188, 4, 7);
CALL defSubCategoriaLocal(188, 4, 8);
CALL defSubCategoriaLocal(188, 4, 14);
CALL defSubCategoriaLocal(188, 5, 4);

/* House */

CALL defSubCategoriaLocal(189, 4, 1);

/* Imaginarium */

CALL defSubCategoriaLocal(190, 4, 10);
CALL defSubCategoriaLocal(190, 4, 13);
CALL defSubCategoriaLocal(190, 4, 14);
CALL defSubCategoriaLocal(190, 6, 4);

/* Intimissimi */

CALL defSubCategoriaLocal(191, 4, 3);

/* iPlace */

CALL defSubCategoriaLocal(192, 0, 0);
CALL defSubCategoriaLocal(192, 0, 2);
CALL defSubCategoriaLocal(192, 2, 0);

/* Kallan */

CALL defSubCategoriaLocal(193, 4, 0);
CALL defSubCategoriaLocal(193, 4, 4);
CALL defSubCategoriaLocal(193, 4, 7);

/* Kanto Kent */

CALL defSubCategoriaLocal(194, 4, 0);
CALL defSubCategoriaLocal(194, 4, 1);
CALL defSubCategoriaLocal(194, 4, 3);

/* Kidstok */

CALL defSubCategoriaLocal(195, 4, 16);
CALL defSubCategoriaLocal(195, 4, 1);
CALL defSubCategoriaLocal(195, 4, 2);
CALL defSubCategoriaLocal(195, 4, 3);
CALL defSubCategoriaLocal(195, 4, 9);

/* Lacoste */

CALL defSubCategoriaLocal(196, 4, 0);
CALL defSubCategoriaLocal(196, 4, 1);
CALL defSubCategoriaLocal(196, 4, 2);
CALL defSubCategoriaLocal(196, 4, 3);
CALL defSubCategoriaLocal(196, 4, 4);

/* Le Lis Blanc */

CALL defSubCategoriaLocal(197, 4, 0);
CALL defSubCategoriaLocal(197, 4, 1);
CALL defSubCategoriaLocal(197, 4, 2);
CALL defSubCategoriaLocal(197, 4, 3);
CALL defSubCategoriaLocal(197, 4, 4);
CALL defSubCategoriaLocal(197, 4, 10);
CALL defSubCategoriaLocal(197, 5, 1);
CALL defSubCategoriaLocal(197, 5, 2);
CALL defSubCategoriaLocal(197, 5, 7);
CALL defSubCategoriaLocal(197, 5, 8);
CALL defSubCategoriaLocal(197, 12, 4);

/* Levi's */

CALL defSubCategoriaLocal(198, 4, 0);
CALL defSubCategoriaLocal(198, 4, 1);
CALL defSubCategoriaLocal(198, 4, 2);
CALL defSubCategoriaLocal(198, 4, 3);
CALL defSubCategoriaLocal(198, 4, 4);
CALL defSubCategoriaLocal(198, 4, 6);
CALL defSubCategoriaLocal(198, 4, 8);
CALL defSubCategoriaLocal(198, 4, 9);
CALL defSubCategoriaLocal(198, 4, 16);
CALL defSubCategoriaLocal(198, 5, 6);

/* Lez a Lez */

CALL defSubCategoriaLocal(199, 4, 1);
CALL defSubCategoriaLocal(199, 4, 17);

/* Lilica & Tigor */

CALL defSubCategoriaLocal(200, 4, 0);
CALL defSubCategoriaLocal(200, 4, 1);
CALL defSubCategoriaLocal(200, 4, 2);
CALL defSubCategoriaLocal(200, 4, 3);
CALL defSubCategoriaLocal(200, 4, 16);

/* Lindt */

CALL defSubCategoriaLocal(201, 7, 1);

/* Lupo */

CALL defSubCategoriaLocal(202, 4, 3);
CALL defSubCategoriaLocal(202, 4, 9);
CALL defSubCategoriaLocal(202, 4, 16);
CALL defSubCategoriaLocal(202, 4, 18);

/* Marcia Mello */

CALL defSubCategoriaLocal(203, 4, 17);
CALL defSubCategoriaLocal(203, 4, 1);
CALL defSubCategoriaLocal(203, 4, 2);
CALL defSubCategoriaLocal(203, 5, 1);
CALL defSubCategoriaLocal(203, 5, 2);
CALL defSubCategoriaLocal(203, 5, 7);
CALL defSubCategoriaLocal(203, 5, 8);

/* Marisorte Loterias */

CALL defSubCategoriaLocal(204, 36, 1);

/* Maxxi Color */

CALL defSubCategoriaLocal(205, 44, 0);
CALL defSubCategoriaLocal(205, 44, 1);

/* Mendes Tur */

CALL defSubCategoriaLocal(206, 38, 0);

/* Miró */

CALL defSubCategoriaLocal(207, 4, 14);
CALL defSubCategoriaLocal(207, 4, 15);

/* MMartan */

CALL defSubCategoriaLocal(208, 12, 7);

/* Monte Carlo */

CALL defSubCategoriaLocal(209, 5, 0);
CALL defSubCategoriaLocal(209, 5, 1);
CALL defSubCategoriaLocal(209, 5, 2);
CALL defSubCategoriaLocal(209, 5, 3);
CALL defSubCategoriaLocal(209, 5, 5);
CALL defSubCategoriaLocal(209, 5, 7);

/* Morana */

CALL defSubCategoriaLocal(210, 5, 2);
CALL defSubCategoriaLocal(210, 5, 1);
CALL defSubCategoriaLocal(210, 5, 7);
CALL defSubCategoriaLocal(210, 5, 8);
CALL defSubCategoriaLocal(210, 4, 10);
CALL defSubCategoriaLocal(210, 5, 9);

/* Murabak */

CALL defSubCategoriaLocal(211, 4, 1);
CALL defSubCategoriaLocal(211, 4, 17);
CALL defSubCategoriaLocal(211, 4, 2);
CALL defSubCategoriaLocal(211, 12, 2);
CALL defSubCategoriaLocal(211, 6, 0);
CALL defSubCategoriaLocal(211, 6, 2);
CALL defSubCategoriaLocal(211, 45, 0);

/* Náutica Tattoo  */

CALL defSubCategoriaLocal(212, 34, 4);

/* O Boticário */

CALL defSubCategoriaLocal(213, 4, 11);
CALL defSubCategoriaLocal(213, 4, 12);
CALL defSubCategoriaLocal(213, 4, 13);

/* Organza */

CALL defSubCategoriaLocal(214, 4, 17);

/* Ortobom */

CALL defSubCategoriaLocal(215, 12, 8);

/* Óticas IX, Martins Zeiss, Occhiali e Carol  */

CALL defSubCategoriaLocal(216, 35, 2);
CALL defSubCategoriaLocal(217, 35, 2);
CALL defSubCategoriaLocal(218, 35, 2);
CALL defSubCategoriaLocal(219, 35, 2);

/* Kidz Shoe Store */

CALL defSubCategoriaLocal(220, 4, 0);
CALL defSubCategoriaLocal(220, 4, 16);

/* Pandora */

CALL defSubCategoriaLocal(221, 5, 2);
CALL defSubCategoriaLocal(221, 5, 1);
CALL defSubCategoriaLocal(221, 5, 7);
CALL defSubCategoriaLocal(221, 5, 8);
CALL defSubCategoriaLocal(221, 5, 9);

/* Pink */

CALL defSubCategoriaLocal(222, 4, 0);
CALL defSubCategoriaLocal(222, 4, 4);

/* Planeta Café */

CALL defSubCategoriaLocal(223, 16, 0);

/* Quiksilver */

CALL defSubCategoriaLocal(224, 4, 6);
CALL defSubCategoriaLocal(224, 4, 8);
CALL defSubCategoriaLocal(224, 4, 1);
CALL defSubCategoriaLocal(224, 4, 2);
CALL defSubCategoriaLocal(224, 4, 18);
CALL defSubCategoriaLocal(224, 5, 6);

/* Radio Nacional */

CALL defSubCategoriaLocal(225, 4, 1);
CALL defSubCategoriaLocal(225, 4, 2);
CALL defSubCategoriaLocal(225, 4, 17);

/* Raquel Bijoux */

CALL defSubCategoriaLocal(226, 5, 2);
CALL defSubCategoriaLocal(226, 5, 1);
CALL defSubCategoriaLocal(226, 5, 7);
CALL defSubCategoriaLocal(226, 5, 8);
CALL defSubCategoriaLocal(226, 5, 9);


/* Rei do Mate */

CALL defSubCategoriaLocal(227, 16, 0);

/* Schutz */

CALL defSubCategoriaLocal(228, 4, 0);
CALL defSubCategoriaLocal(228, 4, 4);
CALL defSubCategoriaLocal(228, 4, 10);

/* Sodimac Dicico */

CALL defSubCategoriaLocal(229, 46, 0);

/* Starbucks Coffee */

CALL defSubCategoriaLocal(230, 7, 3);
CALL defSubCategoriaLocal(230, 16, 0);

/* Stroke */

CALL defSubCategoriaLocal(231, 4, 1);
CALL defSubCategoriaLocal(231, 4, 2);
CALL defSubCategoriaLocal(231, 4, 17);

/* Swarovski */

CALL defSubCategoriaLocal(232, 5, 2);
CALL defSubCategoriaLocal(232, 5, 1);
CALL defSubCategoriaLocal(232, 5, 7);
CALL defSubCategoriaLocal(232, 5, 9);
CALL defSubCategoriaLocal(232, 5, 5);

/* The Body Shop */

CALL defSubCategoriaLocal(233, 4, 11);
CALL defSubCategoriaLocal(233, 4, 12);
CALL defSubCategoriaLocal(233, 4, 13);

/* TIM */

CALL defSubCategoriaLocal(234, 37, 0);

/* Tip Top */

CALL defSubCategoriaLocal(235, 4, 16);

/* Top Car */

CALL defSubCategoriaLocal(236, 47, 0);

/* Tottene */

CALL defSubCategoriaLocal(237, 7, 6);

/* Track & Field */

CALL defSubCategoriaLocal(238, 4, 0);
CALL defSubCategoriaLocal(238, 4, 1);
CALL defSubCategoriaLocal(238, 4, 2);
CALL defSubCategoriaLocal(238, 4, 4);
CALL defSubCategoriaLocal(238, 5, 6);

/* Valisere */

CALL defSubCategoriaLocal(239, 4, 3);

/* Vermont */

CALL defSubCategoriaLocal(240, 4, 0);
CALL defSubCategoriaLocal(240, 4, 4);

/* Victor Hugo */

CALL defSubCategoriaLocal(241, 4, 10);

/* Vim Vi Venci */

CALL defSubCategoriaLocal(242, 4, 16);

/* Vivara */

CALL defSubCategoriaLocal(243, 5, 2);
CALL defSubCategoriaLocal(243, 5, 1);
CALL defSubCategoriaLocal(243, 5, 7);
CALL defSubCategoriaLocal(243, 5, 9);
CALL defSubCategoriaLocal(243, 5, 5);

/* Viviana Puccinelli */

CALL defSubCategoriaLocal(244, 4, 1);
CALL defSubCategoriaLocal(244, 4, 17);

/* YellowCom Vivo */

CALL defSubCategoriaLocal(245, 37, 0);

/* You Play Space */

CALL defSubCategoriaLocal(246, 48, 0);

/* Yuppie */

CALL defSubCategoriaLocal(247, 4, 1);
CALL defSubCategoriaLocal(247, 4, 2);
CALL defSubCategoriaLocal(247, 4, 4);
CALL defSubCategoriaLocal(247, 4, 10);

/* Zelo */

CALL defSubCategoriaLocal(248, 12, 7);

/* Berçários, do térreo ao quarto andar */

CALL defSubCategoriaLocal(249, 26, 0);
CALL defSubCategoriaLocal(250, 26, 0);
CALL defSubCategoriaLocal(251, 26, 0);
CALL defSubCategoriaLocal(252, 26, 0);
CALL defSubCategoriaLocal(253, 26, 0);

/* Telefones (terceiro andar) */

CALL defSubCategoriaLocal(254, 28, 0);
CALL defSubCategoriaLocal(255, 28, 0);
CALL defSubCategoriaLocal(256, 28, 0);
CALL defSubCategoriaLocal(257, 28, 0);

/* Madero */

CALL defSubCategoriaLocal(258, 20, 0);


/* ------------ ! ------------- */

/* ------ COMUNICADOS ------- */

/* Promoções direcionadas */

/* - Samsung - */
CALL publicarComunicado(7, 0, "Compre o Galaxy Note20 em até 12x sem juros, e ganhe um voucher de R$ 2000!", now(), null);
CALL relacionarComunicadoSubCategoria(0, 0, 0); /* Informática - Hardware */

CALL pegarSubCategoriasComunicado(0);

/* - Mão Única - */
CALL publicarComunicado(18, 0, "50% de desconto em todos os jogos e HQ's!", now(), '2020-12-02 13:30:00');
CALL relacionarComunicadoSubCategoria(1, 1, 0); /* Categoria jogos inteira */
CALL relacionarComunicadoSubCategoria(1, 1, 1);
CALL relacionarComunicadoSubCategoria(1, 1, 2);
CALL relacionarComunicadoSubCategoria(1, 1, 3);
CALL relacionarComunicadoSubCategoria(1, 1, 4);
CALL relacionarComunicadoSubCategoria(1, 1, 5);
CALL relacionarComunicadoSubCategoria(1, 1, 6);

CALL relacionarComunicadoSubCategoria(1, 9, 1); /* Literatura - Comic store */

CALL pegarSubCategoriasComunicado(1);

/* Promoções gerais */

/* - Casa das Cuecas - */
CALL publicarComunicado(31, 1, "Desconto de 90% em toda a loja! Aproveite, é apenas neste fim de semana!", now(), '2020-09-20 23:00:00');

/* - Cinemark | Sala 4 - */
CALL publicarComunicado(146, 1, "Próxima sessâo: 'Sonic: O filme', às 17:00. Dublado. Duração: 1h40m", now(), DATE_ADD(now(), INTERVAL 45 minute));

/* - Cinemark | Recepção - */
CALL publicarComunicado(142, 1, "Próxima sessâo: 'Sonic: O filme', às 17:00. Sala 4. Dublado. Duração: 1h40m", now(), DATE_ADD(now(), INTERVAL 45 minute));

/* - Life's Good LG - */
CALL publicarComunicado(7, 0, "Compre o Galaxy Note20 em até 12x sem juros, e ganhe um voucher de R$ 2000!", now(), null);
/* - Divino Fogão - */
CALL publicarComunicado(129, 1, "Prato do dia: escargot ao molho madeira", now(), DATE_ADD(now(), INTERVAL 3 hour));

/* - Polo Play - */
CALL publicarComunicado(25, 1, "50% de desconto em todos os produtos!", now(), '2020-09-30 22:00:00'); 

/* - Lojas Americanas - */
CALL publicarComunicado(5, 1, "Desconto maior para produtos de informática: 80%!", now(), '2020-12-02 22:30:00'); 
CALL publicarComunicado(5, 0, "Compre o Galaxy Note20 em até 12x sem juros, e ganhe um voucher de R$ 2000! (Respostagem)", now(), '2021
-12-02 22:30:00');


/* Notificações */

/* - Hihappy - */
CALL publicarComunicado(6, 2, "Loja fechada por tempo indeterminado, devido à pandemia do novo Coronavírus", now(), null);

/* - Banheiro Praiamar Shopping | 1º Andar - */
CALL publicarComunicado(102, 2, "Banheiro interditado!", now(), DATE_ADD(now(), INTERVAL 1 hour));

/* Alertas */

/* - Carmen Steffens - */
CALL publicarComunicado(12, 3, "Cuidado! Entrada escorregadia!", now(), DATE_ADD(now(), INTERVAL 30 minute));

/* Preços */

/* - Kyowa - */
CALL publicarComunicado(50, 4, "Pagando no cartão, você ganha 15% de desconto!", now(), null);

/* - Cinemark | Recepção - */
CALL publicarComunicado(142, 4, "Preços: Meia entrada - R$ 18.00; Inteira: R$ 32.00", now(), null);

/* Vários comunicados da Americanas */

CALL publicarComunicado(5, 0, "Chegaram os novos Galaxy Note20 e Note20 Ultra!", '2020-09-18 09:07:31', '2020-10-31 22:30:00');
CALL relacionarComunicadoSubCategoria (14, 0, 0);

CALL publicarComunicado(5, 0, "50% de desconto em todas as roupas, somente neste fim de semana!", '2020-10-31 09:13:47', '2020-11-01 22:30:00');
CALL relacionarComunicadoSubCategoria (15, 4, 0);
CALL relacionarComunicadoSubCategoria (15, 4, 1);
CALL relacionarComunicadoSubCategoria (15, 4, 2);
CALL relacionarComunicadoSubCategoria (15, 4, 3);
CALL relacionarComunicadoSubCategoria (15, 4, 4);
CALL relacionarComunicadoSubCategoria (15, 4, 8);
CALL relacionarComunicadoSubCategoria (15, 4, 9);
CALL relacionarComunicadoSubCategoria (15, 4, 11);
CALL relacionarComunicadoSubCategoria (15, 4, 12);
CALL relacionarComunicadoSubCategoria (15, 4, 13);


CALL publicarComunicado(5, 1, "O gerente enlouqueceu neste domingo! Toda a loja com 30% de desconto!", '2020-11-15 08:57:24', '2020-11-15 22:30:00');
CALL publicarComunicado(5, 1, "O gerente enlouqueceu neste domingo! Toda a loja com 15% de desconto!", '2020-08-21 10:53:04', '2020-08-21 22:30:00');
CALL publicarComunicado(5, 1, "O gerente enlouqueceu neste sábado! Toda a loja com 20% de desconto!", '2020-06-06 08:07:12', '2020-06-06 22:30:00');

CALL publicarComunicado(5, 1, "Pagando com nosso cartão, você ganha 5% de desconto em todas as compras!", '2020-01-01 11:01:40', '2020-12-31 22:30:00');
 
CALL publicarComunicado(5, 2, "Loja fechada hoje, excepcionalmente, para manutenção", '2020-11-05 22:41:52', '2020-11-06 22:30:00');
CALL publicarComunicado(5, 2, "Loja fechada hoje, excepcionalmente, para manutenção", '2020-08-13 22:36:30', '2020-08-14 22:30:00');

CALL publicarComunicado(5, 3, "Cuidado! Entrada escorregadia!", '2020-10-10 14:32:03', '2020-10-10 14:52:03');








