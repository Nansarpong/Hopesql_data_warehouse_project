/*
=============================================================
Create Hope Database and Schemas
=============================================================
Script Purpose:
    This script creates a new database named 'HOPEDataWarehouse' after checking if it already exists. 
    If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas 
    within the database: 'bronze', 'silver', and 'gold'.
	
WARNING:
    Running this script will drop the entire 'HOPEDataWarehouse' database if it exists. 
    All data in the database will be permanently deleted. Proceed with caution 
    and ensure you have proper backups before running this script.

Extra warning - please note for this project and because of security limitations we will be using an already created database (WCC_Reports_Live) that engineers at westminster can use 
to test create their pipelines. as such there are a few modifications you will see below on script blocked out and another script that i had to use due to the limitations of using 
the WCC_Reports_Live database.  
*/

/* 
-- this is the original script that i created which would work if  had access to the master database 
USE master;
GO

-- Drop and recreate the 'HOPEDataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'HOPEDataWarehouse')
BEGIN
    ALTER DATABASE HOPEDataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE HOPEDataWarehouse;
END;
GO

-- Create the 'HOPEDataWarehouse' database
CREATE DATABASE HOPEDataWarehouse;
GO

USE HOPEDataWarehouse;
GO
*/


-- this is the script to create the schemas in the (WCC_Reports_Live) database
-- Create Schemas
use WCC_Reports_Live;

Create Schema HOPE_Bronze;
GO
Create Schema HOPE_Silver;
GO
Create Schema HOPE_Gold;
GO
