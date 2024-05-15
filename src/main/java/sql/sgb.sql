create database sgb;
use sgb;

create table login(

 id bigint not null auto_increment,
 nome varchar(200) not null,
 email varchar(100) not null,
 senha varchar(100) not null,
 constraint use_pk primary key(id)
 
);

ALTER TABLE login ADD UNIQUE (email);

create table tbaluno (
  
   idAluno integer auto_increment primary key,
   nome varchar(200),
   telefone integer,
   cpf varchar(200),
   cep varchar(200),
   logradouro varchar(200),
   numero varchar(200),
   bairro varchar(200),
   cidade varchar(200),
   uf varchar(50),
   multas integer,
   checkbox bool,
   unique(cpf)
   
   );
   
ALTER TABLE tbaluno ADD UNIQUE (telefone);