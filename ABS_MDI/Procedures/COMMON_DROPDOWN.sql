CREATE OR REPLACE PROCEDURE abs_mdi."COMMON_DROPDOWN" 
(
 Action IN VARCHAR2,
 Id IN NUMBER,
 Output_Data OUT SYS_REFCURSOR
) AS 
BEGIN
  IF Action = 'BuilderAccessPermissionTemplate' THEN
    IF Id=0 THEN
        OPEN Output_Data FOR
        SELECT
            "BuilderAccessPermissionId" "ItemId",
            "GroupName" "ItemText"
        FROM  "BuilderAccessPermission";
    ELSE
        OPEN Output_Data FOR
        SELECT
            "BuilderAccessPermissionId" "ItemId",
            "GroupName" "ItemText"
        FROM  "BuilderAccessPermission" 
        WHERE "BuilderAccessPermissionId" NOT IN(Id);
    END IF;
  END IF;
END COMMON_DROPDOWN;
/