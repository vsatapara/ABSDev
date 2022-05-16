CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORIES_RUBBERPIPEFLASH_UPDATE" 
(
RubberPipeFlashId IN NUMBER,
BuildingId IN NUMBER,
ProjectId IN NUMBER,
Quantity IN NUMBER,
OutsideDiameter IN VARCHAR2,
IpAddress IN VARCHAR2,
UserId IN NUMBER
)
AS 
BEGIN
 UPDATE "Accessories_RubberPipeFlash"
SET
  "BuildingId"=BuildingId,
  "ProjectId"=ProjectId,
  "Quantity"=Quantity,
  "OutsideDiameter"=OutsideDiameter,
  "ModifiedBy"=UserId ,
  "ModifiedDate"=CURRENT_TIMESTAMP,
  "IpAddress"=IpAddress,
  "IsDelete"='N',
  "Type" ='Rubber Pipe Flash'
WHERE
   "RubberPipeFlashId"=RubberPipeFlashId;
END ACCESSORIES_RUBBERPIPEFLASH_UPDATE;
/