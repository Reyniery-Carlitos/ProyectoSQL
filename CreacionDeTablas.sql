create table CUSTOMERS(
	Customer_Id number(10) constraint Customers_Id_pk primary key,
	Last_Name varchar2(25) not null,
	First_Name varchar2(25) not null,
	Home_Phone varchar2(12) not null,
	Address varchar2(100) not null,
	City varchar2(30) not null,
	State varchar2(2) not null,
	Email varchar2(25),
	Cell_Phone varchar2(12) not null
);

create table MOVIES(
	Title_Id number(10) constraint Movies_Id_pk primary key,
	Title varchar2(60) not null,
	Description varchar2(400) not null,
	Rating varchar2(4),
	Category varchar2(20),
	Release_Date date not null
);

create table MEDIA(
	Media_Id number(10) constraint Media_Id_pk primary key,
	Format varchar2(3) not null,
	Title_Id number(10) not null,
	constraint Media_TitId_fk foreign key (Title_Id) references MOVIES(Title_Id) 
);

create table RENTAL_HISTORY(
	Media_Id number(10),
	Rental_Date date default sysdate,
	Customer_Id number(10) not null,
	Return_Date date,
    constraint RenHis_MedId_RenDat_pk primary key(Media_Id, Rental_Date)
);

alter table RENTAL_HISTORY
add constraint RenHis_CustId_fk foreign key (Customer_Id) references CUSTOMERS(Customer_Id) 
	
alter table RENTAL_HISTORY
add constraint RenHis_MedId_fk foreign key (Media_Id) references MEDIA(Media_Id)
    

create table ACTORS(
	Actor_Id number(10) constraint Actors_ActId_pk primary key,
	Stage_Name varchar2(40) not null,
	First_Name varchar2(25) not null,
	Last_Name varchar2(25) not null,
	Birth_Date date not null
);

create table STAR_BILLINGS(
	Actor_Id number(10),
	Title_Id number(10),
	Comments varchar2(40),
	constraint StrBil_ActId_TitId_pk primary key(Actor_Id, Title_Id)
);

alter table STAR_BILLINGS
add constraint StrBil_ActId_fk foreign key (Actor_Id) references ACTORS(Actor_Id)

alter table STAR_BILLINGS
add constraint StrBil_TitID_fk foreign key (Title_Id) references MOVIES(Title_Id)

-- RESTRICCIONES CHECK

-- Restriccion check tabla movies columna rating
alter table MOVIES
add constraint Movies_Rating_ck 
check (rating in ('G', 'PG', 'PG13', 'R'));

-- Restriccion check tabla movies columna category
alter table MOVIES
add constraint Movies_Category_ck
check (Category in ('DRAMA', 'COMEDY', 'ACTION', 'CHILD', 'SCIFI', 'DOCUMENTARY'));

-- INSERCIONES
-- Insercion de valores para la tabla customers
insert into CUSTOMERS
values (101, 'Palombo', 'Lisa', '716-270-2669', '123 Main ST', 'Bufalo', 'NY', 'palombo@ecc.edu', '716-555-1212')

-- Insercion de valores para la tabla movies
insert into MOVIES 
    (Title_Id, Title, Description, Rating, Category, Release_Date)
values (1, 'Remember the Titans', 'The true story of a newly appointed African-American coach and his high School team or their first season as a racially integrated unit', 'PG', 'DRAMA', to_date('29/09/2000', 'dd/mm/YYYY'));

select * from MOVIES

desc MOVIES
-- Insercion de valores para la tabla media
insert into MEDIA
values (92, 'DVD', 1);

insert into MEDIA
values (93, 'VHS', 1);

-- Insercion de  valores para la tabla Rental history
insert into RENTAL_HISTORY
values (92, to_date('19-sep-2010', 'dd//mm//yyyy'), 101, to_date('20/09/2010', 'dd/mm/yyyy'));

-- Insercion de  valores para la tabla Actors
insert into ACTORS
values (1001, 'Brad Pitt', 'William', 'Pitt', to_date('18/12/1963', 'dd/mm/yyyy'));

-- Insercion de  valores para la tabla Star_billings
insert into STAR_BILLINGS
values (1001, 1, 'Romantic Lead');