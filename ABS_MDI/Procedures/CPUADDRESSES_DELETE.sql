CREATE OR REPLACE PROCEDURE abs_mdi."CPUADDRESSES_DELETE" 
(
    AddressId IN NUMBER,
    UserId IN NUMBER
)
AS 
BEGIN
      UPDATE "CpuAddresses" SET
        "IsDelete"='Y',
         "ModifiedBy"=UserId,
        "ModifiedDate"=CURRENT_TIMESTAMP
      WHERE "AddressId"=AddressId;
    
END CPUADDRESSES_DELETE;
/