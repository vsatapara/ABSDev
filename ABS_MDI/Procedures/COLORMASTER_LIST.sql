CREATE OR REPLACE PROCEDURE abs_mdi."COLORMASTER_LIST" 
(
    OUTPUT_TABLE OUT  SYS_REFCURSOR
)
AS
BEGIN
    OPEN OUTPUT_TABLE FOR 
     SELECT
            "ColorId",
            "CategoryId",
            "ColorText",
            "ColorName",
            "MinRequired"
    FROM
        "ColorMaster";
END COLORMASTER_LIST;
/