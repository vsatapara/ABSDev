CREATE OR REPLACE PROCEDURE abs_mdi."BUILDERINFORMATION_UPDATE" 
(
    BuilderName IN VARCHAR2,
    Website IN VARCHAR2,
    Phone IN VARCHAR2,
    Fax IN VARCHAR2,
    BillToAddress IN VARCHAR2,
    BillToCity IN VARCHAR2,
    BillToState IN VARCHAR2,
    BillToPostalCode IN VARCHAR2,
    BillToCountry IN VARCHAR2, 
    ShipToAddress IN VARCHAR2,
    ShipToCity IN VARCHAR2,
    ShipToState IN VARCHAR2,
    ShipToPostalCode IN VARCHAR2,
    ShipToCountry IN VARCHAR2, 
    PrimaryContact IN VARCHAR2, 
    CustomerNo IN VARCHAR2,
    UserId IN Number,
    IpAddress IN VARCHAR2,
    CompanyId IN NUMBER,
    OutputId OUT NUMBER
)
AS 
IsExist number;
BEGIN
    select count(*)  INTO  IsExist from "BuilderInformation" where "CustomerNo" = CustomerNo;
 
    IF IsExist > 0 THEN
      UPDATE "BuilderInformation" SET
        "BuilderName"=BuilderName, 
        "Website"=Website, 
        "Phone"=Phone, 
        "Fax"=Fax, 
        "BillToAddress"=BillToAddress, 
        "BillToCity"=BillToCity, 
        "BillToState"=BillToState, 
        "BillToPostalCode"=BillToPostalCode,     
        "BillToCountry"=BillToCountry,       
        "ShipToAddress"=ShipToAddress, 
        "ShipToCity"=ShipToCity, 
        "ShipToState"=ShipToState, 
        "ShipToPostalCode"=ShipToPostalCode,     
        "ShipToCountry"=ShipToCountry,   
        "PrimaryContact"=PrimaryContact,
        "CustomerNo"=CustomerNo,
        "ModifiedBy" = UserId, 
        "ModifiedDate" = CURRENT_TIMESTAMP,
        "IpAddress" = IpAddress,
        "CompanyId" = CompanyId
      WHERE "CustomerNo" = CustomerNo
      RETURNING "BuilderID" into OutputId;
      COMMIT;
    ELSE
        INSERT INTO "BuilderInformation" 
        (
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
            "IpAddress",
            "CompanyId"
        ) 
        VALUES 
        (
            BuilderName, 
            Website, 
            Phone, 
            Fax,
            BillToAddress,
            BillToCity,
            BillToState,
            BillToPostalCode,
            BillToCountry,
            ShipToAddress,
            ShipToCity,
            ShipToState,
            ShipToPostalCode,
            ShipToCountry,
            PrimaryContact,
            CustomerNo,  
            UserId,
            CURRENT_TIMESTAMP,
            IpAddress,
            CompanyId
        )
        RETURNING "BuilderID" into OutputId;
        COMMIT;
END IF;
END BUILDERINFORMATION_UPDATE;
/