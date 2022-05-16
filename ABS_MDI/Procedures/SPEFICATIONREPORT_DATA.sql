CREATE OR REPLACE PROCEDURE abs_mdi."SPEFICATIONREPORT_DATA" (
    ProjectId IN NUMBER,
  
     Output_Project_Data OUT SYS_REFCURSOR,
     Output_Building_Data OUT SYS_REFCURSOR,
     Output_SystemVersion_Data  OUT SYS_REFCURSOR,
     Output_Accessories_Data  OUT SYS_REFCURSOR,
     Output_Distinct_Roof_Data  OUT SYS_REFCURSOR,
     Output_Distinct_Wall_Data OUT SYS_REFCURSOR,
     Output_Distinct_RoofingSiding_Data OUT SYS_REFCURSOR,
     Output_RoofingSiding_RoofPanel_Data OUT SYS_REFCURSOR
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
                                 to_char(prj."PriceDate",'MM/DD/YYYY') "PriceDate" ,
                                  prj."Country",
                                  prj."ProjectStage",
                                CL_Settings."SeaLevelElevation" "IsSeaLevelElevation",
                                prj."City",
                                prj."ZipPostalCode",
                                prj."State",
                                CY."WebLink",
                                CY."CompanyName",
                                CL_Settings."GroundSnowLoad" AS "IsGroundSnowLoad",
                                CL_Settings."MinRoofSnowLoad" AS "IsMinRoofSnowLoad",
                                0 as "CheckRoofSnowLoad",
                                CLM_DesignCodes."IsIBC2012Based",
                                CLM_DesignCodes."Edition",
                                CLM_DesignCodes."Code",
                                CASE WHEN Lower(prj."OutputDimensional") = 'metric'
                                    THEN 1
                                ELSE 0 
                                END AS "IsMetric",
                                CY."CompanyCode"
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
                                LEFT JOIN "USR_Brand_Mapping" Brand ON prj."CompanyId" = Brand."MappingBrandId"
                                LEFT JOIN "CL_Settings" CL_Settings on CL_Settings."BuildingCode" = prj."DesignCodeName"
                                LEFT JOIN "Company" CY on prj."CompanyId" = CY."CompanyId"
                                LEFT JOIN "CLM_DesignCodes" CLM_DesignCodes ON CLM_DesignCodes."DesignCodeId" = prj."DesignCodeId"
                                where "ProjectId"=ProjectId;
    
     OPEN Output_Building_Data FOR  SELECT "BuildingInformationId","BuildingLabel"
                                FROM "BuildingInformation" 
                                where "ProjectId"=ProjectId 
                                and "IsDelete"='N' 
                              order by "BuildingLabel";
       
       OPEN Output_SystemVersion_Data FOR SELECT "SystemVersion" FROM "SystemVariable" ;
       
        OPEN Output_Accessories_Data FOR SELECT 
          (SELECT Count(1)  FROM "EDSPrice_IO_Gutters"  WHERE "ProjectId"=ProjectId AND  NVL("IsDeleted",'N')='N') "Gutters",
          (SELECT Count(1)  FROM "EDSPrice_IO_Downspouts" WHERE "ProjectId"=ProjectId AND  NVL("IsDeleted",'N')='N' ) "Downspouts",
          (SELECT Count(1)  FROM "Accessories_WalkDoors"  WHERE "ProjectId"=ProjectId AND  NVL("IsDelete",'N')='N') "WalkDoors",
          (SELECT Count(1)  FROM "Accessories_WalkDoors"  WHERE "ProjectId"=ProjectId AND  NVL("IsDelete",'N')='N') "GlassFrontDoors",
          (SELECT Count(1)  FROM "Accessories_Canopy" WHERE "ProjectId"=ProjectId AND  NVL("IsDelete",'N')='N') "Canopy",  
          (SELECT Count(1)  FROM "Accessories_Facade" WHERE "ProjectId"=ProjectId AND  NVL("IsDelete",'N')='N') "Facade" ,
          (SELECT Count(1)  FROM "Accesories_Windows" WHERE "ProjectId"=ProjectId AND  NVL("IsDelete",'N')='N') "Windows" ,
          (SELECT Count(1)  FROM "Accessories_FramedOpening" WHERE "ProjectId"=ProjectId AND  NVL("IsDelete",'N')='N') "FramedOpening",
          (SELECT Count(1)  FROM "Accesories_TopMountedSlideDoor" WHERE "ProjectId"=ProjectId AND  NVL("IsDelete",'N')='N') "SlideDoor",
          (SELECT Count(1)  FROM "Accesories_WallLTP" WHERE "ProjectId"=ProjectId AND  NVL("IsDelete",'N')='N' AND "Elevation"='R') "WallLTP",
          (SELECT Count(1)  FROM "Accesories_RoofLTP" WHERE "ProjectId"=ProjectId AND  NVL("IsDelete",'N')='N') "RoofLTP",
          (SELECT Count(1)  FROM "Accessories_Vents" WHERE "ProjectId"=ProjectId AND  NVL("IsDelete",'N')='N') "Vents",
          (SELECT Count(1)  FROM "Accessories_RubberPipeFlash" WHERE "ProjectId"=ProjectId AND  NVL("IsDelete",'N')='N' AND "Type"='Metal Roof Jacks') "RoofJacks",
          (SELECT Count(1)  FROM "Accessories_RubberPipeFlash" WHERE "ProjectId"=ProjectId AND  NVL("IsDelete",'N')='N'AND "Type"='Rubber Pipe Flash' ) "PipeFlashing",
          (SELECT Count(1)  FROM "Accessories_Louvers" WHERE "ProjectId"=ProjectId AND  NVL("IsDelete",'N')='N' ) "Louvers",
          (SELECT Count(1)  FROM "EDSPrice_IO_Mezzanines" WHERE "ProjectId"=ProjectId AND  NVL("IsDelete",'N')='N' ) "Mezzanines",
          (SELECT "AccessoryTotalPrice" FROM  "EDSPrice_O_ProjectTotal" WHERE "ProjectId"=ProjectId) "AccessoryTotalPrice",
          (SELECT Count(1)  FROM "Accessories_WalkDoors"  WHERE "ProjectId"=ProjectId AND "SwingDirection" IS NOT NULL AND  NVL("IsDelete",'N')='N') "SwingDoor",
          (SELECT Count(1)  FROM "Accesories_WallLTP" WHERE "ProjectId"=ProjectId AND "Elevation"='R' AND NVL("IsDelete",'N')='N') "LTPs"
          FROM DUAL;
          
          --Distict data from Roof
          OPEN Output_Distinct_Roof_Data FOR SELECT Distinct "Type" FROM "Input_Roof" WHERE 
            "BuildingInformationId" IN(
            SELECT "BuildingInformationId" FROM "BuildingInformation" WHERE "ProjectId"=ProjectId AND "IsComplete"='Y' AND "IsDelete"='N'
            );
          
        --Distinct Data for Wall    
        OPEN Output_Distinct_Wall_Data FOR SELECT Distinct MPT."Type" FROM "Input_Wall" IW
        left join "M_PanelType" MPT on   IW."Type"= MPT."Id"
        WHERE "BuildingInformationId" IN(
            SELECT "BuildingInformationId" FROM "BuildingInformation" WHERE "ProjectId"=ProjectId AND "IsComplete"='Y' AND "IsDelete"='N'
            )AND IW."IsDelete" = 'N';
            
         ---Distinct Roofing and Siding,Roof Finishes   
        OPEN Output_Distinct_RoofingSiding_Data FOR SELECT  Distinct "WallPanel" From "Input_TrimColorSelections" WHERE "BuildingNumber" IN(
                SELECT "BuildingInformationId" FROM "BuildingInformation" WHERE "ProjectId"=ProjectId AND "IsComplete"='Y' AND "IsDelete"='N'
                );
          
        OPEN Output_RoofingSiding_RoofPanel_Data FOR SELECT  Distinct "RoofPanel" From "Input_TrimColorSelections" WHERE "BuildingNumber" IN(
                SELECT "BuildingInformationId" FROM "BuildingInformation" WHERE "ProjectId"=ProjectId AND "IsComplete"='Y' AND "IsDelete"='N'
                );
                
END SpeficationReport_Data;
/