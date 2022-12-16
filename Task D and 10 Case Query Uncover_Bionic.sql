-- Task D Simulate Transaction process for Sales and Purchase

-- Sales Transaction Simulation
-- Customer with ID CU013
-- Buys Bionic with ID BI012 only, and they buy 15 of that Bionic
-- Served by Staff with ID ST003
-- On 21st of December 2021, Sales ID SA031
INSERT INTO [Sales Header] VALUES
('SA031', 'ST003', 'CU013', '2021-12-21')

INSERT INTO [Sales Details] VALUES
('SA031', 'BI012', 15)

UPDATE Bionic
	SET BionicStock = BionicStock - 15
WHERE BionicID = 'BI012'

-- Purchase Transaction Simulation
-- Staff with ID ST012
-- Purchases Bionic with ID BI003 only, and they purchased 32 of that Bionic
-- From Vendor with ID VE011
-- On 12th of December 2021, Purchase ID PU031
INSERT INTO [Purchase Header] VALUES
('PU031', 'ST012', 'VE011', '2021-12-12')

INSERT INTO [Purchase Details] VALUES
('PU031', 'BI003', 32)

UPDATE Bionic
	SET BionicStock = BionicStock + 32
WHERE BionicID = 'BI003'

-- 10 Case Query Answer
--1
SELECT 
	StaffID,
	[Total Purchase] = SUM(BionicPrice * Quantity)
FROM [Purchase Header] ph
JOIN [Purchase Details] pd ON ph.PurchaseID = pd.PurchaseID
JOIN Bionic b ON b.BionicID = pd.BionicID
JOIN Vendor v ON v.VendorID = ph.VendorID
WHERE VendorName LIKE ('%Tillman')
GROUP BY StaffID, VendorName
HAVING SUM(BionicPrice * Quantity) > 1

--2
SELECT
	s.StaffID,
	StaffName,
	StaffSalary,
	[Total Bionic Sold] = SUM(Quantity)
FROM Staff s 
JOIN [Sales Header] sh ON s.StaffID = sh.StaffID
JOIN [Sales Details] sd ON sd.SalesID = sh.SalesID
JOIN Bionic b ON b.BionicID = sd.BionicID
WHERE StaffSalary BETWEEN 8000000 AND 10000000
GROUP BY s.StaffID, StaffName, StaffSalary
HAVING SUM(Quantity) > 10

--3 
SELECT 
	sh.SalesID,
	CustomerName,
	CustomerGender,
	[Total Quantity Purchased] = SUM(Quantity),
	[Total Bionic Purchased] = SUM(BionicPrice * Quantity),
	[Sales Date] =  CONVERT(VARCHAR, TransactionDate, 7)
FROM Customer c 
JOIN [Sales Header] sh ON sh.CustomerID = c.CustomerID
JOIN [Sales Details] sd ON sd.SalesID = sh.SalesID
JOIN Bionic b ON b.BionicID = sd.BionicID
WHERE CustomerGender LIKE ('Female') 
GROUP BY sh.CustomerID, CustomerName, CustomerGender, sh.SalesID, TransactionDate
HAVING SUM(Quantity) > 7

--4
SELECT
	PurchaseID,
	[Total Purchase Detail] = SUM(Quantity * BionicPrice),
	[Highest Bionic Price] = MAX(BionicPrice),
	[TypeName] = BionicTypeName
FROM [Purchase Details] pd
JOIN Bionic b ON pd.BionicID = b.BionicID
JOIN BionicType bt ON bt.BionicTypeID = b.BionicTypeID
WHERE BionicTypeName LIKE ('Hand') 
GROUP BY PurchaseID, BionicTypeName
HAVING SUM(Quantity * BionicPrice) > 1

--5
SELECT
	[Average Salary] = AVG(StaffSalary)
FROM Staff
-- Subquery for average staff salary

SELECT
	StaffName,
	StaffSalary,
	StaffGender,
	PurchaseDate = CONVERT(VARCHAR, TransactionDate, 7),
	VendorName
FROM Staff s 
JOIN [Purchase Header] ph ON ph.StaffID = s.StaffID
JOIN [Purchase Details] pd ON pd.PurchaseID = ph.PurchaseID
JOIN Vendor v ON v.VendorID = ph.VendorID,
(SELECT
	[Average Salary] = AVG(StaffSalary)
FROM Staff) AS Average
WHERE StaffSalary > Average.[Average Salary] AND YEAR(TransactionDate) = 2020
-- Main Query

--6
SELECT
	[Average total sold] = AVG(Quantity * BionicPrice)
FROM [Sales Details] sd 
JOIN Bionic b ON b.BionicID = sd.BionicID
-- Subquery for average total sold 

SELECT
	sh.SalesID,
	s.StaffID,
	StaffName,
	StaffSalary,
	StaffGender = LEFT(StaffGender,1),
	BionicName,
	[Total Sold Price] = SUM(Quantity * BionicPrice),
	[Sales Date] =  CONVERT(VARCHAR, TransactionDate, 6)
FROM [Sales Details] sd
JOIN [Sales Header] sh ON sh.SalesID = sd.SalesID
JOIN Staff s ON s.StaffID = sh.StaffID 
JOIN Bionic b ON b.BionicID = sd.BionicID, 
(SELECT
	[Average total sold] = AVG(Quantity * BionicPrice)
FROM [Sales Details] sd 
JOIN Bionic b ON b.BionicID = sd.BionicID) AS AverageSold
WHERE StaffSalary < 5000000
GROUP BY sh.SalesID, s.StaffID, StaffName, StaffSalary, StaffGender, BionicName, TransactionDate, AverageSold.[Average total sold]
HAVING SUM(Quantity * BionicPrice) > AverageSold.[Average total sold]
-- Main Query

--7
SELECT
	[Average Durability] = AVG(BionicTypeDurability)
FROM BionicType
-- Subquery for average durability

SELECT
	[SalesID] = REPLACE(sh.SalesID, 'SA', 'Sales'),
	[Sales Date] =  CONVERT(VARCHAR, TransactionDate, 7),
	[Total Quantity] = CONVERT(VARCHAR, SUM(Quantity)) + ' Pc(s)',
	BionicName,
	[TypeName] = BionicTypeName,
	[TypeDurability] = BionicTypeDurability
FROM [Sales Details] sd
JOIN Bionic b ON b.BionicID = sd.BionicID
JOIN BionicType bt ON bt.BionicTypeID = b.BionicTypeID
JOIN [Sales Header] sh ON sh.SalesID = sd.SalesID,
(SELECT
	[Average Durability] = AVG(BionicTypeDurability)
FROM BionicType) AS AvgDurability
WHERE YEAR(TransactionDate) > 2016 AND BionicTypeDurability > AvgDurability.[Average Durability]
GROUP BY sh.SalesID, TransactionDate, BionicName, BionicTypeName, BionicTypeDurability
-- Main Query

--8
SELECT
	[BionicID Stock] = BionicID,
	[Bionic Stock] = BionicStock
FROM Bionic b
JOIN BionicType bt ON bt.BionicTypeID = b.BionicTypeID
-- Subquery for current maximum stock

SELECT
	[VendorID] = REPLACE(ph.VendorID, 'VE', 'Vendor'),
	[Total Quantity] = CONVERT(VARCHAR, SUM(Quantity)) + ' Pc(s)',
	pd.BionicID,
	[TypeName] = BionicTypeName,
	[TypeDurability] = BionicTypeDurability,
	CurrentStock.[Bionic Stock]
FROM [Purchase Details] pd
JOIN [Purchase Header] ph ON ph.PurchaseID = pd.PurchaseID
JOIN Vendor v ON v.VendorID = ph.VendorID
JOIN Bionic b ON b.BionicID = pd.BionicID
JOIN BionicType bt ON bt.BionicTypeID = b.BionicTypeID,
(SELECT
	[BionicID Stock] = BionicID,
	[Bionic Stock] = BionicStock
FROM Bionic) AS CurrentStock
WHERE bt.BionicTypeName LIKE ('Eye') AND CurrentStock.[BionicID Stock] = pd.BionicID
GROUP BY ph.VendorID, pd.BionicID, bt.BionicTypeName, BionicTypeDurability, CurrentStock.[Bionic Stock]
HAVING SUM(Quantity) >= CurrentStock.[Bionic Stock]
-- Main Query

--9
CREATE VIEW LoyalCustomer AS
SELECT
	sh.CustomerID,
	CustomerName,
	CustomerGender,
	[Total Transaction] = COUNT(DISTINCT(sh.SalesID)),
	[Total Bionic Bought] = SUM(Quantity)
FROM Customer c 
JOIN [Sales Header] sh ON sh.CustomerID = c.CustomerID
JOIN [Sales Details] sd ON sd.SalesID = sh.SalesID
GROUP BY sh.CustomerID, CustomerName, CustomerGender
HAVING COUNT(DISTINCT(sh.SalesID)) > 1 AND SUM(Quantity) > 10

--10
CREATE VIEW StaffPurchaseRecap AS
SELECT
	ph.StaffID,
	StaffName,
	StaffSalary,
	[Total Purchase Finished] = COUNT(DISTINCT(ph.PurchaseID)),
	[Total Bionic Purchased] = SUM(Quantity)
FROM Staff s
JOIN [Purchase Header] ph ON ph.StaffID = s.StaffID
JOIN [Purchase Details] pd ON pd.PurchaseID = ph.PurchaseID
WHERE YEAR(TransactionDate) > 2016
GROUP BY ph.StaffID, StaffName, StaffSalary
HAVING COUNT(DISTINCT(ph.PurchaseID)) > 1