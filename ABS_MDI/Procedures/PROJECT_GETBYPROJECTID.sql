CREATE OR REPLACE PROCEDURE abs_mdi."PROJECT_GETBYPROJECTID" (
    ProjectId     IN   VARCHAR2,
    OUTPUT_TABLE  OUT  SYS_REFCURSOR
) AS
BEGIN
    OPEN OUTPUT_TABLE FOR SELECT
                              P."ProjectId",
                              P."ProjectName",
                              P."IsActive",
                              P."IsDelete",
                              P."CreatedDate",
                              P."ModifiedBy",
                              P."ModifiedDate",
                              P."BuildingsCount",
                              P."BuildingLocation",
                              P."ProjectStatusId",
                              P."ExpiryDate",
                              P."Price",
                              P."UserId",
                              p."UserType", -- For Internal / External
                              P."CreatedBy",
                              P."IpAddress",
                              P."ProjectUseId",
                              P."RiskCategoryId",
                              P."CityLimit",
                              P."MaterialOriginId",
                              TColor."ItemText"   AS "steel_origin",
                              P."Address1",
                              P."Address2",
                              P."City",
                              P."Region",
                              P."State",
                              P."Country",
                              P."ZipPostalCode",
                              P."QuoteRequestDate",
                              P."PriceStatus",
                              P."Latitude",
                              P."Longitude",
                              P."DesignCodeId",
                              P."DesignCodeName",
                              P."ProjectUseCategoryid",
                              P."WindSpeed",
                              P."WindExposureId",
                              P."IsHurricaneCoastline",
                              P."LiveLoad",
                              P."IsLiveLoadReductionAllowed",
                              P."GroundSnow",
                              P."SnowExposureId",
                              P."MinimumSnowLoad",
                              P."Elevation",
                              P."RainIntensity",
                              P."SustainablilityGoalId",
                              P."IsClimateControlled",
                              P."EnergyEfficiencyId",
                              P."IsAirInfiltrationRequired",
                              P."CustomerNo",
                              P."SeismicSa",
                              P."SeismicS1",
                              P."SeismicSnowLoad",
                              P."SeismicSnowPercentage",
                              P."SiteClassId",
                              P."InputDimensional",
                              P."InputEngineering",
                              P."OutputDimensional",
                              P."OutputEngineering",
                              P."CurrencyDimensional",
                              P."IsCanadaBasedDesignCode",
                              P."IsDesignCodeIbc2012Based",
                              P."RainLoad",
                              P."SeismicSa1Dot0",
                              P."SeismicSa2Dot0",
                              P."WindLoad",
                               P."WindLoadType",
                              P."IsUserDefinedSustainability",
                              P."UserDefinedSustainability",
                              T."ItemText"           AS "ProjectStatus",
                              T1."ItemText"          AS "ProjectUse",
                              T2."ItemText"          AS "Sustainable",
                              T3."ItemText"          AS "EnergyEfficiencyCode",
                              wind."Name"            AS "WindExposure",
                              snow."Name"            AS "SnowExposure",
                              classes."Name"         AS "SiteClass",
                              riskCategory."Name"    AS "RiskCategory",
                              P."CompanyId",
                              P."SeismicUseCategory"
                          FROM
                                   "Project" P
                            LEFT JOIN "TableOfTables"      T ON P."ProjectStatusId" = T."Id"
                            LEFT JOIN "TableOfTables"      T1 ON P."ProjectUseId" = T1."Id"
                            LEFT JOIN "TableOfTables"      T2 ON P."SustainablilityGoalId" = T2."Id"
                            LEFT JOIN "TableOfTables"      T3 ON P."EnergyEfficiencyId" = T3."Id"
                            LEFT JOIN "CLM_WindExposures"  wind ON wind."WindExposureId" = P."WindExposureId"
                            LEFT JOIN "CLM_SnowExposures"  snow ON snow."SnowExposureId" = P."SnowExposureId"
                            LEFT JOIN "CLM_SiteClasses"    classes ON classes."SiteClassId" = P."SiteClassId"
                            LEFT JOIN "CLM_RiskCategory"   riskCategory ON riskCategory."RiskCategoryId" = P."RiskCategoryId"
                             LEFT JOIN "TableOfTables"      TColor ON P."MaterialOriginId" = TColor."Id"
                          WHERE
                              P."ProjectId" IN 
                              (
                                  SELECT
                                      regexp_substr(ProjectId, '[^,]+', 1, level)
                                  FROM
                                      dual
                                  CONNECT BY
                                      regexp_substr(ProjectId, '[^,]+', 1, level) IS NOT NULL
                              )
                              AND (P."IsDelete" IS NULL  OR P."IsDelete" != 'Y');
END;
/