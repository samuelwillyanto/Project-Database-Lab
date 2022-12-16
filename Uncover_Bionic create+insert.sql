CREATE DATABASE Uncover_Bionic
GO
USE Uncover_Bionic
GO

CREATE TABLE Staff (
	StaffID CHAR(5) PRIMARY KEY CHECK(StaffID LIKE 'ST[0-9][0-9][0-9]'),
	StaffName VARCHAR(50) NOT NULL,
	StaffEmail VARCHAR(50) NOT NULL, 
	StaffPhoneNumber VARCHAR(20) NOT NULL,
	StaffAddress VARCHAR(50) NOT NULL,
	StaffDOB DATE NOT NULL,
	StaffGender VARCHAR(10) CHECK(StaffGender IN ('Male', 'Female')) NOT NULL,
	StaffSalary NUMERIC(10,0) NOT NULL
)

INSERT INTO Staff VALUES
('ST001', 'Louise Wise', 'lousewise231@outlook.com', '(568) 588-3385', '3 Reele Land', '1999-03-14', 'Male', 4500000),
('ST002', 'Paul Cunningham', 'paul.cunningham@eso.com', '(186)-919-7790', '8177 Edwards Rd', '1994-01-04', 'Male', 7500000),
('ST003', 'Marie Riley', 'marieriley@sunny.com', '(973)-887-7628', '2965 Dane Street', '1994-11-02', 'Female', 10000000),
('ST004', 'Tina Larson', 'tina.larson39@safle.com', '(952)-055-1851', '5693 Avondale Ave', '1986-10-07', 'Female', 4000000),
('ST005', 'Earl Murray', 'earlmurray@kasde.com', '(640)-950-1735', '7194 Edwards Rd', '1982-06-21', 'Male', 9000000),
('ST006', 'Ryan Newman', 'ryannewman1@ray.com', '(001)-960-1132', '5937 Hunters Creek Dr', '1995-01-15', 'Male', 7500000),
('ST007', 'Freddie Curtis', 'freddie@curt.com', '(716)-123-9106', '8636 Cackson St', '1999-12-15', 'Male', 8000000),
('ST008', 'Byron Wagner', 'wagne641r@byron.com', '(709)-680-2354', '6657 Northaven Rd', '1997-09-01', 'Male', 13000000),
('ST009', 'Erin Menlora', 'erin.menlora@loralei.com', '(305)-899-7128', '992 Parker Rd', '1992-04-01', 'Female', 1100000),
('ST010', 'Christina Jenkins', 'jenkinschristina20@jnc.com', '(002)-160-9139', '7537 N Stelling Rd', '1991-07-20', 'Female', 3500000),
('ST011', 'Gregory Vasquez', 'gregory.vasquez1@vasque.com', '(661)-308-6812', '783 Groveland Terrace', '1995-10-29', 'Male', 15500000),
('ST012', 'CoreySilva', 'coreysilva012@silver.com', '(045)-105-8317', '9750 Hunters Creek Dr', '1999-05-30', 'Male', 8000000),
('ST013', 'Clifford Young', 'clifford.young@ialo.com', '(100)-652-0421', '2320 Central St', '1997-09-26', 'Male', 8500000),
('ST014', 'Erin Menlora', 'erin.menlora@loralei.com', '(305)-899-7128', '992 Parker Rd', '1992-04-09', 'Female', 12000000),
('ST015', 'Christina Jenkins', 'jenkinschristina20@jnc.com', '(002)-160-9139', '7537 N Stelling Rd', '1991-07-13', 'Female', 700000)


CREATE TABLE Customer (
	CustomerID CHAR(5) PRIMARY KEY CHECK(CustomerID LIKE 'CU[0-9][0-9][0-9]'),
	CustomerName VARCHAR(50) NOT NULL,
	CustomerPhoneNumber VARCHAR(20) NOT NULL,
	CustomerAddress VARCHAR(50) NOT NULL,
	CustomerGender VARCHAR(10) CHECK(CustomerGender IN ('Male', 'Female')) NOT NULL,
	CustomerEmail VARCHAR(50) NOT NULL,
	CustomerDOB DATE NOT NULL
)

INSERT INTO Customer VALUES 
('CU001', 'Dirk Titterell', '(252) 459-8750', '74 Melvin Point', 'Male','dtitterell0@yellowpages.com', '1990-10-29'),
('CU002', 'Dukey Diano', '(937) 981-7356', '92 Sugar Alley', 'Male','ddiano1@state.com', '1998-09-27'),
('CU003', 'Alex Meekins', '(401) 397-3408', '577 Dovetail Park', 'Male', 'ameekins2@blogs.com', '1991-11-06'),
('CU004', 'Cherice Jermey', '(503) 663-0388', '811 Debs Street', 'Female', 'cjermey3@guardian.com', '1985-05-18'),
('CU005', 'Ingamar Carlin', '(404) 361-8988', '389 Surrey Pass', 'Male', 'icarlin4@shareasale.com', '1990-08-08'),
('CU006', 'Pooh McCutcheon', '(251) 645-8047', '7 Melby Trail', 'Male', 'pmccutcheon5@salon.com', '1990-08-03'),
('CU007', 'Silvain Jozsa', '(406) 488-8277', '19269 Maryland Hill', 'Female', 'sjozsa6@omniture.com', '2000-12-30'),
('CU008', 'Javier Drewson', '(952) 938-8137', '8 Moulton Point', 'Female', 'jdrewson7@home.com', '2000-08-20'),
('CU009', 'Wilbur Francino', '(870) 364-9839', '21840 Golden Leaf Avenue', 'Female', 'wfrancino8@wunderground.com', '1999-10-06'),
('CU010', 'Sadie Snow', '(712) 243-2367', '70 Eagle Crest Hill', 'Female', 'ssnow9@github.com', '1992-04-25'),
('CU011', 'Sofie Carmen', '(606) 738-6361', '20196 Springview Plaza', 'Female', 'scarmena@gov.com', '1992-11-20'),
('CU012', 'Amy Grenkov', '(706) 557-7395', '2263 Weeping Birch Center', 'Male', 'agrenkovb@aol.com', '1996-06-06'),
('CU013', 'Gabriela Scarf', '(443) 402-0464', '920 Bobwhite Trail', 'Female', 'gscarfc@skype.com', '1992-03-12'),
('CU014', 'Westley Boram', '(731) 641-0714', '47 Darwin Terrace', 'Female', 'wboramd@sun.com', '1999-09-03'),
('CU015', 'Hadleigh Playfoot', '(845) 255-7111', '49 6th Junction', 'Female', 'hplayfoote@msu.com', '2000-04-14')

CREATE TABLE Vendor (
	VendorID CHAR(5) PRIMARY KEY CHECK(VendorID LIKE 'VE[0-9][0-9][0-9]'),
	VendorName VARCHAR(50) NOT NULL,
	VendorPhone VARCHAR(20) NOT NULL,
	VendorAddress VARCHAR(50) NOT NULL CHECK(LEN(VendorAddress) > 10),
	VendorEmail VARCHAR(50) NOT NULL CHECK (VendorEmail LIKE '%@%')
)

INSERT INTO Vendor VALUES 
('VE001', 'Ginger Ray', '(662) 843-6993', '0975 Forest Dale Trail', 'toys@treehouse.com'),
('VE002', 'Ulva Sowle', '(580) 475-0819', '2 Grayhawk Parkway', 'toyagator@makers.com'),
('VE003', 'Roy Tillman', '(618) 654-6707', '905 Goodland Lane', 'toytempt@tions.com'),
('VE004', 'Stuart Waters', '(641) 447-2269', '51745 Bowman Hill', 'playcastle@builders.com'),
('VE005', 'Ike Hayward', '(801) 294-2435', '848 New Castle Center', 'toycre@tivity.com'),
('VE006', 'Vera Norris', '(573) 248-8018', '3455 Village Green Court', 'creativecarpenters@work.com'),
('VE007', 'Kara Kinnsman', '(207) 696-4213', '772 Goodland Park', 'enlightenkids@outlook.com'),
('VE008', 'Winona Harding', '(419) 371-2136', '1 Merchant Street', 'stc@north.com'),
('VE009', 'Cecil Baldwin', '(914) 941-4187', '31718 Toban Point', 'toyterminal@term.com'),
('VE010', 'Lawrence Boyd', '(540) 943-0960', '936 Lyons Plaza', 'elements@play.com'),
('VE011', 'Chelsea Rowse', '(779) 210-7747', '10787 School Drive', 'brain@gym.com'),
('VE012', 'Alice Howell', '(317) 535-1680', '8 Lien Junction', 'kidpalace@create.com'),
('VE013', 'Wilmot Newman', '(412) 521-0705', '4 Dapin Avenue', 'daydreamers@dream.com'),
('VE014', 'Sandra Walters', '(901) 590-3745', '2 Veith Terrace', 'toyventures@local.com'),
('VE015', 'Sarah Ortega', '(708) 201-7702', '2 Hermina Park', 'myriad@mrd.com')

CREATE TABLE BionicType (
	BionicTypeID CHAR(5) PRIMARY KEY CHECK (BionicTypeID LIKE 'TY[0-9][0-9][0-9]'),
	BionicTypeName VARCHAR(10) CHECK (BionicTypeName IN ('Hand','Foot','Leg','Arm', 'Eye')),
	BionicTypeDurability NUMERIC(10,0) CHECK (BionicTypeDurability BETWEEN 50 AND 100)
)

INSERT INTO BionicType VALUES
('TY001', 'Hand', 69),
('TY002', 'Arm', 98),
('TY003', 'Foot', 72),
('TY004', 'Leg', 89),
('TY005', 'Eye', 75),
('TY006', 'Hand', 93),
('TY007', 'Arm', 57),
('TY008', 'Foot', 63),
('TY009', 'Leg', 52),
('TY010', 'Eye', 77),
('TY011', 'Hand', 62),
('TY012', 'Arm', 90),
('TY013', 'Foot', 81),
('TY014', 'Leg', 50),
('TY015', 'Eye', 100)

CREATE TABLE Bionic (
	BionicID CHAR(5) PRIMARY KEY CHECK (BionicID LIKE 'BI[0-9][0-9][0-9]'),
	BionicTypeID CHAR(5) FOREIGN KEY REFERENCES BionicType(BionicTypeID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	BionicName VARCHAR(50) NOT NULL,
	BionicStock NUMERIC(10,0) NOT NULL,
	BionicLaunchDate DATE NOT NULL,
	BionicPrice NUMERIC(10,0) NOT NULL
)

INSERT INTO Bionic VALUES 
('BI001', 'TY005', 'Vufom', 61, '2010-02-25',12000),
('BI002', 'TY004', 'Vufom', 73, '2010-03-29', 29000),
('BI003', 'TY003', 'Vufom', 36, '2010-09-03', 15500),
('BI004', 'TY004', 'Enum', 64, '2011-08-01', 33000),
('BI005', 'TY002', 'Vufom', 94, '2011-03-07', 17000),
('BI006', 'TY001', 'Vufom', 79, '2011-04-02', 10500),
('BI007', 'TY006', 'Ladhis', 52, '2012-06-08', 32500),
('BI008', 'TY009', 'Tivuttis', 82, '2012-11-20', 45500),
('BI009', 'TY008', 'Tivuttis', 91, '2012-03-31', 23500),
('BI010', 'TY009', 'Ladhis', 58, '2013-04-25', 21500),
('BI011', 'TY001', 'Mewkotta', 86,'2013-10-30', 28500),
('BI012', 'TY013', 'Mewkotta', 57,'2013-03-23', 31000),
('BI013', 'TY005', 'Aingok', 100, '2014-04-17', 11500),
('BI014', 'TY007', 'Lhawo', 68, '2014-06-01', 34500),
('BI015', 'TY002', 'Lhavis', 50, '2014-07-17', 40500)

CREATE TABLE [Sales Header] (
	SalesID CHAR(5) PRIMARY KEY CHECK (SalesID LIKE 'SA[0-9][0-9][0-9]'),
	StaffID CHAR(5) FOREIGN KEY REFERENCES Staff(StaffID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	CustomerID CHAR(5) FOREIGN KEY REFERENCES Customer(CustomerID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	TransactionDate DATE NOT NULL
)

INSERT INTO [Sales Header] VALUES
('SA001', 'ST002', 'CU004', '2015-04-02'),
('SA002', 'ST013', 'CU015', '2015-04-08'),
('SA003', 'ST009', 'CU013', '2017-11-20'),
('SA004', 'ST005', 'CU007', '2018-05-02'),
('SA005', 'ST003', 'CU001', '2018-05-04'),
('SA006', 'ST006', 'CU001', '2018-10-31'),
('SA007', 'ST002', 'CU004', '2019-04-18'),
('SA008', 'ST013', 'CU015', '2019-07-12'),
('SA009', 'ST010', 'CU012', '2020-11-11'),
('SA010', 'ST009', 'CU010', '2021-04-28'),
('SA011', 'ST001', 'CU001', '2020-06-22'),
('SA012', 'ST002', 'CU009', '2020-06-13'),
('SA013', 'ST013', 'CU008', '2021-03-18'),
('SA014', 'ST006', 'CU001', '2020-08-22'),
('SA015', 'ST003', 'CU004', '2020-05-31')

CREATE TABLE [Purchase Header] (
	PurchaseID CHAR(5) PRIMARY KEY CHECK (PurchaseID LIKE 'PU[0-9][0-9][0-9]'),
	StaffID CHAR(5) FOREIGN KEY REFERENCES Staff(StaffID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	VendorID CHAR(5) FOREIGN KEY REFERENCES Vendor(VendorID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	TransactionDate DATE NOT NULL
)

INSERT INTO [Purchase Header] VALUES
('PU001', 'ST007', 'VE003', '2016-01-15'),
('PU002', 'ST011', 'VE003', '2016-05-05'),
('PU003', 'ST010', 'VE012', '2016-05-19'),
('PU004', 'ST005', 'VE005', '2016-09-01'),
('PU005', 'ST006', 'VE011', '2017-01-17'),
('PU006', 'ST001', 'VE001', '2018-02-19'),
('PU007', 'ST012', 'VE009', '2018-04-18'),
('PU008', 'ST015', 'VE008', '2018-08-14'),
('PU009', 'ST003', 'VE013', '2018-11-19'),
('PU010', 'ST007', 'VE015', '2019-10-31'),
('PU011', 'ST001', 'VE012', '2020-10-13'),
('PU012', 'ST005', 'VE005', '2021-02-19'),
('PU013', 'ST006', 'VE011', '2021-01-01'),
('PU014', 'ST015', 'VE007', '2020-06-04'),
('PU015', 'ST003', 'VE001', '2020-07-28')

CREATE TABLE [Purchase Details] (
	PurchaseID CHAR(5) FOREIGN KEY REFERENCES [Purchase Header](PurchaseID) ON 
	UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	BionicID CHAR(5) FOREIGN KEY REFERENCES Bionic(BionicID) ON 
	UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	Quantity NUMERIC(10,0) CHECK(Quantity > 0) NOT NULL
)

INSERT INTO [Purchase Details] VALUES
('PU001', 'BI004', 3),
('PU001', 'BI013', 130),
('PU002', 'BI014', 27),
('PU002', 'BI010', 2),
('PU003', 'BI005', 26),
('PU003', 'BI002', 21),
('PU004', 'BI010', 9),
('PU004', 'BI004', 15),
('PU005', 'BI013', 92),
('PU005', 'BI014', 8),
('PU006', 'BI012', 5),
('PU006', 'BI009', 24),
('PU007', 'BI015', 26),
('PU007', 'BI004', 16),
('PU008', 'BI007', 67),
('PU008', 'BI013', 10),
('PU009', 'BI002', 47),
('PU009', 'BI005', 90),
('PU010', 'BI014', 107),
('PU010', 'BI001', 69),
('PU011', 'BI014', 21),
('PU011', 'BI003', 28),
('PU012', 'BI015', 42),
('PU012', 'BI002', 90),
('PU013', 'BI011', 92),
('PU013', 'BI015', 290),
('PU014', 'BI006', 40),
('PU014', 'BI012', 23),
('PU015', 'BI015', 27),
('PU015', 'BI007', 72)

CREATE TABLE [Sales Details] (
	SalesID CHAR(5) FOREIGN KEY REFERENCES [Sales Header](SalesID) ON
	UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	BionicID CHAR(5) FOREIGN KEY REFERENCES Bionic(BionicID) ON 
	UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	Quantity NUMERIC(10,0) CHECK(Quantity > 0) NOT NULL,
)

INSERT INTO [Sales Details] VALUES
('SA001', 'BI011', 9),
('SA001', 'BI015', 2),
('SA002', 'BI006', 4),
('SA002', 'BI012', 23),
('SA003', 'BI015', 27),
('SA003', 'BI007', 2),
('SA004', 'BI014', 27),
('SA004', 'BI001', 6),
('SA005', 'BI014', 21),
('SA005', 'BI003', 28),
('SA006', 'BI015', 4),
('SA006', 'BI002', 9),
('SA007', 'BI015', 26),
('SA007', 'BI004', 16),
('SA008', 'BI007', 17),
('SA008', 'BI005', 20),
('SA009', 'BI002', 17),
('SA009', 'BI005', 20),
('SA010', 'BI010', 9),
('SA010', 'BI004', 15),
('SA011', 'BI012', 14),
('SA011', 'BI014', 8),
('SA012', 'BI015', 5),
('SA012', 'BI009', 24),
('SA013', 'BI004', 3),
('SA013', 'BI005', 26),
('SA014', 'BI014', 27),
('SA014', 'BI010', 2),
('SA015', 'BI005', 26),
('SA015', 'BI002', 21)