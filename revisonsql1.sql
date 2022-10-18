drop database if exists revision;
create database revision;
use revision;
drop table if exists etudiant;
create table etudiant (
codeetudiant int auto_increment primary key,
sexe  varchar(30) not null,
nometudiant varchar(50) not null,
prenometudiant varchar(50) not null,
datenetudiant date not null,
email varchar(50) not null ,
ville varchar(30) not null
);
drop table if exists matiere;
create table matiere(
codemat int auto_increment primary key,
libellemat varchar(20) not null,
coeffmat varchar(20) not null
);
drop table if exists evaluation ;
create table evaluation (
code_etudiant int   ,
code_mat int  ,
dateevaluation date not null,
typeevaluation varchar(50) not null,
note float not null,
constraint fk_etudiant foreign key (code_etudiant) references etudiant (codeetudiant),
constraint fk_matiere foreign key (code_mat) references matiere (codemat),
constraint  primary key (code_etudiant,code_mat)
);
insert into etudiant (sexe ,nometudiant,prenometudiant ,datenetudiant,email ,ville) values
("feminin","achach","salma","2003/08/18","salma@gmail.com","tetouan"),
("feminin","benzerga","khadija","1999/12/06","khadija@gmail.com","fnideq"),
("feminin","houchi","chaymae","2004/03/6","chaymae@gmail.com","tetouan");

select * from etudiant order by nometudiant desc;
select libellemat,coeffmat from matiere;
select * from matiere where coeffmat>2;
select nometudiant,prenometudiant,datenetudiant from etudiant where sexe="feminin";
select * from etudiant where sexe="masculin" order by datenetudiant ;
select * from evaluation where dateevaluation between "2020-01-01" and "2020-05-30";
select *from evaluation where typeevaluation="qcm" order by dateevaluation;
select * from evaluation order by typeevaluation desc ;
select * from evaluation order by dateevaluation asc;
select * from etudiant where prenometudiant="ayman";
select code_mat,note from evaluation where code_etudiant=1 and note>=16;
select * from etudiant where ville="tetouan" or ville="fnideq" or ville="tanger"; 
select prenometudiant from etudiant where prenometudiant like "%a";
select prenometudiant,nometudiant from etudiant where prenometudiant like "%a" and  nometudiant like "%h";
select * from etudiant where  prenometudiant like "%m%";
select nometudiant from etudiant where nometudiant like "_c%";
select nometudiant from etudiant where nometudiant not like "_c%";
select * from etudiant  where sexe="feminin" and ville="tetouan" and nometudiant like "a%" and prenometudiant not like "%h%";
select  typeevaluation from evaluation;
select distinct  typeevaluation from evaluation;
