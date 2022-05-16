CREATE OR REPLACE PROCEDURE abs_mdi."BUILDINGINPUTINIT" (
    ProjectId                           IN   NUMBER,
    UserId                              IN   VARCHAR2,
    CompanyId                           IN   NUMBER,
    PermissionGroupId                   IN   NUMBER,
    Output_Frame                        OUT  SYS_REFCURSOR,
    Output_Building                     OUT  SYS_REFCURSOR,
    Output_BuildingList                 OUT  SYS_REFCURSOR,
    Output_Boundry                      OUT  SYS_REFCURSOR,
    Output_Project                      OUT  SYS_REFCURSOR,
    Output_Insulation                   OUT  SYS_REFCURSOR,
    Output_InsulationMaster             OUT  SYS_REFCURSOR,
    Output_InsulationAccessories        OUT  SYS_REFCURSOR,
    Output_InsulationAccessoriesMaster  OUT  SYS_REFCURSOR
) AS
--CompanyId number DEFAULT NULL;
--CustomerNo Varchar2(50) DEFAULT NULL;
        BuilderAccessPermissionId  NUMBER DEFAULT NULL;
--Projects number DEFAULT NULL;
        UserDetailId               NUMBER(10) DEFAULT 0;
    L_COUNT                    NUMBER(5);
BEGIN
   --select Count(*) INTO Projects from "Project" where "ProjectId" = ProjectId;
    
            SELECT
        COUNT(*)
    INTO L_COUNT
    FROM
        "USR_UserDetail"
    WHERE
            "UserId" = UserId
        AND ROWNUM = 1;
    IF ( L_COUNT > 0 ) THEN
        SELECT
            "UserDetailId"
        INTO UserDetailId
        FROM
            "USR_UserDetail"
        WHERE
                "UserId" = UserId
            AND ROWNUM = 1
            AND "IsDelete" = 'N'
        ORDER BY
            "UserDetailId" DESC;
    END IF;
    
    
    
    --IF Projects > 0 THEN
        --select "CustomerNo" INTO CustomerNo from "Project" where "ProjectId" = ProjectId;
       
        --select "CompanyId" INTO CompanyId from "Customer" where "CustomerNo" = CustomerNo;
    
        --select "BuilderAccessPermissionId" INTO BuilderAccessPermissionId from (select "BuilderAccessPermissionId" from "BuilderAccessBrands" where "CompanyId" = CompanyId and   ORDER BY "BuilderAccessPermissionId" ASC) where rownum = 1;
    
                SELECT
        "BuilderAccessPermissionId"
    INTO BuilderAccessPermissionId
    FROM
        "USR_PER_BuilderAccess"
    WHERE
            "BrandId" = CompanyId
        AND "PermissionGroupId" = PermissionGroupId
        AND "UserDetailId" = UserDetailId
        AND ROWNUM = 1;
    OPEN Output_Frame FOR SELECT
                             "SelectionText"
                         FROM
                             "BuilderAccessSection"  b
                             LEFT JOIN "PermissionItems"       p ON b."SectionId" = p."SelectiveId"
                         WHERE
                                 b."BuilderAccessPermissionId" = BuilderAccessPermissionId
                             AND p."SectionText" IN ( 'Frame Type' )
                             AND B."IsAvailable" = 'Y';
    OPEN Output_Building FOR SELECT
                                b."SectionId",
                                b."MinValue",
                                b."MaxValue",
                                p."SectionText"
                            FROM
                                "BuilderAccessSection"  b
                                LEFT JOIN "PermissionItems"       p ON b."SectionId" = p."SelectiveId"
                            WHERE
                                    b."BuilderAccessPermissionId" = BuilderAccessPermissionId
                                AND p."SelectiveTab" = 'Boundaries'
                                AND p."SectionText" IN ( 'Building Width :: Gable, Clear Span', 'Building Width :: Gable, Muilti Span',
                                                         'Building Width :: Mono Slope, Clear Span',
                                                         'Building Width :: Mono Slope, Multi Span',
                                                         'Building Length',
                                                         'Eave Height',
                                                         'Roof Pitch' );
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
    OPEN Output_Project FOR SELECT
                               P."ProjectId",
                               P."ProjectName",
                               P."Country",
                               P."State",
                               P."DesignCodeName",
                               (select "ItemText" from "TableOfTables" where "Id" = P."ProjectUseId") "ProjectUse",
                               CASE
                                   WHEN NVL(P."IsCanadaBasedDesignCode", 'N') = 'Y' THEN
                                       1
                                   ELSE
                                       0
                               END                           "IsCountryCanada",
                               CASE
                                   WHEN NVL(P."PriceStatus", ' ') = 'ForQuoteRequest' THEN
                                       1
                                   ELSE
                                       0
                               END                           "ForQuote",
                               NVL(P."WindLoad", 0)          "WindLoad",
                               NVL(P."GroundSnow", 0)        "GroundSnow"
                           FROM
                               "Project" P
                           WHERE
                               P."ProjectId" = ProjectId;
    OPEN Output_Insulation FOR SELECT
                                  "InsulationId",
                                  "BuildingNumber",
                                  "ElevationOnSW1",
                                  "ElevationOnSW2",
                                  "ElevationOnEW3",
                                  "ElevationOnEW4",
                                  "ElevationOnRoof",
                                  "Facing",
                                  "Tabs",
                                  "RoofThick",
                                  "WallThick",
                                  "RoofSqft",
                                  "WallSqft",
                                  "StarterRoll",
                                  "RunningRoll",
                                  "FinishRoll",
                                  "Weight",
                                  "Price",
                                  "IsPriced",
                                  "ErrorCode",
                                  "ThickRoofInsulation",
                                  "InsulationType",
                                  "IncludeTape",
                                  "IncludeStaples",
                                  "ElevationOnPartition",
                                  "PartitionNumber",
                                  "ElevationOnEaveStrut",
                                  "SealedTapeTab",
                                  "FromWall",
                                  "DesignedRValue",
                                  "ByManufacturer",
                                  "OverPurlinGirt",
                                  "CavityPurlinBracable",
                                  "DesignedFacing",
                                  "Markup"
                              FROM
                                  "Insulation"
                              WHERE
                                  "BuildingNumber" IN (
                                      SELECT
                                          "BuildingInformationId"
                                      FROM
                                          "BuildingInformation"
                                      WHERE
                                          "ProjectId" = ProjectId and  "IsDelete" = 'N'
                                  )
                                  AND "IsDelete" = 'N';
    OPEN Output_InsulationMaster FOR SELECT
                                        "Id",
                                        "Facing",
                                        CASE WHEN INSTR("Facing",' R',-1) = 0 THEN "Facing" ELSE TRIM(SUBSTR("Facing",0,INSTR("Facing",' R',-1))) END "SeparatedFacing",
                                        "Thickness",
                                        CONCAT(CONCAT(CONCAT(CONCAT(CONCAT("Thickness",'" '),'('),'R'),"RValue"),')') "NewThickness",
                                        "RValue",
                                        "Weight",
                                        "ForRoof",
                                        "ForWall",
                                        "MaxSF1",
                                        "MaxSF2",
                                        "MaxSF3",
                                        "MaxSF4",
                                        "MaxSF5",
                                        "MaxSF6",
                                        "MaxSF7",
                                        "BaseCost1",
                                        "BaseCost2",
                                        "Sell1",
                                        "Sell2",
                                        "Sell3",
                                        "Sell4",
                                        "Sell5",
                                        "Sell6",
                                        "Sell7",
                                        "GroupID",
                                        "IsCanada"
                                    FROM
                                        "InsulationMaster"
                                    WHERE
                                        "IsDelete" = 'N'
                                    ORDER BY
                                        "GroupID",
                                        "Facing";
    OPEN Output_InsulationAccessories FOR SELECT
                                             "InsulationAccessoriesId",
                                             "BuildingNumber",
                                             "ItemNumber",
                                             "Quantity",
                                             "Description",
                                             "Facing",
                                             "Width",
                                             "Weight",
                                             "Price",
                                             "IsPriced",
                                             "ErrorCode",
                                             "InsulationType"
                                         FROM
                                             "InsulationAccessories"
                                         WHERE
                                                 "IsDelete" = 'N'
                                             AND "BuildingNumber" IN (
                                                 SELECT
                                                     "BuildingInformationId"
                                                 FROM
                                                     "BuildingInformation"
                                                 WHERE
                                                     "ProjectId" = ProjectId and  "IsDelete" = 'N'
                                             );
    OPEN Output_InsulationAccessoriesMaster FOR SELECT
                                                   "Id",
                                                   "ItemNumber",
                                                   "Supplier",
                                                   "Description",
                                                   "Price",
                                                   "Weight",
                                                   "CostType",
                                                   "IsCanada",
                                                   "IsDelete"
                                               FROM
                                                   "InsulationAccessoriesMaster"
                                               WHERE
                                                   "IsDelete" = 'N';
    OPEN Output_BuildingList FOR SELECT
                                    "BuildingInformationId",
                                    "BuildingName",
                                    "BuildingLabel",
                                     NVL("Structure",'') AS "Structure"
                                FROM
                                    "BuildingInformation"
                                WHERE
                                        "ProjectId" = ProjectId
                                    AND "IsDelete" != 'Y';
                                    
        
    --END IF;
END BuildingInputInit;
/