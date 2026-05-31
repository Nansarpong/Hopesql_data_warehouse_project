/*
======================================================================
stored procedure: Load silver Layer ( Bronze - > Silver)
======================================================================
script purpose: 
  THIS STORED PROCEDURE performs the ETL (Extract, transformation, Load) process to populate the 'silver' schema tables from the 'bronze' schema'
 

Actions Performed:

- Truncate Silver tables.
- Inserts transformed and cleansed data from Bronze into Silver tables. 
- Free fields ommitted in silver_load. 

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
	PRINT '>> Truncating Table Into: [silver].[HopeExtract]';

	TRUNCATE TABLE [HOPE_silver].[gdpr];

	PRINT '>> Inserting Data Into: silver.HopeExtract';

	use WCC_Reports_Live
insert into [HOPE_silver].[load]
(
    [Application Id],
    [Household Id],
    [Household_Type],
    [Person Id],
    --[First Name],
    --[Last Name HCLIC A1.5],
    --[NINO HCLIC A1.6],
    --[Email Address],
    --[Mobile Number],
    [Date of Birth HCLIC A1.3],
    [Sex HCLIC 2.3],
    [Relationship HCLIC -2.5],
    [Age at Application(HCLIC - 2.4)],
    [Age on Quarter End(HCLIC -2.8)],
    [Date Of Submission],
    [Assigned To],
    [Date Joined(HCLIC -2.6)],
    [Address (HCLIC A1.7)],
    [PostCode (HCLIC A1.8)],
    [Address Type],
    [Date Move In],
    [Date Move Out],
    [App Type],
    [Plan Type],
    [Plan Created Date],
    [H-CLIC 1.1 Local Authority Code and Case Reference Number ],
    [H-CLIC 1.3 Are you satisfied that the applicant is eligible for assistance?],
    [H-CLIC 1.4 Number of Children],
    [Children_Status],
    [H-CLIC 1.5 Date of assessment],
    [H-CLIC 1.6 What duties are owed to the applicant?],
    [H-CLIC 1.7 Ethnic Group of the main applicant],
    [H-CLIC 1.8 Sexual Preference of the main applicant],
    [H-CLIC 1.9 What is the nationality of the main applicant?],
    [H-CLIC 1.10 Current employment status for applicant],
    [H-CLIC 1.11 Is anyone in the household claiming benefits towards housing costs?],
    [H-CLIC 1.12 Is anyone in the household claiming benefits towards other living costs?],
    [H-CLIC 1.13 Please give details of current address],
    [H-CLIC 1.14 Last settled accommodation type],
    [H-CLIC 1.15 Main reason for loss of settled home],
    [H-CLIC 1.16 what was the reason for the loss of private tenancy (Assured Shorthold Tenancy)?],
    [H-CLIC 1.17 what was the reason for the loss of social rented tenancy?],
    [H-CLIC 1.18 what was the reason for the eviction from supported housing?],
    [H-CLIC 1.19 Whether applicant referred to the authority?],
    [H-CLIC 1.20 Agency type],
    [H-CLIC 1.21 Referred by another authority],
    [H-CLIC 1.22 Date homeless application made],
    [H-CLIC 1.23 Current employment status for partner/spouse],
    [H-CLIC 1.24 Is your gender the same as the sex you were registered at birth?],
    [H-CLIC 3.2 Support needs],
    [H-CLIC 4.2 Date prevention duty started],
    [H-CLIC 4.3 Prevention Activity undertaken],
    [H-CLIC 4.4 Were the applicants support needs engaged during the prevention stage?],
    [H-CLIC 4.5 Date Prevention Duty ended ],
    [H-CLIC 4.6 Reason Prevention Duty ended],
    [H-CLIC 4.7 Is a temporary accommodation duty owed following the end of the prevention duty],
    [H-CLIC 4.8 Applicant’s accommodation at point Prevention Duty ended],
    [H-CLIC 4.9 Which Local Authority area is this accommodation in?],
    [H-CLIC 5.2 Date Relief duty started],
    [H-CLIC 5.3 Relief Activity undertaken],
    [H-CLIC 5.4 Were the applicant’s support needs engaged during the prevention stage?],
    [H-CLIC 5.5 Date Relief Duty ended ],
    [H-CLIC 5.6 Reason Relief Duty ended],
    [H-CLIC 5.7 Is a temporary accommodation duty owed during the relief duty?],
    [H-CLIC 5.8 Applicant’s accommodation at point Relief Duty ended],
    [H-CLIC 5.9 Which Local Authority area is this accommodation in?],
    [H-CLIC 5.10 If referred to another Local Authority, which Local Authority?],
    [H-CLIC 6.2 Assistance with support needs],
    [H-CLIC 7.1 Main duty decision date],
    [H-CLIC 7.2 Date main duty decision takes effect ],
    [H-CLIC 7.3 The outcome of the decision issued on what duty (if any) is owed when relief stage ends (the main duty)],
    [H-CLIC 7.4 Was relief offered to legacy cases?],
    [H-CLIC 7.5 What priority need the applicant has?],
    [H-CLIC 7.6 Is a s193 Temporary Accommodation housing duty owed to the applicant?],
    [H-CLIC 7.7 What kind of accommodation is/was the applicant in when you brought the duty to an end?],
    [H-CLIC 7.8 Have you referred the main housing duty to another local authority?],
    [H-CLIC 7.9 In what local authority district is the accommodation outcome described in H-CLIC 7.7],
    [H-CLIC 8.2 Section 193(2), section 193C(4) or section 195A(1) duty end date],
    [H-CLIC 8.3 What is the reason the section 193(2) Duty, the section 193C(4) Duty or the section 195A(1) Duty has ended?],
    [H-CLIC 8.4 What was the applicant's accommodation when section 193(2), section 193C(4) or the section 195A(1) duty ended?],
    [H-CLIC 8.5 In what local authority district is the accommodation outcome?],
    [Hclic 9.2 Entry Date],
    [Hclic 9.3 Placement Entry Date],
    [Hclic 9.4 Placement Exit Date],
    [Hclic 9.5 TA Type],
    [Hclic 9.6 No Of Bedroom],
    [Hclic 9.7 Duty Provided],
    [Hclic 9.8 Duty Provided],
    [Hclic 9.9 Exit Date],
    [HCLIC 10.2 Review Start Date],
    [HCLIC 10.3 Review End Date],
    [HCLIC 10.4 Review Requested],
    [HCLIC 10.5 Review Appeal],
    [HCLIC 10.6 Review Outcome],
    [SecondAssignedOfficer],
    [dwh_create_date]
	)

SELECT
    TRY_CONVERT(INT, src.[Application Id]) AS [Application Id],
    TRY_CONVERT(INT, src.[Household Id]) AS [Household Id],

    CASE
        WHEN COUNT(src.[Household Id]) OVER (PARTITION BY src.[Household Id]) > 1
            THEN 'Family'
        ELSE 'Single'
    END AS [Household_Type],

    TRY_CONVERT(INT, src.[Person Id]) AS [Person Id],
    --UPPER(TRIM(src.[First Name])) AS [First Name],
    --UPPER(TRIM(src.[Last Name HCLIC A1.5])) AS [Last Name HCLIC A1.5],
    --src.[NINO HCLIC A1.6],
    --src.[Email Address],
    --src.[Mobile Number],
    TRY_CONVERT(DATE, src.[Date of Birth HCLIC A1.3]) AS [Date of Birth HCLIC A1.3],

    CASE UPPER(TRIM(src.[Sex HCLIC 2.3]))
        WHEN 'FEMALE' THEN 'FEMALE'
        WHEN 'MALE' THEN 'MALE'
        WHEN 'UNSPECIFIED' THEN 'UNSPECIFIED'
        ELSE 'UNSPECIFIED'
    END AS [Sex HCLIC 2.3],

    src.[Relationship HCLIC -2.5],
    TRY_CONVERT(INT, src.[Age at Application(HCLIC - 2.4)]) AS [Age at Application(HCLIC - 2.4)],
    TRY_CONVERT(INT, src.[Age on Quarter End(HCLIC -2.8)]) AS [Age on Quarter End(HCLIC -2.8)],
    TRY_CONVERT(DATE, src.[Date Of Submission]) AS [Date Of Submission],
    src.[Assigned To],
    TRY_CONVERT(DATE, src.[Date Joined(HCLIC -2.6)]) AS [Date Joined(HCLIC -2.6)],
    TRIM(src.[Address (HCLIC A1.7)]),
    TRIM(src.[PostCode (HCLIC A1.8)]) AS [PostCode (HCLIC A1.8)],
    src.[Address Type],
    TRY_CONVERT(DATE, src.[Date Move In]) AS [Date Move In],
    TRY_CONVERT(DATE, src.[Date Move Out]) AS [Date Move Out],
    src.[App Type],
    src.[Plan Type],
    TRY_CONVERT(DATE, src.[Plan Created Date]) AS [Plan Created Date],
   

    src.[H-CLIC 1.1 Local Authority Code and Case Reference Number ],
    src.[H-CLIC 1.3 Are you satisfied that the applicant is eligible for assistance?],
    TRY_CONVERT(INT, src.[H-CLIC 1.4 Number of Children]) AS [H-CLIC 1.4 Number of Children],

    CASE
        WHEN TRY_CONVERT(INT, src.[H-CLIC 1.4 Number of Children]) > 0
            THEN 'Children'
        ELSE 'No-Children'
    END AS [Children_Status],

    TRY_CONVERT(DATE, src.[H-CLIC 1.5 Date of assessment]) AS [H-CLIC 1.5 Date of assessment],
    src.[H-CLIC 1.6 What duties are owed to the applicant?],
    src.[H-CLIC 1.7 Ethnic Group of the main applicant],
    src.[H-CLIC 1.8 Sexual Preference of the main applicant],
    src.[H-CLIC 1.9 What is the nationality of the main applicant?],
    src.[H-CLIC 1.10 Current employment status for applicant],
    src.[H-CLIC 1.11 Is anyone in the household claiming benefits towards housing costs?],
    src.[H-CLIC 1.12 Is anyone in the household claiming benefits towards other living costs?],
    src.[H-CLIC 1.13 Please give details of current address],
    src.[H-CLIC 1.14 Last settled accommodation type],
    src.[H-CLIC 1.15 Main reason for loss of settled home],
    src.[H-CLIC 1.16 what was the reason for the loss of private tenancy (Assured Shorthold Tenancy)?],
    src.[H-CLIC 1.17 what was the reason for the loss of social rented tenancy?],
    src.[H-CLIC 1.18 what was the reason for the eviction from supported housing?],
    src.[H-CLIC 1.19 Whether applicant referred to the authority?],
    src.[H-CLIC 1.20 Agency type],
    src.[H-CLIC 1.21 Referred by another authority],
    TRY_CONVERT(DATE, src.[H-CLIC 1.22 Date homeless application made]) AS [H-CLIC 1.22 Date homeless application made],
    src.[H-CLIC 1.23 Current employment status for partner/spouse],
    src.[H-CLIC 1.24 Is your gender the same as the sex you were registered at birth?],
    src.[H-CLIC 3.2 Support needs],

    TRY_CONVERT(DATE, src.[H-CLIC 4.2 Date prevention duty started]) AS [H-CLIC 4.2 Date prevention duty started],
    src.[H-CLIC 4.3 Prevention Activity undertaken],
    src.[H-CLIC 4.4 Were the applicants support needs engaged during the prevention stage?],
    TRY_CONVERT(DATE, src.[H-CLIC 4.5 Date Prevention Duty ended ]) AS [H-CLIC 4.5 Date Prevention Duty ended ],
    src.[H-CLIC 4.6 Reason Prevention Duty ended],
    src.[H-CLIC 4.7 Is a temporary accommodation duty owed following the end of the prevention duty],
    src.[H-CLIC 4.8 Applicant’s accommodation at point Prevention Duty ended],
    src.[H-CLIC 4.9 Which Local Authority area is this accommodation in?],

    TRY_CONVERT(DATE, src.[H-CLIC 5.2 Date Relief duty started]) AS [H-CLIC 5.2 Date Relief duty started],
    src.[H-CLIC 5.3 Relief Activity undertaken],
    src.[H-CLIC 5.4 Were the applicant’s support needs engaged during the prevention stage?],
    TRY_CONVERT(DATE, src.[H-CLIC 5.5 Date Relief Duty ended ]) AS [H-CLIC 5.5 Date Relief Duty ended ],
    src.[H-CLIC 5.6 Reason Relief Duty ended],
    src.[H-CLIC 5.7 Is a temporary accommodation duty owed during the relief duty?],
    src.[H-CLIC 5.8 Applicant’s accommodation at point Relief Duty ended],
    src.[H-CLIC 5.9 Which Local Authority area is this accommodation in?],
    src.[H-CLIC 5.10 If referred to another Local Authority, which Local Authority?],
    src.[H-CLIC 6.2 Assistance with support needs],

    TRY_CONVERT(DATE, src.[H-CLIC 7.1 Main duty decision date]) AS [H-CLIC 7.1 Main duty decision date],
    TRY_CONVERT(DATE, src.[H-CLIC 7.2 Date main duty decision takes effect ]) AS [H-CLIC 7.2 Date main duty decision takes effect ],
    src.[H-CLIC 7.3 The outcome of the decision issued on what duty (if any) is owed when relief stage ends (the main duty)],
    src.[H-CLIC 7.4 Was relief offered to legacy cases?],
    src.[H-CLIC 7.5 What priority need the applicant has?],
    src.[H-CLIC 7.6 Is a s193 Temporary Accommodation housing duty owed to the applicant?],
    src.[H-CLIC 7.7 What kind of accommodation is/was the applicant in when you brought the duty to an end?],
    src.[H-CLIC 7.8 Have you referred the main housing duty to another local authority?],
    src.[H-CLIC 7.9 In what local authority district is the accommodation outcome described in H-CLIC 7.7],

    TRY_CONVERT(DATE, src.[H-CLIC 8.2 Section 193(2), section 193C(4) or section 195A(1) duty end date]) AS [H-CLIC 8.2 Section 193(2), section 193C(4) or section 195A(1) duty end date],
    src.[H-CLIC 8.3 What is the reason the section 193(2) Duty, the section 193C(4) Duty or the section 195A(1) Duty has ended?],
    src.[H-CLIC 8.4 What was the applicant's accommodation when section 193(2), section 193C(4) or the section 195A(1) duty ended?],
    src.[H-CLIC 8.5 In what local authority district is the accommodation outcome?],

    TRY_CONVERT(DATE, src.[Hclic 9.2 Entry Date]) AS [Hclic 9.2 Entry Date],
    TRY_CONVERT(DATE, src.[Hclic 9.3 Placement Entry Date]) AS [Hclic 9.3 Placement Entry Date],
    TRY_CONVERT(DATE, src.[Hclic 9.4 Placement Exit Date]) AS [Hclic 9.4 Placement Exit Date],
    src.[Hclic 9.5 TA Type],
    TRY_CONVERT(INT, src.[Hclic 9.6 No Of Bedroom]) AS [Hclic 9.6 No Of Bedroom],
    src.[Hclic 9.7 Duty Provided],
    src.[Hclic 9.8 Duty Provided],
    TRY_CONVERT(DATE, src.[Hclic 9.9 Exit Date]) AS [Hclic 9.9 Exit Date],

    TRY_CONVERT(DATE, src.[HCLIC 10.2 Review Start Date]) AS [HCLIC 10.2 Review Start Date],
    TRY_CONVERT(DATE, src.[HCLIC 10.3 Review End Date]) AS [HCLIC 10.3 Review End Date],
    src.[HCLIC 10.4 Review Requested],
    src.[HCLIC 10.5 Review Appeal],
    src.[HCLIC 10.6 Review Outcome],
    src.[SecondAssignedOfficer],
    GETDATE() AS [dwh_create_date]
FROM [HOPE_bronze].full_load AS src;


-- check to see silver layer load. 
--select * from [HOPE_silver].[load]ATETIME2 DEFAULT GETDATE()
	

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
