CREATE OR REPLACE PROCEDURE abs_mdi."SKINNINGTYPOGRAPHYHEADER_LIST" 
(
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
    OPEN Output_Data FOR 
    SELECT
        "ID",
        "Name"
    FROM "SkinningTypographyHeader";
END SkinningTypographyHeader_List;
/