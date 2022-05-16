CREATE OR REPLACE PROCEDURE abs_mdi."ESCARPMENT_GETBYBUILDINGID" 
(
    BuildingId IN VARCHAR2,
    OUTPUT_TABLE OUT  SYS_REFCURSOR
)
AS
BEGIN
OPEN OUTPUT_TABLE FOR SELECT
    "EscarpmentId",
    "ProjectId",
    "BuildingNumber",
    "HillHeight",
    "Lh",
    "CrestDistance",
    "CrestUpwind",
    "FlatUpwindTerrain",
    "HillTallerBy2",
    "UpperHalfOfHill",
    "2ndRidgeOfHill",
    "TempString1",
    "TempString2",
    "TempDouble1",
    "TempDouble2",
    "TempInteger1",
    "TempInteger2",
    "Answers",
    "QuestionsAnswered",
    "Kzt",
    "CreatedBy",
    "CreatedDate",
    "ModifiedBy",
    "ModifiedDate",
    "IpAddress",
    "IsDeleted"
FROM
    "Escarpment"
    WHERE
                "BuildingNumber" in
                ( 
                        SELECT regexp_substr(BuildingId,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingId, '[^,]+', 1, level) is not null
                 )
                 AND ("IsDeleted" IS NULL  OR "IsDeleted" != 'Y');
END;
/