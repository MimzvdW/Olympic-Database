-- Creating database
Create database Olympic

 --Creating Tables
create table TEAM
(
	Team_ID int not null Primary key identity (1,1),
	Team_Name varchar(255),
	Team_Colors varchar(255)

);

create table COACH
(
	Coach_ID int not null Primary key identity (1,1),
	Coach_FName varchar(255),
	Coach_LName varchar(255),
	Coach_Phone int,
	Team_ID int not null

	FOREIGN KEY(Team_ID) REFERENCES TEAM(Team_ID)
);

create table PARENT
(
	Parent_ID int not null Primary key identity (1,1),
	Parent_FName varchar(255),
	Parent_LName varchar(255),
	Parent_Phone int,
	Parent_Street varchar(255),
	Parent_City varchar(255),
	Parent_State varchar(255),
	Parent_Zip int

);

create table PLAYER
(
	Player_ID int not null Primary key identity (1,1),
	Player_FName varchar(255),
	Player_LName varchar(255),
	Player_Age int,
	Team_ID int not null

	FOREIGN KEY(Team_ID) REFERENCES TEAM(Team_ID)
);

create table REGISTERS
(
	Parent_ID int not null,
	Player_ID int not null

	FOREIGN KEY(Parent_ID) REFERENCES PARENT(Parent_ID),
	FOREIGN KEY(Player_ID) REFERENCES PLAYER(Player_ID)
);

--Insert Data to Table
insert into TEAM(Team_Name, Team_Colors)
values('Reds','Red'),
('Bears', 'Brown'),
('Dolphins', 'Grey'),
('Ravens', 'Black'),
('Eagles','White'),
('Raptors','Grean'),
('Foxes', 'Orange')

--This ID number will Auto generate, the other tables Foreign key does not want to work with this
insert into COACH(Coach_FName,Coach_LName, Coach_Phone, Team_ID)
values('Wilfred', 'Cawoood', 0870671240, 1),
('Alex','Rautenbach',0714569540, 2),
('James','van der Merwe',0711132943, 5),
('Wihan','Roodt', 0614555080, 4),
('Stephan','van der Westhuizen',0827451425, 7),
('Braam','van der Westhuizen',0867491422, 6),
('Brian','van Sitterd',0667441401, 3)

insert into PARENT(Parent_FName,Parent_LName,Parent_Phone,Parent_Street,Parent_City,Parent_State,Parent_Zip)
values('Alessia','Price',0789511526,'1906 Hanifan Lane','Houston','Texas',77063),
('Dale', 'Wild', 0819637896, '4441 Patterson Street','Houston','Texas',66063),
('Zina','Clark', 0678529658,'3987 Five Points','Houston', 'Texas',77063),
('Selma', 'van der Westhuizen', 0824467898,'4960 Cardinal Lane','Houston','Texas',79720),
('Carl', 'Mars', 0713239072, '2079 Ice Hill Road','Houston','Texas',78730),
('Sam', 'Carstens', 0713139082, '2074 Simons Hollo Road','Houston','Texas',79721),
('Rian', 'Dreyer', 0814439072, '3674 Hollow Road','Houston','Texas',79920)


insert into PLAYER(Player_FName,Player_LName, Player_age, Team_ID)
values('Moniques', 'Price',09, 1),
('Nicky','Wild',10, 2),
('Marcelle','Clark',11, 3),
('Yvonne', 'van der Westhuizen',11, 3),
('Mandy', 'Mars', 13, 5),
('Amy', 'Carstens', 12, 4),
('Mia', 'Dreyer', 12, 4)

insert into REGISTERS(Parent_ID, Player_ID)
values(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7)

--Store Procuders
-- SelectAll
create procedure SelectAllTeam
 as
select *
from TEAM

create procedure SelectAllCoach
 as
select *
from COACH join TEAM on COACH.Team_ID = TEAM.Team_ID

create procedure SelectAllParent
 as
select *
from PARENT

create procedure SelectAllPlayer
 as
select *
from PLAYER join TEAM on PLAYER.Team_ID = TEAM.Team_ID

create procedure SelectAllRegisters
 as
select *
from REGISTERS join PLAYER on REGISTERS.Player_ID = PLAYER.Player_ID join PARENT on REGISTERS.Parent_ID = PARENT.Parent_ID

--Execute SelectAll
exec SelectAllTeam
exec SelectAllCoach
exec SelectAllParent
exec SelectAllPlayer
exec SelectAllRegisters

--Update
update TEAM
set Team_Name = 'Fire Birds'
where Team_ID = 1

update TEAM
set Team_Name = 'Grizzlies'
where Team_ID = 2

update TEAM
set Team_Colors = 'Green'
where Team_ID = 6

update COACH
set Coach_LName = 'Cawood'
where Coach_ID = 1

update COACH
set Coach_Phone = 0774651136
where Coach_ID = 2

update PARENT
set Parent_Street = '1977 Hanifan Lane'
where Parent_ID = 1

update PARENT
set Parent_LName = 'Wilds'
where Parent_ID = 2

update PLAYER
set Player_age = 14
where Player_ID = 1

update PLAYER
set Player_LName = 'Wilds'
where Player_ID = 2

-- Registers uses PK and FK as data so I cannot update but the other updates will reflect now when I select the Table REGISTERS

delete from COACH where Coach_ID = 1
delete from COACH where Coach_ID = 2
delete from REGISTERS where Player_ID = 1
delete from REGISTERS where Player_ID = 2
delete from REGISTERS where Parent_ID = 1
delete from REGISTERS where Parent_ID = 2
delete from PLAYER where Player_ID = 1
delete from PLAYER where Player_ID = 2
delete from PARENT where Parent_ID = 1
delete from PARENT where Parent_ID = 2
delete from TEAM where Team_ID = 1
delete from TEAM where Team_ID = 2