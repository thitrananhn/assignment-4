-- MySQL Script created by Joshua Baesler and Thi Nguyen
-- Tue Mar 5 2019
-- Model: New Model    Version: 1.0

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';



/*
Address Table Creation
*/
-- -----------------------------------------------------
-- Table `Address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Address` ;

CREATE TABLE IF NOT EXISTS `Address` (
    `addressKey` INT NOT NULL AUTO_INCREMENT,
    `street` VARCHAR(200) NOT NULL,
    `city` VARCHAR(200) NOT NULL,
    `state` VARCHAR(200) NOT NULL,
    `zip` VARCHAR(200) NOT NULL,
    `country` VARCHAR(200) NOT NULL,
    PRIMARY KEY (`addressKey`)
)  ENGINE=INNODB;

/*
Email Table Creation
*/
-- -----------------------------------------------------
-- Table `Email`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Email` ;

CREATE TABLE IF NOT EXISTS `Email` (
    `emailKey` INT NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(200),
    `personKey` INT NOT NULL,
    PRIMARY KEY (`emailKey`)
)  ENGINE=INNODB;

/*
Person Table Creation
*/
-- -----------------------------------------------------
-- Table `Person`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Person` ;

CREATE TABLE IF NOT EXISTS `Person` (
    `personKey` INT NOT NULL AUTO_INCREMENT,
    `personCode` VARCHAR(200) NOT NULL,
    `name` VARCHAR(200) NOT NULL,
    `addressKey` INT NOT NULL,
    PRIMARY KEY (`personKey`)
)  ENGINE=INNODB;

/*
Customer Table Creation
*/
-- -----------------------------------------------------
-- Table `Customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Customer` ;

CREATE TABLE IF NOT EXISTS `Customer` (
    `customerKey` INT NOT NULL AUTO_INCREMENT,
    `customerCode` VARCHAR(200) NOT NULL,
    `customerType` VARCHAR(200) NOT NULL,
    `personKey` INT NOT NULL COMMENT 'Primary Contact',
    `customerName` VARCHAR(200) NOT NULL,
    `addressKey` INT NOT NULL,
    PRIMARY KEY (`customerKey`),
    CONSTRAINT `personKey` FOREIGN KEY (`personKey`)
        REFERENCES `Person` (`personKey`)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `addressKey` FOREIGN KEY (`addressKey`)
        REFERENCES `Address` (`addressKey`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
)  ENGINE=INNODB;

/*
Invoice and Product Linking Table Creation
*/
-- -----------------------------------------------------
-- Table `InvoiceProductList`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `InvoiceProductList` ;

CREATE TABLE IF NOT EXISTS `InvoiceProductList` (
    `listKey` INT NOT NULL AUTO_INCREMENT,
    `invoiceKey` INT NOT NULL,
    `productKey` INT NOT NULL,
    `dates` VARCHAR(200),
    `units` DOUBLE,
    `hours` DOUBLE,
    PRIMARY KEY (`listKey`)
)  ENGINE=INNODB;

/*
Invoice Table Creation
*/
-- -----------------------------------------------------
-- Table `Invoice`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Invoice` ;
CREATE TABLE IF NOT EXISTS `Invoice` (
    `invoiceKey` INT NOT NULL AUTO_INCREMENT,
    `invoiceCode` VARCHAR(200) NOT NULL,
    `customerKey` INT NOT NULL,
    `personKey` INT NOT NULL,
    PRIMARY KEY (`invoiceKey`)
)  ENGINE=INNODB;

/*
Product Table Creation
*/
-- -----------------------------------------------------
-- Table `Product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Product` ;
CREATE TABLE IF NOT EXISTS `Product` (
    `productKey` INT NOT NULL AUTO_INCREMENT,
    `productCode` VARCHAR(200) NOT NULL,
    `productType` VARCHAR(200) NOT NULL,
    `productName` VARCHAR(200) NOT NULL,
    `personKey` INT,
    `unitPrice` DOUBLE,
    `hourlyFee` DOUBLE,
    `serviceFee` DOUBLE,
    `annualLicenseFee` DOUBLE,
    PRIMARY KEY (`productKey`),
    FOREIGN KEY (`personKey`)
        REFERENCES `Person` (`personKey`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
)  ENGINE=INNODB;

/*
Inserts data into Email table
*/
INSERT INTO Email VALUES	(1,'hphippen0@theguardian.com',1),
							(2,'ebert1@google.it',2),
                            (3,'nfrossell2@home.pl',3),
                            (4,'nharsant3@bizjournals.com',4),
                            (5,'test4@seeifitworks.com',4),
                            (6,'sgrigolon4@paypal.com',5),
                            (7,'edebrett5@deviantart.com',6),
                            (8,'ekorting6@google.co.jp',7),
                            (9,'sarnison7@newyorker.com',8),
                            (10,'egirsch8@hud.gov',9),
                            (11,'jlangelaan9@etsy.com',10),
                            (12,'kguytona@cargocollective.com',11),
                            (13,'glightowlerb@wsj.com',12),
                            (14,'tglenisterc@seattletimes.com',13),
                            (15,'cvernalld@wordpress.org',14),
                            (16,'jtonnae@twitpic.com',15),
                            (17,'pfraschinif@studiopress.com',16),
                            (18,'kschonfeldg@delicious.com',17),
                            (19,'twemh@blogger.com',18),
                            (20,'cstallworthi@squidoo.com',19),
                            (21,'vnatonj@gnu.org', 20);
  
/*
Inserts data into Address table
*/
INSERT INTO Address VALUES	(1,'8 Claremont Junction','Lansing','MI','64324','USA'),
							(2,'61 Warner Avenue','Daytona Beach','FL','87263','USA'),
                            (3,'11219 Onsgard Trail','Hayward','CA','92760','USA'),
                            (4,'18 Morrow Terrace','Hicksville','NY','90909','USA'),
                            (5,'95461 Spaight Road','Daytona Beach','FL','47284','USA'),
                            (6,'92 Carey Pass','New York City','NY','12152','USA'),
                            (7,'2 Northfield Trail','Daytona Beach','FL','77777','USA'),
                            (8,'09 Continental Alley','Oceanside','CA','25635','USA'),
                            (9,'8251 Shoshone Court','Richmond','VA','62354','USA'),
                            (10,'9881 Sutteridge Court','Tampa','FL','75269','USA'),
                            (11,'38446 Butternut Crossing','Katy','TX','86356','USA'),
                            (12,'2059 Kropf Plaza','Evansville','IN','41168','USA'),
                            (13,'0902 Judy Trail','Charlotte','NC','34754','USA'),
                            (14,'9443 Schiller Parkway','Springfield','IL','18424','USA'),
                            (15,'97445 Monica Circle','Hartford','CT','95894','USA'),
                            (16,'567 Cherokee Trail','Lexington','KY','49841','USA'),
                            (17,'2609 Surrey Pass','Pensacola','FL','18412','USA'),
                            (18,'246 John Wall Plaza','Wilmington','NC','29415','USA'),
                            (19,'0 Kensington Pass','Atlanta','GA','59549','USA'),
                            (20,'909 Tennessee Way','Jamaica','NY','94264','USA'),
                            (21,'08 Lighthouse Bay Drive','Columbus','GA','31990','USA'),
                            (22,'6833 Fairfield Alley','Gainesville','FL','32605','USA'),
                            (23,'79 Orin Lane','Greenville','SC','29605','USA'),
                            (24,'27290 Trailsway Hill','Saint Paul','MN','55172','USA'),
                            (25,'33 Grasskamp Center','Providence','RI','02912','USA'),
                            (26,'2 Stang Hill','Tampa','FL','33686','USA'),
                            (27,'4 Algoma Junction','Springfield','IL','62764','USA');
  
/*
Inserts data into Person table
*/
INSERT INTO Person VALUES	(1,'974a','Phippen,Hamil',1),
                            (2,'359k','Bert,Egor',2),
                            (3,'682c','Frossell,Noam',3),
                            (4,'779b','Harsant,Norman',4),
							(5,'562k','Grigolon,Sarah',5),
							(6,'399e','De Brett,Elissa',6),
							(7,'142j','Korting,Elnore',7),
							(8,'554w','Arnison,Sandye',8),
							(9,'465l','Girsch,Emmie',9),
							(10,'450b','Langelaan,Joachim',10),
							(11,'036j','Guyton,Kim',11),
							(12,'970h','Lightowler,Gilbertine',12),
							(13,'305c','Glenister,Thaxter',13),
							(14,'046o','Vernall,Candace',14),
							(15,'138s','Tonna,Juliette',15),
							(16,'812x','Fraschini,Patience',16),
							(17,'713d','Schonfeld,Karita',17),
							(18,'517j','Wem,Thorny',18),
							(19,'682q','Stallworth,Con',19),
							(20,'864d','Naton,Vincent',20);

 /*
Inserts data into Customer Table
*/
INSERT INTO Customer VALUES	(1,'C001','G',1,'Beatty Inc',21),
							(2,'C002','G',4,'"Cummerata, Ullrich and Metz"',22),
							(3,'C003','G',7,'Howe and Sons',23),
							(4,'C004','C',11,'Stark-Tromp',24),
							(5,'C005','G',14,'Bergnaum-Connelly',25),
							(6,'C006','C',17,'Hills-Schowalter',26),
                            (7,'C007','C',18,'Schneider-Sporer',27);

/*
Inserts data into Product Table dependent on type of Product
*/
INSERT INTO Product (productKey, productCode, productType, productName, serviceFee, annualLicenseFee)
			VALUES	(1,'7dtc','L','Cinco Security System','0.00','1025.00'),
					(5,'qcsh','L','Cinco Augmented Reality Software','250.00','1750.00');
                    
INSERT INTO Product (productKey, productCode, productType, productName, unitPrice)
			VALUES	(2,'6l6c','E','Cinco Dance-Pad Keyboard','200.00'),
					(3,'lew8','E','Cinco Projected Mouse','125.00'),
					(6,'q6fd','E','Cinco Wireless Monitor','1500.00');
                    
INSERT INTO Product (productKey, productCode, productType, productName, personKey, hourlyFee)
			VALUES	(4,'ldrs','C','Security Advisor',6,'85.00');

/*
Inserts data into Invoice Product List Table dependent on type of Product
*/
INSERT INTO InvoiceProductList (listKey, invoiceKey, productKey, units) VALUES	(1,1,3,5),
																				(3,2,3,25),
																				(4,2,2,4),
                                                                                (8,4,2,1),
                                                                                (11,5,6,25);
                                                                                
INSERT INTO InvoiceProductList (listKey, invoiceKey, productKey, dates) VALUES	(2,1,1,'2001-01-01:2005-01-01'),
																				(7,3,5,'2005-01-01:2005-12-31'),
                                                                                (9,4,5,'2005-01-01:2005-12-31'),
                                                                                (10,4,1,'2005-01-01:2005-01-15');
                                                                                
INSERT INTO InvoiceProductList (listKey, invoiceKey, productKey, hours) VALUES	(5,2,4,1),
																				(6,3,4,24);

/*
Inserts data into Invoice Table
*/
INSERT INTO Invoice VALUES	(1,'INV001',1,2),
							(2,'INV002',7,6),
							(3,'INV003',5,12),
							(4,'INV004',3,15),
							(5,'INV005',2,20);
                            
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;