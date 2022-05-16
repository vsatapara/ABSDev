CREATE OR REPLACE PROCEDURE abs_mdi."CLM_CITYCOUNTY_LIST" (
    BuildingCode    IN   varchar2,
    JobsiteProvince IN   varchar2,
    City_Data       OUT  SYS_REFCURSOR,
    County_Data     OUT  SYS_REFCURSOR
) 
as
BEGIN
    OPEN City_Data FOR 
    SELECT
       "JobsiteCity"
    FROM
       "CL_MinimumsCanada"
    where 
     "JobsiteProvince"=JobsiteProvince and "BuildingCode"=BuildingCode;
    OPEN County_Data FOR 
    SELECT
       "County"
    FROM
       "CLM_Counties_Canada"
    where 
     "Province"=JobsiteProvince;
END CLM_CityCounty_List;
/