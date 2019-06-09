create database Oficina;

use Oficina;

create table cliente(
celular varchar(20) not null primary key,
nome varchar(60) not null,
telefone varchar(20) not null,
endereco varchar(100) not null
);

create table cep(
cep varchar(12)  not null primary key,
rua varchar(60) not null,
bairro varchar(30) not null,
cidade varchar(30) not null,
uf varchar(2) not null
);

create table veiculo(
placa varchar(10) not null primary key, 
marca varchar(20) not null,
ano varchar(4) not null,
cor varchar(10) not null,
celular varchar(20) not null,
foreign key (celular) references cliente (celular)
);

create table servico(
	codservico smallint not null primary key,
	defeito varchar(100)not null,
	preco double not null,
	data_entrada date not null,
	data_saida date not null,
	placa varchar(10)not null,
	foreign key(placa)references veiculo(placa)
    );

create table profissional(
codprofissional varchar(10) not null primary key,
especialidade varchar(20) not null,
valorHora double not null
);

create table servicoprofissional(
codservicoprofissional varchar(20) not null primary key,
codservico smallint not null, 
quanthoras smallint not null,
codprofissional varchar(10) not null,
foreign key(codservico) references servico (codservico),
foreign key(codprofissional) references profissional (codprofissional)
);

create table peca(
codpeca varchar(10) not null primary key,
quantidade smallint not null,
preco double not null,
nome varchar(10) not null
);

create table servico_peca(
codservico_peca varchar(10) not null primary key,
codpeca varchar(10) not null,
codservico smallint not null,
quantidade smallint not null,
foreign key(codpeca) references peca(codpeca),
foreign key(codservico) references servico(codservico)
);
 
alter table cliente change endereco cep varchar(12) not null;
alter table cliente add numero smallint not null;
alter table cliente add complemento varchar(30) not null;
alter table peca change nome nome varchar (20) not null;
alter table peca change nome nome varchar (30) not null;
alter table peca change nome nome varchar (40) not null;


select * from peca where nome like 'v%';
select * from cep;
select * from peca;
select * from profissional;
select * from cliente;
desc cep;

insert into servico_peca (codservico_peca,codpeca,codservico,quantidade) values (01,01,01,2),(02,02,02,1),(03,03,03,1),(04,04,03,1);
insert into servicoprofissional(codservicoprofissional,codservico,quanthoras,codprofissional) values (01,01,1,02),(02,02,2,02),(03,03,1,02);
insert into servico(codservico,defeito,preco,data_entrada,data_saida,placa) values (01,'Motor Engasgado','2019-10-01','2019-10-01','APZ2587'),(02,'Falhando troca de velocidade',220,'2019-01-11','2019-01-12','MNA1128'),(03,'Barulho na roda dianteira',400,'2019-01-11','2019-01-11','LUW5114');
insert into veiculo(placa,marca,ano,cor,celular) values('LUW5114','FIAT','2006','Prata','(21) 3851-5138'),('MNA1128','Ford',2015,'Preto',03),('APZ2587','Fiat','2010','Prata',02);
insert into cliente(celular,nome,telefone,cep,numero,complemento) values ('(21) 3851-5138','Manoel da Costa','(21) 5438-5438'),('Angela da Silva','23085-610','1241','Casa','(21) 2224-114521');
insert into profissional(codprofissional,especialidade,valorHora) values (01,'Lanterneiro',130),(02,'Mecânico',100),(03,'Pintor',150),(04,'Eletricista',120);
insert into peca(codpeca,quantidade,preco,nome) values (01,35,60,'Vela Bosh'),(02,25,75,'Cabo de Vela Jogo'),(03,10,130,'Braço Articulado Direito'),(04,10,250,'Amortecedor Dianteiro Par Monroe');
insert into cep(cep,rua,bairro,cidade,uf) values ('26551-110','Rua Bagre','Cruzeiro do Sul','Mesquita','RJ'),('26551-140','Rua Paulo','Vila Emil,','Mesquita','RJ'),('23085-610','Rua Padre Pauwels','Campo Grande','Mesquita','RJ');