CREATE OR REPLACE PROCEDURE abs_mdi."MBS_SHIPPING_DETAILS" (
	BuildingId IN NUMBER,
	ProjectId IN NUMBER,
	Output_ProjectData OUT SYS_REFCURSOR,
	Output_ShippingData OUT SYS_REFCURSOR,
	Output_ShippingPlantBaseOnCountryData OUT SYS_REFCURSOR,
	Output_PriceShipping OUT SYS_REFCURSOR,
	Output_ShippingPlantGroupFromParentId OUT SYS_REFCURSOR,
	Output_ShippingPlantAll OUT SYS_REFCURSOR,
	Output_BuildingComplexity OUT SYS_REFCURSOR,
	Output_MbsBuildingPrice OUT SYS_REFCURSOR,
	Output_ShippingPlantBasedShippingData OUT SYS_REFCURSOR,
	Output_CategoryMarginData OUT SYS_REFCURSOR,
	Output_UserTypeData OUT SYS_REFCURSOR,
	Output_CustomerData OUT SYS_REFCURSOR,
	Output_CompanyData OUT SYS_REFCURSOR,
    Output_CPUAddressData OUT SYS_REFCURSOR,
    Output_ThreeWeekData OUT SYS_REFCURSOR,
    Output_GeometryData OUT SYS_REFCURSOR,
    Output_AdditionalEngineeringFeesData OUT SYS_REFCURSOR
 )
AS 
ShippingCountry VARCHAR2(40) DEFAULT NULL;
CompanyId NUMBER(10) DEFAULT 0;
BuilderAccessPermissionId number DEFAULT NULL;
Projects NUMBER(10) DEFAULT 0;
UserDetailId NUMBER(10) DEFAULT 0;
U_COUNT NUMBER(5) DEFAULT 0;
UserId VARCHAR2(40) DEFAULT NULL;
PermissionGroupId NUMBER(10) DEFAULT 0;
CampaignId NUMBER(5) DEFAULT 0;
ShippingPlantId NUMBER(10) DEFAULT 0;
CustomerNo VARCHAR2(40) DEFAULT NULL;
BEGIN
    SELECT COUNT(*) INTO Projects FROM "Project" WHERE "ProjectId" = ProjectId;
	IF Projects > 0 THEN
		SELECT "UserId","CompanyId","CustomerNo" INTO UserId,CompanyId,CustomerNo FROM "Project" WHERE "ProjectId" = ProjectId AND ROWNUM = 1;
	END IF;
    
	OPEN  Output_ProjectData  FOR
		SELECT
			 p."ProjectId",
			 p."ProjectName",
			 p."IsActive",
			 p."BuildingLocation",
			 p."Address1",
			 p."Address2",
			 p."City",
			 p."Region",
			 p."State",
			 p."Country",
			 p."ZipPostalCode",
			 p."IsCanadaBasedDesignCode",
			 p."IsDesignCodeIbc2012Based",
			 p."CompanyId",
			 t."ItemText" as "ProjectUseMetaName",
             p."InputDimensional" as "UseImperialDimensions"
		FROM "Project" p ,
			"TableOfTables" t
		WHERE "ProjectId" = ProjectId and "Id" = "ProjectUseCategoryid";
	OPEN Output_ShippingData FOR
		SELECT 
			"ShippingId",
			"ProjectId",
			"Latitude",
			"Longitude",
			"Country",
			"State",
			"County",
			"City",
			"Address1",
			"Address2",
			"ShippingTerms",
            "TruckTarps" as "HasTruckTarp"
		FROM "Shipping"
		WHERE "ProjectId" = ProjectId AND ROWNUM = 1;
	SELECT "ShippingPointId" INTO ShippingPlantId FROM "Shipping" WHERE "ProjectId" = ProjectId AND ROWNUM = 1 ;
	SELECT "Country" INTO ShippingCountry FROM "Shipping" WHERE "ProjectId" = ProjectId AND ROWNUM = 1 ;
	OPEN Output_ShippingPlantBaseOnCountryData FOR
		SELECT 
			"ShippingPlantId",
			"IsActive",
			"Name",
			"Latitude",
			"Longitude",
			"IsCanadaApproved",
			"PriceMultiplier",
			"IsExpressCapable",
			"IsMbciPlant",
			"IsCpuPlant",
			"IsComponentsPlant",
			"MinimumWeight"
		 FROM "ShippingPlants"
		 WHERE "ShippingPlantId" in (SELECT "ShippingPlantId" FROM "ShipPlantCountriesToShip" where "CountryId" = (SELECT "Id" FROM "TableOfTables" WHERE "ItemText" like ShippingCountry )) AND "IsActive" != 'N';
	
	SELECT COUNT(*) INTO U_COUNT FROM "USR_UserDetail" WHERE "UserId" = UserId;
	SELECT "PermissionGroupId" INTO PermissionGroupId FROM "USR_Brand_PermissionGroup" WHERE "BrandId" = CompanyId AND ROWNUM = 1;
	SELECT "CampaignId" INTO CampaignId FROM "TermsAndCondition" WHERE "CompanyId" = CompanyId  AND "IsDelete" != 'Y' AND ROWNUM = 1;
    
	IF(U_COUNT>0)
	THEN
		SELECT "UserDetailId" into UserDetailId FROM "USR_UserDetail" WHERE "UserId" = UserId AND "IsDelete"='N' AND ROWNUM = 1;
	END IF;
    
	IF CampaignId = 63 THEN
		OPEN Output_BuildingComplexity FOR 
			SELECT
				"LeadDayClassId" as "ComplexityClass",
				"DayInput" as "LeadDays",
				"ShipPlantCampaignId" as "CampaignId",
                "ShippingPlantId"
			FROM
				"ShipPlantLeadDays" WHERE "ShipPlantCampaignId" = 40;           
	ELSIF CampaignId = 64 THEN
		OPEN Output_BuildingComplexity FOR 
			SELECT
				"ShippingPlantId",
				"LeadDayClassId" as "ComplexityClass",
				"DayInput" as "LeadDays",
				"ShipPlantCampaignId" as "CampaignId"
			FROM
				"ShipPlantLeadDays" WHERE "ShipPlantCampaignId" = 41;
    ELSE
		OPEN Output_BuildingComplexity FOR 
			SELECT null FROM DUAL;
	END IF; 
  
	SELECT "BuilderAccessPermissionId" INTO BuilderAccessPermissionId 
	FROM "USR_PER_BuilderAccess" 
	WHERE "BrandId" = CompanyId and "PermissionGroupId" = PermissionGroupId and "UserDetailId"=UserDetailId AND ROWNUM = 1;
    
	OPEN Output_PriceShipping FOR 
		SELECT B."IsAvailable" as "PriceShippingPlant"
		FROM "BuilderAccessSection" b LEFT JOIN  "PermissionItems" p ON b."SectionId"= p."SelectiveId" WHERE b."BuilderAccessPermissionId" = BuilderAccessPermissionId and b."SectionId" IN(291);
   
   OPEN Output_ShippingPlantGroupFromParentId FOR
		SELECT * FROM "ShippingPlants" Where "ShippingPlantId" IN (SELECT "ShippingPlantID" FROM "ShippingPlantGrouping" 
		WHERE "ShippingGroupID" IN (SELECT "ShippingPlantGroupFromParentId" FROM "Company" WHERE "CompanyId" = CompanyId)) AND "IsActive" = 'Y';
        
	OPEN Output_ShippingPlantAll FOR
		SELECT * FROM "ShippingPlants" WHERE "IsActive" = 'Y';
        
	OPEN Output_MbsBuildingPrice FOR
		SELECT 
			"BuildingId",
			"BuildingGuid",
			"ProjectId",
			"ProjectGuid",
			"UserId" ,
			"BuildingWeight",
			"NetItemWeight"
		FROM "MBSBuildingPrice" 
		WHERE "BuildingId" = BuildingId;
	OPEN Output_ShippingPlantBasedShippingData FOR
		SELECT * FROM "ShippingPlants" WHERE "ShippingPlantId" = ShippingPlantId AND "IsActive" = 'Y';
        
	OPEN Output_CategoryMarginData FOR
		 SELECT 
			"CategoryMarginId",
			"CategoryId",
			"CategoryMetaId",
			"ItemText" as "CategoryMetaName",
			"MultiplierForComponents" ,
			"MultiplierForBuilding" as "Multiplier",
			"IsPurchased",
			"AmountForBuilding",
			"AmountForComponents",
			"IsBuyout"
		FROM "CategoryMargins" , "TableOfTables" WHERE "Id" = "CategoryId" AND "IsDelete" != 'Y';
    
	 OPEN Output_UserTypeData FOR
		 SELECT 
			"IsInternal","IsExternal" 
		 FROM "BuilderAccessPermission" 
		 WHERE "BuilderAccessPermissionId" IN (SELECT "BuilderAccessPermissionId" FROM "USR_UserDetail" WHERE "UserDetailId" = UserDetailId AND ROWNUM = 1);
	OPEN Output_CustomerData FOR
		 SELECT 
			"CustomerNo", "CustomerName", "IsDefault", "IsActive", "IsPrivateLabelBuilder", "EnforceSignatureRule"
		 FROM "Customer" 
		 WHERE "CustomerNo" = CustomerNo AND "IsDelete" != 'Y' AND "CompanyId" = CompanyId;
         
	OPEN Output_CompanyData FOR
		 SELECT 
			"ExpressDeliveryPrice",
			"WetStampFee",
			"BuildingPriceMultiplier" as "PriceMultiplier" , 
			"CompanyName" as "BrandName",
            "QuoteExpirationDays",
            "IsNciBrand"
		 FROM "Company" c , "CompanyInformation" ci
		 WHERE c."CompanyId" = CompanyId and c."CompanyId" = ci."CompanyId";
    OPEN Output_CPUAddressData FOR
		 SELECT 
			"Name",
            "CountyRegion",
            "City",
            "AddressId" as "CpuAddressId",
            "Address2",
            "Address1"
		 FROM "CpuAddresses" 
		 WHERE "IsDelete" != 'Y' and "IsActive" = 'Y';
         
    OPEN Output_ThreeWeekData FOR
		 SELECT 
			"ThreeWeekFee"
		 FROM "BuildingQuoteVariable" 
		 WHERE "IsDelete" != 'Y' and "IsActive" = 'Y';
         
    OPEN Output_GeometryData FOR
		 SELECT 
			"BuildingWidth" as "Width",
            "BuildingLength" "Length"
		 FROM "GeometryInformation" 
		 WHERE "BuildingInformationId" = BuildingId;
         
    OPEN Output_AdditionalEngineeringFeesData FOR
		 SELECT 
			"Country",
            "Description",
            "EngineeringFees",
            "EngineeringFeesId",
            "State"
		 FROM "AdditionalEngineeringFees";
     
END MBS_SHIPPING_DETAILS;
/