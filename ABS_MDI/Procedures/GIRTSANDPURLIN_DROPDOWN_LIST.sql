CREATE OR REPLACE PROCEDURE abs_mdi."GIRTSANDPURLIN_DROPDOWN_LIST" 
(
    ProjectId IN NUMBER,
    UserId IN VARCHAR2 DEFAULT NULL,
    GirtsAndPurlinStyle_Data OUT SYS_REFCURSOR,
    GirtsDepth_Data OUT SYS_REFCURSOR,
    PurlinDepth_Data OUT SYS_REFCURSOR,
    Boundary_Data OUT SYS_REFCURSOR
)
AS 
Projects number DEFAULT NULL;
UserDetailId NUMBER(10) DEFAULT 0;
L_COUNT NUMBER(5);
BEGIN
OPEN GirtsAndPurlinStyle_Data FOR SELECT 
        "StyleId" AS Id,
        "StyleName" AS Name,
        '' AS Value
        FROM "GirtsAndPurlinStyle"
        ORDER BY Id;
OPEN GirtsDepth_Data FOR SELECT 
        "DepthId" AS Id,
        "DepthName" AS Name,
        "DepthValue" AS Value
        FROM "GirtsAndPurlinDepth"
        WHERE "IsForGirts" =1
        ORDER BY Id;
OPEN PurlinDepth_Data FOR SELECT 
        "DepthId" AS Id,
        "DepthName" AS Name,
        "DepthValue" AS Value
        FROM "GirtsAndPurlinDepth"
        ORDER BY Id;
---Get Boundary to Validate
    select Count(*) INTO Projects from "Project" where "ProjectId" = ProjectId;
    
    SELECT	COUNT(*) INTO L_COUNT FROM "USR_UserDetail" WHERE "UserId" = UserId AND ROWNUM = 1;
    
    IF(L_COUNT>0)
    THEN
        SELECT "UserDetailId" into UserDetailId FROM "USR_UserDetail" WHERE "UserId" = UserId AND rownum=1 and "IsDelete"='N' ORDER BY "UserDetailId" DESC;
    END IF;
    
    IF Projects > 0 THEN
        OPEN Boundary_Data FOR  
            SELECT
                BAS."SectionId",
                PI."SectionText",   
                "MinValue",
                "MaxValue"
            FROM
                "BuilderAccessSection" BAS,"BuilderAccessPermission", "USR_PER_BuilderAccess" UPB, "PermissionItems" PI
            WHERE BAS."BuilderAccessPermissionId" =  "BuilderAccessPermission"."BuilderAccessPermissionId"  
            AND UPB."BuilderAccessPermissionId" = BAS."BuilderAccessPermissionId"
            AND PI."SelectiveId" = BAS."SectionId"
            AND UPB."UserDetailId"=UserDetailId and "BrandId"=1
            and BAS."SectionId" IN(227,218,219);
    END IF;
    
END GirtsAndPurlin_DROPDOWN_LIST;
/