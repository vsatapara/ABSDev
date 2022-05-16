CREATE OR REPLACE PROCEDURE abs_mdi."CompanyInformation_Select" 
(
    CompanyId IN NUMBER,
    OutPut_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
  OPEN OutPut_Data FOR 
    SELECT
            CI."CompanyInformationId",
            CI."CompanyId",
            CI."IsTruckTarpAvaileble",
            CI."IsTrucTarpMandatory",
            CI."ItemNotStrocked",
            CI."ItemNotAvaileble",
            CI."QuoteExpirationDays",
            
            CMS."CompanyMailServerDetailId",
            CMS."IsDefualtSetting",
            CMS."SMTPPHost",
            CMS."SMTPPort",
            CMS."IsAuthenticationRequired",
            CMS."IsUseSSLConnection",
            CMS."UserName",
            CMS."Password",
            CMS."ReplyToAddress",
            
            CPD."PortalDetailId",
            CPD."PortalSoftwareName",
            CPD."PortalHeaderDescriptor",
            CPD."PortalURL",
            CPD."GoogleTagManagerId",
            CPD."BuilderWroxSoftwareName",
            CPD."FeedBackEmailAddress",
            
            CLMD."LabelMessagingDetailId",
            CLMD."IsDefualtSetting",
            CLMD."LoginWelcomeMessage",
            CLMD."ForgotPasswordMeassage",
            CLMD."OrderNoteMessage",
            CLMD."StartBuildingAction",
            CLMD."StartBuildingURL",
            CLMD."OrderComponent",
            CLMD."OrderComponntURL",
            CLMD."ReturnTowebsideName",
            CLMD."ReturnToWebSideUrl",
            CLMD."CompanyAddess",
            
            CCUD."ContactUsDetailId",
            CCUD."ContactUsPageURL",
            CCUD."BuidldingSoftwareName",
            CCUD."ComponentSoftwareName",
            CCUD."BuildingGoogleAnalyticsId",
            CCUD."ComponenetAnalyticId",
            CCUD."BuidlingPhone",
            CCUD."ComponentPhone",
            CCUD."DistrictManager",
            CCUD."RegionalManager",
            CCUD."ServiceRepresentative",
            
            CODS."OrderdocumentId",
            CODS."IsFinalDrawing",
            CODS."IsPermitDrawing",
            CODS."IsSalesChangeOrder",
            CODS."IsCalculationFiles",
            CODS."IsBOMFiles",
            CODS."IsApprovalDrawing",
            CODS."IsOpenRegistration",
            CODS."IsLangualgeSelection",
            UBM."BrandId" || ' - ' || UBM."BrandName" AS "OracleBrand"
    FROM "CompanyInformation" CI
    INNER JOIN "CompanyMailServerDetail" CMS
        ON CI."CompanyId" = CMS."CompanyId"
     INNER JOIN "CompanyPortalDetail" CPD
        ON CI."CompanyId" = CPD."CompanyId"
    INNER JOIN "CompanyLabelMessagingDetail" CLMD
        ON CI."CompanyId" = CLMD."CompanyId"
    INNER JOIN "CompanyContactUsDetail" CCUD
        ON CI."CompanyId" = CCUD."CompanyId"
    INNER JOIN "CompanyOrderDocumentationSetting" CODS
        ON CI."CompanyId" = CODS."CompanyId"
    INNER JOIN "USR_Brand_Mapping" UBM 
        ON UBM."MappingBrandId" = CI."CompanyId"
    WHERE CI."CompanyId"=CompanyId;   
END "CompanyInformation_Select";
/