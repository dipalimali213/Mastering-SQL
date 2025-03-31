# 🏦 Banking System Database

## 📌 Overview
The **Banking System Database** is a robust and secure database system designed to handle core banking operations, including customer account management, transactions, loans, employees and branch operations. This project follows **SQL best practices** and includes features such as **data integrity, referential constraints and optimized query operations.**

---

## 🎯 Key Objectives
- ✅ **Centralized Customer Management** – Efficiently store and manage customer information.
- ✅ **Seamless Account Handling** – Handle multiple account types (Savings, Checking, Business).
- ✅ **Secure Transaction Processing** – Record and manage deposits, withdrawals, and transfers.
- ✅ **Automated Loan Management** – Process various loan types (Home Loan, Car Loan, Personal Loan).
- ✅ **Employee & Branch Management** – Monitor and control branch-level operations and workforce.
- ✅ **Data Integrity & Security** – Enforce constraints (Foreign Keys, Checks, Auto-increment).

---

## 🎁 Features & Functionalities

### 📇 **Customer Management**
- Add, update, and delete customer information.
- Ensure unique contact and email details.
- Enforce a 10-digit contact number constraint.

### 💰 **Account Handling**
- Create multiple account types: **Savings, Checking, and Business.**
- Maintain account balances with zero balance protection.
- Cascade deletion to handle customer and account relationships.

### 🔄 **Transaction Tracking**
- Record transaction types: **Deposits, Withdrawals, and Transfers.**
- Automatically timestamp each transaction.
- Prevent invalid transactions with amount constraints.

### 🏡 **Loan Processing**
- Handle multiple loan types with different interest rates.
- Track loan status (approved, pending, rejected).
- Maintain payment history and monitor defaults.

### 👩‍💼 **Employee & Branch Management**
- Store employee details and assign them to branches.
- Monitor employee roles and responsibilities.
- Manage branch operations and location details.

---

## 📂 Database Schema

### 🗂 **Tables & Relationships**
1. **Customers:** Stores customer information.
2. **Accounts:** Maintains account details, balance, and types.
3. **Transactions:** Records all financial transactions.
4. **Loans:** Manages loan details and repayment status.
5. **Employees:** Stores employee details.
6. **Branches:** Manages information about different branches.

---

## 🧠 Topics to Cover for a Comprehensive Banking System Database

### 📚 **Database Concepts**
- **Normalization:** Ensure the database is in 3NF (Third Normal Form) to remove redundancy and maintain data integrity.
- **Data Integrity:** Use `CHECK`, `NOT NULL`, `UNIQUE`, and `FOREIGN KEY` constraints to ensure data accuracy.
- **Referential Integrity:** Define `ON DELETE CASCADE` and `ON UPDATE CASCADE` for related tables.
- **Triggers & Stored Procedures:** Automate specific operations such as auditing transactions, calculating interest, and sending loan reminders.

---

### 📊 **Aggregate Functions & Queries**
Include queries that use aggregate functions such as:
- `SUM()` – Calculate total balance across all accounts.
- `AVG()` – Determine average balance per account type.
- `COUNT()` – Count the total number of customers and accounts.
- `MAX()` & `MIN()` – Find highest and lowest transaction amounts.
- `GROUP BY` – Group transactions and accounts by type.
- `HAVING` – Apply conditions to aggregated data.

