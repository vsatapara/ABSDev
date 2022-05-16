CREATE OR REPLACE PROCEDURE abs_mdi."FRAMETYPE_LIST" (
    ProjectId IN NUMBER,
    UserId IN VARCHAR2,
    Output_DataFrame OUT SYS_REFCURSOR,
    Output_DataBuilding OUT SYS_REFCURSOR,
    Output_Boundry OUT SYS_REFCURSOR
)
AS 
CompanyId number DEFAULT NULL;
CustomerNo Varchar2(50) DEFAULT NULL;
BuilderAccessPermissionId number DEFAULT NULL;
Projects number DEFAULT NULL;
UserDetailId NUMBER(10) DEFAULT 0;
L_COUNT NUMBER(5);
BEGIN
    select Count(*) INTO Projects from "Project" where "ProjectId" = ProjectId;
    
    SELECT	COUNT(*) INTO L_COUNT FROM "USR_UserDetail" WHERE "UserId" = UserId AND ROWNUM = 1;
    
    IF(L_COUNT>0)
    THEN
        SELECT "UserDetailId" into UserDetailId FROM "USR_UserDetail" WHERE "UserId" = UserId AND rownum=1 and "IsDelete"='N' ORDER BY "UserDetailId" DESC;
    END IF;
    
    IF Projects > 0 THEN
        select "CustomerNo" INTO CustomerNo from "Project" where "ProjectId" = ProjectId;
       
        select "CompanyId" INTO CompanyId from "Customer" where "CustomerNo" = CustomerNo;
    
        select "BuilderAccessPermissionId" INTO BuilderAccessPermissionId from (select "BuilderAccessPermissionId" from "BuilderAccessBrands" where "CompanyId" = CompanyId ORDER BY "BuilderAccessPermissionId" ASC) where rownum = 1;
    
        OPEN Output_DataFrame FOR 
            select "SelectionText" from "BuilderAccessSection" b LEFT JOIN  "PermissionItems" p ON b."SectionId"= p."SelectiveId" where b."BuilderAccessPermissionId" = BuilderAccessPermissionId and b."SectionId" IN(273,274,275,276) and B."IsAvailable" = 'Y';
   
        OPEN Output_DataBuilding FOR 
            select b."SectionId",b."MinValue",b."MaxValue",p."SectionText" 
            from "BuilderAccessSection" b LEFT JOIN  "PermissionItems" p ON b."SectionId"= p."SelectiveId" 
            where b."BuilderAccessPermissionId" = BuilderAccessPermissionId and b."SectionId" IN(211,212,213,214,215,216,217);
        
        OPEN Output_Boundry FOR   
            SELECT
                PI."SectionText",   
                "MinValue",
                "MaxValue"
            FROM
                "BuilderAccessSection" BAS,"BuilderAccessPermission", "USR_PER_BuilderAccess" UPB, "PermissionItems" PI
            WHERE BAS."BuilderAccessPermissionId" =  "BuilderAccessPermission"."BuilderAccessPermissionId"  
            AND UPB."BuilderAccessPermissionId" = BAS."BuilderAccessPermissionId"
            AND PI."SelectiveId" = BAS."SectionId"
            AND UPB."UserDetailId"=UserDetailId and "BrandId"=1;
  
    END IF;
END FrameType_List;
/