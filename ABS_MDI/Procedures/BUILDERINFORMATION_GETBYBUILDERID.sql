CREATE OR REPLACE PROCEDURE abs_mdi."BUILDERINFORMATION_GETBYBUILDERID" 
(
    BuilderId IN VARCHAR2,
    OUTPUT_TABLE OUT  SYS_REFCURSOR
)
AS
BEGIN
OPEN OUTPUT_TABLE FOR SELECT
    "BuilderID",
    "BuilderName",
    "Website",
    "Phone",
    "Fax",
    "BillToAddress",
    "BillToCity",
    "BillToState",
    "BillToPostalCode",
    "BillToCountry",
    "ShipToAddress",
    "ShipToCity",
    "ShipToState",
    "ShipToPostalCode",
    "ShipToCountry",
    "PrimaryContact",
    "CustomerNo",
    "CreatedBy",
    "CreatedDate",
    "ModifiedBy",
    "ModifiedDate",
    "IpAddress",
    "CompanyId"
FROM
    "BuilderInformation"
     WHERE
                "BuilderID" in
                ( 
                        SELECT regexp_substr(BuilderId,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuilderId, '[^,]+', 1, level) is not null
                 );
END;
/