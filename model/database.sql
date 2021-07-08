create database OrderaNodejs

create table Admin
(
	name varchar(20),
	password varchar(40),
	PhoneNumber int,
	image varchar(999)
)


create table captain
(
	delivery_id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
	First_name varchar(20),
	last_name varchar(20),
	password varchar(40),
	email varchar(25),
	Scooter varchar(10),
	location varchar(100),
	online_status int,	-- 0 OR 1
	transportation_state int,	-- 0 OR 1
	PhoneNumber int,
	image varchar(999)

)
--===========================================================================


create table User
(
	user_id int	NOT NULL PRIMARY KEY AUTO_INCREMENT,
	First_name varchar(15),
	last_name varchar(15),
	password varchar(40),
	Email varchar(100),
	Location varchar(100),
	PhoneNumber int,
	image varchar(999)
)
--===========================================================================


create table captain_trans
(
	delivery int,
	From_location varchar(100),
	to_location varchar(100),
	distance varchar(15),
	duration varchar(15)
)
--===========================================================================


create table carts
(
	user_id int,
	product_name varchar(50),
	image varchar(999),
	qty int,
	price int,
	total int,
	time varchar(20),
	user_location varchar(100),
	product_location varchar(100)

)
--===========================================================================

create table foods
(
	restaurants_id int,
	item_id int primary key AUTO_INCREMENT,
	name varchar(100),
	description varchar(999),
	price int,
	image varchar(999)
)
--===========================================================================

create table groceries
(
	supermarket_id int,
	item_id int primary key AUTO_INCREMENT,
	name varchar(100),
	description varchar(999),
	price int,
	image varchar(999)
)
--===========================================================================

create table tools
(
	library_id int,
	item_id int primary key AUTO_INCREMENT,
	name varchar(100),
	description varchar(999),
	price int,
	image varchar(999)
)
--===========================================================================

create table library
(
	library_id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name varchar(100),
	description varchar(500),
	location int,
	image varchar(999)
	status int	-- 1 OK 0 Banned

)
--===========================================================================

create table Restaurants
(
	restaurants_id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name varchar(100),
	description varchar(999),
	location int,
	image varchar(999),
	status int

)
--===========================================================================

create table supermarket
(
	supermarket_id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name varchar(100),
	description varchar(999),
	location int,
	image varchar(999),
	status int
)
--=============================================================================

create table waiting_list
(
	id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
	First_name varchar(25),
	lastname varchar(25),
	password varchar(255),
	Email varchar(255),
	Scooter varchar(10),
	PhoneNumber int
)
--===========================================================================
















