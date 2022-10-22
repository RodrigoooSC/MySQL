/*CRIANDO BANCO DE DADOS*/
create database if not exists vendas_sucos;

create database vendas_sucos2 default character set utf8;

drop database if exists vendas_sucos2;

/*CRIAÇÃO DAS TABELAS COM PK*/
use vendas_sucos;

create table PRODUTOS(
CODIGO varchar(10) not null,
DESCRIPTOR  varchar(100) null,
SABOR varchar(50) null,
TAMANHO varchar(50) null,
EMBALAGEM varchar(50) null,
PRECO_LISTA float null,
primary key(CODIGO));

create table VENDEDORES(
MATRICULA varchar(5) not null,
NOME varchar(100) null,
BAIRRO varchar(50) null,
COMISSAO float null,
DATA_ADMISSAO date,
FERIAS bit(1) null,
primary key(MATRICULA));

create table CLIENTES(
CPF varchar(11) not null,
NOME varchar(100) null,
ENDERECO varchar(150) null,
BAIRRO varchar(50) null,
CIDADE varchar(50) null,
ESTADO varchar(50) null,
CEP varchar(8) null,
DATA_NASCIMENTO date NULL,
IDADE int null,
SEXO varchar(1) null,
LIMITE_CREDITO float null,
VOLUME_COMPRA float null,
PRIMEIRA_COMPRA bit(1) null,
primary key(CPF))
engine = InnoDB;

create table notas(
NUMERO varchar(5) not null,
DATA_VENDA date null,
CPF varchar(11) not null,
MATRICULA varchar(5) not null,
IMPOSTO float null,
primary key(NUMERO));

create table ITENS_NOTAS(
NUMERO varchar(5) not null,
CODIGO varchar(10) not null,
QUANTIDADE int(11) null,
PRECO float null,
primary key (NUMERO, CODIGO));
 
 /*ALTERANDO COLUNA DA TABELA*/ 
 alter table VENDEDORES rename column DATA_ADIMISSAO to DATA_ADMISSAO;
 alter table PRODUTOS rename column PRECO_DE_LISTA to PRECO_LISTA;
 
/*RELACIONADO TABELA COM CHGAVE ESTRANGEIRA*/
alter table notas add constraint FK_CLIENTES
foreign key(CPF) references CLIENTES (CPF);

alter table itens_notas add constraint FK_NOTAS
foreign key(NUMERO) references notas (NUMERO);

alter table itens_notas add constraint FK_PRODUTOS
foreign key(CODIGO) references PRODUTOS (CODIGO);

USE vendas_sucos;

/*ALTERANDO NOME DA TABELA*/
alter table itens_notas rename itens_notas;

/*INCLUINDO DADOS NAS TABELAS*/
 use vendas_sucos;
 
 insert into PRODUTOS (CODIGO, DESCRIPTOR, SABOR, TAMANHO, EMBALAGEM, PRECO_LISTA) values('1040107', 'Light - 350 ml - Melância', 'Melância', '350 ml', 'Lata', 4.56);
 insert into PRODUTOS (CODIGO, DESCRIPTOR, SABOR, TAMANHO, EMBALAGEM, PRECO_LISTA) values('1040108', 'Light - 350 ml - Graviola', 'Graviola', '350 ml', 'Lata', 4.00);
 insert into PRODUTOS values('1040109', 'Light - 350 ml - Açaí', 'Açaí', '350 ml', 'Lata', 5.60);
 insert into PRODUTOS values('1040110', 'Light - 350 ml - Jaca', 'Jaca', '350 ml', 'Lata', 6.00),('1040111', 'Light - 350 ml - Manga', 'Manga', '350 ml', 'Lata', 3.50);
 select * from produtos;
  
 insert into CLIENTES (CPF,NOME,ENDERECO,BAIRRO,CIDADE,ESTADO,CEP,DATA_NASCIMENTO,IDADE,SEXO,LIMITE_CREDITO,VOLUME_COMPRA,PRIMEIRA_COMPRA) values 
 ('1471156710','Érica Carvalho','R. Iriquitia','Jardins','São Paulo','SP','80012212','19900901',27,'F',170000,24500,0),
 ('19290992743','Fernando Cavalcante','R. Dois de Fevereiro','Água Santa','Rio de Janeiro','RJ','22000000','20000212',18,'M',100000,20000,1),
 ('2600586709','César Teixeira','Rua Conde de Bonfim','Tijuca','Rio de Janeiro','RJ','22020001','20000312',18,'M',120000,22000,0);
 select * from clientes;
 
 /*INCLUINDO MULTIPLOS REGISTROS*/
 use vendas_sucos;
 
 select * from sucos_vendas.tabela_de_produtos;
 
 select CODIGO_DO_PRODUTO as CODIGO, NOME_DO_PRODUTO as DESCRIPTOR, SABOR, TAMANHO, EMBALAGEM, PRECO_DE_LISTA as PRECO_LISTA
 from sucos_vendas.tabela_de_produtos
 where CODIGO_DO_PRODUTO not in (select CODIGO from produtos);
 
 insert into produtos
 select CODIGO_DO_PRODUTO as CODIGO, NOME_DO_PRODUTO as DESCRIPTOR, SABOR, TAMANHO, EMBALAGEM, PRECO_DE_LISTA as PRECO_LISTA
 from sucos_vendas.tabela_de_produtos
 where CODIGO_DO_PRODUTO not in (select CODIGO from produtos);
 
 select * from produtos;
 
 /*Inclua todos os clientes na tabela CLIENTES baseados nos registros da 
 tabela TABELA_DE_CLIENTES da base SUCOS_VENDAS.*/
 
  use vendas_sucos;
  
  select * from sucos_vendas.tabela_de_clientes;
  
  insert into clientes
  select CPF, NOME, ENDERECO_1 AS ENDERECO, BAIRRO, CIDADE, ESTADO, CEP, DATA_DE_NASCIMENTO AS DATA_NASCIMENTO,
  IDADE, SEXO, LIMITE_DE_CREDITO AS LIMITE_CREDITO, VOLUME_DE_COMPRA AS VOLUME_COMPRA, PRIMEIRA_COMPRA
  from sucos_vendas.tabela_de_clientes
  where CPF not in (select CPF from clientes);
  
  select * from clientes;  
  
  /*ALTERANDO DADOS DA TABELA*/
  
  select * from produtos;
  
  update produtos set PRECO_LISTA = 5 where CODIGO = '1000889';
  
  update produtos set EMBALAGEM = 'PET', DESCRIPTOR = 'Sabor da Montanha - 1 Litro - Uva', TAMANHO = '1 Litro'
  where CODIGO = '1000889';
  
  select * from produtos where SABOR = 'Maracujá';
  
  update produtos set PRECO_LISTA = PRECO_LISTA * 1.10 where SABOR = 'Maracujá';
  
  /*Atualize o endereço do cliente com cpf 19290992743 para R. Jorge Emílio 23 o 
  bairro para Santo Amaro, a cidade para São Paulo, o estado para SP e o CEP para 8833223.*/  
  
  select * from clientes where CPF = '19290992743';
  
  update clientes set ENDERECO = 'R.Jorge Emílio 23', BAIRRO = 'Santo Amaro', CIDADE = 'São Paulo', ESTADO = 'SP', CEP = '8833223' 
  where CPF = '19290992743';
    
  /*USANDO UPDATE COM FROM*/
  
  select * from vendedores;
  
  select * FROM sucos_vendas.tabela_de_vendedores;
  
  select * from vendedores as V
  inner join sucos_vendas.tabela_de_vendedores as TV
  on V.MATRICULA = substring(TV.MATRICULA,3,3);
  
  update vendedores as V inner join sucos_vendas.tabela_de_vendedores as TV
  on V.MATRICULA = substring(TV.MATRICULA,3,3)
  SET V.FERIAS = TV.DE_FERIAS;
  
  /*Podemos observar que os vendedores possuem bairro associados a eles. 
  Vamos aumentar em 30% o volume de compra dos clientes que possuem, em 
  seus endereços bairros onde os vendedores possuam escritórios.

  Dica: Vamos usar um UPDATE com FROM usando o seguinte INNER JOIN:*/
  
  select * from clientes;
  
  select * from vendedores;
  
  select * from clientes as C
  inner join vendedores as V
  on C.BAIRRO = V.BAIRRO;
    
  update clientes as C
  inner join vendedores as V
  on C.BAIRRO = V.BAIRRO
  set C.VOLUME_COMPRA = C.VOLUME_COMPRA * 1.30;
  
  /*EXCLUINDO DADOS DA TABELA*/
  
  insert into produtos (CODIGO,DESCRIPTOR,SABOR,TAMANHO,EMBALAGEM,PRECO_LISTA)
  values ('1001001','Sabor dos Alpes 700 ml - Manga','Manga','700 ml','Garrafa',7.50),
  
         ('1001000','Sabor dos Alpes 700 ml - Melão','Melão','700 ml','Garrafa',7.50),

         ('1001002','Sabor dos Alpes 700 ml - Graviola','Graviola','700 ml','Garrafa',7.50),

         ('1001003','Sabor dos Alpes 700 ml - Tangerina','Tangerina','700 ml','Garrafa',7.50),

         ('1001004','Sabor dos Alpes 700 ml - Abacate','Abacate','700 ml','Garrafa',7.50),

         ('1001005','Sabor dos Alpes 700 ml - Açai','Açai','700 ml','Garrafa',7.50),

         ('1001006','Sabor dos Alpes 1 Litro - Manga','Manga','1 Litro','Garrafa',7.50),

         ('1001007','Sabor dos Alpes 1 Litro - Melão','Melão','1 Litro','Garrafa',7.50),

         ('1001008','Sabor dos Alpes 1 Litro - Graviola','Graviola','1 Litro','Garrafa',7.50),

         ('1001009','Sabor dos Alpes 1 Litro - Tangerina','Tangerina','1 Litro','Garrafa',7.50),

         ('1001010','Sabor dos Alpes 1 Litro - Abacate','Abacate','1 Litro','Garrafa',7.50),

         ('1001011','Sabor dos Alpes 1 Litro - Açai','Açai','1 Litro','Garrafa',7.50);
         
  select * from produtos where substring(descriptor,1,15) = 'Sabor dos Alpes';
  
  delete from produtos where CODIGO = '1001000';
  
  delete from produtos where TAMANHO = '1 Litro' and substring(descriptor,1,15) = 'Sabor dos Alpes';
  
  select CODIGO_DO_PRODUTO from sucos_vendas.tabela_de_produtos;
  
  select CODIGO, DESCRIPTOR from produtos where
  CODIGO not in (select CODIGO_DO_PRODUTO from sucos_vendas.tabela_de_produtos);
  
  delete from produtos where
  CODIGO not in (select CODIGO_DO_PRODUTO from sucos_vendas.tabela_de_produtos);
  
  
  /*Desafio: Vamos excluir as notas fiscais (Apenas o cabeçalho) 
  cujos clientes tenham a idade menor ou igual a 18 anos.*/
  
  delete N from notas as N
  inner join clientes as C on N.CPF = C.CPF
  where C.IDADE <= 18;
  
  /*ALTERANDO E APAGANDO TODA A TABELA*/
  
  CREATE TABLE `produtos_2` (
  `CODIGO` varchar(10) NOT NULL,
  `DESCRIPTOR` varchar(100) DEFAULT NULL,
  `SABOR` varchar(50) DEFAULT NULL,
  `TAMANHO` varchar(50) DEFAULT NULL,
  `EMBALAGEM` varchar(50) DEFAULT NULL,
  `PRECO_LISTA` float DEFAULT NULL,
  PRIMARY KEY (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

  select * from produtos_2;
  
  insert into produtos_2
  select * from produtos;
  
  update produtos_2 set PRECO_LISTA = 8;  
  
  delete from produtos_2;
  
  /*Apague todos os dados da tabela NOTAS e ITENS_NOTAS.*/
  
  select * from notas;
  
  select * from itens_notas;
  
  delete from notas;
  
  delete from itens_notas;
  
  /*COMMMIT E ROLLBACK*/
  
  start transaction; -- Inicia uma transaction
  
  select * from vendedores; -- Seleciona a tabela de vendedores
  
  update vendedores set COMISSAO = COMISSAO * 1.15; -- Atribui um aumento de 15% na comissão dos vendedores
  
  rollback; -- Retorna as alterações anteriores a transaction
  
  commit; -- Confirma as alterações na transaction
  
  start transaction;  
  select * from vendedores;  
  INSERT INTO vendedores VALUES(239,'Rodrigo Costa','Parque Ideal',9 ,'2022-01-05',0);
  rollback;   
  commit; 
  
  
  /*CAMPO AUTO-INCREMENTO*/
  
  create table tb_identity (
  ID int auto_increment,
  DESCRITOR varchar(20),
  primary key(ID));
  
  insert into tb_identity (DESCRITOR) values ('Cliente1');
  insert into tb_identity (DESCRITOR) values ('Cliente2');
  insert into tb_identity (DESCRITOR) values ('Cliente3');
  insert into tb_identity (ID, DESCRITOR) values (null, 'Cliente4');
  
  delete from tb_identity where ID = 2;
  
  insert into tb_identity (ID, DESCRITOR) values (null, 'Cliente5');
  
  delete from tb_identity where ID = 5;
  
  insert into tb_identity (ID, DESCRITOR) values (null, 'Cliente6');
  
  insert into tb_identity (ID, DESCRITOR) values (100, 'Cliente100');
  
  insert into tb_identity (ID, DESCRITOR) values (null, 'Cliente101');
  
  select * from tb_identity;
  
  /*DEFININDO PADRÕES PARA OS CAMPOS*/
  
  create table tb_padrao(
  ID int auto_increment,
  DESCRITOR varchar(20),
  ENDERECO varchar(100) null,
  CIDADE varchar(50) default 'Minas Gerais',
  DATA_CRIACAO timestamp default current_timestamp(),
  primary key(ID));
  
  insert into tb_padrao (DESCRITOR, ENDERECO, CIDADE, DATA_CRIACAO) values ('Cliente X','Rua alta','São Paulo', '2022-09-06');
  insert into tb_padrao (DESCRITOR) values ('Cliente Y');
  
  select * from tb_padrao;
  
  /*TRIGGER - (Gatilho) Um tipo especial de procedimento  armazenado executado automaticamente quando um evento ocorre no servidor 
  de banco de dados*/
  
  create table tb_faturamento(
  DATA_VENDA date null,
  TOTAL_VENDA float);
  
  select * from tb_faturamento;
  
  select * from notas;
  
  select * from itens_notas;
  
  insert into notas (NUMERO, DATA_VENDA, CPF, MATRICULA, IMPOSTO) 
  values ('0100', '2022-09-22', '1471156710', '235', 0.10);
  insert into itens_notas (NUMERO, CODIGO, QUANTIDADE, PRECO)
  values ('0100', '1000889', 100, 10);
  insert into itens_notas (NUMERO, CODIGO, QUANTIDADE, PRECO)
  values ('0100', '1002334', 100, 10);
  
  insert into notas (NUMERO, DATA_VENDA, CPF, MATRICULA, IMPOSTO) 
  values ('0101', '2022-09-22', '1471156710', '235', 0.10);
  insert into itens_notas (NUMERO, CODIGO, QUANTIDADE, PRECO)
  values ('0101', '1000889', 100, 10);
  insert into itens_notas (NUMERO, CODIGO, QUANTIDADE, PRECO)
  values ('0101', '1002334', 100, 10);
  
  insert into notas (NUMERO, DATA_VENDA, CPF, MATRICULA, IMPOSTO) 
  values ('0102', '2022-09-22', '1471156710', '235', 0.10);
  insert into itens_notas (NUMERO, CODIGO, QUANTIDADE, PRECO)
  values ('0102', '1000889', 100, 10);
  insert into itens_notas (NUMERO, CODIGO, QUANTIDADE, PRECO)
  values ('0102', '1002334', 100, 10); 
  
  insert into notas (NUMERO, DATA_VENDA, CPF, MATRICULA, IMPOSTO) 
  values ('0103', '2022-09-22', '1471156710', '235', 0.10);
  insert into itens_notas (NUMERO, CODIGO, QUANTIDADE, PRECO)
  values ('0103', '1000889', 100, 10);
  insert into itens_notas (NUMERO, CODIGO, QUANTIDADE, PRECO)
  values ('0103', '1002334', 100, 10);
  
  insert into notas (NUMERO, DATA_VENDA, CPF, MATRICULA, IMPOSTO) 
  values ('0104', '2022-09-22', '1471156710', '235', 0.10);
  insert into itens_notas (NUMERO, CODIGO, QUANTIDADE, PRECO)
  values ('0104', '1000889', 100, 10);
  insert into itens_notas (NUMERO, CODIGO, QUANTIDADE, PRECO)
  values ('0104', '1002334', 100, 10);
  
  insert into notas (NUMERO, DATA_VENDA, CPF, MATRICULA, IMPOSTO) 
  values ('0105', '2022-09-22', '1471156710', '235', 0.10);
  insert into itens_notas (NUMERO, CODIGO, QUANTIDADE, PRECO)
  values ('0105', '1000889', 100, 10);
  insert into itens_notas (NUMERO, CODIGO, QUANTIDADE, PRECO)
  values ('0105', '1002334', 100, 10);
  
  insert into notas (NUMERO, DATA_VENDA, CPF, MATRICULA, IMPOSTO) 
  values ('0106', '2022-09-22', '1471156710', '235', 0.10);
  insert into itens_notas (NUMERO, CODIGO, QUANTIDADE, PRECO)
  values ('0106', '1000889', 100, 10);
  insert into itens_notas (NUMERO, CODIGO, QUANTIDADE, PRECO)
  values ('0106', '1002334', 100, 10);
  
  delete from tb_faturamento;   
  insert into tb_faturamento
  select N.DATA_VENDA, sum(ITN.QUANTIDADE * ITN.PRECO) AS TOTAL_VENDA
  from  notas as N
  inner join itens_notas as ITN on N.NUMERO = ITN.NUMERO
  group by N.DATA_VENDA;
  
  select * from tb_faturamento;
  
  DELIMITER //
  create trigger TG_CALCULA_FATURAMENTO_INSERT after insert on itens_notas
  for each row begin  
	  delete from tb_faturamento;   
	  insert into tb_faturamento
	  select N.DATA_VENDA, sum(ITN.QUANTIDADE * ITN.PRECO) AS TOTAL_VENDA
	  from  notas as N
	  inner join itens_notas as ITN on N.NUMERO = ITN.NUMERO
	  group by N.DATA_VENDA;  
  end //
  
  
  SELECT CPF, IDADE, DATA_NASCIMENTO, timestampdiff(YEAR, DATA_NASCIMENTO, NOW()) AS ANOS FROM
  CLIENTES
  
 /*Caso seja necessário calcular a idade de um(a) novo(a) cliente, que será inserido(a)
 na tabela CLIENTES, podemos utilizar o BEFORE INSERT. Antes do registro ir para a tabela,
 o cálculo da idade será realizado como é demonstrado abaixo:*/
 
 
DELIMITER//

CREATE TRIGGER TG_CLIENTES_IDADE_INSERT BEFORE INSERT ON CLIENTES

FOR EACH ROW

BEGIN

SET NEW.IDADE = timestampdiff(YEAR, NEW.DATA_NASCIMENTO, NOW());

END//

/*Vale ressaltar que o código acima é válido para novos(as) clientes. Em caso de 
registros já existentes no banco de dados, a idade não se altera. Observe que não
 utilizamos o UPDATE, mas sim a cláusula SET diretamente. Uma vez que não podemos
 utilizar um comando UPDATE em uma trigger, na qual a tabela a ser atualizada é a
 mesma que sofrerá a ação para acionar a trigger (neste caso, a tabela "clientes"),
 utilizamos o comando SET atualizando apenas os novos registros a serem inseridos na
 tabela. O operador NEW representa o novo registro que será incluído.*/
 
 /*TRIGGER - UPDATE E DELETE*/
 
 select * from notas;
 select * from itens_notas;
 select * from tb_faturamento;
 
 update itens_notas set QUANTIDADE = 900
 where NUMERO = '0104' and CODIGO = '1002334';
 select * from tb_faturamento;
 
 DELIMITER //
  create trigger TG_CALCULA_FATURAMENTO_UPDATE after update on itens_notas
  for each row begin  
	  delete from tb_faturamento;   
	  insert into tb_faturamento
	  select N.DATA_VENDA, sum(ITN.QUANTIDADE * ITN.PRECO) AS TOTAL_VENDA
	  from  notas as N
	  inner join itens_notas as ITN on N.NUMERO = ITN.NUMERO
	  group by N.DATA_VENDA;  
  end //
  
  DELIMITER //
  create trigger TG_CALCULA_FATURAMENTO_DELETE after delete on itens_notas
  for each row begin  
	  delete from tb_faturamento;   
	  insert into tb_faturamento
	  select N.DATA_VENDA, sum(ITN.QUANTIDADE * ITN.PRECO) AS TOTAL_VENDA
	  from  notas as N
	  inner join itens_notas as ITN on N.NUMERO = ITN.NUMERO
	  group by N.DATA_VENDA;  
  end //
  
  update itens_notas set QUANTIDADE = 900
  where NUMERO = '0104' and CODIGO = '1002334';
  select * from tb_faturamento;
  
  delete from itens_notas where NUMERO = '0104' and CODIGO = '1002334';
  select * from tb_faturamento;
