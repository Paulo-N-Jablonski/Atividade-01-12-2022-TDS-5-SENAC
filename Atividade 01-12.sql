CREATE DATABASE atividade01dezembro;
USE atividade01dezembro;

CREATE TABLE Assinante(
cdAssinante INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(50) NOT NULL,
assEnd INT NOT NULL,
assRamo INT NOT NULL,
assTipo INT NOT NULL,
assMunic INT NOT NULL);

CREATE TABLE RamoAtividade(
cdRamo INT NOT NULL,
dsRamo VARCHAR(40) NOT NULL,
assRamo INT NOT NULL);

CREATE TABLE TipoAtividade(
cdTipo INT NOT NULL,
dsTipo VARCHAR(50) NOT NULL,
assTipo INT NOT NULL);

CREATE TABLE Endereco(
cdEndereco INT NOT NULL,
dsEndereco VARCHAR(40) NOT NULL,
Complemento VARCHAR(20) NOT NULL,
Bairro VARCHAR(30) NOT NULL,
CEP INT(8) NOT NULL,
assEnd INT NOT NULL,
assMunic INT NOT NULL,
assFone INT NOT NULL);

CREATE TABLE Municipio(
cdMunicipio INT NOT NULL,
dsMunicipio VARCHAR(40) NOT NULL,
assMunic INT NOT NULL);

CREATE TABLE Telefone(
cdTelefone INT NOT NULL,
DDD INT(3) NOT NULL,
nTelefone INT NOT NULL,
assFone INT NOT NULL,
auxiliar INT NOT NULL);

SELECT Nome, Complemento, nTelefone
FROM Assinante
INNER JOIN Endereco ON Assinante.assEnd = Endereco.assEnd
INNER JOIN Telefone ON Assinante.assEnd = Telefone.assFone;

SELECT dsRamo, Nome
FROM Assinante
INNER JOIN RamoAtividade ON Assinante.assRamo = RamoAtividade.assRamo;

SELECT Nome
FROM Assinante
INNER JOIN TipoAtividade ON Assinante.assTipo = TipoAtividade.assTipo
INNER JOIN Endereco ON Assinante.assEnd = Endereco.assEnd
INNER JOIN Municipio ON Endereco.assMunic = Municipio.assMunic
WHERE dsMunicipio = 'Pelotas'AND dsTipo = 'Residencial';

SELECT COUNT(nTelefone), Nome
FROM Assinante
INNER JOIN Endereco ON Assinante.assEnd = Endereco.assEnd
INNER JOIN Telefone ON Endereco.assFone = Telefone.assFone
GROUP BY nTelefone
HAVING nTelefone>1;

SELECT Nome, nTelefone, dsTipo
FROM Assinante
INNER JOIN TipoAtividade ON Assinante.assTipo = TipoAtividade.assTipo
INNER JOIN Endereco ON Assinante.assEnd = Endereco.assEnd
INNER JOIN Telefone ON Endereco.assFone = Telefone.assFone
INNER JOIN Municipio ON Endereco.assMunic = Municipio.assMunic
WHERE dsMunicipio = 'Pelotas' OR 'Cangaçu';