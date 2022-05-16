CREATE OR REPLACE PROCEDURE abs_mdi."COMPANYINFORMATION_CREATE" 
(
    /*COMPANYINFORMATION*/
	CompanyId IN NUMBER,
	IsTruckTarpAvaileble IN CHAR,
	IsTrucTarpMandatory IN CHAR,
	ItemNotStrocked IN VARCHAR2,
	ItemNotAvaileble IN VARCHAR2,
	QuoteExpirationDays IN NUMBER,
    IpAddress IN VARCHAR2,
    /*PORTALDETAIL*/
	PortalSoftwareName IN NVARCHAR2,
	PortalHeaderDescriptor IN NVARCHAR2,
	PortalURL IN NVARCHAR2,
	GoogleTagManagerId IN NUMBER, 
	BuilderWroxSoftwareName IN NVARCHAR2,
	FeedBackEmailAddress IN NVARCHAR2,
    FavaiconName IN NVARCHAR2 DEFAULT NULL,
    CompanyLogoName IN NVARCHAR2 DEFAULT NULL,
    CompanyPortalLogoName IN NVARCHAR2 DEFAULT NULL,
    SignInPageName IN NVARCHAR2 DEFAULT NULL,
    SignInPageLogoName IN NVARCHAR2 DEFAULT NULL,
    PurchaseOrderLogoName IN NVARCHAR2 DEFAULT NULL,
    FavaiconPath IN VARCHAR2,
    CompanyLogoPath IN NCLOB DEFAULT NULL,
    CompanyPortalLogoPath IN NCLOB DEFAULT NULL,
    SignInPagePath IN NCLOB DEFAULT NULL,
    SignInPageLogoPath IN NCLOB DEFAULT NULL,
    PurchaseOrderLogoPath IN NCLOB DEFAULT NULL,
/*LABELMESSAGINGDETAIL*/
	IsDefualtSetting IN CHAR,
	LoginWelcomeMessage IN NVARCHAR2,
	ForgotPasswordMeassage IN NVARCHAR2,
	OrderNoteMessage IN NVARCHAR2,
	StartBuildingAction IN VARCHAR2,
	StartBuildingURL IN NVARCHAR2,
	OrderComponent IN NVARCHAR2,
	OrderComponntURL IN NVARCHAR2,
	ReturnTowebsideName IN NVARCHAR2,
	ReturnToWebSideUrl IN NVARCHAR2,
	CompanyAddess IN NVARCHAR2,
/*CONTACTUSDETAIL*/
	ContactUsPageURL IN NVARCHAR2,
	BuidldingSoftwareName IN NVARCHAR2,
	ComponentSoftwareName IN NVARCHAR2,
	BuildingGoogleAnalyticsId IN NUMBER,
	ComponenetAnalyticId IN NUMBER,
	BuidlingPhone IN VARCHAR2,
	ComponentPhone IN VARCHAR2,
	DistrictManager IN NVARCHAR2,
	RegionalManager IN NVARCHAR2,
	ServiceRepresentative IN NVARCHAR2,
/*ORDERDOCUMENTATIONSETTING*/
	IsFinalDrawing IN CHAR,
	IsPermitDrawing IN CHAR,
	IsSalesChangeOrder IN CHAR,
	IsCalculationFiles IN CHAR,
	IsBOMFiles IN CHAR,
	IsApprovalDrawing IN CHAR,
	IsOpenRegistration IN CHAR,
	IsLangualgeSelection IN CHAR,
/*COMPANYEMAILNOTIFICATION*/
	PurchaseQueueEmailBuildings IN VARCHAR2,
	PurchaseQueueEmailComponent IN VARCHAR2,
/*COMPANYMAILSERVERDETAIL*/
    IsDefualtSettingMailServer IN CHAR,
	SMTPPHost IN VARCHAR2,
	SMTPPort IN VARCHAR2,
	IsAuthenticationRequired IN CHAR,
	IsUseSSLConnection IN CHAR,
	UserName IN NVARCHAR2,
	Password IN NVARCHAR2,
	ReplyToAddress IN NVARCHAR2,
	CreatedBy IN NUMBER
)
AS 
FavaiconId NUMBER;
CompanyLogoId NUMBER;
CompanyPortalLogoId NUMBER;
SignInPageId NUMBER;
SignInPageLogoId NUMBER;
PurchaseOrderLogoId NUMBER;
BEGIN
    /* Attachment Insert start*/
     IF FavaiconName IS NOT NULL THEN
        INSERT INTO "Attachment"("AttachmentType","AttachmentName","AttachmentPath","IsDelete","AttachedDate")
        VALUES('Image',FavaiconName,FavaiconPath,'N',CURRENT_TIMESTAMP)
        RETURNING "AttachmentId" into FavaiconId;
    END IF;
    IF CompanyLogoName IS NOT NULL THEN
        INSERT INTO "Attachment"("AttachmentType","AttachmentName","AttachmentPath","IsDelete","AttachedDate")
        VALUES('Image',CompanyLogoName,CompanyLogoPath,'N',CURRENT_TIMESTAMP)
        RETURNING "AttachmentId" into CompanyLogoId;
    END IF;
    
    IF CompanyPortalLogoName IS NOT NULL THEN
        INSERT INTO "Attachment"("AttachmentType","AttachmentName","AttachmentPath","IsDelete","AttachedDate")
        VALUES('Image',CompanyPortalLogoName,CompanyPortalLogoPath,'N',CURRENT_TIMESTAMP)
        RETURNING "AttachmentId" into CompanyPortalLogoId;
    END IF;
    
     IF SignInPageName IS NOT NULL THEN
        INSERT INTO "Attachment"("AttachmentType","AttachmentName","AttachmentPath","IsDelete","AttachedDate")
        VALUES('Image',SignInPageName,SignInPagePath,'N',CURRENT_TIMESTAMP)
        RETURNING "AttachmentId" into SignInPageId;
    END IF;
    IF SignInPageLogoName IS NOT NULL THEN
        INSERT INTO "Attachment"("AttachmentType","AttachmentName","AttachmentPath","IsDelete","AttachedDate")
        VALUES('Image',SignInPageLogoName,SignInPageLogoPath,'N',CURRENT_TIMESTAMP)
        RETURNING "AttachmentId" into SignInPageLogoId;
    END IF;
     IF PurchaseOrderLogoName IS NOT NULL THEN
        INSERT INTO "Attachment"("AttachmentType","AttachmentName","AttachmentPath","IsDelete","AttachedDate")
        VALUES('Image',PurchaseOrderLogoName,PurchaseOrderLogoPath,'N',CURRENT_TIMESTAMP)
        RETURNING "AttachmentId" into PurchaseOrderLogoId;
    END IF;
    /* Attachment Insert End*/    
    /* COMPANYINFORMATION Insert */
       INSERT INTO "CompanyInformation" (
            "CompanyId",
            "IsTruckTarpAvaileble",
            "IsTrucTarpMandatory",
            "ItemNotStrocked",
            "ItemNotAvaileble",
            "QuoteExpirationDays",
            "CreatedBy",
            "CreatedDate",
            "IpAddress"
        ) VALUES (
        CompanyId,
            IsTruckTarpAvaileble,
            IsTrucTarpMandatory,
            ItemNotStrocked,
            ItemNotAvaileble,
            QuoteExpirationDays,
            CreatedBy,
            CURRENT_TIMESTAMP,
            IpAddress
        );
     /*COMPANYPORTALDETAIL Insert */
    INSERT INTO "CompanyPortalDetail"
     (
        "CompanyId",
        "PortalSoftwareName",
        "PortalHeaderDescriptor",
        "PortalURL",
        "GoogleTagManagerId",
        "BuilderWroxSoftwareName",
        "FeedBackEmailAddress",
        "Favaicon",
        "CompanyLogo",
        "SignInPage",
        "SignInPageLogo",
        "PurchaseOrderLogo",
        "CompanyPortalLogo",
        "CreatedBy",
        "CreatedDate",
        "IpAddress"
      )VALUES
     (
        CompanyId,
        PortalSoftwareName,
        PortalHeaderDescriptor,
        PortalURL,
        GoogleTagManagerId,
        BuilderWroxSoftwareName,
        FeedBackEmailAddress,
        FavaiconId,
        CompanyLogoId,
        SignInPageId,
        SignInPageLogoId,
        PurchaseOrderLogoId,
		CompanyPortalLogoId,
        CreatedBy,
        CURRENT_TIMESTAMP,
        IpAddress
     );
    /*COMPANYLABELMESSAGINGDETAIL insert */
    INSERT INTO "CompanyLabelMessagingDetail" (
            "CompanyId",
            "IsDefualtSetting",
            "LoginWelcomeMessage",
            "ForgotPasswordMeassage",
            "OrderNoteMessage",
            "StartBuildingAction",
            "StartBuildingURL",
            "OrderComponent",
            "OrderComponntURL",
            "ReturnTowebsideName",
            "ReturnToWebSideUrl",
            "CompanyAddess",
            "CreatedBy",
            "CreatedDate",
            "IpAddress"
        ) VALUES (
            CompanyId,
            IsDefualtSetting,
            LoginWelcomeMessage,
            ForgotPasswordMeassage,
            OrderNoteMessage,
            StartBuildingAction,
            StartBuildingURL,
            OrderComponent,
            OrderComponntURL,
            ReturnTowebsideName,
            ReturnToWebSideUrl,
            CompanyAddess,
            CreatedBy,
            CURRENT_TIMESTAMP,
            IpAddress
     );
     /*COMPANYCONTACTUSDETAIL Insert */
     INSERT INTO "CompanyContactUsDetail" (
        "CompanyId",
        "ContactUsPageURL",
        "BuidldingSoftwareName",
        "ComponentSoftwareName",
        "BuildingGoogleAnalyticsId",
        "ComponenetAnalyticId",
        "BuidlingPhone",
        "ComponentPhone",
        "DistrictManager",
        "RegionalManager",
        "ServiceRepresentative",
        "CreatedBy",
        "CreatedDate",
        "IpAddress"
        ) VALUES (
        CompanyId,
        ContactUsPageURL,
        BuidldingSoftwareName ,
        ComponentSoftwareName,
        BuildingGoogleAnalyticsId,
        ComponenetAnalyticId ,
        BuidlingPhone,
        ComponentPhone,
        DistrictManager,
        RegionalManager,
        ServiceRepresentative,
        CreatedBy,
        CURRENT_TIMESTAMP,
        IpAddress
     );
     /*COMPANYORDERDOCUMENTATIONSETTING Insert */
    INSERT INTO "CompanyOrderDocumentationSetting" (
        "CompanyId",
        "IsFinalDrawing",
        "IsPermitDrawing",
        "IsSalesChangeOrder",
        "IsCalculationFiles",
        "IsBOMFiles",
        "IsApprovalDrawing",
        "IsOpenRegistration",
        "IsLangualgeSelection",
        "CreatedBy",
        "CreatedDate",
        "IpAddress"
    ) VALUES (
        CompanyId,
        IsFinalDrawing,
        IsPermitDrawing,
        IsSalesChangeOrder,
        IsCalculationFiles,
        IsBOMFiles,
        IsApprovalDrawing,
        IsOpenRegistration,
        IsLangualgeSelection,
        CreatedBy,
        CURRENT_TIMESTAMP,
        IpAddress
     );
     /*COMPANYEMAILNOTIFICATION Insert */
     INSERT INTO "CompanyEmailNotification" (
        "CompanyId",
        "PurchaseQueueEmailBuildings",
        "PurchaseQueueEmailComponent",
        "CreatedBy",
        "CreatedDate",
        "IpAddress"
    ) VALUES (
        CompanyId,
        PurchaseQueueEmailBuildings,
        PurchaseQueueEmailComponent,
        CreatedBy,
        CURRENT_TIMESTAMP,
        IpAddress
     );
     /*COMPANYMAILSERVERDETAIL Insert*/
    INSERT INTO "CompanyMailServerDetail" (
        "CompanyId",
        "IsDefualtSetting",
        "SMTPPHost",
        "SMTPPort",
        "IsAuthenticationRequired",
        "IsUseSSLConnection",
        "UserName",
        "Password",
        "ReplyToAddress",
        "CreatedBy",
        "CreatedDate",
        "IpAddress"
        ) VALUES (
        CompanyId,
        IsDefualtSettingMailServer,
        SMTPPHost,
        SMTPPort,
        IsAuthenticationRequired,
        IsUseSSLConnection,
        UserName,
        Password,
        ReplyToAddress,
        CreatedBy,
        CURRENT_TIMESTAMP,
        IpAddress
     );
END COMPANYINFORMATION_CREATE;
/