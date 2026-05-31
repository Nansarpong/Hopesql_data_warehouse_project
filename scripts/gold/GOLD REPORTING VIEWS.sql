


/* ============================================================
   GOLD REPORTING VIEWS
   ============================================================ */






CREATE OR ALTER VIEW [HOPE_gold].dim_Application AS
SELECT
    [Application Id] AS ApplicationId,
    [Household Id] AS HouseholdId,
    [Date Of Submission] AS Submission_Date,
    [Assigned To] AS AssignedTo,
    [App Type] AS AppType,
    [H-CLIC 1.1 Local Authority Code and Case Reference Number ] AS Local_Auth_code,
    [H-CLIC 1.19 Whether applicant referred to the authority?] AS Referral_type,
    [H-CLIC 1.20 Agency type] AS AgencyType,
    [H-CLIC 1.21 Referred by another authority] AS Referral_Authority,
    [H-CLIC 1.22 Date homeless application made] AS HomelessApplicationMadeDate
FROM [HOPE_silver].vw_Application_3NF;
GO

CREATE OR ALTER VIEW [HOPE_gold].dim_Household AS
SELECT
    [Household Id] AS HouseholdId,
    [Household_Type] AS HouseholdType,
    [Address (HCLIC A1.7)] AS AddressLine,
    [Address Type] AS AddressType,
    [Date Move In] AS DateMoveIn,
    [Date Move Out] AS DateMoveOut,
    [PostCode (HCLIC A1.8)] AS Postcode,
    [H-CLIC 1.4 Number of Children] AS NumberOfChildren,
    [Children_Status] AS ChildrenStatus,
    [H-CLIC 1.13 Please give details of current address] AS CurrentAddressDetails,
    [H-CLIC 1.14 Last settled accommodation type] AS LastSettledAccommodationType,
    [H-CLIC 1.15 Main reason for loss of settled home] AS MainReasonForLossOfSettledHome,
    [H-CLIC 1.16 what was the reason for the loss of private tenancy (Assured Shorthold Tenancy)?] AS ReasonForLossOfPrivateTenancy,
    [H-CLIC 1.17 what was the reason for the loss of social rented tenancy?] AS ReasonForLossOfSocialRentedTenancy,
    [H-CLIC 1.18 what was the reason for the eviction from supported housing?] AS ReasonForEvictionFromSupportedHousing
FROM [HOPE_silver].vw_Household_3NF;
GO

CREATE OR ALTER VIEW [HOPE_gold].dim_Person AS
SELECT
    [Person Id] AS PersonId,
    [Household Id] AS HouseholdId,
    [Application Id] AS ApplicationId,
    [Date of Birth HCLIC A1.3] AS DateOfBirth,
    [Age at Application(HCLIC - 2.4)] AS AgeAtApplication,
    [Age on Quarter End(HCLIC -2.8)] AS AgeOnQuarterEnd,
    [Date Joined(HCLIC -2.6)] AS DateJoined,
    [Sex HCLIC 2.3] AS Sex,
    [Relationship HCLIC -2.5] AS Relationship,
    [H-CLIC 1.7 Ethnic Group of the main applicant] AS EthnicGroup,
    [H-CLIC 1.8 Sexual Preference of the main applicant] AS SexualPreference,
    [H-CLIC 1.9 What is the nationality of the main applicant?] AS Nationality,
    [H-CLIC 1.10 Current employment status for applicant] AS CurrentEmploymentStatus,
    [H-CLIC 1.24 Is your gender the same as the sex you were registered at birth?] AS GenderSameAsSexRegisteredAtBirth
FROM [HOPE_silver].vw_Person_3NF;
GO

CREATE OR ALTER VIEW [HOPE_gold].fact_Assessment AS
SELECT
    [Application Id] AS ApplicationId,
    [App Type] AS AppType,
    [Plan Type] AS PlanType,
    [Plan Created Date] AS PlanCreatedDate,
    [H-CLIC 1.3 Are you satisfied that the applicant is eligible for assistance?] AS EligibleForAssistance,
    [H-CLIC 1.5 Date of assessment] AS AssessmentDate,
    [H-CLIC 1.6 What duties are owed to the applicant?] AS DutiesOwed,
    [H-CLIC 1.11 Is anyone in the household claiming benefits towards housing costs?] AS ClaimingBenefitsTowardsHousingCosts,
    [H-CLIC 1.12 Is anyone in the household claiming benefits towards other living costs?] AS ClaimingBenefitsTowardsOtherLivingCosts,
    [H-CLIC 3.2 Support needs] AS SupportNeeds,
    [H-CLIC 6.2 Assistance with support needs] AS AssistanceWithSupportNeeds
FROM [HOPE_silver].vw_Assessment_3NF;
GO

CREATE OR ALTER VIEW [HOPE_gold].fact_PreventionActivity AS
SELECT
    [Application Id] AS ApplicationId,
    [H-CLIC 4.2 Date prevention duty started] AS PreventionDutyStartDate,
    [H-CLIC 4.3 Prevention Activity undertaken] AS PreventionActivityUndertaken,
    [H-CLIC 4.4 Were the applicants support needs engaged during the prevention stage?] AS SupportNeedsEngagedDuringPrevention,
    [H-CLIC 4.5 Date Prevention Duty ended ] AS PreventionDutyEndDate,
    [H-CLIC 4.6 Reason Prevention Duty ended] AS ReasonPreventionDutyEnded,
    [H-CLIC 4.7 Is a temporary accommodation duty owed following the end of the prevention duty] AS TemporaryAccommodationDutyOwedAfterPrevention,
    [H-CLIC 4.8 Applicant’s accommodation at point Prevention Duty ended] AS AccommodationAtPreventionEnd,
    [H-CLIC 4.9 Which Local Authority area is this accommodation in?] AS LocalAuthorityAreaAtPreventionEnd
FROM [HOPE_silver].vw_PreventionActivity_3NF;
GO

CREATE OR ALTER VIEW [HOPE_gold].fact_ReliefDutyActivity AS
SELECT
    [Application Id] AS ApplicationId,
    [H-CLIC 5.2 Date Relief duty started] AS ReliefDutyStartDate,
    [H-CLIC 5.3 Relief Activity undertaken] AS ReliefActivityUndertaken,
    [H-CLIC 5.4 Were the applicant’s support needs engaged during the prevention stage?] AS SupportNeedsEngagedDuringRelief,
    [H-CLIC 5.5 Date Relief Duty ended ] AS ReliefDutyEndDate,
    [H-CLIC 5.6 Reason Relief Duty ended] AS ReasonReliefDutyEnded,
    [H-CLIC 5.7 Is a temporary accommodation duty owed during the relief duty?] AS TemporaryAccommodationDutyOwedDuringRelief,
    [H-CLIC 5.8 Applicant’s accommodation at point Relief Duty ended] AS AccommodationAtReliefEnd,
    [H-CLIC 5.9 Which Local Authority area is this accommodation in?] AS LocalAuthorityAreaAtReliefEnd,
    [H-CLIC 5.10 If referred to another Local Authority, which Local Authority?] AS ReferredToLocalAuthority
FROM [HOPE_silver].vw_ReliefDutyActivity_3NF;
GO

CREATE OR ALTER VIEW [HOPE_gold].fact_MainDuty AS
SELECT
    [Application Id] AS ApplicationId,
    [H-CLIC 7.1 Main duty decision date] AS MainDutyDecisionDate,
    [H-CLIC 7.2 Date main duty decision takes effect ] AS MainDutyDecisionEffectiveDate,
    [H-CLIC 7.3 The outcome of the decision issued on what duty (if any) is owed when relief stage ends (the main duty)] AS MainDutyDecisionOutcome,
    [H-CLIC 7.4 Was relief offered to legacy cases?] AS ReliefOfferedToLegacyCases,
    [H-CLIC 7.5 What priority need the applicant has?] AS PriorityNeed,
    [H-CLIC 7.6 Is a s193 Temporary Accommodation housing duty owed to the applicant?] AS S193TemporaryAccommodationDutyOwed,
    [H-CLIC 7.7 What kind of accommodation is/was the applicant in when you brought the duty to an end?] AS AccommodationWhenDutyEnded,
    [H-CLIC 7.8 Have you referred the main housing duty to another local authority?] AS MainDutyReferredToAnotherAuthority,
    [H-CLIC 7.9 In what local authority district is the accommodation outcome described in H-CLIC 7.7] AS LocalAuthorityDistrictOfAccommodationOutcome,
    [H-CLIC 8.2 Section 193(2), section 193C(4) or section 195A(1) duty end date] AS S193DutyEndDate,
    [H-CLIC 8.3 What is the reason the section 193(2) Duty, the section 193C(4) Duty or the section 195A(1) Duty has ended?] AS ReasonS193DutyEnded,
    [H-CLIC 8.4 What was the applicant's accommodation when section 193(2), section 193C(4) or the section 195A(1) duty ended?] AS AccommodationWhenS193DutyEnded,
    [H-CLIC 8.5 In what local authority district is the accommodation outcome?] AS LocalAuthorityDistrictOfS193AccommodationOutcome
FROM [HOPE_silver].vw_MainDuty_3NF;
GO

CREATE OR ALTER VIEW [HOPE_gold].fact_TA_Details AS
SELECT
    ROW_NUMBER() OVER (
        ORDER BY
            [Application Id],
            [Hclic 9.2 Entry Date],
            [Hclic 9.3 Placement Entry Date],
            [Hclic 9.4 Placement Exit Date]
    ) AS TADetailId,
    [Application Id] AS ApplicationId,
    [Hclic 9.2 Entry Date] AS TAEntryDate,
    [Hclic 9.3 Placement Entry Date] AS PlacementEntryDate,
    [Hclic 9.4 Placement Exit Date] AS PlacementExitDate,
    [Hclic 9.5 TA Type] AS TAType,
    [Hclic 9.6 No Of Bedroom] AS NumberOfBedrooms,
    [Hclic 9.7 Duty Provided] AS DutyProvided1,
    [Hclic 9.8 Duty Provided] AS DutyProvided2,
    [Hclic 9.9 Exit Date] AS TAExitDate
FROM [HOPE_silver].vw_TA_Details_3NF;
GO
