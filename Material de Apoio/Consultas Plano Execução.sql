
SELECT A.NOME_DO_PRODUTO FROM tabela_de_produtos A;

SELECT A.NOME_DO_PRODUTO, C.QUANTIDADE 
FROM tabela_de_produtos A
INNER JOIN itens_notas_fiscais C ON A.codigo_do_produto = C.codigo_do_produto;

SELECT A.NOME_DO_PRODUTO, YEAR(B.DATA_VENDA) AS ANO, C.QUANTIDADE 
FROM tabela_de_produtos A
INNER JOIN itens_notas_fiscais C ON A.codigo_do_produto = C.codigo_do_produto
INNER JOIN notas_fiscais B ON C.NUMERO = B.NUMERO;

SELECT A.NOME_DO_PRODUTO, YEAR(B.DATA_VENDA) AS ANO, SUM(C.QUANTIDADE) AS QUANTIDADE 
FROM tabela_de_produtos A
INNER JOIN itens_notas_fiscais C ON A.codigo_do_produto = C.codigo_do_produto
INNER JOIN notas_fiscais B ON C.NUMERO = B.NUMERO
GROUP BY A.NOME_DO_PRODUTO, YEAR(B.DATA_VENDA)
ORDER BY A.NOME_DO_PRODUTO, YEAR(B.DATA_VENDA);