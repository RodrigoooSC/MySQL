CREATE USER 'read02'@'localhost' identified BY 'read02';
GRANT SELECT, EXECUTE ON *.* TO 'read02'@'localhost';