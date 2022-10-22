CREATE USER 'back02'@'localhost' identified BY 'back02';
GRANT SELECT, RELOAD, LOCK TABLES, REPLICATION CLIENT ON *.* TO 'back02'@'localhost';