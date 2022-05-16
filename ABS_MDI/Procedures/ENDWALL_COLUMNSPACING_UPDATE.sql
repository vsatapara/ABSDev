CREATE OR REPLACE PROCEDURE abs_mdi."ENDWALL_COLUMNSPACING_UPDATE" 
(
BuildingNo IN NUMBER,
CSType IN VARCHAR,
BayNo IN NUMBER,
BaySpacing IN VARCHAR,
UserId IN NUMBER,
IpAddress IN VARCHAR,
CSID IN NUMBER
)
AS 
BEGIN
        UPDATE "Input_Endwalls_ColumnSpacing" SET 
     "BuildingNo" = BuildingNo,
     "CSType" = CSType,
     "BayNo" = BayNo,
     "BaySpacing" = BaySpacing,
     "ModifiedBy" = UserId,
     "ModifiedDate" = CURRENT_TIMESTAMP,
     "IpAddress" = IpAddress
    WHERE "CSID" = CSID;
END ENDWALL_COLUMNSPACING_UPDATE;
/