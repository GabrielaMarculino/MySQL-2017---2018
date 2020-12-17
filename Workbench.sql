CREATE DATABASE db_exercicio1;

USE db_exercicio1;

CREATE TABLE tb_pais(
cd_pais int auto_increment,
nm_pais varchar(50) not null,
Primary key (cd_pais),
Constraint pais_unico unique (nm_pais)
); 

CREATE TABLE tb_estado(
cd_estado int auto_increment,
nm_estado varchar(50)not null,
sg_estado  char(2)not null,
id_pais int, 
PRIMARY KEY (cd_estado),
Constraint estado_unico unique(nm_estado),
Constraint sigla_unico unique (sg_estado),
FOREIGN KEY (id_pais) REFERENCES tb_pais (cd_pais) 
);

CREATE TABLE tb_cidade(
cd_cidade int auto_increment,
nm_cidade varchar(50),
id_estado int,
qt_populacao int not null, 
PRIMARY KEY (cd_cidade),
constraint cidade_unico unique(nm_cidade),
FOREIGN KEY (id_estado) REFERENCES tb_estado (cd_estado)
);

INSERT INTO tb_pais(cd_pais, nm_pais) VALUES
(NULL, 'Brasil'),
(NULL, 'Argentina'),
(NULL, 'Mexico'),
(NULL, 'Japão'),
(NULL, 'Africa');

INSERT INTO tb_estado VALUES
(NULL, 'São Paulo', 	'SP',1),
(NULL, 'Minas Gerais', 	'MG',1),
(NULL, 'Parana', 		'PR',1),

(NULL, 'Buenos Aires',	'BA',2),
(NULL, 'Catamarca', 	'CM',2),
(NULL, 'Chaco', 		'CC',2),

(NULL, 'Puebla', 		'PB',3),
(NULL, 'Estado do México', 'EM',3),
(NULL, 'Chiapas', 		'CA',3),

(NULL, 'Honshu',		'HS',4),
(NULL, 'Hokkaido',		'HK',4),
(NULL, 'Kyushu',		'KS',4),

(NULL, 'Angola', 		'AG',5 ),
(NULL, 'Argélia',		'AL',5 ),
(NULL, ' Burundi ', 	'BU',5 );

INSERT INTO tb_cidade VALUES
(NULL, 'Mongagua', 		1, 53.000),
(NULL, 'Praia Grande', 	1, 70.000),
(NULL, 'Itanhaém', 		1, 52.000),

(NULL, 'Campos do Jordão', 2, 50.000),
(NULL, 'Ponte Nova', 	2, 52.000),
(NULL, 'Ouro Preto', 	2, 40.000),

(NULL, 'Curitiba', 		3, 70.000),
(NULL, 'Londrina', 		3, 85.000),
(NULL, 'Foz do Iguaçu', 3, 93.000),

(NULL, 'Tóquio', 		4, 704.569),
(NULL, 'Yokohama', 		4, 676.188),
(NULL, 'Osaka', 		4, 640.702),

(NULL, 'Cidade do Cabo', 5, 456.789),
(NULL, 'Joanesburgo', 	5, 895.125),
(NULL, 'Pretória', 		5, 456.489);

SELECT * FROM tb_pais;
SELECT * FROM tb_estado; 
SELECT * FROM tb_cidade;

/* EXIBIR TODOS OS REGISTROS */

SELECT * FROM TB_PAIS;

/* EXIBIR UM CAMPO ESPECÍFICO DE UMA TABLE*/

SELECT NM_PAIS FROM TB_PAIS;

/* EXIBIR UM CAMPO ESPECÍFICO DE UMA TABLE E TROCAR O RÓTULO DO CAMPO*/

SELECT NM_PAIS 'PAÍS' FROM TB_PAIS;

/* ORDENAR A EXIBIÇÃO DOS REGISTROS POR ORDEM ALFABÉTICA A-Z (ASC) Z-A (DESC)*/

SELECT * FROM TB_PAIS
ORDER BY CD_PAIS ASC;

/* EXIBIR SOMENTE PAÍSES QUE COMECEM COM A LETRA A*/

SELECT NM_PAIS 'PAÍS'
FROM TB_PAIS
WHERE
NM_PAIS LIKE 'A%';

/* EXIBIR SOMENTE PAÍSES QUE TERMINEM COM A LETRA O*/

SELECT NM_PAIS 'PAÍS'
FROM TB_PAIS
WHERE
NM_PAIS LIKE '%A%';

/* EXIBIR OS NOMES DOS ESTADOS E DOS SEUS RESPESCTIVOS PAÍSES */

SELECT
CD_PAIS,
NM_PAIS 'PAÍS',
ID_PAIS,
NM_ESTADO 'ESTADO'
FROM TB_PAIS, TB_ESTADO
where
ID_PAIS = CD_PAIS;

/* EXIBIR AS CIDADES E SEUS ESTADOS */

/* EXIBIR AS CIDADES, ESTADOS E PAÍSES RELACIONADOS*/

/* EXIBIR AS CIDADES E A POPULAÇÃO DA CIDADE */

/* ------------------ NÍVEL 2 -----------------*/

/* CONTAGEM DE REGISTROS */

SELECT COUNT(CD_CIDADE)
FROM TB_CIDADE;

SELECT COUNT(*) 
FROM TB_CIDADE;

select
NM_ESTADO 'ESTADO',
COUNT(CD_CIDADE) 'TOTAL'
FROM TB_ESTADO, TB_CIDADE
WHERE
ID_ESTADO = CD_ESTADO
GROUP BY NM_ESTADO;

/* SOMAR CAMPOS*/

SELECT SUM(QT_POPULACAO)
FROM TB_CIDADE;

select
NM_ESTADO 'ESTADO',
SUM(QT_POPULACAO) 'POPULAÇÃO'
FROM TB_ESTADO, TB_CIDADE
WHERE
ID_ESTADO = CD_ESTADO
GROUP BY NM_ESTADO;

SELECT * FROM TB_CIDADE;

/* EXIBIR O TOTAL DE POPULAÇÃO DE CADA PAÍS */ 

/* EXIBIR O TOTAL DE CIDADES CADASTRADAS PARA CADA PAÍS */
