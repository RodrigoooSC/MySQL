/*CRIANDO STORED PROCEDURES*/

-- Nome da Stored Procedure deve ter apenas letras números, $ e underscore(_)
-- Tamanho máximo 64 caracteres
-- Deve ser nome único
-- È case sensitive

call Hello_World;

call Mostra_Numero;

call Mostra_Numero_2;

call Funcao_Concat;

/*CRIANDO E ALTERANDO STORED PROCEDURE*/

USE `vendas_sucos`;
DROP procedure IF EXISTS `vendas_sucos`.`Stored_1`;
;

DELIMITER $$
USE `vendas_sucos`$$
CREATE PROCEDURE `Stored_1`()
BEGIN
select concat('Hello World !!!', ' .... ' , (2 + 9 - 8)) as 'Resultado';
END$$

DELIMITER ;
;

/*DELETANDO STORED PROCEDURE*/

USE `vendas_sucos`;
DROP procedure IF EXISTS `vendas_sucos`.`Stored_1`;

/*DECLARANDO VARIÁVEIS*/

-- DECLARE variable_name datatype DEFAULT value;
-- Datatype é obrigatório
-- Default é opcional
-- Nome da variável de ter apenas letras, números, $ e underscore( _)
-- Deve ser único dentro da stored procedures
-- É case sensitive
-- Tamanho máximo 255 caracteres
-- Se não houver DEFAULT o valor da variável será NULL
-- A linha da declaração deve terminar com ponto e vírgula

-- TIPOS DE VARIÁVEIS
	-- Varchar(n) - Caracteres textos com tamanho máximo de 'n' caracteres
    -- Integer - Variável do tipo inteiro
    -- Decimal(p,s) - Variável decimal com 'p' dígitos e 's' pontos decimais
    -- Date - Para guardar uma data
    -- TimeStamp - Para guardar data e hora

call Exibi_variavel;

call Tipos_de_dados;

call Data_hora_local;

call Mesmo_tipo_dados;

call Atribui_valor;


/*Crie 4 variáveis com as características abaixo:

Nome: Cliente. 
Tipo: Caracteres com 10 posições. 
Valor: JoãoCOPIAR CÓDIGO
Nome: Idade. 
Tipo: Inteiro. 
Valor: 10COPIAR CÓDIGO
Nome: DataNascimento. 
Tipo: Data. 
Valor: 10/01/2007COPIAR CÓDIGO
Nome: Custo. 
Tipo: Número com casas decimais. 
Valor: 10,23COPIAR CÓDIGO
Construa um script declarando estas variáveis, 
atribuindo valores a elas e exibindo na saída 
do MYSQL.(Dê o nome da procedure de sp_Exerc01).*/

call sp_Exerc01;

/*MANIPULANDO BANCO DE DADOS*/

INSERT INTO tabela_de_produtos (CODIGO_DO_PRODUTO,NOME_DO_PRODUTO,SABOR,TAMANHO,EMBALAGEM,PRECO_DE_LISTA)
VALUES ('2001001','Sabor da Serra 700 ml - Manga','Manga','700 ml','Garrafa',7.50),
('2001000','Sabor da Serra  700 ml - Melão','Melão','700 ml','Garrafa',7.50),
('2001002','Sabor da Serra  700 ml - Graviola','Graviola','700 ml','Garrafa',7.50),
('2001003','Sabor da Serra  700 ml - Tangerina','Tangerina','700 ml','Garrafa',7.50),
('2001004','Sabor da Serra  700 ml - Abacate','Abacate','700 ml','Garrafa',7.50),
('2001005','Sabor da Serra  700 ml - Açai','Açai','700 ml','Garrafa',7.50),
('2001006','Sabor da Serra  1 Litro - Manga','Manga','1 Litro','Garrafa',7.50),
('2001007','Sabor da Serra  1 Litro - Melão','Melão','1 Litro','Garrafa',7.50),
('2001008','Sabor da Serra  1 Litro - Graviola','Graviola','1 Litro','Garrafa',7.50),
('2001009','Sabor da Serra  1 Litro - Tangerina','Tangerina','1 Litro','Garrafa',7.50),
('2001010','Sabor da Serra  1 Litro - Abacate','Abacate','1 Litro','Garrafa',7.50),
('2001011','Sabor da Serra  1 Litro - Açai','Açai','1 Litro','Garrafa',7.50);

SELECT * FROM tabela_de_produtos WHERE NOME_DO_PRODUTO LIKE 'Sabor da Serra%';

UPDATE tabela_de_produtos SET PRECO_DE_LISTA = 8 WHERE NOME_DO_PRODUTO LIKE 'Sabor da Serra%';

SELECT * FROM tabela_de_produtos WHERE NOME_DO_PRODUTO LIKE 'Sabor da Serra%';

DELETE FROM tabela_de_produtos WHERE NOME_DO_PRODUTO LIKE 'Sabor da Serra%';

SELECT * FROM tabela_de_produtos WHERE NOME_DO_PRODUTO LIKE 'Sabor da Serra%';


call Manipulacao_dados;

call Inclui_novo_produto;

SELECT * FROM tabela_de_produtos WHERE NOME_DO_PRODUTO LIKE 'Sabor do mar%';


/*Crie uma Stored procedure que atualize a idade dos clientes. 
Lembrando que o comando para calcular a idade, na tabela Tabela_de_Clientes é:

TIMESTAMPDIFF(YEAR, c.data_de_nascimento, CURDATE()) as idade COPIAR CÓDIGO
Nome da Stored Procedure: Calcula_Idade.*/

call Calcula_Idade;

/*PARAMETROS*/

/*declare vCodigo varchar(50) default '3000001';
declare vNome varchar(50) default 'Sabor do mar 700ml - Manga';
declare vSabor varchar(50) default 'Manga';
declare vTamanho varchar(50) default '700 ml';
declare vEmbalagem varchar(50) default 'Garrafa';
declare vPreco decimal(10,2) default 9.25;

insert into tabela_de_produtos (CODIGO_DO_PRODUTO,NOME_DO_PRODUTO,SABOR,TAMANHO,EMBALAGEM,PRECO_DE_LISTA)
values (vCodigo, vNome, vSabor, vTamanho, vEmbalagem, vPreco);*/

select * from tabela_de_produtos where CODIGO_DO_PRODUTO = '4000001';

call Inclui_novo_produto_parametro('4000001', 'Sabor do Pantanal 1 Litro - Melância', 'Melância', '1 Litro', 'Pet', 4.67);

/*Crie uma Stored procedure para reajustar o % de comissão dos vendedores. 
Inclua como parâmetro da SP o %, expresso em valor (Ex: 0,90).

Nome da Stored Procedure: Reajuste_Comissao.*/

call Reajuste_Comissao(0.9);

/*CONTROLE DE ERROS*/

call Inclui_novo_produto_parametro('4000003', 'Sabor do Pantanal 700 ml - Melância', 'Melância', '700 ml', 'Garrafa', 3.67);

/*ATRIBUIÇÃO DE VALOR USANDO SELECT*/

select SABOR from tabela_de_produtos where CODIGO_DO_PRODUTO = '4000001';

call Acha_sabor_produto('1013793000');

/*Crie uma variável chamada NUMNOTAS e atribua a ela o número de
 notas fiscais do dia 01/01/2017. Mostre na saída do script o valor
 da variável. (Chame esta Stored Procedure de Quantidade_Notas).*/
 
 call Quantidade_notas;
 
 /*IF THEN ELSE*/
 
 /*
   IF condition THEN
	if_statements;
   ELSE
	else_statements;
   END IF
*/

select * from tabela_de_clientes;

call Cliente_novo_velho('19290992743');
call Cliente_novo_velho('1471156710');

/*Crie uma Stored Procedure que, baseado em uma data, contamos o número de notas fiscais. 
Se houverem mais que 70 notas exibimos a mensagem: ‘Muita nota’. Ou então exibimos a mensagem
‘Pouca nota’. Também exibir o número de notas. Chame esta Stored Procedure de Testa_Numero_Notas.

A data a ser usada para testar a nota será um parâmetro da Stored Procedure.*/

call Testa_numero_notas('20150301');

/*IF THEN ELSEIF*/
 
 /*
   IF condition THEN
	if_statements;
   ELSEIF condition
	elseif_statements;
    ELSEIF condition
	elseif_statements;
    (...)
   ELSE
	else_stattements;
   END IF
 */
 
  select * from tabela_de_produtos;
  
  select PRECO_DE_LISTA from tabela_de_produtos where CODIGO_DO_PRODUTO = '1000889';
  
  call Acha_status_preco('326779');
  
  /*Desafio! Veja a consulta abaixo:

SELECT SUM(B.QUANTIDADE * B.PRECO) AS TOTAL_VENDA FROM 
NOTAS_FISCAIS A INNER JOIN ITENS_NOTAS_FISCAIS B
ON A.NUMERO = B.NUMERO
WHERE A.DATA_VENDA = '20170301'COPIAR CÓDIGO
Ela retorna o valor do faturamento em uma determinada data.

Construa uma Stored Procedure chamada Comparativo_Vendas que 
compara as vendas em duas datas (Estas duas datas serão parâmetros da SP).
 Se a variação percentual destas vendas for maior que 10% a resposta deve 
 ser ‘Verde’. Se for entre -10% e 10% deve retornar ‘Amarela1. Se o retorno
 form menor que -10% deve retornar ‘Vermelho’.*/


SELECT SUM(B.QUANTIDADE * B.PRECO) AS TOTAL_VENDA FROM 
NOTAS_FISCAIS A INNER JOIN ITENS_NOTAS_FISCAIS B
ON A.NUMERO = B.NUMERO
WHERE A.DATA_VENDA = '20170301';

call Comparativo_vendas('20150301','20170301');

/*CASE END CASE*/

 select distinct SABOR from tabela_de_produtos where CODIGO_DO_PRODUTO = '1000889';
 
 /*
 'Lima/limão' - 'Cítrico'
 'Laranja' - 'Cítrico'
 'Morango/Limão' - 'Cítrico'
 'Uva' - 'Neutros'
 'Morango' - 'Neutros'
 'Outros' - 'Acidos'
 */
 
call Acha_tipo_sabor('1000889');

call Acha_tipo_sabor_erro('1004337');


/*CASE COINDICIONAL*/

call Acha_status_preco_case('1000889');


/*Implemente a Stored Procedure do exercício do vídeo 2, 
agora usando CASE CONDICIONAL. Chame de Comparativo_Vendas_Case_Cond.*/

call Comparativo_vendas_case('20150301','20170301');

/*LOOPING*/

/* WHILE condtion
   do statements;
   END WHILE;
*/

create table tab_looping (id int);


call Looping_while(1,1000);

/*Sabendo que a função abaixo soma de 1 dia uma data:

SELECT ADDDATE(DATA_VENDA, INTERVAL 1 DAY);

Faça uma Stored Procedure que,a partir do dia 01/01/2017, iremos contar o número de notas fiscais até o dia 10/01/2017. Devemos imprimir a data e o número de notas fiscais dia a dia. Chame esta Stored Procedure de Soma_Dias_Notas.

Dicas:

Declare variáveis do tipo DATE: Data inicial e final; Faça um loop 
testando se Data inicial < Data final; Imprima na saída do MYSQL a 
data e o número de notas. Não esquecer de converter as variáveis para
 VARCHAR; Some a data em 1 dia.*/
 
 call Soma_Dias_Notas;
 
 
 /*PROBLEMA DO SELCT INTO*/
 
 call Teste_select_into;
 
 /*DEFINIÇÃO DE CURSOR*/
 /* Curso é um estrutura implementada no MySQL que permite uma 
 interatividade linha a linha atrvés de uma determinada ordem.
 
 - Fases para o uso do cursor:
 
 * Declaração - Onde definimos qula consulta SQL estará sendo carregada ao cursor;
 * Abertura: Abrimos o cursor para percorre-lô linha a linha;
 * Percorre linha a linha até o seu final;
 * Fecha o cursor; e
 * Limpa o cursor da memória.
 
 call Cursor_1();
 
 /*LOOPING COM CURSOR*/
 
 call Cursor_Looping;
 
 /*Crie uma Stored Procedure usando um cursor 
 para achar o valor total de todos os créditos
 de todos os clientes. Chame esta SP de Limite_Creditos.

 Dicas:

 Declare duas variáveis: Uma que recebe o limite
 de crédito do cursor e outra o limite de crédito
 total; Faça um loop no cursor e vá somando na 
 variável limite de crédito total o valor do limite
 de cada cliente; Exiba o valor total do limite.*/
 
 call Limite_creditos;
 
 /*CURSOR ACESSANDO MAIS DE UM CAMPO*/
 
 select * from tabela_de_clientes;
 
 call Looping_cursor_multiplas_colunas;
 
 /*Crie uma Stored Procedure usando um cursor para achar
 o valor total do faturamento para um mês e um ano.

Dicas:

Declare três variáveis: Uma que recebe a quantidade,
 outra o preço e uma terceira que irá acumular o 
 faturamento; Faça um loop no cursor e vá somando o 
 faturamento de cada nota; Exiba o valor total do limite;
 Lembrando a consulta que obter o faturamento dentro de um mês e ano.*/
 
call Mais_Um_Campo;

/*ENTENDENDO FUNÇÕES*/

SET GLOBAL log_bin_trust_function_creators = 1; -- Permiti a criação de funções no MySQL

select F_Acha_Tipo_Sabor('Laranja') as 'Tipo Sabor';

select NOME_DO_PRODUTO, SABOR from tabela_de_produtos;

select NOME_DO_PRODUTO, SABOR, F_Acha_Tipo_Sabor(SABOR) as 'Tipo Sabor'  from tabela_de_produtos;

select NOME_DO_PRODUTO, SABOR from tabela_de_produtos where F_Acha_Tipo_Sabor(SABOR)= 'Neutro';

select concat(NOME_DO_PRODUTO, ' ', SABOR) from tabela_de_produtos;

/*Transforme esta SP em uma função onde passamos como parâmetro da
 data e retornamos o número de notas. Chame esta função de NumeroNotas.
 Após a criação da função teste seu uso com um SELECT.*/

select F_Numero_Notas('20150101');

/*PROBLEMA PRÁTICO*/

-- Fórmula Número Aleatório =  (ALEATORIO() * (NUMERO_MAX - NUMERO_MIN + 1 )) + NUMERO_MINIMO
select floor((rand() * (300 - 15 + 1)) + 15);

select F_Numero_Aleatorio(1,15);


/*Crie uma tabela chamada TABELA_ALEATORIOS. O comando para cria-la é mostrado abaixo:

CREATE TABLE TABELA_ALEATORIOS(NUMERO INT);

Faça uma SP (Chame-a de Tabela_Numeros) que use um loop para gravar nesta tabela 
100 números aleatórios entre 0 e 1000. Depois liste numa consulta esta tabela.*/

create table tabela_aleatorios(NUMERO int);

call Tabela_Numeros;

select * from tabela_de_clientes limit 0,1;

select * from tabela_de_clientes limit 15,1;

select F_Cliente_Aleatorio();

/*Crie outra função para obter o produto também usando a função aleatório.*/

select F_Produto_Aleatorio();

/*Crie outra função para obter o vendedor  também usando a função aleatório.*/

select F_Vendedor_Aleatorio();

/*INCLUINDO A VENDA*/

select F_Cliente_Aleatorio(),F_Vendedor_Aleatorio(), F_Produto_Aleatorio();  

select max(NUMERO) + 1 from notas_fiscais;

select PRECO_DE_LISTA from tabela_de_produtos where CODIGO_DO_PRODUTO = '1000889';

call Inserir_Venda('20221014', 20, 100);

select NF.NUMERO, count(*) as Numero_Itens, sum(ITN.QUANTIDADE * ITN.PRECO) AS Faturado
from notas_fiscais as NF
inner join  itens_notas_fiscais as ITN on NF.NUMERO = ITN.NUMERO
where NF.DATA_VENDA = '20221014' group by NF.NUMERO;


/*MELHORANDO TRIGGERS*/

CREATE TABLE TAB_FATURAMENTO (DATA_VENDA DATE NULL, TOTAL_VENDA FLOAT);

DELIMITER //
CREATE TRIGGER TG_CALCULA_FATURAMENTO_INSERT AFTER INSERT ON ITENS_NOTAS_FISCAIS
FOR EACH ROW BEGIN
  call Calculo_Faturamento;
END//

DELIMITER //
CREATE TRIGGER TG_CALCULA_FATURAMENTO_UPDATE AFTER UPDATE ON ITENS_NOTAS_FISCAIS
FOR EACH ROW BEGIN
  call Calculo_Faturamento;
END//

DELIMITER //
CREATE TRIGGER TG_CALCULA_FATURAMENTO_DELETE AFTER DELETE ON ITENS_NOTAS_FISCAIS
FOR EACH ROW BEGIN
  call Calculo_Faturamento;
END//

DROP TRIGGER TG_CALCULA_FATURAMENTO_INSERT;
DROP TRIGGER TG_CALCULA_FATURAMENTO_UPDATE;
DROP TRIGGER TG_CALCULA_FATURAMENTO_DELETE;


call Inserir_Venda('20221009', 46, 100);

SELECT * FROM tab_faturamento where  DATA_VENDA between '20200101' and  '20221014';