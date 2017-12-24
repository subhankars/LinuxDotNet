-- Create database
IF  NOT EXISTS (SELECT * FROM sys.databases WHERE name = N'LinuxDotNet')
    BEGIN
        CREATE DATABASE LinuxDotNet
END;
-- Use the created database to create tables
USE [LinuxDotNet]
IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[Customer]') AND type in (N'U'))
BEGIN	
	CREATE TABLE Customer (
    ID int identity primary key, 
    FirstName varchar(50),
    LastName varchar(50),
    Email varchar(100),
    Age   int
);

END

-- Insert Sample data
TRUNCATE TABLE Customer
Insert INTO Customer Values('John', 'Doe', 'johndoe@email.com',45),('Mike', 'Penn', 'mikepen@email.com',34),('Walter', 'Mar', 'walter@email.com',32),('Suzan', 'J', 'suzi@email.com',56),('Kyle', 'Day', 'kday@email.com',27);
