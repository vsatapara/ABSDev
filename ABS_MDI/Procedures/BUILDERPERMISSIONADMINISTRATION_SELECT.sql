CREATE OR REPLACE PROCEDURE abs_mdi."BUILDERPERMISSIONADMINISTRATION_SELECT" 
(
BuilderAccessPermissionId IN NUMBER,
OUTPUT_DATA OUT SYS_REFCURSOR,
OUTPUT_DATAPERMISSION OUT SYS_REFCURSOR,
OUTPUT_DATABUILDERACCESSBRAND OUT SYS_REFCURSOR
)
AS 
BEGIN
   OPEN OUTPUT_DATA FOR 
        SELECT 
            "BuilderAccessPermissionId",
            "GroupName",
            "IsActive",
            "PredefineTemplateId",
            "IpAddress",
            "IsInternal",
            "IsExternal",
            "ProjectBuildingType"
    FROM
    "BuilderAccessPermission"
    WHERE "BuilderAccessPermissionId"=BuilderAccessPermissionId;
    
    /*IF (BuilderAccessPermissionId = 0)
THEN 
     OPEN OUTPUT_DATAPERMISSION FOR 
        SELECT 
            0 "BuilderAccessSectionId", 
            0 "BuilderAccessPermissionId", 
            "SelectiveId" "SectionId", 
            "SectionText", 
            NVL("SelectionText", ' ') "SelectionText", 
            'N' "IsAvailable", 
            0 "MinValue", 
            0 "MaxValue", 
            "SelectiveTab",
            "IsFeetInchFormat"
        FROM 
        "PermissionItems" ORDER By "DisplayOrder";
ELSE 
      OPEN OUTPUT_DATAPERMISSION FOR 
        SELECT 
            BAS."BuilderAccessSectionId", 
            BAS."BuilderAccessPermissionId", 
            BAS."SectionId", 
            PA."SectionText", 
            NVL(PA."SelectionText", ' ') as "SelectionText", 
            BAS."IsAvailable", 
            BAS."MinValue", 
            BAS."MaxValue", 
            BAS."SelectiveTab",
            BAS."IpAddress",
            PA."IsFeetInchFormat"
        FROM 
            "BuilderAccessSection" BAS 
        LEFT JOIN "PermissionItems" PA ON BAS."SectionId" = PA."SelectiveId" 
        WHERE 
        BAS."BuilderAccessPermissionId" = BuilderAccessPermissionId ORDER By "DisplayOrder";
END IF;*/
     
     OPEN OUTPUT_DATAPERMISSION FOR 
            SELECT 
            NVL(BAS."BuilderAccessSectionId",0) "BuilderAccessSectionId", 
            NVL(BAS."BuilderAccessPermissionId",0) "BuilderAccessPermissionId", 
            NVL(BAS."SectionId",PA."SelectiveId") "SectionId", 
            PA."SectionText", 
            NVL(PA."SelectionText", ' ') as "SelectionText", 
            NVL(BAS."IsAvailable",'N') "IsAvailable",
            NVL(BAS."MinValue",0) "MinValue" ,
            NVL(BAS."MaxValue",0) "MaxValue", 
            PA."SelectiveTab",
            BAS."IpAddress",
            PA."IsFeetInchFormat"
        FROM 
           "PermissionItems" PA 
        LEFT JOIN "BuilderAccessSection" BAS ON BAS."SectionId" = PA."SelectiveId" AND  BAS."BuilderAccessPermissionId" = BuilderAccessPermissionId
        ORDER By "DisplayOrder";
        
    OPEN OUTPUT_DATABUILDERACCESSBRAND FOR     
     SELECT 
            BA."BuilderAccessBrandId",
            BA."BuilderAccessPermissionId",
            BA."CompanyId"
        FROM 
            "BuilderAccessBrands" BA where BA."BuilderAccessPermissionId" = BuilderAccessPermissionId;    
END BUILDERPERMISSIONADMINISTRATION_SELECT;
/