create database exemplo_insert_1

use exemplo_insert_1


create table curso
(id_curso integer identity(1,1)NOT NULL primary key,
nm_curso varchar(45) NOT NULL);

create table aluno
(id_aluno integer identity (1,1)NOT NULL primary key,
nm_aluno varchar(60) NOT NULL,
dt_cad datetime NOT NULL,
dt_nas date NOT NULL,
id_curso integer not null
constraint alun_curso_fk references curso(id_curso));

sp_help aluno

insert into curso (nm_curso)
values ('Informatica'),
('Redes'),
('Contabilidade');

insert into aluno
values('João da Silva', '1992-02-28', getdate(),1),
('Maria Cristina', '1992-03-01', getdate(),2), /* 1,2,3,1 são referentes ao id do curso */
('Maria Joana','1953-05-09',GETDATE(),3),
('Julio Roberto','1992-06-01',GETDATE(),1);

select *from aluno

select*from curso
where id_curso=1 /* o numero 1 é a condição ou seja me traga 1 informação */

/*me traz o id 2*/

select * from aluno
where id_aluno=2

/*identificar uma parte do nome */
select*from aluno
where nm_aluno like '%Ma'

select*from aluno
where nm_aluno like 'Ma%'

/*Renomear nomes */
select id_aluno 'RM Aluno', nm_aluno 'Nome Aluno'
from aluno
where nm_aluno like 'Ma%'