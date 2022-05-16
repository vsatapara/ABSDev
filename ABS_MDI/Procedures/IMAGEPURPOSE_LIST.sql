CREATE OR REPLACE PROCEDURE abs_mdi."IMAGEPURPOSE_LIST" 
(
    Output_Data OUT SYS_REFCURSOR
)
AS
BEGIN
OPEN Output_Data FOR
    SELECT
        "ImagePurposeId",
        "Name",
        "PreferredPixelsWidth",
        "PreferredPixelHeight",
        "IsActive",
        "CreatedBy",
        "CreatedDate",
        "ModifiedBy",
        "ModifiedDate"
    FROM
        "ImagePurpose";
END ImagePurpose_List;
/