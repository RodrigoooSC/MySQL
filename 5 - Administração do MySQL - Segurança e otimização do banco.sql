/*DBA - Database Administrator

* Avaliar e instalar o ambiente MySQL;
* Configurar o acesso a base de dados;
* Manter o banco de dados com performance;
* Manter os dados através de processos de backup;
* Auxiliar a área de desenvolvimento na manutenção dos dados;
* Monitorar a instalação do MySQL;
* Configurar o ambiente; 
* Administrar os usuários de acesso. */

/*Comando Serviço MySQL(Windows)
net stop mysql80 -- Para o serviço do MySQL
net start mysql80 -- Inicia o serviço do MySQL */ 

/*TUNING DE HARDWARE*/

-- Existem quatro maneiras de configurar o ambiente do MySQL para fazer tuning;
-- Esquema e índices, mysqld tuning e tuning de sistema opercional;
-- Ênfase ao tuning usando o mysqld e tuning de hardware.

-- Preferência a sistema operacional de 64 bits;
-- Ver a relação entre RAM e base de dados;
-- Ver tipo de leitura de disco;
-- Usar controladora de disco RAID;

/*VARIÁVEIS DE AMBIENTE*/

-- Tuning o MySQL: Através de variáveis de ambiente (+250);
-- O comando SHOW STATUS mostra a situação atual das variáveis de ambiente.
-- Temos dois tipos : GLOBAL e SESSION.
-- my.ini(Windows) / my.cnf(Linux) - Arquivos de inicializações de variáveis.
-- Possui duas diretivas: [mysqld] e [client].

show global status like 'Created_tmp_disk_tables'; -- Número de tabelas temporárias criadas que estam em disco.
show global status like 'Created_tmp_tables'; -- Número de tabelas temporárias criadas que estam em mémoria.
-- Número máximo de mémoria que podemos gastar para criar tabelas temporárias.

show global variables like 'tmp_table_size'; -- Verifica o limite de mb reservado para criação de tabela temporária.
set global tmp_table_size = 'Valor Reservado'; -- Aumenta o limite de mb reservado para criação de tabela temporária.

/*MECANISMO DE ARMAZENAMENTO MyISAM*/

--  20 Grandes mecanismos de armazenamentos são disponíveis.
 
-- Mecanismos de armazenamento permite que haja uma separação entre a armazenagem e o código principal do banco de dados.

-- Os mais usados são o MyISAM, InnoDB e MEMORY.

/*MyISAM*/

-- Não é transacional e não implementa mecanismos de bloqueio;
-- Rápido para leitura;
-- Problemático para muitas gravações.

-- Não transacional;
-- Nenhuma chave estrangeira suporta índices FULLTEXT para correspondência de texto;
-- Nenhum cache de dados Cache de índice - pode ser especificado pelo nome;
-- Implementa os índices HASH e BTREE;
-- Bloqueio no nível da tabela;
-- Atividade de leitura muito rápida, adequada para data Warehouses;
-- Dados compactos;

/*Variáveis de ambiente - MyISAM*/

-- key_buffer_size;
-- concurrent_insert;
-- delay_key+write;
-- max_write_lock_count;
-- preload_buffer_size;

/*Utilitários para manipular tabelas MyISAM*/

-- myisamchk
-- myisampack
-- myisam_ftdump


/*InnoDB*/

-- O mecanismo de armazenamento transacional mais usado é o mecanismo de armazenamento InnoDB.
-- O InnoDB trouxe suporte parachaves estrangeiras para o mysqld.

-- Suporte transacional completo.
-- Bloqueio de nível de linha e suporte de chave estrangeira.
-- Indexação usando índices BTREE.
-- Cache de buffer configurável de ambos os índices e dados.
-- Backup on-line sem bloqueio.


/*Variáveis de ambiente - InnoDB*/
/*
Innodb_data_file_path: Determina o caminho dentro do sistema operacional, onde as informações dos arquivos
são armazenados juntamente como o tamanho deles.

Innodb_data_home_dir: Diz qual o caminho comum de todos os arquivos db.

Innodb_file_per_table: Especifica cada tabela de armazenamento do índice e do dado.

innodb_buffer_poool_size: Determina o tamanho de buffer que o mecanismo de armazenamento innodb,
vai estar usando para armazenar dados e índices em cache

innodb_flush_log_at_trx_commit: Configura a frequência com que o buffer de log é liberado para o disco.
Na medida em que a gente vai usando o banco, esse buffer de log vai crescendo e de tempos em tempos,
ele é descarregado para o disco rígido.
 
innodb_log_file_size: Determinar o trabalho em bytes que cada um dos arquivos de log (InnoDB) vão ter.
O padrão dessa variável, quando você não menciona nada, é ter um log de no máximo 5MB.
/*

/*Memory*/

-- Nenhum suporte de chave estrangeira;
-- Muito rápido na leitura e escrita, devido a ser inteiramente na memória
-- Bloqueio no nível da tabela;

create database administrator;

create table default_table (ID integer, NOME varchar(100));

alter table default_table engine = MyISAM;

create table default_table_2 (ID integer, NOME varchar(100)) engine memory;

/*CRIANDO A BASE DE DADOS*/

 create database library;
 
 show variables where Variable_Name like '%dir'; -- datadir: Mostra o local onde as bases são armazenadas fisicamente
 
 /*REALIZANDO O BACKUP COM MYSQLDUMP*/
 
 -- Backup Lógico.
 -- Backup Físico.

/* Sintaxe: mysqldump [options]
	* Usuário, senha, servidor
    * --all-databases é a opção que diz que o BACKUP será completo.
    * > <Nome da saída> redireciona a saída backup.
    * Para incluir Stored Procedures e eventos do banco de dados usamos --routines e --events. /*
    
    -- https://dev.mysql.com/doc/refman/8.0/en/mysqldump.html
    
    lock instance for backup; -- Bloqueia o banco de dados
    
    unlock instance; -- desbloquia o banco de dados
    
    
    /*PLANO DE EXECUÇÃO*/ 
    
    -- Tempo: 3.75
    select A.NOME_DO_PRODUTO from tabela_de_produtos A;
    
     -- Tempo: 53725.73 (Original com PK e FK)
    select A.NOME_DO_PRODUTO, C.QUANTIDADE from tabela_de_produtos A inner join itens_notas_fiscais C ON A.CODIGO_DO_PRODUTO = C.CODIGO_DO_PRODUTO;
    
    -- Tempo: 747038.58 (Sem PK e FK)
    select A.NOME_DO_PRODUTO, C.QUANTIDADE from tabela_de_produtos2 A inner join itens_notas_fiscais2 C ON A.CODIGO_DO_PRODUTO = C.CODIGO_DO_PRODUTO;

	-- Tempo: 211850.87
	select A.NOME_DO_PRODUTO, year(B.DATA_VENDA) as Ano, C.QUANTIDADE from tabela_de_produtos A inner join itens_notas_fiscais C ON A.CODIGO_DO_PRODUTO = C.CODIGO_DO_PRODUTO inner join notas_fiscais B on C.NUMERO = B.NUMERO;
    
    -- Tempo: 211850.87
    select A.NOME_DO_PRODUTO, year(B.DATA_VENDA) as Ano, sum(C.QUANTIDADE) as Quantidade from tabela_de_produtos A inner join itens_notas_fiscais C ON A.CODIGO_DO_PRODUTO = C.CODIGO_DO_PRODUTO inner join notas_fiscais B on C.NUMERO = B.NUMERO group by A.NOME_DO_PRODUTO, year(B.DATA_VENDA);
   
    
    -- explain format=json select A.NOME_DO_PRODUTO from tabela_de_produtos A \G; -- Comando para analisar tempo de execução de query
    
    /*CONCEITO DE ÍNDICES*/
    
    /*ALGORITMOS HASH E B-TREE
    
    MYISAM
	* Cria uma estrutura a parte para índices PK e não PK.
	* Nesta estrutura a coluna do índice é ordenada e tem como referência a posição da linha da tabela original.
	* Implementa índices HASH e B-TREE.
    
    INNODB
	* A tabela original ja é ordenada pela PK.
    * Os índices não PK possuem estruturas a parte onde a coluna do índice é ordenada e tem como referência o valor da PK.
    * Implementa somente índices B-TREE.
    
    HASH e B-TREE são diferentes algoritmos de busca em lista ordenada.
    */
    
    /*USANDO ÍNDICES*/
	
    -- Tempo de execução da query 8855.65
    -- explain format=json select *from notas_fiscais where DATA_VENDA = '20170101' \G; 
    
    -- Criando índice para o campa DATA_VENDA e melhorando o tempo de execução da query para 54.86
    -- alter table notas_fiscais add index (DATA_VENDA); -- Cria o índice
	-- alter table notas_fiscais drop index DATA_VENDA; -- Apaga o índice
    
    select * from itens_notas_fiscais;
    
    
	CREATE TABLE `itens_notas_fiscais2` (
	  `NUMERO` int NOT NULL,
	  `CODIGO_DO_PRODUTO` varchar(10) NOT NULL,
	  `QUANTIDADE` int NOT NULL,
	  `PRECO` float NOT NULL  
	) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


	CREATE TABLE `notas_fiscais2` (
	  `CPF` varchar(11) NOT NULL,
	  `MATRICULA` varchar(5) NOT NULL,
	  `DATA_VENDA` date DEFAULT NULL,
	  `NUMERO` int NOT NULL,
	  `IMPOSTO` float NOT NULL  
	) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `tabela_de_produtos2` (
  `CODIGO_DO_PRODUTO` varchar(10) NOT NULL,
  `NOME_DO_PRODUTO` varchar(50) DEFAULT NULL,
  `EMBALAGEM` varchar(20) DEFAULT NULL,
  `TAMANHO` varchar(10) DEFAULT NULL,
  `SABOR` varchar(20) DEFAULT NULL,
  `PRECO_DE_LISTA` float NOT NULL 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert into itens_notas_fiscais2 select * from itens_notas_fiscais;

insert into notas_fiscais2 select * from notas_fiscais;

insert into tabela_de_produtos2 select * from tabela_de_produtos;

select * from tabela_de_produtos2;
select * from itens_notas_fiscais2;
select * from notas_fiscais2;

/*FERRAMENTA MYSQLSLAP -  simula acessos concorrentes a uma determinada consulta*/

-- Tempo: 77.18
select * from notas_fiscais where DATA_VENDA = '20170101';

alter table notas_fiscais add index(DATA_VENDA);

-- Tempo: 9026.63
select * from notas_fiscais2 where DATA_VENDA = '20170101';


-- Comando Slap
-- MYSQLSLAP -uroot -p --concurrency=100 --iterations=10 --create-schema=sucos_vendas --query="SELECT * FROM NOTAS_FISCAIS WHERE DATA_VENDA ='20170101'";


/*ACESSOS - Criando usuários*/


-- Criando acesso administrador
create user 'Admin02'@'localhost' identified by '510#353';
-- Adicionando privilégios ao usuário
grant all privileges on *.* to 'Admin02'@'localhost' with grant option; -- Todos os privilegios

-- Apagar o usuário
drop user 'root'@'localhost';

-- Criando acesso usuário
create user 'User02'@'localhost' identified by '380,120';
-- Adicionando privilégios ao usuário
grant SELECT, INSERT, UPDATE, DELETE, CREATE TEMPORARY TABLES, LOCK TABLES, EXECUTE
on *.* to 'User02'@'localhost' ; 
 
 -- Criando acesso usuário leitura
create user 'Read02'@'localhost' identified by '444(823';
-- Adicionando privilégios ao usuário leitura
grant SELECT, EXECUTE
 on *.* to 'Read02'@'localhost' ; 
 
 -- Criando acesso usuário backup
create user 'Backup02'@'localhost' identified by '150°222';
-- Adicionando privilégios ao usuário backup
grant SELECT, RELOAD, LOCK TABLES, REPLICATION CLIENT
on *.* to 'Backup02'@'localhost' ;
 
 /*ACESSANDO DE QUALQUER SERVIDOR*/
 
 -- Criando usuário genérico (Pode acessar de qualquer lugar)
 create user 'AdminGeneric02'@'%' identified by '100.285';
-- Adicionando privilégios ao usuário genérico 
grant all privileges on *.* to 'AdminGeneric02'@'%' ;

/*LIMITANDO ACESSO AOS ESQUEMAS*/

create user 'User04'@'%' identified by '500!200';
-- Adicionando privilégios ao usuário
grant SELECT, INSERT, UPDATE, DELETE, CREATE TEMPORARY TABLES, LOCK TABLES, EXECUTE
on sucos_vendas.* to 'User04'@'%' ; 
 
 create user 'User05'@'%' identified by '111,210';
-- Adicionando privilégios ao usuário
grant SELECT, INSERT, UPDATE, DELETE
on sucos_vendas.tabela_de_clientes to 'User05'@'%' ; 
grant SELECT
on sucos_vendas.tabela_de_produtos to 'User05'@'%' ;

/*REVOGAR PRIVILÉGIOS*/

select * from mysql.user;

show grants for 'User02'@'localhost';

revoke all privileges, grant option from 'User02'@'localhost';

grant SELECT, INSERT, UPDATE, DELETE, CREATE TEMPORARY TABLES, LOCK TABLES, EXECUTE
on *.* to 'User02'@'localhost'; 