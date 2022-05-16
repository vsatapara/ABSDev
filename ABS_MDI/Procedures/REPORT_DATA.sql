CREATE OR REPLACE PROCEDURE abs_mdi."REPORT_DATA" (
    ProjectId IN NUMBER,
  
     Output_Project_Data OUT SYS_REFCURSOR,
     Output_Project_Shipping_Data OUT SYS_REFCURSOR,
     Output_Building_Data OUT SYS_REFCURSOR,
     Output_SystemVersion_Data  OUT SYS_REFCURSOR,
     Output_AddLinesCount_Data  OUT SYS_REFCURSOR
)
AS
BEGIN

    OPEN Output_Project_Data FOR Select prj."ProjectId",prj."ProjectName",status."ItemText" as "ProjectStatus",Use."ItemText" as "ProjectUse",RiskCategory."Name" as "RiskCategory",MaterialOrigin."ItemText" as "MaterialOrigin" ,
                                prj."Address1",to_char(prj."QuoteRequestDate",'MM/DD/YYYY') "QuoteRequestDate",prj."CityLimit",prj."PriceStatus",prj."DesignCodeName",prj."WindSpeed",WindExposure."Name" as "WindExposure",prj."IsHurricaneCoastline",prj."LiveLoad",prj."IsLiveLoadReductionAllowed",
                                prj."GroundSnow",SnowExposure."Name" as "SnowExposure",prj."MinimumSnowLoad",prj."Elevation",prj."RainIntensity",SustainabilityGoal."ItemText" as "SustainabilityGoal",prj."IsClimateControlled",
                                EnergyEfficiency."ItemText" as EnergyEfficiency,prj."IsAirInfiltrationRequired",prj."CustomerNo",prj."SeismicSa",prj."SeismicS1",prj."SeismicSnowLoad",prj."SeismicSnowPercentage",prj."InputDimensional",
                                prj."InputEngineering",prj."OutputDimensional",prj."OutputEngineering",prj."CurrencyDimensional",prj."IsCanadaBasedDesignCode",prj."IsDesignCodeIbc2012Based",prj."RainLoad",prj."SeismicSa1Dot0",
                                prj."SeismicSa2Dot0",prj."WindLoad",prj."IsUserDefinedSustainability",prj."UserDefinedSustainability",prj."CompanyId",prj."CBBInquiryNumber",prj."MinAnchorRodDiameter",prj."TDIRequired",prj."UsingSystemGeneratedRodPlan",
                                prj."Address2",prj."Country",ProjectUseCategory."ItemText" as ProjectUseCategory,prj."Region",SiteClass."Name" as "SiteClass",
                                prj."EnteredBy",
                                prj."IsProjectPriced",
                                 to_char(prj."PriceDate",'MM-DD-YYYY') "PriceDate" ,
                                  prj."Country",
                                  prj."ProjectStage",
                               CASE WHEN Company."CompanyCode" = 'Cecopro'
                                    THEN (SELECT "Price" FROM "M_EDSPrice_Program_MiscPricing" WHERE "ID"=3003)
                                WHEN Company."CompanyCode" = 'Optima' 
                                    THEN (SELECT "Price" FROM "M_EDSPrice_Program_MiscPricing" WHERE "ID"=96)
                                WHEN Company."CompanyCode" = 'Star'
                                    THEN (SELECT "Price" FROM "M_EDSPrice_Program_MiscPricing" WHERE "ID"=3001)
                                WHEN Company."CompanyCode" = 'Robertson' 
                                    THEN (SELECT "Price" FROM "M_EDSPrice_Program_MiscPricing" WHERE "ID"=3002)
                                ELSE 1 
                                END AS "PricingGeneralMarkup",
                                CL_Settings."SeaLevelElevation" "IsSeaLevelElevation",
                                prj."City",
                                prj."ZipPostalCode",
                                prj."State",
                                CLM_DesignCodes."IsIBC2012Based",
                                CLM_DesignCodes."Edition",
                                CLM_DesignCodes."Code",
                                NVL((select NVL("Incomplete",1) from "EDSPrice_ProcessingResults" where "ProjectId"=ProjectId and RowNum=1),1) "Incomplete",
                                prj."Complexity",
                                prj."EstComplexity",
                                prj."MBMAComplexity",
                                prj."DesignPoints",
                                prj."DraftingPoints",
                                prj."UsingAnchorBolt",
                                CASE WHEN Company."CompanyCode" = 'Cecopro'
                                    THEN 'CBS'
                                WHEN Company."CompanyCode" = 'Optima' 
                                    THEN 'NBS'
                                WHEN Company."CompanyCode" = 'Robertson' 
                                    THEN 'RBS'
                                WHEN Company."CompanyCode" = 'Star'
                                    THEN 'SBS'
                                ELSE 'NONE'
                                END AS "CompanyAbreviation",
                                prj."PGASeismic",
                                prj."OutputDimensional",
                                CL_Settings."GroundSnowLoad" AS "IsGroundSnowLoad",
                                CL_Settings."MinRoofSnowLoad" AS "IsMinRoofSnowLoad",
                                0 as "CheckRoofSnowLoad",
                                CASE WHEN Lower(prj."OutputDimensional") = 'metric'
                                    THEN 1
                                ELSE 0 
                                END AS "IsMetric",
                                prj."Mailed",
                                prj."IsCorpEngineers",
                                prj."IsUFCAntiTerrorism",
                                to_char(prj."FinalAnchorRodDate",'MM/DD/YYYY') "FinalAnchorRodDate",
                                to_char(prj."ApprovalDate",'MM/DD/YYYY') "ApprovalDate",
                                to_char(prj."PermitDate",'MM/DD/YYYY') "PermitDate",
                                to_char(prj."FinalDate",'MM/DD/YYYY') "FinalDate",
                                Company."CompanyCode",
                                prj."UFCAntiTerrorismListWeight",
                                prj."UFCAntiTerrorismListPrice"
                                from "Project" prj
                                left join "TableOfTables" status on prj."ProjectStatusId"=status."Id" 
                                left join "TableOfTables" Use on prj."ProjectUseId"=Use."Id" 
                                left join "TableOfTables" ProjectUseCategory on prj."ProjectUseCategoryid"=ProjectUseCategory."Id" 
                               left join "CLM_RiskCategory" RiskCategory on prj."RiskCategoryId"=RiskCategory."RiskCategoryId" 
                                left join "TableOfTables" MaterialOrigin on prj."MaterialOriginId"=MaterialOrigin."Id" 
                               left join "CLM_SnowExposures" SnowExposure on prj."SnowExposureId"=SnowExposure."SnowExposureId" 
                                left join "TableOfTables" SustainabilityGoal on prj."SustainablilityGoalId"=SustainabilityGoal."Id" 
                                left join "TableOfTables" EnergyEfficiency on prj."EnergyEfficiencyId"=EnergyEfficiency."Id" 
                                left join "CLM_SiteClasses" SiteClass on prj."SiteClassId"=SiteClass."SiteClassId" 
                                left join "CLM_WindExposures" WindExposure on prj."WindExposureId"=WindExposure."WindExposureId" 
                                --LEFT JOIN "USR_Brand_Mapping" Brand ON prj."CompanyId" = Brand."MappingBrandId"
                                LEFT JOIN "CL_Settings" CL_Settings on CL_Settings."BuildingCode" = prj."DesignCodeName"
                                LEFT JOIN "CLM_DesignCodes" CLM_DesignCodes ON CLM_DesignCodes."DesignCodeId" = prj."DesignCodeId"
                                LEFT JOIN "Company" Company ON Company."CompanyId" = prj."CompanyId"
                                where "ProjectId"=ProjectId;
    OPEN Output_Project_Shipping_Data FOR select SP."Name" "ShippingPoint",Shipping."ShippingTerms",Shipping."ShippingContact",Shipping."Notification",Shipping."DayPhone",Shipping."NightPhone",Shipping."FreightTerms",Shipping."FreightExpense",Shipping."Carrier",
                                Shipping."Country",Shipping."State",Shipping."County",Shipping."City",Shipping."Address1",Shipping."Address2",Shipping."ZipCode",to_char(Shipping."RequestedDeliveryDate",'MM/DD/YYYY') "RequestedDeliveryDate",Shipping."Miles1",Shipping."Miles2",Shipping."Miles3",Shipping."Rate1",Shipping."Rate2"
                                ,Shipping."Rate3",Shipping."NumberLoads1",Shipping."NumberLoads2",Shipping."NumberLoads3",Shipping."TruckTarps",Shipping."CopyFlag",Shipping."AddIMPOverages",Shipping."AddExportOverages" from "Shipping" Shipping
                                left join "ShippingPlants" SP on SP."ShippingPlantId" = Shipping."ShippingPointId"
                                where Shipping."ProjectId" = ProjectId;
     OPEN Output_Building_Data FOR  SELECT "BuildingInformationId","BuildingLabel","IsComplete"
                                FROM "BuildingInformation" 
                                where "ProjectId"=ProjectId 
                                and "IsDelete"='N' 
                              order by "BuildingLabel";
       
       OPEN Output_SystemVersion_Data FOR SELECT "SystemVersion","ThreeWeekFee" FROM "SystemVariable" ;
                              
      OPEN Output_AddLinesCount_Data FOR SELECT count(1) as "AddlinesCount" FROM "Input_AddLines"   
            WHERE "Expired" = 1
            AND "BuildingInformationId" IN (SELECT "BuildingInformationId" 
            FROM "BuildingInformation" 
            WHERE "IsDelete" ='N' 
            AND "ProjectId" = ProjectId);   
END Report_Data;
/