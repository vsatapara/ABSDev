CREATE OR REPLACE PROCEDURE abs_mdi."ENDWALL_COLUMNSPACING_CREATE" 
(
BuildingNo IN NUMBER,
CSType IN VARCHAR,
BayNo IN NUMBER,
BaySpacing IN VARCHAR,
UserId IN NUMBER,
IpAddress IN VARCHAR,
OutputId OUT NUMBER
)
AS 
BEGIN
    INSERT INTO "Input_Endwalls_ColumnSpacing"
    (
     "BuildingNo",
     "CSType",
     "BayNo",
     "BaySpacing",
     "CreatedBy",
     "CreatedDate",
     "IpAddress"
     ) 
    VALUES 
    (
    BuildingNo,
    CSType,
    BayNo,
    BaySpacing,
    UserId,
    CURRENT_TIMESTAMP,
    IpAddress
     )
    RETURNING "CSID" into OutputId;
END ENDWALL_COLUMNSPACING_CREATE;
/