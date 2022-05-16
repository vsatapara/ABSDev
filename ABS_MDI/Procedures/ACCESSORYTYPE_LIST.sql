CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORYTYPE_LIST" (
    ProjectId        IN   NUMBER,
    RoleId           IN   NUMBER,
    UserDetailId     IN   NUMBER,
    Output_Data      OUT  SYS_REFCURSOR,
    EAT_Output_Data  OUT  SYS_REFCURSOR
) AS
    CompanyId                  NUMBER;
    RegionName                 VARCHAR2(20);
    GeoRegionId                NUMBER;
    BuilderAccessPermissionId  NUMBER;
BEGIN
    SELECT
        "CompanyId",
        "State"
    INTO
        CompanyId,
        RegionName
    FROM
        "Project"
    WHERE
        "ProjectId" = ProjectId;
    BEGIN
        SELECT
            "GeoRegionId"
        INTO GeoRegionId
        FROM
            "GeoRegions"
        WHERE
                Lower("Name") = Lower(RegionName)
            AND "IsDelete" = 'N'
            AND ROWNUM = 1;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            SELECT
                "GeoRegionId"
            INTO GeoRegionId
            FROM
                "GeoRegions"
            WHERE
                ROWNUM = 1;
    END;
    OPEN Output_Data FOR SELECT
                            "Project"."ProjectName",
                            "AccessoryTypeId",
                            "Name",
                            "ParentId",
                            "Project"."UserRoleId",
                            CASE
                                WHEN "Project"."ProjectBuildingType" = 1    THEN
                                    'Express'
                                WHEN "Project"."ProjectBuildingType" = 2    THEN
                                    'Standard'
                                ELSE
                                    ''
                            END AS "ProjectBuildingType"
                        FROM
                            "AccessoryType",
                            "Project"
                        WHERE
                            "AccessoryTypeId" NOT IN (
                                SELECT
                                    "AccessoryId"
                                FROM
                                    "AccessoryExclusionZone"
                                WHERE
                                        "CompanyId" = CompanyId
                                    AND "GeoRegionId" = GeoRegionId
                                    AND "IsExcluded" = 'Y'
                            )
                            AND "Project"."ProjectId" = ProjectId
                        ORDER BY
                            "DisplayOrder" ASC;
    SELECT
        "BuilderAccessPermissionId"
    INTO BuilderAccessPermissionId
    FROM
        "USR_PER_BuilderAccess"
    WHERE
            "PermissionGroupId" = RoleId
        AND "UserDetailId" = UserDetailId
        AND "BrandId" = CompanyId;
    OPEN EAT_Output_Data FOR SELECT
                                PI."SectionText" AS "ExcludedTypes"
                            FROM
                                     "PermissionItems" PI
                                INNER JOIN "BuilderAccessSection" BAS ON PI."SelectiveId" = BAS."SectionId"
                                                                         AND PI."SelectiveId" > 194
                                                                         AND PI."SelectiveId" < 211
                                                                         AND BAS."BuilderAccessPermissionId" = BuilderAccessPermissionId
                                                                         AND "IsAvailable" = 'N';
END ACCESSORYTYPE_LIST;
/