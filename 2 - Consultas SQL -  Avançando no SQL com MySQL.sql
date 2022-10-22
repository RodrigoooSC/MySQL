/*BANCO DE DADOS*/
use sucos_vendas;

select CPF , NOME, ENDERECO_1, ENDERECO_2, BAIRRO, CIDADE, ESTADO, CEP, DATA_DE_NASCIMENTO, IDADE, SEXO, LIMITE_DE_CREDITO,
VOLUME_DE_COMPRA, PRIMEIRA_COMPRA from tabela_de_clientes;

select * from tabela_de_clientes;

select CPF, NOME from tabela_de_clientes;

select CPF as IDENTIFICADOR, NOME as NOME_COMPLETO from tabela_de_clientes;

select * from tabela_de_produtos;

select * from tabela_de_produtos where CODIGO_DO_PRODUTO = '1000889';

select * from tabela_de_produtos where SABOR = 'Manga';

select * from tabela_de_produtos where PRECO_DE_LISTA > 19.51;

select * from tabela_de_produtos where PRECO_DE_LISTA between 19.49 and 19.52;

/*CONSULTAS CONDICIONAIS*/
/*(NOT ((3 > 2) OR (4 >= 5)) AND (5 > 4) ) OR (9 > 0)

(NOT ((3 > 2) OR (4 >= 5)) AND (5 > 4) ) OR (9 > 0)
(NOT ((Verdadeiro) OR (Falso)) AND (Verdadeiro) ) OR (Verdadeiro)
(NOT (Verdadeiro) AND (Verdadeiro) ) OR (Verdadeiro)
(Falso AND Verdadeiro) OR (Verdadeiro)
(Falso) OR (Verdadeiro)
Verdadeiro */

select * from tabela_de_produtos where SABOR = 'Manga' or TAMANHO = '470 ml';

select * from tabela_de_produtos where SABOR = 'Manga' and TAMANHO = '470 ml';

select * from tabela_de_produtos where not(SABOR = 'Manga' or TAMANHO = '470 ml');

select * from tabela_de_produtos where not(SABOR = 'Manga' and TAMANHO = '470 ml');

select * from tabela_de_produtos where SABOR = 'Manga' and not(TAMANHO = '470 ml');

select * from tabela_de_produtos where SABOR in ('Laranja', 'Manga');

select * from tabela_de_clientes where CIDADE in ('São Paulo', 'Rio de Janeiro') and IDADE >= 20;

select * from tabela_de_clientes where CIDADE in ('São Paulo', 'Rio de Janeiro') and (IDADE >= 18 and IDADE <= 21);

/*COMANDO LIKE*/

select * from tabela_de_produtos where SABOR like '%Maça%';

select * from tabela_de_produtos where SABOR like '%Maça%' and EMBALAGEM = 'PET';

/*Quantos clientes possuem o último sobrenome Mattos?*/

select * from tabela_de_clientes where NOME like '%Mattos';

/*DISTINCT EM TABELAS*/

select EMBALAGEM , TAMANHO from tabela_de_produtos;

select distinct EMBALAGEM , TAMANHO from tabela_de_produtos;

select distinct EMBALAGEM , TAMANHO from tabela_de_produtos where SABOR = 'Laranja';

select distinct EMBALAGEM, TAMANHO , SABOR from tabela_de_produtos;

/*Quais são os bairros da cidade do Rio de Janeiro que possuem clientes?*/

select distinct BAIRRO from tabela_de_clientes where CIDADE = 'Rio de Janeiro';

/*LIMITANDO A SAÍDA DA CONSULTA*/

select * from tabela_de_produtos;

select * from tabela_de_produtos limit 5;

select * from tabela_de_produtos limit 2,3;

select * from tabela_de_produtos limit 0,2;

/*Queremos obter as 10 primeiras vendas do dia 01/01/2017. Qual seria o comando SQL para obter este resultado?*/

select * from notas_fiscais where DATA_VENDA = '2017-01-01' limit 10;

/*ORDENANDO A SAÍDA DA CONSULTA*/

select * from  tabela_de_produtos order by NOME_DO_PRODUTO ASC;

select * from  tabela_de_produtos order by NOME_DO_PRODUTO DESC;

select * from  tabela_de_produtos order by EMBALAGEM desc, NOME_DO_PRODUTO asc;

/*Qual (ou quais) foi (foram) a(s) maior(es) venda(s) do produto “Linha Refrescante - 1 Litro - Morango/Limão”, em quantidade? 
(Obtenha este resultado usando 2 SQLs).*/

select * from tabela_de_produtos where nome_do_produto = 'Linha Refrescante - 1 Litro - Morango/Limão';

select * from itens_notas_fiscais where codigo_do_produto = '1101035' order by QUANTIDADE desc;

/*AGRUPANDO RESULTADOS*/ -- SUM(SOMA) MAX(MÁXIMO) MIN(MÍNIMO) AVG(MÉDIA) COUNT(CONTA OCORRÊNCIAS)

select * from tabela_de_clientes;

select ESTADO, LIMITE_DE_CREDITO from tabela_de_clientes;

select ESTADO, sum(LIMITE_DE_CREDITO) as LIMITE_TOTAL from tabela_de_clientes group by ESTADO;

select * from tabela_de_produtos;

select EMBALAGEM, PRECO_DE_LISTA from tabela_de_produtos;

select EMBALAGEM, max(PRECO_DE_LISTA) as MAIOR_PRECO from tabela_de_produtos group by EMBALAGEM;

select EMBALAGEM, count(*) as CONTADOR from tabela_de_produtos group by EMBALAGEM;

select ESTADO, BAIRRO, sum(LIMITE_DE_CREDITO) AS LIMITE from tabela_de_clientes group by ESTADO, BAIRRO;

select BAIRRO, sum(LIMITE_DE_CREDITO) AS LIMITE from tabela_de_clientes where CIDADE = 'Rio de Janeiro' group by BAIRRO;

select ESTADO, BAIRRO, sum(LIMITE_DE_CREDITO) AS LIMITE from tabela_de_clientes where CIDADE = 'Rio de Janeiro' group by ESTADO, BAIRRO;

select ESTADO, BAIRRO, sum(LIMITE_DE_CREDITO) AS LIMITE from tabela_de_clientes 
where CIDADE = 'Rio de Janeiro' 
group by ESTADO, BAIRRO
order by BAIRRO;

/*Quantos itens de venda existem com a maior quantidade do produto '1101035'?*/
select QUANTIDADE from itens_notas_fiscais where CODIGO_DO_PRODUTO = '1101035'; 
select max(QUANTIDADE) as 'MAIOR QUANTIDADE' from itens_notas_fiscais where CODIGO_DO_PRODUTO = '1101035'; 
SELECT COUNT(*) FROM itens_notas_fiscais WHERE codigo_do_produto = '1101035' AND QUANTIDADE = 99;


/*USADO A CONDIÇÃO HAVING*/
select ESTADO, sum(LIMITE_DE_CREDITO) as SOMA_LIMITE from tabela_de_clientes group by ESTADO;

select ESTADO, sum(LIMITE_DE_CREDITO) as SOMA_LIMITE from tabela_de_clientes group by ESTADO 
having sum(LIMITE_DE_CREDITO) > 900000;

select EMBALAGEM, max(PRECO_DE_LISTA) as MAIOR_PRECO, min(PRECO_DE_LISTA) as MENOR_PRECO from tabela_de_produtos group by EMBALAGEM;

select EMBALAGEM, max(PRECO_DE_LISTA) as MAIOR_PRECO, min(PRECO_DE_LISTA) as MENOR_PRECO from tabela_de_produtos 
group by EMBALAGEM having sum(PRECO_DE_LISTA) <= 80;

select EMBALAGEM, max(PRECO_DE_LISTA) as MAIOR_PRECO, min(PRECO_DE_LISTA) as MENOR_PRECO from tabela_de_produtos 
group by EMBALAGEM having sum(PRECO_DE_LISTA) <= 80 and max(PRECO_DE_LISTA) >= 5;

/*Quais foram os clientes que fizeram mais de 2000 compras em 2016?*/
select * from tabela_de_clientes;
select CPF, COUNT(*) from notas_fiscais
where year(DATA_VENDA) = 2016
group by CPF
having COUNT(*) > 2000;

/*CLASSIFICAR RESULTADOS - CASE */

select * from tabela_de_produtos;

select NOME_DO_PRODUTO, PRECO_DE_LISTA,
case
 when PRECO_DE_LISTA >= 12 then 'Produto Caro'
 when PRECO_DE_LISTA >= 7 and PRECO_DE_LISTA < 12 then 'Produto em Conta'
 else 'Produto Barato' 
end as STATUS_PRECO 
from tabela_de_produtos;

select EMBALAGEM,
case
 when PRECO_DE_LISTA >= 12 then 'Produto Caro'
 when PRECO_DE_LISTA >= 7 and PRECO_DE_LISTA < 12 then 'Produto em Conta'
 else 'Produto Barato' 
end as STATUS_PRECO, avg(PRECO_DE_LISTA) as PRECO_MEDIO
from tabela_de_produtos group by EMBALAGEM,
case
 when PRECO_DE_LISTA >= 12 then 'Produto Caro'
 when PRECO_DE_LISTA >= 7 and PRECO_DE_LISTA < 12 then 'Produto em Conta'
 else 'Produto Barato' 
end order by EMBALAGEM;

/*Veja o ano de nascimento dos clientes e classifique-os como:
 Nascidos antes de 1990 são velhos, nascidos entre 1990 e 1995 
 são jovens e nascidos depois de 1995 são crianças. Liste o nome
 do cliente e esta classificação.*/ 
 
 select * from tabela_de_clientes; 
 select NOME,
	case
		when YEAR(DATA_DE_NASCIMENTO) < 1990 then 'São Velhos'
        when year(DATA_DE_NASCIMENTO) >= 1990 and year(DATA_DE_NASCIMENTO) <= 1995 then 'São Jovens'
        else 'São Crianças' 
	end as 'CLASSIFICAÇÃO POR IDADE'
    from tabela_de_clientes;
    
    /*USANDO JOINS - INNER, LEFT, RIGHT, FULL e CROSS/
    
    select * from tabela_de_vendedores;
    select * from notas_fiscais;
    
    select * from tabela_de_vendedores as V
    inner join notas_fiscais as NF 
    on V.MATRICULA = NF.MATRICULA;
    
    select V.MATRICULA, V.NOME, count(*) as QNTD_NOTAS
    from tabela_de_vendedores as V
    inner join notas_fiscais as NF 
    on V.MATRICULA = NF.MATRICULA
    group by V.MATRICULA, V.NOME;
    
	select V.MATRICULA, V.NOME, count(*) as QNTD_NOTAS
    from tabela_de_vendedores as V, notas_fiscais as NF    
    where V.MATRICULA = NF.MATRICULA
    group by V.MATRICULA, V.NOME;
    
    /*Obtenha o faturamento anual da empresa. Leve em consideração que o 
    valor financeiro das vendas consiste em multiplicar a quantidade pelo preço.*/
    
	select year(DATA_VENDA), sum(QUANTIDADE * PRECO) as FATURAMENTO
	from notas_fiscais NF 
    inner join itens_notas_fiscais as INF 
	on NF.NUMERO = INF.NUMERO
	group by year(DATA_VENDA);
    
    select count(*) from tabela_de_clientes;
    
    select CPF, count(*) from notas_fiscais group by CPF;
    
    select distinct C.CPF, C.NOME, NF.CPF 
    from tabela_de_clientes as C
    inner join notas_fiscais as NF
    on C.CPF = NF.CPF;
    
    select distinct C.CPF, C.NOME, NF.CPF 
    from tabela_de_clientes as C
    left join notas_fiscais as NF
    on C.CPF = NF.CPF
    where NF.CPF is null;
    
    select distinct C.CPF, C.NOME, NF.CPF 
    from  notas_fiscais as NF
    right join tabela_de_clientes as C
    on C.CPF = NF.CPF
    where NF.CPF is null;
    
    select * from tabela_de_vendedores;
    
    select * from tabela_de_clientes;
    
    select * from tabela_de_vendedores
    inner join tabela_de_clientes 
    on tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;
    
    -- Inner Join
    select tabela_de_vendedores.BAIRRO,
    tabela_de_vendedores.NOME,
    DE_FERIAS,
    tabela_de_clientes.BAIRRO,
    tabela_de_clientes.NOME    
    from tabela_de_vendedores
    inner join tabela_de_clientes 
    on tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;
    
    -- Left Join
    select tabela_de_vendedores.BAIRRO,
    tabela_de_vendedores.NOME,
    DE_FERIAS,
    tabela_de_clientes.BAIRRO,
    tabela_de_clientes.NOME    
    from tabela_de_vendedores
    left join tabela_de_clientes 
    on tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;
    
    -- Right Join
    select tabela_de_vendedores.BAIRRO,
    tabela_de_vendedores.NOME,
    DE_FERIAS,
    tabela_de_clientes.BAIRRO,
    tabela_de_clientes.NOME    
    from tabela_de_vendedores
    right join tabela_de_clientes 
    on tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;
    
    -- Full Join
    select tabela_de_vendedores.BAIRRO,
    tabela_de_vendedores.NOME,
    DE_FERIAS,
    tabela_de_clientes.BAIRRO,
    tabela_de_clientes.NOME    
    from tabela_de_vendedores
    full join tabela_de_clientes -- MySql não permite full join
    on tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;
    
    -- Cross Join
    select tabela_de_vendedores.BAIRRO,
    tabela_de_vendedores.NOME,
    DE_FERIAS,
    tabela_de_clientes.BAIRRO,
    tabela_de_clientes.NOME    
    from tabela_de_vendedores, tabela_de_clientes;
   
   
   /*JUNTANDO CONSULTAS - UNION, UNION ALL*/
   
   select distinct BAIRRO from tabela_de_clientes;
   select distinct BAIRRO from tabela_de_vendedores;
   
   select distinct BAIRRO from tabela_de_clientes
   union
   select distinct BAIRRO from tabela_de_vendedores;
   
   select distinct BAIRRO from tabela_de_clientes
   union all
   select distinct BAIRRO from tabela_de_vendedores;
   
   select distinct BAIRRO, NOME, 'Cliente' as TIPO from tabela_de_clientes
   union 
   select distinct BAIRRO, NOME, 'Vendedor' as TIPO from tabela_de_vendedores;
   
   select distinct BAIRRO, NOME, 'Cliente' as TIPO_CLIENTE from tabela_de_clientes
   union
   select distinct BAIRRO, NOME, 'Vendedor' as TIPO_VENDEDOR from tabela_de_vendedores;
   
   
    select tabela_de_vendedores.BAIRRO,
    tabela_de_vendedores.NOME,
    DE_FERIAS,
    tabela_de_clientes.BAIRRO,
    tabela_de_clientes.NOME    
    from tabela_de_vendedores
    left join tabela_de_clientes 
    on tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO
    union    
    select tabela_de_vendedores.BAIRRO,
    tabela_de_vendedores.NOME,
    DE_FERIAS,
    tabela_de_clientes.BAIRRO,
    tabela_de_clientes.NOME    
    from tabela_de_vendedores
    right join tabela_de_clientes 
    on tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;
    
    /*SUBCONSULTAS*/    
    select distinct BAIRRO from tabela_de_vendedores;
    
    select * from tabela_de_clientes
    where BAIRRO in ('Tijuca', 'Jardins', 'Copacabana', 'Santo Amaro');
    
    select * from tabela_de_clientes
    where BAIRRO in (select distinct BAIRRO from tabela_de_vendedores);
    
    
    select X.EMBALAGEM, X.PRECO_MAX from 
    (select EMBALAGEM, max(PRECO_DE_LISTA) as PRECO_MAX from tabela_de_produtos
    group by EMBALAGEM) X where X.PRECO_MAX >= 10;
    
    /*Qual seria a consulta usando subconsulta que seria equivalente a:

	  SELECT CPF, COUNT(*) FROM notas_fiscais
	  WHERE YEAR(DATA_VENDA) = 2016
	  GROUP BY CPF
	  HAVING COUNT(*) > 2000*/    
    
    select X.CPF, X.CONTADOR from 
	(select CPF, COUNT(*) as CONTADOR from notas_fiscais
	where year(DATA_VENDA) = 2016
	group by CPF) X where X.CONTADOR > 2000;
    
    
    /*CRIANDO VIEWS*/    
    select EMBALAGEM, max(PRECO_DE_LISTA) as MAIOR_PRECO 
    from tabela_de_produtos group by EMBALAGEM;
    
    select X.EMBALAGEM, X.MAIOR_PRECO from
    vw_maiores_embalagens X
    where X.MAIOR_PRECO >= 10;
    
    select A.NOME_DO_PRODUTO, A.PRECO_DE_LISTA, A.EMBALAGEM, x.MAIOR_PRECO,
    ((A.PRECO_DE_LISTA / X.MAIOR_PRECO)-1) * 100  as PRECENTUAL
    from tabela_de_produtos A inner join vw_maiores_eMbalagens X
    on A.EMBALAGEM = X.EMBALAGEM;
    
    /*FUNÇÕES DE STRING*/
    
    -- Retira os espaços a esquerda da string
    select  ltrim('    Olá') as FUNCAO_LTRIM;
    
    -- Retira os espaços a direita da string
    select  rtrim('    Olá') as FUNCAO_RTRIM;
    
    -- Retira os espaços a esquerda e direita da string
    select  trim('    Olá') as FUNCAO_TRIM;
    
    -- Concatena a string
    select concat('Olá', ' ', 'Tudo bem?') as FUNCAO_CONCAT;
    
    -- Uper/lower
    select upper('Olá tudo bem?') as FUNCAO_UPPER;
    select lower('Olá tudo bem?') as FUNCAO_LOWER;
    
    -- Substring
    select substring('Olá, tudo bem?', 6) as FUNCAO_SUBSTRING;
    select substring('Olá, tudo bem?', 6, 4) as FUNCAO_SUBSTRING;
        
    select concat(NOME, ' (', CPF, ') ') as RESULTADO
    from tabela_de_clientes;
    
    /*Faça uma consulta listando o nome do cliente e o endereço completo (Com rua, bairro, cidade e estado).*/
    select * from tabela_de_clientes;
    
    select NOME, concat(ENDERECO_1, ', ', BAIRRO, ', ', CIDADE, ' - ', ESTADO) as ENDEREÇO
    from tabela_de_clientes;
    
    /*FUNÇÕES DE DATA*/
    
    -- Exibi a data atual
    select curdate()as FUNCAO_CURDATE;
    
    -- Exibe a hora atual
    select current_time()as FUNCAO_CURRENT_TIME;
    
    -- Exibi data e hora atual
    select current_timestamp()as FUNCAO_CURRENT_TIMESPAM;
    
    -- Extrai ano/mes/dia
    select year(current_timestamp) as FUNCAO_YEAR;
    
    select month(current_timestamp) as FUNCAO_MONTH;
    
    select monthname(current_timestamp) as FUNCAO_MONTHNAME;
    
    select day(current_timestamp) as FUNCAO_DAY;
    
    -- Subtrai e conta os dias entre a data de hoje e a data indicada
    select datediff(current_timestamp(), '1990-10-23') as FUNCAO_DATEDIFF;
	
    -- Diminui a data
    select current_timestamp() as DATA_ATUAL, date_sub(current_timestamp(), interval 5 day) as FUNCAO_DATE_SUB;
    
    -- Adiciona ano/mês/dia/hora/segundo a uma data
    select adddate('2022-05-01', interval 10 YEAR_MONTH) as FUNCAO_ADDDATE;
    
    select distinct DATA_VENDA as DA,
    dayname(DATA_VENDA) as DIA,
    monthname(DATA_VENDA) as MÊS,
    year(DATA_VENDA) as ANO
    from notas_fiscais;
    
    /*Crie uma consulta que mostre o nome e a idade atual dos clientes.*/    
    select * from tabela_de_clientes;  
    
    select NOME, timestampdiff (year, DATA_DE_NASCIMENTO, curdate()) as IDADE_ATUAL
    from tabela_de_clientes;
    
    /*FUNÇÕES MATEMÁTICAS*/
    
    select (23+((25-2)/2)*45) as RESULTADO;
    
    -- Função de arredondamento (Maior inteiro)
    select ceiling(12.33333333333333333333333) as FUNCAO_CEILING;
    
    -- Função de arredondamento (Menor inteiro)
    select ceil(12.33333333333333333333333) as FUNCAO_CEIL;
    
     -- Função de arredondamento (Dependendo da casa decimal)
    select round(12.33333333333333333333333) as FUNCAO_ROUND;
    
    -- Função de arredondamento (Independente da casa decimal)
    select floor(12.93333333333333333333333) as FUNCAO_FLOOR;
    
    -- Função de simulação (Número aleatório)
    select rand() as FUNCAO_RAND;
    
    select NUMERO, QUANTIDADE, PRECO, 
    QUANTIDADE * PRECO AS FATURAMENTO
    from itens_notas_fiscais;
    
    select NUMERO, QUANTIDADE, PRECO, 
    round(QUANTIDADE * PRECO, 2) AS FATURAMENTO
    from itens_notas_fiscais;
    
     /*Na tabela de notas fiscais temos o valor do imposto. 
     Já na tabela de itens temos a quantidade e o faturamento. 
     Calcule o valor do imposto pago no ano de 2016 arredondando para o menor inteiro.*/
    
    
    select * from notas_fiscais;
    select * from itens_notas_fiscais;
    
    select  NF.NUMERO, NF.IMPOSTO, INF.QUANTIDADE, INF.PRECO,
    floor((INF.QUANTIDADE * INF.PRECO) / NF.IMPOSTO) AS IMPOSTO_PAGO
    FROM notas_fiscais AS NF
    INNER JOIN itens_notas_fiscais AS INF
    ON NF.NUMERO = INF.NUMERO
    group by NF.NUMERO;
    
    select year(DATA_VENDA) as ANO_VENDA, floor(sum(IMPOSTO * (QUANTIDADE * PRECO)))  AS IMPOSTO_PAGO 
	from notas_fiscais NF
	inner join itens_notas_fiscais INF on NF.NUMERO = INF.NUMERO
	where year(DATA_VENDA) = 2016
	group by year(DATA_VENDA);
    
    
    /*CONVERSÃO DE DADOS*/
    
    select current_timestamp() as RESULTADO;
    
    select concat('O dia de hoje é : ', current_timestamp()) as RESULTADO;
    
	select concat('O dia de hoje é : ', date_format(current_timestamp(),'%Y') ) as DATE_FORMAT;
	select concat('O dia de hoje é : ', date_format(current_timestamp(),'%y') ) as DATE_FORMAT;
	select concat('O dia de hoje é : ', date_format(current_timestamp(),'%m/%y') ) as DATE_FORMAT;
	select concat('O dia de hoje é : ', date_format(current_timestamp(),'%c/%y') ) as DATE_FORMAT;
    select concat('O dia de hoje é : ', date_format(current_timestamp(),'%d/%c/%y') ) as DATE_FORMAT;
    select concat('O dia de hoje é : ', date_format(current_timestamp(),'%d/%m/%Y') ) as DATE_FORMAT;
    select concat('O dia de hoje é : ', date_format(current_timestamp(),'%W, %d/%m/%Y') ) as DATE_FORMAT;
    select concat('O dia de hoje é : ', date_format(current_timestamp(),'%W, %d/%m/%Y - %U') ) as DATE_FORMAT;
    
    select convert(23.3, char) as FUNCAO_CONVERT;
    select substring(convert(23.3, char),1,1) as FUNCAO_CONVERT;
    
    /*Queremos construir um SQL cujo resultado seja, para cada cliente:

	“O cliente João da Silva faturou 120000 no ano de 2016”.

	Somente para o ano de 2016.*/
    
    select * from tabela_de_clientes;
    
    select concat('O cliente ', TC.NOME, ' faturou ', cast(sum(INF.QUANTIDADE * INF.preco) as char (20))
	 , ' no ano ', CAST(year(NF.DATA_VENDA) as char (20))) as SENTENCA from notas_fiscais NF
	inner join itens_notas_fiscais INF on NF.NUMERO = INF.NUMERO
	inner join tabela_de_clientes TC on NF.CPF = TC.CPF
	where year(DATA_VENDA) = 2016
	group by TC.NOME, year(DATA_VENDA);
    
    /*RELATÓRIO DE VENDAS VÁLIDAS*/
    
    select * from itens_notas_fiscais;   
        
    select * from notas_fiscais;
    
    select * from notas_fiscais as NF
    inner join itens_notas_fiscais as INF
    on NF.NUMERO = INF.NUMERO;    
       
    select NF.CPF, NF.DATA_VENDA, INF.QUANTIDADE from notas_fiscais as NF
    inner join itens_notas_fiscais as INF
    on NF.NUMERO = INF.NUMERO;
    
    select NF.CPF, date_format(NF.DATA_VENDA, '%Y-%m')as MES_ANO, INF.QUANTIDADE from notas_fiscais as NF
    inner join itens_notas_fiscais as INF
    on NF.NUMERO = INF.NUMERO;
    
    -- Consulta com vendas de clientes por mês
    select NF.CPF, date_format(NF.DATA_VENDA, '%Y-%m')as MES_ANO, sum(INF.QUANTIDADE) as QUANTIDADE_VENDAS from notas_fiscais as NF
    inner join itens_notas_fiscais as INF
    on NF.NUMERO = INF.NUMERO
    group by NF.CPF, date_format(NF.DATA_VENDA, '%Y-%m');
    
    -- Consulta de limite de compra por cliente 
    select TC.CPF, TC.NOME, TC.VOLUME_DE_COMPRA as QUANTIDADE_LIMITE
    from tabela_de_clientes as TC;    
    
    select 
    NF.CPF, 
    TC.NOME, 
    date_format(NF.DATA_VENDA, '%Y-%m') as MES_ANO, 
    sum(INF.QUANTIDADE) as QUANTIDADE_VENDAS,
    max(TC.VOLUME_DE_COMPRA) AS QUANTIDADE_LIMITE
    from notas_fiscais as NF
    inner join itens_notas_fiscais as INF
    on NF.NUMERO = INF.NUMERO
    inner join tabela_de_clientes as TC
    on TC.CPF = NF.CPF
    group by NF.CPF, TC.NOME, date_format(NF.DATA_VENDA, '%Y-%m');
    
    
    select X.CPF, X.NOME, X.MES_ANO, X.QUANTIDADE_VENDAS, X.QUANTIDADE_LIMITE,    
    case when (X.QUANTIDADE_LIMITE - X.QUANTIDADE_VENDAS) <0 
		then 'Inválida' 
		else 'Válida' 
    end as STATUS_VENDA
    FROM(
		select 
		NF.CPF, 
		TC.NOME, 
		date_format(NF.DATA_VENDA, '%Y-%m') as MES_ANO, 
		sum(INF.QUANTIDADE) as QUANTIDADE_VENDAS,
		max(TC.VOLUME_DE_COMPRA) AS QUANTIDADE_LIMITE
		from notas_fiscais as NF
		inner join itens_notas_fiscais as INF
		on NF.NUMERO = INF.NUMERO
		inner join tabela_de_clientes as TC
		on TC.CPF = NF.CPF
		group by NF.CPF, TC.NOME, date_format(NF.DATA_VENDA, '%Y-%m')
    ) X;
    
    /*Nesta aula construímos um relatório que apresentou os clientes que tiveram vendas inválidas. Complemente este relatório listando somente os que tiveram vendas inválidas e calculando a diferença entre o limite de venda máximo e o realizado, em percentuais.

    Dica:

    Capture a SQL final da aula.

    Filtre somente as linhas onde

    (X.QUANTIDADE_LIMITE - X.QUANTIDADE_VENDAS) < 0

    Liste a coluna de X.QUANTIDADE_LIMITE

    Crie uma nova coluna fazendo a fórmula:

    (1 - (X.QUANTIDADE_LIMITE/X.QUANTIDADE_VENDAS)) * 100 */
      
    select X.CPF, X.NOME, X.MES_ANO, X.QUANTIDADE_VENDAS, X.QUANTIDADE_LIMITE,    
    case when (X.QUANTIDADE_LIMITE - X.QUANTIDADE_VENDAS) <0 
		then 'Inválida' 
		else 'Válida' 
    end as STATUS_VENDA,
    (1 - (X.QUANTIDADE_LIMITE/X.QUANTIDADE_VENDAS)) * 100 as PERCENTUAL
    FROM(
    select 
    NF.CPF, 
    TC.NOME, 
    date_format(NF.DATA_VENDA, '%Y-%m') as MES_ANO, 
    sum(INF.QUANTIDADE) as QUANTIDADE_VENDAS,
    max(TC.VOLUME_DE_COMPRA) AS QUANTIDADE_LIMITE
    from notas_fiscais as NF
    inner join itens_notas_fiscais as INF
    on NF.NUMERO = INF.NUMERO
    inner join tabela_de_clientes as TC
    on TC.CPF = NF.CPF
    group by NF.CPF, TC.NOME, date_format(NF.DATA_VENDA, '%Y-%m')
    ) X
    where (X.QUANTIDADE_LIMITE - X.QUANTIDADE_VENDAS) < 0;
    
    /*RELATÓRIO DE VENDAS POR SABOR*/
    
    select TP.SABOR, NF.DATA_VENDA, INF.QUANTIDADE
    from tabela_de_produtos as TP
    inner join itens_notas_fiscais as INF on TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
    inner join notas_fiscais as NF on NF.NUMERO = INF.NUMERO;
    
	  -- Quantidade por sabor vendida no ano de 2016.
    select TP.SABOR, year(NF.DATA_VENDA) as ANO, sum(INF.QUANTIDADE) as QUANTIDADE
    from tabela_de_produtos as TP
    inner join itens_notas_fiscais as INF on TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
    inner join notas_fiscais as NF on NF.NUMERO = INF.NUMERO
    where  year(NF.DATA_VENDA) = 2016
    group by TP.SABOR, year(NF.DATA_VENDA)
    order by 3 desc;
    
    -- Quantidade total vendida no ano de 2016.
    select year(NF.DATA_VENDA) as ANO, sum(INF.QUANTIDADE) as QUANTIDADE
    from tabela_de_produtos as TP
    inner join itens_notas_fiscais as INF on TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
    inner join notas_fiscais as NF on NF.NUMERO = INF.NUMERO
    where  year(NF.DATA_VENDA) = 2016
    group by year(NF.DATA_VENDA);
   
    
    -- Quantidade por sabor,total e porcentagem vendida no ano de 2016.
	  select * from
    (select TP.SABOR, year(NF.DATA_VENDA) as ANO, sum(INF.QUANTIDADE) as QUANTIDADE
    from tabela_de_produtos as TP
    inner join itens_notas_fiscais as INF on TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
    inner join notas_fiscais as NF on NF.NUMERO = INF.NUMERO
    where  year(NF.DATA_VENDA) = 2016
    group by TP.SABOR, year(NF.DATA_VENDA)) as VENDA_SABOR
    inner join
    (select year(NF.DATA_VENDA) as ANO, sum(INF.QUANTIDADE) as QUANTIDADE
    from tabela_de_produtos as TP
    inner join itens_notas_fiscais as INF on TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
    inner join notas_fiscais as NF on NF.NUMERO = INF.NUMERO
    where  year(NF.DATA_VENDA) = 2016
    group by year(NF.DATA_VENDA)) as VENDA_TOTAL
    on VENDA_SABOR.ANO = VENDA_TOTAL.ANO;
    
    select VENDA_SABOR.SABOR, VENDA_SABOR.ANO, VENDA_SABOR.QUANTIDADE,
    round((VENDA_SABOR.QUANTIDADE/VENDA_TOTAL.QUANTIDADE) * 100,2) as PARTICIPACAO from
		(select TP.SABOR, year(NF.DATA_VENDA) as ANO, sum(INF.QUANTIDADE) as QUANTIDADE
		from tabela_de_produtos as TP
		inner join itens_notas_fiscais as INF on TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
		inner join notas_fiscais as NF on NF.NUMERO = INF.NUMERO
		where  year(NF.DATA_VENDA) = 2016
		group by TP.SABOR, year(NF.DATA_VENDA)) as VENDA_SABOR
    inner join
		(select year(NF.DATA_VENDA) as ANO, sum(INF.QUANTIDADE) as QUANTIDADE
		from tabela_de_produtos as TP
		inner join itens_notas_fiscais as INF on TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
		inner join notas_fiscais as NF on NF.NUMERO = INF.NUMERO
		where  year(NF.DATA_VENDA) = 2016
		group by year(NF.DATA_VENDA)) as VENDA_TOTAL
    on VENDA_SABOR.ANO = VENDA_TOTAL.ANO
    order by 4 desc;
    
    /*Modifique o relatório mas agora para ver o ranking das vendas por tamanho.*/
    
    select VENDA_TAMANHO.TAMANHO, VENDA_TAMANHO.ANO, VENDA_TAMANHO.QUANTIDADE,
    round((VENDA_TAMANHO.QUANTIDADE/VENDA_TOTAL.QUANTIDADE) * 100,2) as PARTICIPACAO from
		(select TP.TAMANHO, year(NF.DATA_VENDA) as ANO, sum(INF.QUANTIDADE) as QUANTIDADE
		from tabela_de_produtos as TP
		inner join itens_notas_fiscais as INF on TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
		inner join notas_fiscais as NF on NF.NUMERO = INF.NUMERO
		where  year(NF.DATA_VENDA) = 2016
		group by TP.SABOR, year(NF.DATA_VENDA)) as VENDA_TAMANHO
    inner join
		(select year(NF.DATA_VENDA) as ANO, sum(INF.QUANTIDADE) as QUANTIDADE
		from tabela_de_produtos as TP
		inner join itens_notas_fiscais as INF on TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
		inner join notas_fiscais as NF on NF.NUMERO = INF.NUMERO
		where  year(NF.DATA_VENDA) = 2016
		group by year(NF.DATA_VENDA)) as VENDA_TOTAL
    on VENDA_TAMANHO.ANO = VENDA_TOTAL.ANO
    order by 4 desc;