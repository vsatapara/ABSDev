CREATE OR REPLACE PROCEDURE abs_mdi."COUNTRIES_STATES_GETBYBUILDINGID" 
(
    OUTPUT_TABLE OUT  SYS_REFCURSOR
)
AS
BEGIN
OPEN OUTPUT_TABLE FOR SELECT
    "State",
    "County",
    "CrmGuid",
    "CecoASCrmGuid"
FROM
   "M_EDSPrice_Counties_States";
--WHERE "IsDeleted" != 'Y';
END;
/