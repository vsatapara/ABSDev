CREATE OR REPLACE PROCEDURE abs_mdi."DRAWINGSSTAR_GETBYBUILDINGID" 
(
    ProjectId IN VARCHAR2,
    OUTPUT_TABLE OUT SYS_REFCURSOR
)
AS
BEGIN
OPEN OUTPUT_TABLE FOR 
SELECT
   "DrawingsStarId" as "Id",
    "DrawingNumber",
    "Quantity",
    "Type",
    "Purpose",
    "Seal",
    "Enhanced",
    "Mailed",
    "Carrier",
    "Account",
    "Country",
    "State",
    "InternationalSite",
    "ProjectNumber",
    "ShipTo",
    "AnchorRodDate",
    "ApprovalDate",
    "PermitDate",
    "MinQuantity",
    "CorpEngineers",
    "DrawingSize",
    "ProjectId"
FROM
    "EDSPrice_I_DrawingsStar"
WHERE
                "ProjectId"=ProjectId
             AND ("IsDeleted" IS NULL OR "IsDeleted" != 'Y');
END;
/