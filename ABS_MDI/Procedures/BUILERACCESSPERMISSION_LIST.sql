CREATE OR REPLACE PROCEDURE abs_mdi."BUILERACCESSPERMISSION_LIST" (
  BuilderAccessPermissionId IN NUMBER, 
  output_Data OUT SYS_REFCURSOR
) 
AS 
BEGIN 
IF (BuilderAccessPermissionId = 0)
THEN 
    OPEN Output_Data FOR 
        SELECT 
            0 "BuilderAccessSectionId", 
            0 "BuilderAccessPermissionId", 
            "SelectiveId" "SectionId", 
            "SectionText", 
            NVL("SelectionText", ' ') "SelectionText", 
            'N' "IsAvailable", 
            0 "MinValue", 
            0 "MaxValue", 
            "SelectiveTab" 
        FROM 
        "PermissionItems";
ELSE 
     OPEN Output_Data FOR 
        SELECT 
            BAS."BuilderAccessSectionId", 
            BAS."BuilderAccessPermissionId", 
            BAS."SectionId", 
            PA."SectionText", 
            NVL(PA."SelectionText", ' ') as "SelectionText", 
            BAS."IsAvailable", 
            BAS."MinValue", 
            BAS."MaxValue", 
            BAS."SelectiveTab" 
        FROM 
            "BuilderAccessSection" BAS 
        LEFT JOIN "PermissionItems" PA ON BAS."SectionId" = PA."SelectiveId" 
        WHERE 
        BAS."BuilderAccessSectionId" = "BuilderAccessSectionId";
END IF;
END BUILERACCESSPERMISSION_LIST;
/