CREATE OR REPLACE PROCEDURE abs_mdi."COMPANYINFORMATION_SELECT" 
(
    CompanyId IN NUMBER,
    CI_Data OUT SYS_REFCURSOR,
    CMS_Data OUT SYS_REFCURSOR,
    CPD_Data OUT SYS_REFCURSOR,
    CLMD_Data OUT SYS_REFCURSOR,
    CCUD_Data OUT SYS_REFCURSOR,
    CODS_Data OUT SYS_REFCURSOR,
    CEN_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
    OPEN CI_Data FOR 
    SELECT
            CI."CompanyInformationId",
            CI."CompanyId",
            CI."IsTruckTarpAvaileble",
            CI."IsTrucTarpMandatory",
            CI."ItemNotStrocked",
            CI."ItemNotAvaileble",
            CI."QuoteExpirationDays",
            UBM."BrandId" || ' - ' || UBM."BrandName" AS "OracleBrand"
    FROM "CompanyInformation" CI
    RIGHT JOIN "USR_Brand_Mapping" UBM ON UBM."MappingBrandId" = CI."CompanyId"
    where UBM."MappingBrandId"=CompanyId;
    OPEN CMS_Data FOR 
    SELECT            
            CMS."CompanyMailServerDetailId",
            CMS."IsDefualtSetting",
            CMS."SMTPPHost",
            CMS."SMTPPort",
            CMS."IsAuthenticationRequired",
            CMS."IsUseSSLConnection",
            CMS."UserName",
            CMS."Password",
            CMS."ReplyToAddress"
    FROM "CompanyMailServerDetail" CMS
    WHERE CMS."CompanyId"=CompanyId;      
    OPEN CPD_Data FOR 
    SELECT            
            CPD."PortalDetailId",
            CPD."PortalSoftwareName",
            CPD."PortalHeaderDescriptor",
            CPD."PortalURL",
            CPD."GoogleTagManagerId",
            CPD."BuilderWroxSoftwareName",
            CPD."FeedBackEmailAddress",
            --CPD."Favaicon" as "FavaiconName",
            --CPD."CompanyLogo" as "CompanyLogoName",
            --CPD."SignInPage" as "SignInPageName",            
            --CPD."SignInPageLogo" as "SignInPageLogoName",
            --CPD."PurchaseOrderLogo" as "PurchaseOrderLogoName",
            A."AttachmentName" AS SignInPageName,
            A."AttachmentPath" AS SignInPagePath,
            B."AttachmentName" AS SignInPageLogoName,
            B."AttachmentPath" AS SignInPageLogoPath,
            C."AttachmentName" AS FavaiconName,
            C."AttachmentPath" AS FavaiconPath,
            D."AttachmentName" AS CompanyLogoName,
            D."AttachmentPath" AS CompanyLogoPath,
            E."AttachmentName" AS PurchaseOrderLogoName,
            E."AttachmentPath" AS PurchaseOrderLogoPath,
            F."AttachmentName" AS CompanyPortalLogoName,
            F."AttachmentPath" AS CompanyPortalLogoPath
    FROM "CompanyPortalDetail" CPD
    LEFT JOIN "Attachment" A ON A."AttachmentId" = "SignInPage"
    LEFT JOIN "Attachment" B ON B."AttachmentId" = "SignInPageLogo"
    LEFT JOIN "Attachment" C ON C."AttachmentId" = "Favaicon"
    LEFT JOIN "Attachment" D ON D."AttachmentId" = "CompanyLogo"
    LEFT JOIN "Attachment" E ON E."AttachmentId" = "PurchaseOrderLogo"
    LEFT JOIN "Attachment" F ON F."AttachmentId" = "CompanyPortalLogo"
    WHERE CPD."CompanyId"=CompanyId;    
    OPEN CLMD_Data FOR 
    SELECT            
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
            CLMD."CompanyAddess"
    FROM "CompanyLabelMessagingDetail" CLMD    
    WHERE CLMD."CompanyId"=CompanyId; 
    OPEN CCUD_Data FOR 
    SELECT              
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
            CCUD."ServiceRepresentative"
    FROM "CompanyContactUsDetail" CCUD    
    WHERE CCUD."CompanyId"=CompanyId; 
    OPEN CODS_Data FOR 
    SELECT                          
            CODS."OrderdocumentId",
            CODS."IsFinalDrawing",
            CODS."IsPermitDrawing",
            CODS."IsSalesChangeOrder",
            CODS."IsCalculationFiles",
            CODS."IsBOMFiles",
            CODS."IsApprovalDrawing",
            CODS."IsOpenRegistration",
            CODS."IsLangualgeSelection"
    FROM "CompanyOrderDocumentationSetting" CODS
    WHERE CODS."CompanyId"=CompanyId;
    OPEN CEN_Data FOR 
    SELECT                          
            CEN."CompanyEmailNotificationId",
            CEN."PurchaseQueueEmailBuildings",
            CEN."PurchaseQueueEmailComponent"
    FROM "CompanyEmailNotification" CEN
    WHERE CEN."CompanyId"=CompanyId;    
END CompanyInformation_Select;
/