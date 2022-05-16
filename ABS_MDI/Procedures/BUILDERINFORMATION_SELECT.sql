CREATE OR REPLACE PROCEDURE abs_mdi."BUILDERINFORMATION_SELECT" 
(
    CustomerNo IN NUMBER,
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
  OPEN Output_Data FOR 
      SELECT 
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
        "CompanyId"
      FROM "BuilderInformation" 
       WHERE "CustomerNo" = CustomerNo;
END BuilderInformation_Select;
/