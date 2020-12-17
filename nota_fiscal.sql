create database nota_fiscal;

use  nota_fiscal;

create table cliente
(

id_cliente INT auto_increment,
nm_cliente VARCHAR(20) not null unique,
cd_cpf_cnpj INT(11) not null,
Primary key (id_cliente),
constraint cliente_unico unique (id_cliente)

);

create table produto
(
cd_produto int auto_increment,
nm_produto VARCHAR (20) not null,
vl_produto double not null,
ds_produto longtext not null,
Primary key (cd_produto),
constraint nr_produto unique (cd_produto)
);

create table tb_notaF
(
cd_nota int auto_increment,
qt_produto int not null,
vl_subTotal double not null,
id_produto int,
primary key (cd_nota),
constraint nr_notaF unique (cd_nota),
foreign key (id_produto) references produto (cd_produto)
);

create table notaFiscal(
cd_notaFiscal int auto_increment,
dt_emissao date not null,
id_cliente int not null,
cd_nota int not null,
primary key(cd_notaFiscal),
foreign key (id_cliente) references cliente(id_cliente),
foreign key (cd_nota) references tb_notaF(cd_nota)
);



insert into cliente values 
(1234,'Gabriela',00000000000),
(0001,'Kevin',00000000001),
(0002,'Vinicius',00000000002),
(0003,'Lidiane',00000000003),
(0004,'Breno',00000000005);

insert into produto values 
(0001,'Escudo',1.50,'Proteger o corpo'),
(0002,'Espada',200.00,'Atacar'),
(0003,'Bota',50.00,'Correr mais rápido'),
(0004,'Chapeu',20.00,'Proteger a cabeça'),
(0005,'Calça',50.00,'Proteger as pernas');

insert into tb_notaF values 
(0001,5,7.50,0001),
(0002,5,1.000,0002),
(0003,5,250.00,0003),
(0004,5,100.00,0004),
(0005,5,100.00,00005);

insert into notaFiscal values
(null,'2010-10-10',1234,0001),
(null,'2013-10-10',0001,0002),
(null,'2014-10-10',0002,0003),
(null,'2015-10-10',0003,0004),
(null,'2016-10-10',0004,0005);

select * from notaFiscal;
select * from cliente;
select * from produto;
select * from tb_notaF;

update produto set vl_produto = vl_produto * 1.10
where cd_produto <=5 and vl_produto <=20;

select round(vl_produto,2) from produto;
