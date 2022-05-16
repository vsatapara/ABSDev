CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORIES_RUBBERPIPEFLASH_CREATE" 
(
BuildingId IN NUMBER,
ProjectId IN NUMBER,
Quantity IN NUMBER,
OutsideDiameter IN VARCHAR2,
IpAddress IN VARCHAR2,
UserId IN NUMBER,
OutputId OUT NUMBER
)
AS 
BEGIN
 INSERT INTO "Accessories_RubberPipeFlash" (
    "BuildingId",
    "ProjectId",
    "Quantity",
    "OutsideDiameter",
    "CreatedBy",
    "CreatedDate",
    "IpAddress",
    "IsDelete",
    "Type"
) 
VALUES 
(
    BuildingId,
    ProjectId,
    Quantity,
    OutsideDiameter,
    UserId,
    CURRENT_TIMESTAMP,
    IpAddress,
    'N',
    'Rubber Pipe Flash'
)
RETURNING "RubberPipeFlashId" into OutputId;
END ACCESSORIES_RUBBERPIPEFLASH_CREATE;
/