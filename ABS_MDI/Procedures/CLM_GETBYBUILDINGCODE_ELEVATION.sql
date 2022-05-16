CREATE OR REPLACE PROCEDURE abs_mdi."CLM_GETBYBUILDINGCODE_ELEVATION" 
(
    DesignCodeId IN VARCHAR2,
    JobsiteState varchar2,
    JobsiteCounty varchar2,
    BuildingElevation_Data OUT  SYS_REFCURSOR
)
AS
BEGIN
OPEN BuildingElevation_Data FOR SELECT distinct
    "BuildingCode",
     "Elevation",
     (select "SeaLevelElevation" from "CL_Settings" where "BuildingCode"=CLM."BuildingCode") as SeaLevelElevation,
     "WindLoad2",
     "ValidWindLoad"
FROM
    "CL_Minimums" CLM
                WHERE
                CLM."BuildingCode" in
                ( 
                        SELECT regexp_substr(DesignCodeId,'[^,]+', 1, level) from dual
                        connect by regexp_substr(DesignCodeId, '[^,]+', 1, level) is not null
                )
                AND (CLM."IsDeleted" IS NULL  OR CLM."IsDeleted" != 'Y')
                AND CLM."JobsiteState" = JobsiteState AND CLM."JobsiteCounty" = JobsiteCounty;
END CLM_GETBYBUILDINGCODE_ELEVATION;
/