-- Create Database
CREATE DATABASE BankingSystem;
USE BankingSystem;

-- Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Address VARCHAR(255),
    Contact VARCHAR(15) UNIQUE NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    CHECK (CHAR_LENGTH(Contact) = 10) -- Ensuring Contact is 10 digits
);

DESC Customers;

-- Accounts Table
CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    AccountType ENUM('Savings', 'Checking', 'Business') NOT NULL,
    Balance DECIMAL(15,2) DEFAULT 0.00 CHECK (Balance >= 0), -- Ensuring non-negative balance
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE
);

DESC Accounts;

CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY AUTO_INCREMENT,
    AccountID INT,
    Amount DECIMAL(15,2) NOT NULL CHECK (Amount > 0), -- Ensuring positive transaction amount
    TransactionType ENUM('Deposit', 'Withdrawal', 'Transfer') NOT NULL,
    TransactionDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID) ON DELETE CASCADE
);

DESC Transactions;

CREATE TABLE Loans (
    LoanID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    LoanType ENUM('Home Loan', 'Car Loan', 'Personal Loan') NOT NULL,
    LoanAmount DECIMAL(15,2) NOT NULL CHECK (LoanAmount > 0),
    Status ENUM('Pending', 'Approved', 'Rejected') DEFAULT 'Pending',
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE
);

DESC Loans;

-- Employees Table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Position VARCHAR(50) NOT NULL,
    BranchID INT
);

DESC Employees;

-- Branches Table
CREATE TABLE Branches (
    BranchID INT PRIMARY KEY AUTO_INCREMENT,
    BranchName VARCHAR(100) NOT NULL,
    Location VARCHAR(255) NOT NULL
);

DESC Branches;

-- CRUD Operations

-- Insert Data into Customers Table
INSERT INTO Customers (Name, Address, Contact, Email) VALUES
('Dipali Mali', 'Nutan Colony,Dhule', '9421901604', 'dipalimali@gmail.com'),
('Lokesh Mali', 'Pachpawali Mata Temple,Dhule', '9876544220', 'lokeshm@gmail.com'),
('Sejal Badgujar', 'Ram Nagar,Kapadane', '9028988773', 'badgujarsejal@gmail.com'),
('Shubham Khalane', 'Katraj,Pune', '8010857275', 'shubhk@gmail.com'),
('Jagruti Desale', 'Amalner', '1020225478', 'jd@gmail.com');

SELECT * FROM Customers;

-- Insert Data into Accounts Table
INSERT INTO Accounts (CustomerID, AccountType, Balance) VALUES
(1, 'Savings', 50000.00),
(2, 'Checking', 15000.00),
(3, 'Business', 100000.00),
(4, 'Savings', 20000.00),
(5, 'Checking', 25000.00);

SELECT * FROM Accounts;

-- Insert Data into Transactions Table
INSERT INTO Transactions (AccountID, Amount, TransactionType) VALUES
(1, 5000.00, 'Deposit'),
(2, 3000.00, 'Withdrawal'),
(3, 10000.00, 'Deposit'),
(4, 2500.00, 'Withdrawal'),
(5, 5000.00, 'Deposit');

SELECT * FROM Transactions;

-- Insert Data into Loans Table
INSERT INTO Loans (CustomerID, LoanType, LoanAmount) VALUES
(1, 'Home Loan', 2500000.00),
(2, 'Car Loan', 500000.00),
(3, 'Personal Loan', 200000.00),
(4, 'Home Loan', 1800000.00),
(5, 'Car Loan', 400000.00);

SELECT * FROM Loans;

-- Insert Data into Employees Table
INSERT INTO Employees (Name, Position, BranchID) VALUES
('Rajesh Sharma', 'Manager', 1),
('Neha Patel', 'Clerk', 2),
('Amit Verma', 'Cashier', 3),
('Sonia Mehta', 'Loan Officer', 4),
('Rahul Joshi', 'Branch Head', 5);

SELECT * FROM Employees;

-- Insert Data into Branches Table
INSERT INTO Branches (BranchName, Location) VALUES
('Main Branch', 'Dhule'),
('West Branch', 'Pune'),
('South Branch', 'Mumbai'),
('East Branch', 'Nagpur'),
('North Branch', 'Nashik');

SELECT * FROM Branches;

-- Update Account Balance After a Deposit
UPDATE Accounts SET Balance = Balance + 2000 WHERE AccountID = 1;

-- Update Loan Status
UPDATE Loans SET Status = 'Approved' WHERE LoanID = 1;

-- Delete a Customer (Cascades to Accounts & Transactions)
DELETE FROM Customers WHERE CustomerID = 5;

-- Aggregate Function Queries

-- Total Balance in the Bank
SELECT SUM(Balance) AS TotalBankBalance FROM Accounts;

-- Average Account Balance by Account Type
SELECT AccountType, AVG(Balance) AS AverageBalance FROM Accounts GROUP BY AccountType;

-- Number of Customers in the Bank
SELECT COUNT(*) AS TotalCustomers FROM Customers;

-- Highest Transaction Amount
SELECT MAX(Amount) AS MaxTransaction FROM Transactions;

-- Lowest Transaction Amount
SELECT MIN(Amount) AS MinTransaction FROM Transactions;

-- Total Loan Amount Approved
SELECT SUM(LoanAmount) AS TotalApprovedLoans FROM Loans WHERE Status = 'Approved';

-- Count of Transactions per Type
SELECT TransactionType, COUNT(*) AS TotalTransactions FROM Transactions GROUP BY TransactionType;

-- Average Loan Amount per Loan Type
SELECT LoanType, AVG(LoanAmount) AS AvgLoanAmount FROM Loans GROUP BY LoanType;

-- Total Number of Employees in the Bank
SELECT COUNT(*) AS TotalEmployees FROM Employees;

-- Branch-wise Employee Count
SELECT BranchID, COUNT(*) AS EmployeesPerBranch FROM Employees GROUP BY BranchID;

