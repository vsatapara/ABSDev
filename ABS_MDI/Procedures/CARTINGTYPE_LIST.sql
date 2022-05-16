CREATE OR REPLACE PROCEDURE abs_mdi."CARTINGTYPE_LIST" 
(
    Output_Data OUT SYS_REFCURSOR
)
AS
BEGIN
OPEN Output_Data FOR
    SELECT
        "CartingTypeId",
        "Name",
        "MetaName",
        "IsDefault",
        "DisplayOrder",
        "IsActive",
        "CreatedBy",
        "CreatedDate",
        "ModifiedBy",
        "ModifiedDate"
    FROM
        "CartingType";
END CartingType_List;
/