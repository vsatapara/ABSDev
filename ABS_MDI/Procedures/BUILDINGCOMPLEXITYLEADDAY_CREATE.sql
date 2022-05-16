CREATE OR REPLACE PROCEDURE abs_mdi."BUILDINGCOMPLEXITYLEADDAY_CREATE" 
(
    BuildingQuoteTypeId IN NUMBER,
    ClassMasterId IN NUMBER,
    ClassInput IN NUMBER,
    CreatedBy IN NUMBER,
    IpAddress IN VARCHAR2
)
AS 
BEGIN
   INSERT INTO "BuildingComplexityLeadDay" (
        "BuildingQuoteTypeId",
        "ClassMasterId",
        "ClassInput",
        "CreatedBy",
        "CreatedDate",
        "IpAddress"
    ) VALUES (
        BuildingQuoteTypeId,
        ClassMasterId ,
        ClassInput,
        CreatedBy,
        CURRENT_TIMESTAMP,
        IpAddress
     );
END BUILDINGCOMPLEXITYLEADDAY_CREATE;
/