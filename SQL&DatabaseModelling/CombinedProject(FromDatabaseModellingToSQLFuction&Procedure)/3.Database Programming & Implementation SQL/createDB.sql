/*
*********************************************************************
Name: MySQL Magic Ale Database
*********************************************************************
*/

CREATE SCHEMA if not exists magicale;

USE magicale;

DROP TABLE IF EXISTS Product,Campaign,Membership,DiscountDetails,Branch;

create table Product (
	ProductID int not null,
	ProductType varchar (20) not null,
	PackageType varchar(20) not null, 
    YearProduced int not null,
    Price float not null,
    Brand varchar(255) not null,
	PRIMARY KEY (ProductID)
) engine InnoDB default charset=latin1;

create table Campaign (
	CampaignID int not null,
	CampaignStartDate date not null,
    CampaignEndDate date,
	PRIMARY KEY (CampaignID)
) engine InnoDB default charset=latin1;

create table Accident (
	incidenceNum int not null,
	date datetime,
    driver varchar(20) not null,
    car varchar(20) not null,
    damage_amount varchar(20) not null,
	PRIMARY KEY (incidenceNum),
    foreign key (driver) references Person (licenceNum),
	foreign key (car) references Car (regoNum)
);

select c.*
from Car c, Person p, Accident a
where c.owner=p.licenceNum and p.licenceNum=a.driver and
month(a.date) between 1 and 3 and
year(a.date) =2021;

select distinct e.employeeNumber, e.lastName, e.firstName, d.DeptName
from Employees e, Departments d
where e.DeptID= d.DeptID and
e.Position='Manager';




create table DiscountDetails (
	ProductID int not null,
	CampaignID int not null,
	MembershipLevel varchar(20) not null, 
	Discount int not null,
	primary key (ProductID, CampaignID, MembershipLevel),
	foreign key (ProductID) references Product (ProductID),
	foreign key (CampaignID) references Campaign (CampaignID)
) engine InnoDB default charset=latin1;

create table Branch (
	BranchID varchar(45) not null,
	ProductID int not null,
	StockLevel int not null,
	primary key (BranchID, ProductID),
	foreign key (ProductID) references Product (ProductID)
) engine InnoDB default charset=latin1;
