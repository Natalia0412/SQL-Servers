create database ex_has_ex_7
use ex_has_ex_7;

create table projeto
(id_projeto integer primary key not null,
nome_projeto varchar(200) not null);

create table departamento
(id_departamento integer primary key not null,
nome_departamento varchar (200) not null);

create table empregado
(id_empregado integer not null primary key,
id_departamento integer not null
constraint empre_departamento_fk references departamento(id_departamento),
nome_empregado varchar (200) not null,
numero_dependentes integer not null,
salario numeric (7,2)); 

create table empregado_projeto
(id_empregado integer not null
constraint proj_empregado_fk references empregado(id_empregado),
id_projeto integer not null
constraint proj_projeto_fk references projeto(id_projeto) );

create table ferias 
(id_empregado integer not null
constraint feria_empregado_fk references empregado(id_empregado),
ano integer not null,
mes integer not null);

insert into projeto (id_projeto,nome_projeto)
values	(1,'Relatorio Contabilidade Internacional'),
		(2,'Pesquisa Salarial'),
		(3,'Aplicativo Controle de Acesso Predial ');

insert into departamento(id_departamento,nome_departamento)
values	(2,' Contabilidade '),
		(4,'RH'),
		(6,'TI ');


insert into  empregado (id_empregado,id_departamento,nome_empregado,numero_dependentes,salario)
values  (10,2,'Maria',10,1600.00),
		(20,4,'Ricardo',5,1400.00);
		(30,6,'Julia',3,1200.00);

insert into empregado_projeto (id_empregado, id_projeto)
values  (10,1),
		(20,2),
		(30,3);

insert into ferias (id_empregado,ano, mes)
values  (10,2017,10),
		(20,2017,8),
		(30,2017,7);

		/*sp_help diversos*/
		sp_help projeto
		sp_help empregado_projeto
		sp_help empregado
		sp_help departamento
		sp_help ferias


		/*select diversos*/
		select*from projeto
		select*from empregado
		select*from empregado_projeto
		select*from ferias
		select*from departamento

		/* Drop´s apaga a tabela por completo */
	drop table ferias
	drop table empregado_projeto
	drop table empregado
	drop table departamento
	drop table projeto

	select id_empregado "Codigo", nome_empregado "Nome",
			numero_dependentes "Qtd Dep", salario "Vl Salario",
			id_departamento "Depto"
		from empregado
		where nome_empregado like 'J%'

	select id_empregado "Codigo", nome_empregado "Nome",
			numero_dependentes "Qtd Dep", salario "Vl Salario",
			id_departamento "Depto"
		from  empregado
		where id_departamento=20

	select nome_empregado "Nome", salario "Vl Salario"
		from empregado
		where salario>1200.00

	select id_projeto "Nro Prj", nome_projeto "Nome Prj"
		from projeto 
		where nome_projeto like '%ial'

	select id_projeto "Nro Prj", nome_projeto "Nome Prj"
		from projeto
		where nome_projeto like '%ial'
		order by id_projeto DESC

update empregado 
set nome_empregado='Valdivia'
where id_empregado='20'

truncate table ferias;

update empregado
set nome_empregado='Mario Cardoso'
where id_empregado='10'

update empregado
set numero_dependentes='4'
where id_empregado='30'

update empregado
set salario='1540'
where id_departamento='4'

delete from empregado_projeto
  where id_empregado=30;

delete from empregado
delete from empregado where id_empregado=30;
 
 delete from empregado_projeto
 delete from empregado_projeto where id_empregado=10;

 create table cargo 
 (id_cargo integer not null 