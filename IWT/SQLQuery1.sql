
--Create Database
CREATE DATABASE ONLINE_AUCTION_SYSTEM;
USE ONLINE_AUCTION_SYSTEM;

--CREATE TABLES

--System table
/*CREATE TABLE AuctionSystem(
	ASID CHAR(4) NOT NULL PRIMARY KEY,  
	Email VARCHAR(50) NOT NULL,
	Address VARCHAR(20) NOT NULL,
	Information VARCHAR(500) NOT NULL,
);

--System phone book
CREATE TABLE SystemPhoneBook (
	ASID CHAR(4) NOT NULL FOREIGN KEY REFERENCES AuctionSystem (ASID),
	ContactNumber VARCHAR(13) NOT NULL PRIMARY KEY,
);*/


--Admin table
CREATE TABLE Admin (
	AID CHAR(4) NOT NULL PRIMARY KEY, 
	Full_Name VARCHAR(20) NOT NULL,
	Email VARCHAR (30)NOT NULL,
	Username VARCHAR(20) NOT NULL,
	Password VARCHAR(8) NOT NULL
);

--SELLER
--Seller Table
CREATE TABLE Seller (
	SID CHAR(4) NOT NULL PRIMARY KEY,  
	First_Name VARCHAR(20) NOT NULL,
	Last_Name VARCHAR(20) NOT NULL,
	Email VARCHAR(50) NOT NULL,
	Country VARCHAR(20) NOT NULL,
	Username VARCHAR(20) NOT NULL,
	Password VARCHAR(8) NOT NULL,
	Comment VARCHAR(100) 
);

--Seller Phone Book
CREATE TABLE SellerPhoneBook (
	SID CHAR(4) NOT NULL FOREIGN KEY REFERENCES Seller (SID),
	Contact_Number INT NOT NULL PRIMARY KEY,
);

--Seller Problem
CREATE TABLE SellerProblem (
	SID CHAR(4) NOT NULL FOREIGN KEY REFERENCES Seller (SID),
	Problem VARCHAR(100) NOT NULL PRIMARY KEY,
	AID CHAR(4) NOT NULL FOREIGN KEY REFERENCES Admin (AID),
);

--Seller-Solve Problems
CREATE TABLE SellerSolveProblem (
	SID CHAR(4) NOT NULL FOREIGN KEY REFERENCES Seller (SID),
	Solution VARCHAR(100) NOT NULL PRIMARY KEY,
	AID CHAR(4) NOT NULL FOREIGN KEY REFERENCES Admin (AID),
);

--End of Seller Section

--BUYER
--Buyer Table (
CREATE TABLE Buyer(
	BID CHAR(4) NOT NULL PRIMARY KEY,  
	First_Name VARCHAR(20) NOT NULL,
	Last_Name VARCHAR(20) NOT NULL,
	Email VARCHAR(50) NOT NULL,
	Country VARCHAR(20) NOT NULL,
	City VARCHAR(20) NOT NULL,
	State VARCHAR(20) NOT NULL,
	Postal_Code VARCHAR(20) NOT NULL,
	Username VARCHAR(20) NOT NULL,
	Password VARCHAR(8) NOT NULL,
	Comment VARCHAR(100)
);

--Buyer Phone Book
CREATE TABLE BuyerPhoneBook (
	BID CHAR(4) NOT NULL FOREIGN KEY REFERENCES Buyer (BID),
	Contact_Number INT NOT NULL PRIMARY KEY
);

--Buyer Problem
CREATE TABLE BuyerProblem (
	BID CHAR(4) NOT NULL FOREIGN KEY REFERENCES Buyer (BID),
	Problem VARCHAR(100) NOT NULL PRIMARY KEY,
	AID CHAR(4) NOT NULL FOREIGN KEY REFERENCES Admin (AID),
);

--Buyer - solve problems
CREATE TABLE BuyerSolveProblem (
	BID CHAR(4) NOT NULL FOREIGN KEY REFERENCES Buyer (BID),
	Solution VARCHAR(100) NOT NULL,
	AID CHAR(4) NOT NULL FOREIGN KEY REFERENCES Admin (AID),
);

--End of Buyer Section


--Item Table (
CREATE TABLE Item (
	IID CHAR(4) NOT NULL PRIMARY KEY,  
	Item_Name VARCHAR(20) NOT NULL,
	Start_Time DATETIME NOT NULL,
	End_Time DATETIME NOT NULL,
	Starting_Price FLOAT NOT NULL,
	Description VARCHAR(300) NOT NULL,
	SID CHAR(4) NOT NULL FOREIGN KEY REFERENCES Seller (SID),
);

--Category Table
CREATE TABLE Category (
	CID CHAR(4) NOT NULL PRIMARY KEY,  
	Category_Name VARCHAR(20) NOT NULL,
	CONSTRAINT CHK_Category CHECK (Category_Name='Jewellery' OR Category_Name='Kitchen' OR Category_Name='Electronic' OR Category_Name='Other')
);

--Item_Category Table
CREATE TABLE Item_Category (
	CID CHAR(4) NOT NULL, 
	IID CHAR(4) NOT NULL,
	CONSTRAINT PK_Item_Category PRIMARY KEY (IID,CID)
);

--Bid Table
CREATE TABLE Bid (
	BID CHAR(4) NOT NULL PRIMARY KEY,   
	Bid_Amount FLOAT NOT NULL,
	Bid_Time DATE NOT NULL,
	Win_Status VARCHAR (5) NOT NULL,
	IID CHAR(4) NOT NULL FOREIGN KEY REFERENCES Item (IID),
	CONSTRAINT CHK_Bid CHECK (Win_Status='Yes' OR Win_Status='No')
);

--Buy Table
CREATE TABLE Buy (
	BID CHAR(4) NOT NULL PRIMARY KEY,  
	Account_No INT NOT NULL,
	Payment_Method VARCHAR(20) NOT NULL,
	IID CHAR(4) NOT NULL FOREIGN KEY REFERENCES Item (IID),
	CONSTRAINT CHK_Buy CHECK (Payment_Method='Credit Card' OR Payment_Method='Debit Card' OR Payment_Method='Pay Pal')
); 


--DATA INSERT
--Admin (AID, Full_Name, Username, Password)
INSERT INTO Admin VALUES ('A001' , 'Harry Potter' , 'harrypotter@gmail.com' , 'hrry2082' , 'jinny786');
INSERT INTO Admin VALUES ('A002' , 'Ron Weasley' , 'ronweasley@gmail.com' , 'ronn5412' , 'hermo898');

--Seller (SID, First_Name, Last_Name, Email, Country, Username, Password)
INSERT INTO Seller VALUES ('S001' , 'Zayan' , 'Malik' , 'zayanmalik@gmail.com' , 'England' , 'zayn9312' , '1DzainM' , 'I think you did a great job');
INSERT INTO Seller VALUES ('S002' , 'Anna' , 'Scott' , 'annascott@gmail.com' , 'America' , 'anna9718' , 'Afancott' , NULL);
INSERT INTO Seller VALUES ('S003' , 'Hemal' , 'Ranasinghe' , 'hemalranasinghe@gmail.com' , 'Sri Lanka' , 'hema8425' , 'Prverana' , 'SUPERB...!!');
INSERT INTO Seller VALUES ('S004' , 'Priyanka' , 'Chopra' , 'priyankachopra@gmail.com' , 'India' , 'priy8218' , 'Siddchop' , NULL);
INSERT INTO Seller VALUES ('S005' , 'Lee' , 'Seungi' , 'leeseungi@gmail.com' , 'South Korea' , 'damwo8713' , 'kanchi90' , 'goooooood');

--Seller phone book (SID, Contact_Number)
INSERT INTO SellerPhoneBook VALUES ('S001' , 0754521789);
INSERT INTO SellerPhoneBook VALUES ('S002' , 0704542582);
INSERT INTO SellerPhoneBook VALUES ('S002' , 0114524554);
INSERT INTO SellerPhoneBook VALUES ('S003' , 0774521789);
INSERT INTO SellerPhoneBook VALUES ('S004' , 0764521789);
INSERT INTO SellerPhoneBook VALUES ('S004' , 0115254654);
INSERT INTO SellerPhoneBook VALUES ('S004' , 0704554559);
INSERT INTO SellerPhoneBook VALUES ('S005' , 0777775252);

--Seller Problem
INSERT INTO SellerProblem VALUES ('S001' , 'Hidden Item Details' , 'A001');
INSERT INTO SellerProblem VALUES ('S002' , 'Add items again' , 'A002');

--Seller - solve problems
INSERT INTO SellerSolveProblem VALUES ('S001' , 'I will fixed it' , 'A001');
INSERT INTO SellerSolveProblem VALUES ('S002' , 'Now it is okay' , 'A002');

--BUYER

--Buyer (BID, First_Name, Last_Name, Email, Country, City, State, Postal_Code, Username, Password)
INSERT INTO Buyer VALUES ('B001' , 'Jughead' , 'Jones' , 'jugheadjones@gmail.com' , 'England' , 'London', 'Islington' , 'E1 6AN' , 'jonh9312' , '1jhgfnM' , NULL);
INSERT INTO Buyer VALUES ('B002' , 'Archie' , 'Andrews' , 'archieandrews@gmail.com' , 'America' , 'New York', 'Ohio' , '30303' , 'sfsf9718' , 'oiuytfgh' , 'Interesting Items');
INSERT INTO Buyer VALUES ('B003' , 'Betty' , 'Scooper' , 'bettyscooper@gmail.com' , 'Russia' , 'Moscow', 'Chechnya' , '101000' , 'fjdk8425' , '09iuhgth' , NULL);
INSERT INTO Buyer VALUES ('B004' , 'Cheryl' , 'Blossom' , 'cherylblossom@gmail.com' , 'Japan' , 'Okazaki', 'Akita' , '63-8001' , 'lssj8218' , '5252lkjh' , 'Slowwwww');
INSERT INTO Buyer VALUES ('B005' , 'Veronica' , 'Lodge' , 'veronicalodge@gmail.com' , 'China' , 'Beijing', 'autonomous' , '10-1000' , 'lkjg8713' , '56ty67gh' , NULL);
INSERT INTO Buyer VALUES ('B006' , 'Kevin' , 'Keller' , 'kevinkeeler@gmail.com' , 'India' , 'Bihar', 'Panjabi' , '56001' , 'lmnh8713' , 'lp09kjui' , 'Easy to Use');

--Buyer phone book (BID, Contact_Number)
INSERT INTO BuyerPhoneBook VALUES ('B001' , 0754521789);
INSERT INTO BuyerPhoneBook VALUES ('B002' , 0114542582);
INSERT INTO BuyerPhoneBook VALUES ('B003' , 0114524554);
INSERT INTO BuyerPhoneBook VALUES ('B003' , 0774521789);
INSERT INTO BuyerPhoneBook VALUES ('B004' , 0764521789);
INSERT INTO BuyerPhoneBook VALUES ('B004' , 0115254654);
INSERT INTO BuyerPhoneBook VALUES ('B005' , 0714554559);
INSERT INTO BuyerPhoneBook VALUES ('B005' , 0117775252);
INSERT INTO BuyerPhoneBook VALUES ('B006' , 0767754452);

--Buyer Problem
INSERT INTO BuyerProblem VALUES ('B001' , 'How to delete account' , 'A001');
INSERT INTO BuyerProblem VALUES ('B003' , 'I want to reset my password' , 'A002');

--Buyer Solve Problem
INSERT INTO BuyerSolveProblem VALUES ('B001' , 'From settings' , 'A001');
INSERT INTO BuyerSolveProblem VALUES ('B003' , 'please go to the settings' , 'A002');

--Item (IID, Item_Name, Start_Time, End_time, Starting_Price, Description, SID)
INSERT INTO Item VALUES ('I001' , 'Blender' , '01-01-2020 1:10:00 PM' , '12-31-2020 6:10:00 AM' , 10000.00 , 'Multitask' , 'S001');
INSERT INTO Item VALUES ('I002' , 'Pen Drive' , '01-01-2020 6:10:00 PM' , '12-31-2020 6:10:00 AM' , 2500.00 , 'easy to use' , 'S002');
INSERT INTO Item VALUES ('I003' , 'Ring' , '01-01-2020 6:10:00 PM' , '10-31-2020 6:10:00 AM' , 5800.00 , 'Made by gemstone' , 'S003');
INSERT INTO Item VALUES ('I004' , 'Dish Holder' , '01-11-2020 2:10:00 PM' , '12-25-2020 1:10:00 AM' , 5000.00 , 'easy to handle' , 'S004');
INSERT INTO Item VALUES ('I005' , 'Cloth rack' , '01-01-2020 6:10:00 PM' , '12-31-2020 8:10:00 AM' , 6000.00 ,  'It can use indoor also' , 'S005');
INSERT INTO Item VALUES ('I006' , 'Necklace' , '01-01-2020 6:10:00 PM' , '12-31-2020 6:10:00 AM' , 12000.00 , 'made by original gold' , 'S001');
INSERT INTO Item VALUES ('I007' , 'Water Bottle' , '01-01-2020 6:10:00 PM' , '12-31-2020 6:10:00 AM' , 500.00 ,  'convenient and safe' , 'S002');
INSERT INTO Item VALUES ('I008' , 'Laptop' , '01-01-2020 6:10:00 PM' , '12-24-2020 6:10:00 AM' , 150000.00 , '4GB RAM, 1TB HDD' , 'S003');
INSERT INTO Item VALUES ('I009' , 'Shoe Polish' , '01-01-2020 6:10:00 PM' , '05-31-2020 6:10:00 AM' , 200.00 , 'Original one' , 'S004');
INSERT INTO Item VALUES ('I010' , 'Spoon Set' , '01-01-2020 6:10:00 PM' , '10-11-2020 2:10:00 AM' , 2000.00 , 'made by aluminium' , 'S005');
INSERT INTO Item VALUES ('I011' , 'Earring' , '01-01-2020 6:10:00 PM' , '12-31-2020 6:10:00 AM' , 1800.00 ,  'Made by stone' , 'S001');
INSERT INTO Item VALUES ('I012' , 'Play Station' , '01-06-2019 6:10:00 PM' , '12-31-2020 6:10:00 AM' , 200000.00 , '60GB hard disk' , 'S002');

--Category (CID, Category_Name, IID)
INSERT INTO Category VALUES ('C001' , 'Kitchen');
INSERT INTO Category VALUES ('C002' , 'Electronic');
INSERT INTO Category VALUES ('C003' , 'Jewellery');
INSERT INTO Category VALUES ('C004' , 'Other');

--Item_Category (CID, IID)
INSERT INTO Item_Category VALUES ('C001' , 'I001'); 
INSERT INTO Item_Category VALUES ('C001' , 'I004'); 
INSERT INTO Item_Category VALUES ('C001' , 'I010'); 
INSERT INTO Item_Category VALUES ('C002' , 'I002'); 
INSERT INTO Item_Category VALUES ('C002' , 'I008'); 
INSERT INTO Item_Category VALUES ('C002' , 'I012'); 
INSERT INTO Item_Category VALUES ('C003' , 'I003'); 
INSERT INTO Item_Category VALUES ('C003' , 'I006'); 
INSERT INTO Item_Category VALUES ('C003' , 'I011'); 
INSERT INTO Item_Category VALUES ('C004' , 'I005'); 
INSERT INTO Item_Category VALUES ('C004' , 'I007'); 
INSERT INTO Item_Category VALUES ('C004' , 'I009');  

--Bid(BID, Bid_Amount, Bit_Time, Win_Status, IID)
INSERT INTO Bid VALUES ('B001', 20000.00 , '2020-10-24' , 'Yes' , 'I001'); 
INSERT INTO Bid VALUES ('B002', 3500.00 , '2020-09-30' , 'No' , 'I002');
INSERT INTO Bid VALUES ('B003', 15000.00 , '2020-09-23' , 'Yes' , 'I006');
INSERT INTO Bid VALUES ('B004', 300000.00 , '2020-10-20' , 'No' , 'I008');
INSERT INTO Bid VALUES ('B005', 2500.00 , '2020-10-25' , 'Yes' , 'I011');
INSERT INTO Bid VALUES ('B006', 350000.00 , '2020-10-11' , 'No' , 'I012');

--Buy (BID, Account_No, Payment_method IID)
INSERT INTO Buy VALUES ('B001' , 1245341419 , 'Credit Card' , 'I003');
INSERT INTO Buy VALUES ('B003' , 1521688975 , 'Debit Card' , 'I005');
INSERT INTO Buy VALUES ('B005' , 1371465865 , 'Pay Pal' , 'I004');


--FINAL TABLES
--Seller Table
SELECT Seller.* , SellerPhoneBook.Contact_Number 
FROM Seller , SellerPhoneBook
WHERE Seller.SID = SellerPhoneBook.SID 
ORDER BY Seller.SID;

--Seller Problem and Problem Solve Table
SELECT SellerProblem.*  , SellerSolveProblem.Solution
FROM SellerProblem, SellerSolveProblem
Where SellerProblem.SID = SellerSolveProblem.SID

--Buyer Table
SELECT Buyer.* , BuyerPhoneBook.Contact_Number 
FROM Buyer , BuyerPhoneBook
WHERE Buyer.BID = BuyerPhoneBook.BID 
ORDER BY Buyer.BID;

--Buyer Problem and Problem Solve Table
SELECT BuyerProblem.* , BuyerSolveProblem.Solution
FROM BuyerProblem, BuyerSolveProblem
Where BuyerProblem.BID = BuyerSolveProblem.BID;

--Item Table
SELECT * 
FROM Item;

--Category Table
SELECT Item_Category.* , Item.Item_Name
FROM Item ,Item_Category
WHERE Item.IID = Item_Category.IID 
ORDER BY Item.IID ;

--Bid_Buy Table
SELECT *
FROM Bid;

--Buy Table
SELECT * 
FROM Buy;


