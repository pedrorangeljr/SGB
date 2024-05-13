create database sgb;
use sgb;

create table login(

 id bigint not null auto_increment,
 nome varchar(200) not null,
 email varchar(100) not null,
 senha varchar(100) not null,
 constraint use_pk primary key(id)
 
);
