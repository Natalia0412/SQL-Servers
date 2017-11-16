create database ex_has_ex_s
use ex_has_ex_s;

create table empregado_projeto
(id_empregado integer not null,
constraint proj_empregado_fk references empregado(id_empregado),
id_projeto integer not null,
constraint proj_projeto_fk references projeto(id_projeto) );

create table empregado
(id_empregado integer not null primary key,
id_departamento integer not null,
constraint empre_departamento_fk references departamento(id_departamento),
nome_empregado varchar (200)not null,
numero_departamento integer not null,
salario numeric (7,2)); 

create table projeto
(id_projeto integer primary key ,
nome_projeto varchar(200) not null);

create table departamento
(id_departamento integer primary key,
nome_departamento varchar (200) not null);

create table ferias 
(id_empregado integer not null
constraint feria_empregado_fk references empregado(id_empregado),
ano integer not null,
mes integer not null);
