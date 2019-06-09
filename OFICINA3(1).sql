create database oficina;

use oficina;

create table cep(
cep varchar(10)not null primary key,
rua varchar(60)not null,
bairro varchar(30)not null,
cidade varchar(30)not null,
uf varchar(2)not null);
    
create table cliente(
codcliente smallint not null primary key,
nome varchar(60)not null,
cep varchar(10)not null,
numero smallint not null,
complemento varchar(20)not null,
telefone varchar(20)not null,
foreign key(cep)references cep(cep));
    
create table veiculo(
placa varchar(10)not null primary key,
marca varchar(30)not null,
ano varchar(4)not null,
cor varchar(20)not null,
modelo varchar(30)not null,
codcliente smallint not null,
foreign key(codcliente)references cliente(codcliente));
    
create table servico(
codservico smallint not null primary key,
defeito varchar(100)not null,
preco double not null,
data_entrada date not null,
data_saida date not null,
placa varchar(10)not null,
foreign key(placa)references veiculo(placa));
    
create table profissional(
codprofissional smallint not null primary key,
especialidade varchar(30)not null,
valor_hora double not null);

create table peca(
codpeca smallint not null primary key,
nome varchar(50)not null,
preco double not null,
quantidade smallint not null);

create table serv_prof(
codserv_prof smallint not null primary key,
codprofissional smallint not null,
codservico smallint not null,
quant_horas smallint not null,
foreign key(codprofissional)references profissional(codprofissional),
foreign key(codservico)references servico(codservico));
	
create table servico_peca(
codservico_peca smallint not null primary key,
codpeca smallint not null,
codservico smallint not null,
quant_usada smallint not null,
foreign key(codpeca)references peca(codpeca),
foreign key(codservico)references servico(codservico));
    
insert into cep(cep,rua,bairro,cidade,uf)values
('26551-090','Travessa Elpidio','Cruzeiro do Sul','Mesquita','RJ'),
('26551-110','Rua Bagre','Cruzeiro do Sul','Mesquita','RJ' ),
('26551-140','Rua Paulo','Vila Emil','Mesquita','RJ'),
('23085-610','Rua Padre Pauwels','Campo Grande','Rio de Janeiro','RJ');

insert into cliente(codcliente,nome,cep,numero,complemento,telefone)values
(01,'manoel da costa','26551-090',10,'fundos','(21)3358-9856'),
(02,'angela da silva','23085-610',1241,'casa','(21)2224-1145'),
(03,'pedro henrique dias','26551-140',52,'casa','(21)9985-7744');

insert into veiculo(placa,marca,ano,cor,codcliente,modelo) values
('luw5114','fiat','2006','prata',01,'uno'),
('mna1128','ford','2015','preto',03,'fiesta'),
('apz2587','fiat','2010','prata',02,'palio');

insert into peca(codpeca,nome,preco,quantidade)values
(01,'vela bosh',60,35),
(02,'cabo de vela jogo',75,25),
(03,'braço articulado direito',130,10),
(04,'amortecedor dianteiro par monroe',250,10);

insert into profissional(codprofissional,especialidade,valor_hora) values
(01,'lanterneiro',130),(02,'mecânico',100),(03,'pintor',150),(04,'eletricista',120);

insert into servico(codservico,defeito,preco,data_entrada,data_saida,placa)values
(01,'motor engasgando',200,'2019-01-10','2019-01-10','apz2587'),
(02,'falhando troca de velocidade',220,'2019-01-11','2019-01-12','mna1128'),
(03,'barulho na roda dianteira',400,'2019-01-11','2019-01-11','luw5114');

insert into serv_prof(codserv_prof,codprofissional,codservico,quant_horas)values
(01,02,01,1),
(02,02,02,2),
(03,02,03,1);

insert into servico_peca(codservico_peca,codpeca,codservico,quant_usada)values
(01,01,01,2),
(02,02,02,1),
(03,03,03,1),
(04,04,03,1);

insert into veiculo(placa,marca,ano,cor,codcliente,modelo) values
('luw5554','fiat','2006','preto',01,'uno');

insert into servico(codservico,defeito,preco,data_entrada,data_saida,placa)values
(100,'motor de arranque sem partida',350,'2019-01-03','2019-01-03','luw5554'),
(105,'Comando de seta não aciona o alerta',230,'2019-01-18','2019-01-18','luw5554');

insert into peca(codpeca,nome,preco,quantidade)values
(05,'motor de arranque',250,35),
(06,'automático do motor de arranque',90,40);

insert into servico_peca(codservico_peca,codpeca,codservico,quant_usada)values
(05,05,100,1),(06,06,100,1);

insert into peca(codpeca,nome,preco,quantidade)values
(07,'feixe de mola',175,4);

insert into servico(codservico,defeito,preco,data_entrada,data_saida,placa)values
(106,'carro com nível irregular',500,'2019-02-05','2019-02-05','luw5554');

insert into serv_prof(codserv_prof,codprofissional,codservico,quant_horas)values
(04,04,100,2),(05,02,106,3);

insert into servico_peca(codservico_peca,codpeca,codservico,quant_usada)values
(07,07,106,1);

select nome,telefone,rua,numero,complemento,
bairro,cidade,uf,cli.cep from cep c
inner join cliente cli on
c.cep = cli.cep;

select nome,telefone,rua,numero,complemento,
bairro,cidade,uf,c.cep from cep as c
inner join cliente as cli on
c.cep = cli.cep;


/*
1) consultar nome e endereço de todos os clientes -OK JÁ FOI FEITO

2) consultar nome e endereço de todos os clientes que moram em jacarepagua - OK JÁ FOI FEITO

3) consultar nome dos clientes, telefone, placa do veiculo, modelo e marca. 

4) consultar nome,telefone e placa do veiculo do

cliente do serviço código 100.

5) Nome de todas as peças usadas na ordem de serviço número 100

6) consultar quais foram os serviços executados(mão obra)e as peças utilizadas no veículo placa luw5554 no dia 05/02/2019.

7) Mostrar a soma atualizada das peças do estoque.


8) Mostrar a média de preço das peças do estoque


9) Mostrar o maior valor de mão de obra da oficina por especialidade.''

Consultas para o dia 29/01

10) Mostrar o nome de todas as peças com quantidade em estoque menor que 10.

11) Mostrar o nome e telefone de todos os clientes que possuem carro do ano 2014.

12) Mostrar o nome de todos os profissionais que trabalharam no serviço código 234.

13) Mostrar o nome e telefone de todos os clientes que entraram com o carro para serviço no dia 15/01/2019.

14) Mostrar o nome e telefone de todos os proprietários de carros marca Nissan.
 
15) Placa de todos os veículos que realizaram serviço da especialidade "lanternagem".

*/
select nome,telefone,rua,numero,placa,modelo from 
cep c inner join cliente cli
on c.cep = cli.cep 
inner join veiculo v 
on cli.codcliente = v.codcliente;

select nome,telefone,rua,numero,placa from 
cep c inner join cliente cli
on c.cep = cli.cep 
inner join veiculo v 
on cli.codcliente = v.codcliente;

