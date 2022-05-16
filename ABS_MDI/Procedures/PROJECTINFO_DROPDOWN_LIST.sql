CREATE OR REPLACE PROCEDURE abs_mdi."PROJECTINFO_DROPDOWN_LIST" (
    UserId             IN   VARCHAR2,
    CompanyId          IN   NUMBER,
    PermissionGroupId  IN   NUMBER,
    WindExposure_Data  OUT  SYS_REFCURSOR,
    SnowExposure_Data  OUT  SYS_REFCURSOR,
    SiteClass_Data     OUT  SYS_REFCURSOR,
    RiskCategory_Data  OUT  SYS_REFCURSOR,
    Customer_Data      OUT  SYS_REFCURSOR,
    Output_Boundry     OUT  SYS_REFCURSOR
) AS
    UserDetailId  NUMBER;
    TotalCount    NUMBER;
    CustomerNo    NUMBER;
BEGIN
    OPEN WindExposure_Data FOR SELECT
                                   "WindExposureId",
                                   "Name",
                                   "SortOrder",
                                   "IsDefault",
                                   "IsCanadian",
                                   "ExposureFactor"
                               FROM
                                   "CLM_WindExposures"
                               WHERE
                                   "IsActive" = 'Y'
                               ORDER BY
                                   "SortOrder";
    OPEN SnowExposure_Data FOR SELECT
                                  se."SnowExposureId",
                                  se."SortOrder",
                                  se."IsDefault",
                                  se."Name",
                                  se."IsCanadian"
                              FROM
                                  "CLM_SnowExposures" se
                              WHERE
                                  se."IsActive" = 'Y'
                              ORDER BY
                                  "SortOrder";
    OPEN SiteClass_Data FOR SELECT
                               sc."SiteClassId",
                               sc."SortOrder",
                               sc."IsDefault",
                               sc."Name"
                           FROM
                               "CLM_SiteClasses" sc
                           WHERE
                               sc."IsActive" = 'Y'
                           ORDER BY
                               "SortOrder";
    OPEN RiskCategory_Data FOR SELECT
                                  rc."RiskCategoryId",
                                  rc."Name",
                                  rc."SortOrder",
                                  rc."IsDefault",
                                  rc."IsAvailableForCanada"
                              FROM
                                  "CLM_RiskCategory" rc
                              WHERE
                                  rc."IsActive" = 'Y'
                              ORDER BY
                                  rc."SortOrder";
    SELECT
        NVL("CustomerNo", 0),
        "UserDetailId"
    INTO
        CustomerNo,
        UserDetailId
    FROM
        "USR_UserDetail"
    WHERE
            "UserId" = UserId
        AND ROWNUM = 1
        AND "IsDelete" = 'N';
    IF CustomerNo = 0 THEN
        BEGIN
            OPEN Customer_Data FOR SELECT
                                       "CustomerNo",
                                       "CustomerName"
                                   FROM
                                            "USR_Brand_Customer"
                                       INNER JOIN "Customer" ON "CustomerID" = "CustomerId"
                                                                AND "UserDetailId" = UserDetailId
                                                                AND "BrandId" = CompanyId order by "CustomerName";
        END;
    ELSE
        BEGIN
            OPEN Customer_Data FOR SELECT
                                       "CustomerNo",
                                       "CustomerName"
                                   FROM
                                       "Customer"
                                   WHERE
                                       "CustomerNo" = CustomerNo order by "CustomerName";
        END;
    END IF;
    OPEN Output_Boundry FOR SELECT
                               PI."SectionText",
                               NVL(PI."SelectionText", ' ') "SelectionText",
                               BAS."IsAvailable",
                               "MinValue",
                               "MaxValue"
                           FROM
                               "BuilderAccessSection"   BAS,
                               "BuilderAccessPermission",
                               "USR_PER_BuilderAccess"  UPB,
                               "PermissionItems"        PI
                           WHERE
                                   BAS."BuilderAccessPermissionId" = "BuilderAccessPermission"."BuilderAccessPermissionId"
                               AND UPB."BuilderAccessPermissionId" = BAS."BuilderAccessPermissionId"
                               AND PI."SelectiveId" = BAS."SectionId"
                               AND UPB."UserDetailId" = UserDetailId
                               AND "BrandId" = CompanyId
                               AND UPB."PermissionGroupId" = PermissionGroupId;
END PROJECTINFO_DROPDOWN_LIST;
/