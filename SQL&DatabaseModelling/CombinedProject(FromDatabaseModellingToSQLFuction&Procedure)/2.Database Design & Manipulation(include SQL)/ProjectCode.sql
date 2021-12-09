SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';


-- -----------------------------------------------------
-- Schema Project
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Project` DEFAULT CHARACTER SET utf8 ;
USE `Project` ;


-- -----------------------------------------------------
-- Table `Project`.`Branch`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Project`.`Branch` (
  `BranchID` VARCHAR(4) NOT NULL,
  PRIMARY KEY (`BranchID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Project`.`Product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Project`.`Product` (
  `ProductID` VARCHAR(4) NOT NULL,
  `ProductType` VARCHAR(20) NULL,
  `PackageType` VARCHAR(20) NULL,
  `YearProduced` INT NULL,
  `Price` DECIMAL(5,2) NULL,
  `Brand` VARCHAR(20) NULL,
  PRIMARY KEY (`ProductID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Project`.`Campaign`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Project`.`Campaign` (
  `CampaignID` VARCHAR(4) NOT NULL,
  `CampaignStartDate` DATETIME NULL,
  `CampaignEndDate` DATETIME NULL,
  PRIMARY KEY (`CampaignID`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Project`.`Member`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Project`.`Member` (
  `MemberID` VARCHAR(4) NOT NULL,
  `FirstName` VARCHAR(10) NULL,
  `LastName` VARCHAR(10) NULL,
  `eMail` VARCHAR(35) NULL,
  `MemberExpDate` DATETIME NULL,
  `MembershipLevel` VARCHAR(10) NOT NULL,
  `BranchID` VARCHAR(4) NOT NULL, 
  PRIMARY KEY (`MemberID`),
  Constraint Membership_fk FOREIGN KEY (MembershipLevel) references Membership (MembershipLevel),
  Constraint BranchID_m_fk FOREIGN KEY (BranchID) references Branch (BranchID)
  )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Project`.`Membership`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Project`.`Membership` (
  `MembershipLevel` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`MembershipLevel`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Project`.`Stock`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Project`.`Stock` (
  `ProductID` VARCHAR(4) NOT NULL,
  `BranchID` VARCHAR(4) NOT NULL,
  `StockLevel` INT NOT NULL,
   PRIMARY KEY (`ProductID`,`BranchID`),
   Constraint Product_fk FOREIGN KEY (ProductID) references Product (ProductID),
   Constraint Branch_fk FOREIGN KEY (BranchID) references Branch (BranchID)
  )
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `Project`.`Discount`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Project`.`Discount` (
  `ProductID` VARCHAR(4) NOT NULL,
  `CampaignID` VARCHAR(4) NOT NULL,
  `MembershipLevel` VARCHAR(10) NOT NULL,
  `Discount` INT NOT NULL,
   PRIMARY KEY (`ProductID`,`CampaignID`,`MembershipLevel`),
   Constraint Product_D_fk FOREIGN KEY (ProductID) references Product (ProductID),
   Constraint Campaign_D_fk FOREIGN KEY (CampaignID) references Campaign (CampaignID),
   Constraint Membership_D_fk FOREIGN KEY (MembershipLevel) references Membership (MembershipLevel)
  )
ENGINE = InnoDB;


-- insert values for membership 
insert into Membership Values ("VIP");
insert into Membership Values ("Platinum");
insert into Membership Values ("Gold");
insert into Membership Values ("Sliver");
insert into Membership Values ("Bronze");

-- insert values for branch
insert into Branch Values ("B101");
insert into Branch Values ("B102");
insert into Branch Values ("B103");
insert into Branch Values ("B104");
insert into Branch Values ("B105");


-- insert values for member
insert into Member Values ("M357","Simone","Singh","simone123@gmail.com","2022-02-24","Gold","B101");
insert into Member Values ("M203","Jane","Doe","janejane4ever@gmail.com","2021-11-24","VIP","B102");
insert into Member Values ("M11","Ariana","Grande","ari468@gmail.com","2021-12-12","Sliver","B103");
insert into Member Values ("M580","Justin","Biber","justin96@gmail.com","2022-01-30","Bronze","B104");
insert into Member Values ("M721","Jason","Lee","jasonlee1996@gmail.com","2050-02-04","VIP","B105");


-- insert values for product
insert into Product Values ("P399","wine","bottle",2015,15.5,"Yellow Tail");
insert into Product Values ("P400","wine","bottle",2010,12,"Penfold Grange");
insert into Product Values ("P570","beer","box",2020,35,"Heineken");
insert into Product Values ("P300","beer","bottle",2020,5.5,"VB");
insert into Product Values ("P203","beer","bottle",2021,3.2,"Pure Blonde");


-- insert values for Campaign
insert into Campaign Values ("C432","2020-07-12","2022-01-12");
insert into Campaign Values ("C590","2021-02-12","2022-03-12");
insert into Campaign Values ("C300","2015-10-12","2019-02-25");
insert into Campaign Values ("C672","2021-09-23","2022-05-21");
insert into Campaign Values ("C401","2019-11-17","2020-02-24");

-- insert values for Stock
insert into Stock Values ("P400","B101",10);
insert into Stock Values ("P400","B102",20);
insert into Stock Values ("P400","B103",4);
insert into Stock Values ("P300","B104",20);
insert into Stock Values ("P203","B105",500);

-- insert values for Discount
insert into Discount Values ("P203","C432","Gold",30);
insert into Discount Values ("P300","C590","Gold",20);
insert into Discount Values ("P400","C300","Gold",70);
insert into Discount Values ("P400","C672","Gold",10);
insert into Discount Values ("P570","C401","Gold",20);


-- display Membership
select * from Membership;

-- display Branch
select * from Branch;

-- display Member
select * from Member;

-- display Product
select * from Product;

-- display Campaign
select * from Campaign;

-- display Stock
select * from Stock;

-- display Discount
select * from Discount;


-- Query 1
select b.BranchID from Branch b, Product p, Stock s where s.BranchID=b.BranchID and s.ProductID=p.ProductID 
and p.Brand="Penfold Grange" and p.YearProduced=2010 
and s.Stocklevel>=5;


-- Query 2
select p.ProductID, p.ProductType, p.PackageType, p.YearProduced,p.Brand,
p.Price OriginalPrice, format(Price*(1-d.Discount/100),2) DiscountedPrice
from Product p, Campaign c, Member m, Membership ms, Discount d
where p.ProductID=d.ProductID and c.CampaignID=d.CampaignID 
and ms.Membershiplevel=d.Membershiplevel and ms.Membershiplevel=d.Membershiplevel 
and d.Discount=20 and m.FirstName="Simone" and m.Lastname="Singh"
and "2021-12-24" between c.CampaignStartDate and c.CampaignEndDate
and m.MemberExpDate >="2021-12-24";

-- Query 3
select b.BranchID, m.MemberExpDate, m.eMail, now() QueryRunDate
from Branch b, Member m 
where b.BranchID=m.BranchID and
year(DATE_ADD(now(), INTERVAL 2 MONTH))=year(m.MemberExpDate) and 
month(DATE_ADD(now(), INTERVAL 2 MONTH))=month(m.MemberExpDate)
order by b.BranchID asc, m.MemberExpDate asc, m.eMail asc;


-- Query 4
select count(*) SaleCountAfterCovid
from Product p, Campaign c, Discount d
where p.ProductID=d.ProductID and c.CampaignID=d.CampaignID and
p.Brand="Penfold Grange" and p.YearProduced=2010 and
c.CampaignStartDate>="2020-03-01"