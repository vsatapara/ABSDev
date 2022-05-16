CREATE OR REPLACE PROCEDURE abs_mdi."CL_SOILTYPE_GET" 
(
    OUTPUT_TABLE OUT  SYS_REFCURSOR
)
AS
BEGIN
OPEN OUTPUT_TABLE FOR SELECT
    "Id",
    "SoilTypeList",
    "SoilTypeValue",
    "DisplayOrder"
FROM
    "CL_SoilType";
END;
/