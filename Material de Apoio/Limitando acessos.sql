
CREATE USER 'user04'@'%' IDENTIFIED BY 'user04';

GRANT SELECT, INSERT, UPDATE, DELETE, CREATE TEMPORARY TABLES, LOCK TABLES, EXECUTE 
ON sucos_vendas.* TO 'user04'@'%';

CREATE USER 'user05'@'%' IDENTIFIED BY 'user05';

GRANT SELECT, INSERT, UPDATE, DELETE
ON sucos_vendas.tabela_de_clientes TO 'user05'@'%';

GRANT SELECT
ON sucos_vendas.tabela_de_produtos TO 'user05'@'%';

INSERT INTO `sucos_vendas`.`tabela_de_produtos`
(`CODIGO_DO_PRODUTO`,
`NOME_DO_PRODUTO`,
`EMBALAGEM`,
`TAMANHO`,
`SABOR`,
`PRECO_DE_LISTA`)
VALUES
('999999',
'BNBNBNBNB',
'HJHJHJHJ',
'FGFGFGF',
'GHGHGH',
10);