CREATE OR REPLACE PROCEDURE abs_mdi."CATEGORYMARGINS_CREATE" (
    CategoryId IN NUMBER,
    AmountForBuilding IN DECIMAL,
    MultiplierForBuilding IN DECIMAL,
    AmountForComponents IN DECIMAL,
    MultiplierForComponents IN DECIMAL,
    IsBuyout IN CHAR,
    IsPurchased IN CHAR,
    CreatedBy IN NUMBER,
    IpAddress IN VARCHAR2,
    OutputId OUT NUMBER
)
AS 
BEGIN
   INSERT INTO "CategoryMargins"
     (
        "CategoryId",
        "AmountForBuilding",
        "MultiplierForBuilding",
        "AmountForComponents",
        "MultiplierForComponents",
        "IsBuyout",
        "IsPurchased",
        "IsDelete",
        "CreatedBy",
        "CreatedDate",
        "IpAddress"
     )
     VALUES
     (
        CategoryId,
        AmountForBuilding,
        MultiplierForBuilding,
        AmountForComponents,
        MultiplierForComponents,
        IsBuyout,
        IsPurchased,
        'N',
        CreatedBy,
        CURRENT_TIMESTAMP,
        IpAddress
     )
     RETURNING "CategoryMarginId" into OutputId;
     
END Categorymargins_Create;
/