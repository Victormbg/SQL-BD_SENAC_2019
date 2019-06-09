create database oficina;

use oficina;

CREATE TABLE cliente (
cpf SMALLINT NOT NULL PRIMARY KEY,
endereco VARCHAR(100),
nome VARCHAR(60) NOT NULL,
telefone VARCHAR(10) NOT NULL
);

CREATE TABLE cep (
cep varchar(12) NOT NULL PRIMARY KEY,
rua varchar(60) not null,
bairro varchar(30) not null,
cidade varchar(30) not null,
uf varchar(2) not null
);

CREATE TABLE servico (
codServico SMALLINT NOT NULL PRIMARY KEY,
custoServico VARCHAR(10),
custoPecas VARCHAR(10),
defeito VARCHAR(100),
dataEntrada date not null,
dataSaida date not null,
placa VARCHAR(10) NOT NULL,
FOREIGN KEY(placa) REFERENCES veiculo(placa)
);

CREATE TABLE peca (
codPeca SMALLINT NOT NULL PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
preco VARCHAR(10) NOT NULL,
quantidade SMALLINT
);

CREATE TABLE especialistas (
codEspecialista smallint NOT NULL PRIMARY KEY,
especialidade VARCHAR(20),
custoHomemHora VARCHAR(10)
);

CREATE TABLE veiculo (
placa VARCHAR(10) NOT NULL PRIMARY KEY,
marca VARCHAR(10),
ano VARCHAR(10),
cor VARCHAR(10),
cpf SMALLINT NOT NULL,
FOREIGN KEY(cpf) REFERENCES cliente (cpf)
);

CREATE TABLE servico_especialistas (
codServico_especialista SMALLINT NOT NULL PRIMARY KEY,
quantHoras smallint not null,
codEspecialista smallint not null,
codServico SMALLINT NOT NULL,
FOREIGN KEY(codEspecialista) REFERENCES especialistas (codEspecialista),
FOREIGN KEY(codServico) REFERENCES servico (codServico)
);

CREATE TABLE servico_peca (
codServico_peca SMALLINT NOT NULL PRIMARY KEY,
quantidade SMALLINT NOT NULL,
codServico SMALLINT NOT NULL,
codPeca SMALLINT NOT NULL,
FOREIGN KEY(codServico) REFERENCES servico (codServico),
FOREIGN KEY(codPeca) REFERENCES peca (codPeca)
);

show tables;
desc cep;
desc cliente;
desc veiculo;

select * from cliente;

insert into servico_peca (codservico_peca,codpeca,codservico,quantidade) values 
(01,01,01,2),
(02,02,02,1),
(03,03,03,1),
(04,04,03,1);

insert into servicoprofissional(codservicoprofissional,codservico,quanthoras,codprofissional) values 
(01,01,1,02),
(02,02,2,02),
(03,03,1,02);

insert into servico(codservico,defeito,preco,data_entrada,data_saida,placa) values 
(01,'Motor Engasgado','2019-10-01','2019-10-01','APZ2587'),
(02,'Falhando troca de velocidade',220,'2019-01-11','2019-01-12','MNA1128'),
(03,'Barulho na roda dianteira',400,'2019-01-11','2019-01-11','LUW5114');

insert into servico(codServico,defeito,custoServico,dataEntrada,dataSaida,placa) values
(04,'Barulho no motor',200,'2019-01-09','2019-01-10','LHC1234'),
(05,'Barulho na roda traseira',100,'2019-01-03','2019-01-04','LUC1234');

insert into veiculo(placa,marca,ano,cor,cpf) values
('LUW5114','FIAT','2006','Prata',1),
('MNA1128','Ford','2015','Preto',3),
('APZ2587','Fiat','2010','Prata',2);

insert into veiculo(placa,marca,ano,cor,cpf,modelo) values
('LUC1234','Ford','2015','Preto',4,'Fiest'),
('LHC1234','Fiat','2017','Prata',5,'Punto');


insert into cliente(cpf,nome,telefone,cep,complemento) values 
('(21)3851-5138','Manoel da Costa','(21) 5438-5438'),
('Angela da Silva','23085-610','1241','Casa','(21) 2224-114521');
select * from servico;
insert into cliente(cpf,nome,telefone,cep,complemento) values 
(4,'Manuel','(21)1231-5438','12341234','casa'),
(5,'Marcos','(21)1231-1294','12340987','apt');

insert into profissional(codprofissional,especialidade,valorHora) values 
(01,'Lanterneiro',130),
(02,'Mecânico',100),
(03,'Pintor',150),
(04,'Eletricista',120);

insert into peca(codpeca,quantidade,preco,nome) values 
(01,35,60,'Vela Bosh'),
(02,25,75,'Cabo de Vela Jogo'),
(03,10,130,'Braço Articulado Direito'),
(04,10,250,'Amortecedor Dianteiro Par Monroe');

insert into cep(cep,rua,bairro,cidade,uf) values 
('26551-110','Rua Bagre','Cruzeiro do Sul','Mesquita','RJ'),
('26551-140','Rua Paulo','Vila Emil,','Mesquita','RJ'),
('23085-610','Rua Padre Pauwels','Campo Grande','Mesquita','RJ');

select especialidade from especialistas where custoHomemHora>100;

select sum(custoServico) from servico where dataSaida='2019-01-10';

select avg(custoServico) from servico;

select min(preco) from peca;

select nome from peca,servico_peca
where peca.codPeca = servico_peca.codPeca
and codServico = 3;

select nome,rua from cliente,cep
where cliente.cep = cep.cep;

select nome,rua from cliente,cep
where cliente.cep = cep.cep
and bairro='campo grande';

alter table veiculo add modelo varchar(30) not null;
select * from veiculo;

update veiculo set modelo = 'Palio' where veiculo.placa ='APZ2587';
update veiculo set modelo = 'Uno' where veiculo.placa ='LUW5114';
update veiculo set modelo = 'Fiesta' where veiculo.placa ='MNA1128';

select * from peca where nome like 'v%';
select * from peca where nome like '%e';
select * from peca where nome like '%de%';
select * from peca where codPeca in(1,3);
select * from peca where codPeca between 1 and 3;

select * from especialistas;

select * from cliente where nome like 'm%';
select * from servico where dataEntrada between 1 and 10;
select * from servico where codServico in(100,105);
select * from especialistas where custoHomemHora between 50 and 150;
select * from servico where codServico like 'luw5554%';


