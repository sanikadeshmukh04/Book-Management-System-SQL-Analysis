# Book-Management-System-SQL-Analysis
A MySQL project that analyses a book database (books, users and ratings) to answer business questions about authors, publishers, readers and rating behaviour.

# Project Overview

The goal of this project is to explore a book-rating dataset using SQL and extract useful insights such as:

1.Which authors and publishers get the most ratings
2.Who the most engaged users are
3.Which countries have the most users
4.How book publishing changed over the years
5.Which books were never rated

# Repository Structure
book-management-sql/
│
├── book_management.sql   # All SQL queries
├── README.md             # Project documentation
└── data/                 # CSV files (optional)

# How to Run
1.Install MySQL and open MySQL Workbench (or any MySQL client).
2.Create the database and import the three CSV files (books, users, rating) using the Table Data Import Wizard.
3.Run the script:
CREATE DATABASE IF NOT EXISTS book_management;
USE book_management;
4.Open book_management.sql and execute the queries one by one.
