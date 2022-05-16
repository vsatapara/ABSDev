CREATE OR REPLACE PROCEDURE abs_mdi."CATEGORYMARGINS_UPDATE" 
(
    CategoryMarginId IN NUMBER,
    CategoryId IN NUMBER,
    AmountForBuilding IN DECIMAL,
    MultiplierForBuilding IN DECIMAL,
    AmountForComponents IN DECIMAL,
    MultiplierForComponents IN DECIMAL,
    IsBuyout CHAR,
    IsPurchased CHAR,
    ModifiedBy NUMBER,
    IpAddress IN VARCHAR2
    
)
AS 
BEGIN
   UPDATE "CategoryMargins" SET
        "CategoryId"=CategoryId,
        "AmountForBuilding"=AmountForBuilding,
        "MultiplierForBuilding"=MultiplierForBuilding,
        "AmountForComponents"=AmountForComponents,
        "MultiplierForComponents"=MultiplierForComponents,
        "IsBuyout"=IsBuyout,
        "IsPurchased"=IsPurchased,
        "ModifiedBy"=ModifiedBy,
        "ModifiedDate"=CURRENT_TIMESTAMP,
        "IpAddress"=IpAddress
  WHERE "CategoryMarginId"=CategoryMarginId;
END Categorymargins_Update;
/