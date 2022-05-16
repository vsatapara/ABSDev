CREATE OR REPLACE PROCEDURE abs_mdi."CPUADDRESSES_LIST" 
( Output_Data OUT SYS_REFCURSOR) 
AS 
BEGIN
  OPEN Output_Data FOR 
SELECT 
    "AddressId",
    "IsActive",
    "CanUseForMailing",
    "Address1",
    "Address2",
    "City",
    "CountyRegion",
    "Name"
FROM
    "CpuAddresses"
     WHERE "CpuAddresses"."IsDelete"='N';
END CPUADDRESSES_LIST;
/