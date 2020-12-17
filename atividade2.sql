Create database db_Meu_novo_mundo;


Use db_Meu_novo_mundo;

Create table tb_pais (

cd_pais int auto_increment,
nm_pais varchar (50) not null,
Constraint pais_chave Primary Key (cd_pais),
Constraint pais_unico unique (nm_pais) 
);

Create table tb_estado (


cd_estado int auto_increment, 
nm_estado varchar (50) not null ,
sg_estado char (2) not null ,
id_pais int not null, 
Primary Key (cd_estado),
Constraint estado_unico unique (nm_estado), 
Constraint sigla_unico unique (sg_estado),
Constraint fk_pais Foreign Key (id_pais) references tb_pais (cd_pais)  
); 

Create table tb_cidade (

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
(NULL, 'Itália'),
(NULL, 'França'),
(NULL, 'Estados Unidos'),
(NULL, 'Canadá');

select * from tb_pais;

INSERT INTO tb_estado values 

(null, 'São Paulo', 	  	'SP', 1),
(null, 'Rio de Janeiro',	'RJ', 1),
(null, 'Minas Gerais', 		'MG', 1),
(null, 'Liguria', 			'LG',2),
(null, 'Lazio', 			'LZ',2),
(null, 'Toscana', 			'TS',2),
(null, 'Bretagne', 			'BG', 3),
(null, 'Corse', 			'CS',3),
(null, 'Normandie', 		'NM',3),
(null, 'New York', 			'NY', 4),
(null, 'Flórida', 			'FL',4),
(null, 'Califórnia', 		'CA',4),
(null, 'British Columbia',  'BC',5),
(null, 'Ontario', 			'ON',5),
(null, 'Quebec',    		'QC',5);


select * from tb_estado;

Alter table tb_estado drop index sigla_unico;

INSERT INTO tb_cidade values 

(null, 'Sorocaba',1, 1.900),
(null, 'Santos',1,3.427),
(null, 'Guarulhos',1,70.346),

(null, 'Niterói',2,487.562),
(null, 'Rezende',2,124.316),
(null, 'Cabo Frio',2,212.289),

(null, 'Belo Horizonte',3,2.000),
(null, 'Betim',3,427.146),
(null, 'Viçosa' ,3,77.863),

(null, 'Genova',4,639.536),
(null, 'La Spezia',4,220.745),
(null, 'Bolano',4,7.389),

(null, 'Roma',5,2.8000),
(null, 'Tivoli',5,46.784),
(null, 'Palestrina',5,16.469),

(null, 'Fiorentina',6,12.000),
(null, 'Piza',6,21.050000),
(null, 'Siena',6,50.000),

(null, 'Rennes',7,13.254),
(null, 'Vannes',7,9.254),
(null, 'Lorient' ,7,12.365),

(null, 'Bastia',8,13.587),
(null, 'Calvi',8,7.895),
(null, 'Ajaccio' ,8,7.542962),

(null, 'Caen',9,5.487),
(null, 'Le Havre',9,50.547),
(null, 'Livarot',9,45.254),

(null, 'Miami',10,8.254),
(null, 'Orlando',10,17.548),
(null, 'Tampa',10,36.547),

(null, 'Los Angeles',11,45.235),
(null, 'San Francisco' ,11,9.541),
(null, 'Sacramento' ,11,3.654),

(null, 'Montreal',12,20.145),
(null, 'Ville de Québec',12,63.54122), 
(null, 'Gatineau',12,52.14722),

(null,'North Vancouver',13,63.25422),
(null, 'Vancouver' ,13,45.666),
(null, 'Victoria',13,66.666),

(null, 'Toronto',14, 13.465),
(null, 'Ottawa' ,14, 33.333),
(null, 'Hamilton',14, 650000);



SELECT * FROM tb_pais;
SELECT * FROM tb_estado; 
SELECT * FROM tb_cidade;



SELECT * FROM TB_PAIS;



SELECT NM_PAIS FROM TB_PAIS;



SELECT NM_PAIS 'PAÍS' FROM TB_PAIS;



SELECT * FROM TB_PAIS
ORDER BY CD_PAIS ASC;



SELECT NM_PAIS 'PAÍS'
FROM TB_PAIS
WHERE
NM_PAIS LIKE 'A%';



SELECT NM_PAIS 'PAÍS'
FROM TB_PAIS
WHERE
NM_PAIS LIKE '%A%';


SELECT
CD_PAIS,
NM_PAIS 'PAÍS',
ID_PAIS,
NM_ESTADO 'ESTADO'
FROM TB_PAIS, TB_ESTADO
where
ID_PAIS = CD_PAIS;



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



SELECT SUM(QT_POPULACAO)
FROM TB_CIDADE;

select
NM_PAIS 'ESTADO',
SUM(QT_POPULACAO) 'POPULAÇÃO'
FROM TB_ESTADO, TB_CIDADE, tb_pais
WHERE ID_ESTADO = CD_ESTADO &&
ID_PAIS = CD_PAIS
GROUP BY NM_PAIS;

SELECT * FROM TB_CIDADE;


