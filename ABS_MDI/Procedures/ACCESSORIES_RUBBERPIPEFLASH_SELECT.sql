CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORIES_RUBBERPIPEFLASH_SELECT" 
(
RubberPipeFlashId IN Number,
Output_Data OUT SYS_REFCURSOR
)
AS
BEGIN
OPEN Output_Data FOR 
SELECT
    "RubberPipeFlashId",
    "BuildingId",
    "ProjectId",
    "Quantity",
    "OutsideDiameter",
    "CreatedBy",
    "CreatedDate",
    "ModifiedBy",
    "ModifiedDate",
    "IpAddress",
    "IsDelete"
FROM
    "Accessories_RubberPipeFlash"
WHERE
    "RubberPipeFlashId"=RubberPipeFlashId;
END ACCESSORIES_RUBBERPIPEFLASH_SELECT;
/