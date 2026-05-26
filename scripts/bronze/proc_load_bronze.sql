/*
======================================================================
stored procedure: Load Bronze Layer ( source -. Bronze)
======================================================================
script purpose: 
  THIS STORED PROCEDURE LOADS DATA INTO THE 'BRONZE' SCHEMA FROM EXTERNAL EXCEL/CSV FILES
  IT PERFORMS THE FOLLOWING ACTIONS: 
  -Truncates the bronze tables before loading data. 
  -Uses the 'Bulk Insert' command to load data from csv file bronze tables.

Parameters: 
 None - this stored procedure does not accept any parameters or return any values. 

Use Example: 
 EXEC bronze.load_bronze_Hope;

========================================================================
*/



--Stored procedure

CREATE OR ALTER PROCEDURE bronze.load_bronze_Hope AS

BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME;
	BEGIN TRY
		PRINT '==============================================================';
		PRINT 'Loading Bronze Layer';
		PRINT '==============================================================';


		PRINT '==============================================================';
		PRINT 'Loading HopeExtract Table';
		PRINT '==============================================================';


      SET @start_time = GETDATE();
-- Full Load
		
		TRUNCATE TABLE Hope_bronze;

			
-- get the path for below. should be sharepoint file but for immeddiacy the file is linked to the sharepoint file via personal one-drive file. (Security issue to be resolved)	
		BULK INSERT Hope_bronze
			
		FROM 'C:\Users\nsarpon\OneDrive - Office Shared Service\General - Data & Performance - Housing Needs\Hopepipeline\HopeExtract.csv'
		WITH (
		FirstROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
		);

		SET @end_time = GETDATE();
		PRINT ' >> Load Duration : ' + CAST(DATEDIFF(SECOND, @start_time,@end_time) AS NVARCHAR) + ' SECONDS';
	END TRY
	BEGIN CATCH
		PRINT '==============================================================';
		PRINT 'Error occured duing Loading bronze layer';
		PRINT 'Error Message' + ERROR_MESSAGE ();
		PRINT 'Error Message' + CAST (ERROR_NUMBER() AS NVARCHAR;
		PRINT 'Error Message' + CAST (ERROR_STATE() AS NVARCHAR;
		PRINT '==============================================================';
	END CATCH
END
SELECT * FROM Hope_bronze
SELECT COUNT (* ) FROM Hope_bronze
