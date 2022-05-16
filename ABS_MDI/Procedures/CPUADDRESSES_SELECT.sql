CREATE OR REPLACE PROCEDURE abs_mdi."CPUADDRESSES_SELECT" 
(
    AddressId IN NUMBER,
    Output_Data OUT SYS_REFCURSOR
)
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
      FROM  "CpuAddresses"
      WHERE "AddressId"=AddressId;
END CPUADDRESSES_SELECT;
/