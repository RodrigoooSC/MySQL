
CREATE USER 'admin02'@'localhost' identified BY 'admin02';
GRANT ALL PRIVILEGES ON *.* TO 'admin02'@'localhost' WITH GRANT OPTION;

DROP USER 'root'@'localhost';