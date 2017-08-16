drop database if exists pfdingbao;
create database pfdingbao;
use pfdingbao;
drop table if exists cp;
drop table if exists paper;
drop table if exists customer;

create table paper(
			pno char(6) primary key not null,
            pna varchar(40),
            ppr double,
            psi varchar(10),
            pdw varchar(40)
);

create table cp(
			gno int not null,
            pno char(6),
            num int
);

create table customer(
			gno int primary key auto_increment,
            gna varchar(20),
            gte varchar(20),
            gad varchar(50),
            gpo varchar(10),
            username varchar(20) not null,
            userpassword varchar(20) not null,
		    addmission int
);



insert into paper values('000001','南方都市报','2.5','60*30','南方都市报出版社');
insert into paper values('000002','人民日报','1.5','50*40','人民日报出版社');
insert into paper values('000003','广州日报','2','60*30','广州日报出版社');
insert into paper values('000004','篮球先锋报','1.5','50*30','篮球先锋报出版社');
insert into paper values('000005','羊城晚报','2','60*40','羊城晚报出版社');
insert into paper values('000006','人民日报','1.5','50*30','人民日报出版社');
insert into paper values('000007','环球时报','3','60*40','环球时报出版社');

insert into customer values(null,'李明','13798739028','大学城外环东路142号','521000','liming','1234','1');
insert into customer values(null,'王强','13796439028','大学城外环东路112号','521210','wangqiang','1234','1');
insert into customer values(null,'郭梅','13282739058','大学城外环东路132号','521330','guomei','1234','1');
