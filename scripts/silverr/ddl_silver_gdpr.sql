
/*
======================================================
DDL Script: Creating silver Tables - under GDPR
======================================================
Script Purpose: 
   This script creates tables in the 'silver' schema, dropping existing tables if they already exist. 
  run this script to re-define the DDL structure of 'silver' Tables

NOTE: This only creates a table for the sensitive GDPR COMPLIANT CLIENT DATA  
=======================================================
*/



IF OBJECT_ID('[HOPE_silver].[dpr]', 'U') IS NOT NULL
    DROP TABLE [HOPE_silver].[dpr];
GO


CREATE TABLE Hope_silver.dpr (
    [Person Id] INT,
    [First Name] NVARCHAR(MAX),
    [Last Name HCLIC A1.5] NVARCHAR(MAX),
    [NINO HCLIC A1.6] NVARCHAR(MAX),
    [Email Address] NVARCHAR(MAX),
    [Mobile Number] NVARCHAR(MAX),
    [Date of Birth HCLIC A1.3] DATE,
    [dwh_create_date],
);
GO
