/*
======================================================================
stored procedure: Load silver Layer gdpr ( Bronze - > Silver)
======================================================================
script purpose: 
  THIS STORED PROCEDURE performs the ETL (Extract, transformation, Load) process to populate the 'silver' gdpr schema tables from the 'bronze' schema'
 

Actions Performed:

- Truncate Silver tables.
- Inserts transformed and cleansed data from Bronze into Silver tables. 
- Free fields ommitted in silver_load. 
-only gdpr compliant fields are captured. 

Parameters: 
 None - this stored procedure does not accept any parameters or return any values. 

Use Example: 
 EXEC [HOPE_silver].load_silver_Hope_gdpr;

========================================================================
*/








 EXEC [HOPE_silver].load_silver_Hope_gdpr



CREATE OR ALTER PROCEDURE [HOPE_silver].load_silver_Hope_gdpr
 AS

BEGIN
    DECLARE @start_time DATETIME, @end_time DATETIME;
	BEGIN TRY
		PRINT '==============================================================';
		PRINT 'Loading silver Layer';
		PRINT '==============================================================';


		PRINT '==============================================================';
		PRINT 'Loading HopeExtract Table';
		PRINT '==============================================================';

	SET @start_time = GETDATE();
	PRINT '>> Truncating Table Into: [silver].[HopeExtract][gdrpr]';

	TRUNCATE TABLE [HOPE_silver].[gdpr];

	PRINT '>> Inserting Data Into: silver.HopeExtract';

	use WCC_Reports_Live
insert into [HOPE_silver].[gdpr]
(
  
    [Person Id],
    [First Name],
    [Last Name HCLIC A1.5],
    [NINO HCLIC A1.6],
    [Email Address],
    [Mobile Number],
    
    [dwh_create_date]
	)

SELECT
     TRY_CONVERT(INT, src.[Person Id]) AS [Person Id],
     UPPER(TRIM(src.[First Name])) AS [First Name],
     UPPER(TRIM(src.[Last Name HCLIC A1.5])) AS [Last Name HCLIC A1.5],
     src.[NINO HCLIC A1.6],
     src.[Email Address],
     src.[Mobile Number],
    GETDATE() AS [dwh_create_date]
FROM [HOPE_bronze].full_load AS gdpr;


-- check to see silver layer load gdpr. 
--select * from [HOPE_silver].[dpr]ATETIME2 DEFAULT GETDATE()
	

		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' +CAST(DATEDIFF(SECOND,@start_time, @end_time) as NVARCHAR) + ' seconds';
		PRINT '================================'

END TRY
BEGIN CATCH
  PRINT '==============================='
  PRINT 'ERROR OCCURED DURING LOADING SILVER LAYER'
  PRINT 'Error Message' + ERROR_MESSAGE();
  PRINT  'Error Message' + CAST (ERROR_NUMBER () AS NVARCHAR);
  PRINT  'Error Message' + CAST (ERROR_SATE () AS NVARCHAR);
End CATCH
END
