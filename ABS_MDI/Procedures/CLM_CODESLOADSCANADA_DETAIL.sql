CREATE OR REPLACE PROCEDURE abs_mdi."CLM_CODESLOADSCANADA_DETAIL" (
    BuildingCode    IN   varchar2,
    JobsiteProvince IN   varchar2,
    JobsiteCity IN   varchar2,
    CodeLoads_Data  OUT  SYS_REFCURSOR
) 
as
BEGIN
    OPEN CodeLoads_Data FOR 
    SELECT
        "LiveLoad",
        "GroundSnowLoad",
        "RainLoad",
        "SpectralResponseSs",
        "SpectralResponseSh",
        "SpectralResponseS1",
        "SpectralResponseS2",
        "RainIntensity",
        0 as "WindLoad"
    FROM
       "CL_MinimumsCanada"
    where 
     "JobsiteProvince"=JobsiteProvince and "JobsiteCity"=JobsiteCity and "BuildingCode"=BuildingCode;
END CLM_CodesLoadsCanada_Detail;
/