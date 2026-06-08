/* This is a breakwon of the fully normalised 3NF views in the silver layer 

    HOPE Medallion Architecture Views
    Silver Layer: 3NF-style normalised views from [HOPE_silver].[load]
  

    Assumption:
    Source cleaned table = [HOPE_silver].[load]

*/

/* ============================================================
   SILVER 3NF VIEWS
   ============================================================ */

CREATE OR ALTER VIEW [HOPE_silver].vw_Application_3NF AS
SELECT DISTINCT
    [Application Id],
    [Household Id],
    [Date Of Submission],
    [Assigned To],
    [App Type],
    [H-CLIC 1.1 Local Authority Code and Case Reference Number ],
    [H-CLIC 1.19 Whether applicant referred to the authority?],
    [H-CLIC 1.20 Agency type],
    [H-CLIC 1.21 Referred by another authority],
    [H-CLIC 1.22 Date homeless application made]
FROM [HOPE_silver].[load]
WHERE [Application Id] IS NOT NULL
    AND [Relationship HCLIC -2.5] = ('Main Applicant');
GO

CREATE OR ALTER VIEW [HOPE_silver].vw_Household_3NF AS
SELECT DISTINCT
    [Household Id],
    [Application Id],
    [Household_Type],
    [Address (HCLIC A1.7)],
    [Address Type],
    [Date Move In],
    [Date Move Out],
    [PostCode (HCLIC A1.8)],
    [H-CLIC 1.4 Number of Children],
    [Children_Status],
    [H-CLIC 1.13 Please give details of current address],
    [H-CLIC 1.14 Last settled accommodation type],
    [H-CLIC 1.15 Main reason for loss of settled home],
    [H-CLIC 1.16 what was the reason for the loss of private tenancy (Assured Shorthold Tenancy)?],
    [H-CLIC 1.17 what was the reason for the loss of social rented tenancy?],
    [H-CLIC 1.18 what was the reason for the eviction from supported housing?]
FROM [HOPE_silver].[load]
WHERE [Household Id] IS NOT NULL
    AND [Relationship HCLIC -2.5] = ('Main Applicant');
GO


CREATE OR ALTER VIEW [HOPE_silver].vw_Person_3NF AS
SELECT DISTINCT
    [Person Id],
    [Household Id],
    [Application Id],
    [Date of Birth HCLIC A1.3],
    [Age at Application(HCLIC - 2.4)],
    [Age on Quarter End(HCLIC -2.8)],
    [Date Joined(HCLIC -2.6)],
    [Sex HCLIC 2.3],
    [Relationship HCLIC -2.5],
    [H-CLIC 1.7 Ethnic Group of the main applicant],
    [H-CLIC 1.8 Sexual Preference of the main applicant],
    [H-CLIC 1.9 What is the nationality of the main applicant?],
    [H-CLIC 1.10 Current employment status for applicant],
    [H-CLIC 1.24 Is your gender the same as the sex you were registered at birth?]
FROM [HOPE_silver].[load]
WHERE [Person Id] IS NOT NULL
    AND [Relationship HCLIC -2.5] = ('Main Applicant');
GO

CREATE OR ALTER VIEW [HOPE_silver].vw_Assessment_3NF AS
SELECT DISTINCT
    [Application Id],
    [App Type],
    [Plan Type],
    [Plan Created Date],
    [Plan Publish Status],
    [H-CLIC 1.3 Are you satisfied that the applicant is eligible for assistance?],
    [H-CLIC 1.5 Date of assessment],
    [H-CLIC 1.6 What duties are owed to the applicant?],
    [H-CLIC 1.11 Is anyone in the household claiming benefits towards housing costs?],
    [H-CLIC 1.12 Is anyone in the household claiming benefits towards other living costs?],
    [H-CLIC 3.2 Support needs],
    [H-CLIC 6.2 Assistance with support needs]
FROM [HOPE_silver].[load]
WHERE [Application Id] IS NOT NULL
    AND [Relationship HCLIC -2.5] = ('Main Applicant');
GO

CREATE OR ALTER VIEW [HOPE_silver].vw_PreventionActivity_3NF AS
SELECT DISTINCT
    [Application Id],
    [H-CLIC 4.2 Date prevention duty started],
    [H-CLIC 4.3 Prevention Activity undertaken],
    [H-CLIC 4.4 Were the applicants support needs engaged during the prevention stage?],
    [H-CLIC 4.5 Date Prevention Duty ended ],
    [H-CLIC 4.6 Reason Prevention Duty ended],
    [H-CLIC 4.7 Is a temporary accommodation duty owed following the end of the prevention duty],
    [H-CLIC 4.8 Applicant’s accommodation at point Prevention Duty ended],
    [H-CLIC 4.9 Which Local Authority area is this accommodation in?]
FROM [HOPE_silver].[load]
WHERE [Application Id] IS NOT NULL
    AND [Relationship HCLIC -2.5] = ('Main Applicant');
GO

CREATE OR ALTER VIEW [HOPE_silver].vw_ReliefDutyActivity_3NF AS
SELECT DISTINCT
    [Application Id],
    [H-CLIC 5.2 Date Relief duty started],
    [H-CLIC 5.3 Relief Activity undertaken],
    [H-CLIC 5.4 Were the applicant’s support needs engaged during the prevention stage?],
    [H-CLIC 5.5 Date Relief Duty ended ],
    [H-CLIC 5.6 Reason Relief Duty ended],
    [H-CLIC 5.7 Is a temporary accommodation duty owed during the relief duty?],
    [H-CLIC 5.8 Applicant’s accommodation at point Relief Duty ended],
    [H-CLIC 5.9 Which Local Authority area is this accommodation in?],
    [H-CLIC 5.10 If referred to another Local Authority, which Local Authority?]
FROM [HOPE_silver].[load]
WHERE [Application Id] IS NOT NULL
    AND [Relationship HCLIC -2.5] = ('Main Applicant');
GO

CREATE OR ALTER VIEW [HOPE_silver].vw_MainDuty_3NF AS
SELECT DISTINCT
    [Application Id],
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
    [H-CLIC 8.5 In what local authority district is the accommodation outcome?]
FROM [HOPE_silver].[load]
WHERE [Application Id] IS NOT NULL
    AND [Relationship HCLIC -2.5] = ('Main Applicant');
GO

CREATE OR ALTER VIEW [HOPE_silver].vw_TA_Details_3NF AS
SELECT DISTINCT
    [Application Id],
    [Hclic 9.2 Entry Date],
    [Hclic 9.3 Placement Entry Date],
    [Hclic 9.4 Placement Exit Date],
    [Hclic 9.5 TA Type],
    [Hclic 9.6 No Of Bedroom],
    [Hclic 9.7 Duty Provided],
    [Hclic 9.8 Duty Provided],
    [Hclic 9.9 Exit Date]
FROM [HOPE_silver].[load]
WHERE [Application Id] IS NOT NULL
    AND [Relationship HCLIC -2.5] = ('Main Applicant');
GO
