CREATE OR REPLACE PROCEDURE abs_mdi."PROJECT_SELECT" (
    ProjectId     IN   NUMBER,
    Project_Data  OUT  SYS_REFCURSOR
) AS
BEGIN
    OPEN Project_Data FOR SELECT
                              P."ProjectId",
                              P."ProjectName",
                              P."ProjectUseId",
                              P."RiskCategoryId",
                              P."CityLimit",
                              P."ProjectStatusId",
                              P."MaterialOriginId",
                              P."Address1",
                              P."Address2",
                              P."City",
                              P."Region",
                              P."State",
                              P."ZipPostalCode",
                              P."Country",
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
                              SC."Name",
                              P."CustomerNo",
                              CASE
                                  WHEN P."CustomerNo" = '0' THEN
                                      NULL
                                  ELSE
                                      ( CS."CustomerNo"
                                        || ' - '
                                        || CS."CustomerName" )
                              END  AS "CustomerName",
                              P."CBBInquiryNumber",
                              P."MinAnchorRodDiameter",
                              P."TDIRequired",
                              P."UsingSystemGeneratedRodPlan",
                              P."EnteredBy",
                              p."UserRoleId",
                              P."ProjectStage",
                              CS."EnforceSignatureRule",
                              P."PGASeismic",
                              P."IsOverrideSeismicSa",
                              P."IsOverrideSeismicS1",
                              P."IsOverrideSeismicSa1Dot0",
                              P."IsOverrideSeismicSa2Dot0",
                              P."IsOverrideWindSpeed",
                              P."IsOverrideWindLoad",
                              P."IsOverrideLiveLoad",
                              P."IsOverrideGroundSnow",
                              P."IsOverrideRainIntensity",
                              P."IsOverrideRainLoad",
                              P."IsOverridePGASeismic",
                              P."IsProjectPriced",
                              CASE
                                  WHEN P."ProjectBuildingType" = 1    THEN
                                      'Express'
                                  WHEN P."ProjectBuildingType" = 2    THEN
                                      'Standard'
                                  ELSE
                                      ''
                              END  AS "ProjectBuildingType"
                          FROM
                              "Project"          P
                              LEFT JOIN "CLM_SiteClasses"  SC ON P."SiteClassId" = SC."SiteClassId"
                              LEFT JOIN "Customer"         CS ON CS."CustomerNo" = P."CustomerNo"
                          WHERE
                              P."ProjectId" = ProjectId;
END Project_Select;
/