CREATE OR REPLACE PROCEDURE abs_mdi."COMPANYINFORMATION_UPDATE" 
(
 /*COMPANYINFORMATION*/
  CompanyInformationId IN NUMBER,
	CompanyId IN NUMBER,
	IsTruckTarpAvaileble IN CHAR,
	IsTrucTarpMandatory IN CHAR,
	ItemNotStrocked IN VARCHAR2,
	ItemNotAvaileble IN VARCHAR2,
	QuoteExpirationDays IN NUMBER,
	IpAddress IN VARCHAR2,
    /*PORTALDETAIL*/
    PortalDetailId IN NUMBER,
    PortalSoftwareName IN NVARCHAR2,
	PortalHeaderDescriptor IN NVARCHAR2,
	PortalURL IN NVARCHAR2,
	GoogleTagManagerId IN VARCHAR2, 
	BuilderWroxSoftwareName IN NVARCHAR2,
	FeedBackEmailAddress IN NVARCHAR2,
    FavaiconName IN NVARCHAR2 DEFAULT NULL,
    CompanyLogoName IN NVARCHAR2 DEFAULT NULL,
    CompanyPortalLogoName IN NVARCHAR2 DEFAULT NULL,
    SignInPageName IN NVARCHAR2 DEFAULT NULL,
    SignInPageLogoName IN NVARCHAR2 DEFAULT NULL,
    PurchaseOrderLogoName IN NVARCHAR2 DEFAULT NULL,
    FavaiconPath IN NCLOB DEFAULT NULL,
    CompanyLogoPath IN NCLOB DEFAULT NULL,
    CompanyPortalLogoPath IN NCLOB DEFAULT NULL,
    SignInPagePath IN NCLOB DEFAULT NULL,
    SignInPageLogoPath IN NCLOB DEFAULT NULL,
    PurchaseOrderLogoPath IN NCLOB DEFAULT NULL,

/*LABELMESSAGINGDETAIL*/
    LabelMessagingDetailId IN NUMBER,
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
    ContactUsDetailId IN NUMBER,
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
    OrderdocumentId IN NUMBER,
	IsFinalDrawing IN CHAR,
	IsPermitDrawing IN CHAR,
	IsSalesChangeOrder IN CHAR,
	IsCalculationFiles IN CHAR,
	IsBOMFiles IN CHAR,
	IsApprovalDrawing IN CHAR,
	IsOpenRegistration IN CHAR,
	IsLangualgeSelection IN CHAR,
/*COMPANYEMAILNOTIFICATION*/
    CompanyEmailNotificationId IN NUMBER,
	PurchaseQueueEmailBuildings IN VARCHAR2,
	PurchaseQueueEmailComponent IN VARCHAR2,
/*COMPANYMAILSERVERDETAIL*/
    CompanyMailServerDetailId IN NUMBER,
	IsDefualtSettingMailServer IN CHAR,
	SMTPPHost IN VARCHAR2,
	SMTPPort IN VARCHAR2,
	IsAuthenticationRequired IN CHAR,
	IsUseSSLConnection IN CHAR,
	UserName IN NVARCHAR2,
	Password IN NVARCHAR2,
	ReplyToAddress IN NVARCHAR2,
    ModifiedBy IN NUMBER
)
AS 
FavaiconId NUMBER;
CompanyLogoId NUMBER;
CompanyPortalLogoId NUMBER;
SignInPageId NUMBER;
SignInPageLogoId NUMBER;
PurchaseOrderLogoId NUMBER;
BEGIN
    /*Update insert Attachment in Images table */
    /*Favaicon */
         IF FavaiconName IS NOT NULL THEN
         SELECT "Favaicon" 
         INTO FavaiconId 
         FROM "CompanyPortalDetail" 
         WHERE "PortalDetailId"=PortalDetailId;
        IF FavaiconId IS NOT NULL THEN
            UPDATE "Attachment" SET
                "IsDelete"='Y',
                "AttachedDate"=CURRENT_TIMESTAMP
            WHERE "AttachmentId"=FavaiconId;
        END IF;
        INSERT INTO "Attachment"("AttachmentType","AttachmentName","AttachmentPath","IsDelete","AttachedDate")
        VALUES('Image',FavaiconName,FavaiconPath,'N',CURRENT_TIMESTAMP)
        RETURNING "AttachmentId" into FavaiconId;
     END IF;
        /*CompanyLogo */
       IF CompanyLogoName IS NOT NULL THEN
         SELECT "CompanyLogo" 
         INTO CompanyLogoId 
         FROM "CompanyPortalDetail" 
         WHERE "PortalDetailId"=PortalDetailId;
        IF CompanyLogoId IS NOT NULL THEN
            UPDATE "Attachment" SET
                "IsDelete"='Y',
                "AttachedDate"=CURRENT_TIMESTAMP
            WHERE "AttachmentId"=CompanyLogoId;
         END IF;
        INSERT INTO "Attachment"("AttachmentType","AttachmentName","AttachmentPath","IsDelete","AttachedDate")
        VALUES('Image',CompanyLogoName,CompanyLogoPath,'N',CURRENT_TIMESTAMP)
        RETURNING "AttachmentId" into CompanyLogoId;
     END IF;
     
       /*CompanyPortalLogo*/
      IF CompanyPortalLogoName IS NOT NULL THEN
         SELECT "CompanyPortalLogo" 
         INTO CompanyPortalLogoId 
         FROM "CompanyPortalDetail" 
         WHERE "PortalDetailId"=PortalDetailId;
        IF CompanyPortalLogoId IS NOT NULL THEN
            UPDATE "Attachment" SET
                "IsDelete"='Y',
                "AttachedDate"=CURRENT_TIMESTAMP
            WHERE "AttachmentId"=CompanyLogoId;
         END IF;
        INSERT INTO "Attachment"("AttachmentType","AttachmentName","AttachmentPath","IsDelete","AttachedDate")
        VALUES('Image',CompanyPortalLogoName,CompanyPortalLogoPath,'N',CURRENT_TIMESTAMP)
        RETURNING "AttachmentId" into CompanyPortalLogoId;
     END IF;
        /*SignInPage */
      IF SignInPageName IS NOT NULL THEN
         SELECT "SignInPage" 
         INTO SignInPageId 
         FROM "CompanyPortalDetail" 
         WHERE "PortalDetailId"=PortalDetailId;
        IF SignInPageId IS NOT NULL THEN
            UPDATE "Attachment" SET
                "IsDelete"='Y',
                "AttachedDate"=CURRENT_TIMESTAMP
            WHERE "AttachmentId"=SignInPageId;
         END IF;
        INSERT INTO "Attachment"("AttachmentType","AttachmentName","AttachmentPath","IsDelete","AttachedDate")
        VALUES('Image',SignInPageName,SignInPagePath,'N',CURRENT_TIMESTAMP)
        RETURNING "AttachmentId" into SignInPageId;
     END IF;
        /*Favaicon */
       IF SignInPageLogoName IS NOT NULL THEN
         SELECT "Favaicon" 
         INTO SignInPageLogoId 
         FROM "CompanyPortalDetail" 
         WHERE "PortalDetailId"=PortalDetailId;
        IF SignInPageLogoId IS NOT NULL THEN
            UPDATE "Attachment" SET
                "IsDelete"='Y',
                "AttachedDate"=CURRENT_TIMESTAMP
            WHERE "AttachmentId"=SignInPageLogoId;
        END IF;
        INSERT INTO "Attachment"("AttachmentType","AttachmentName","AttachmentPath","IsDelete","AttachedDate")
        VALUES('Image',SignInPageLogoName,SignInPageLogoPath,'N',CURRENT_TIMESTAMP)
        RETURNING "AttachmentId" into SignInPageLogoId;
     END IF;
        /*PurchaseOrderLogo*/
       IF PurchaseOrderLogoName IS NOT NULL THEN
         SELECT "PurchaseOrderLogo" 
         INTO PurchaseOrderLogoId 
         FROM "CompanyPortalDetail" 
         WHERE "PortalDetailId"=PortalDetailId;
        IF PurchaseOrderLogoId IS NOT NULL THEN
            UPDATE "Attachment" SET
                "IsDelete"='Y',
                "AttachedDate"=CURRENT_TIMESTAMP
            WHERE "AttachmentId"=PurchaseOrderLogoId;
        END IF;    
        INSERT INTO "Attachment"("AttachmentType","AttachmentName","AttachmentPath","IsDelete","AttachedDate")
        VALUES('Image',PurchaseOrderLogoName,PurchaseOrderLogoPath,'N',CURRENT_TIMESTAMP)
        RETURNING "AttachmentId" into PurchaseOrderLogoId;
     END IF;
    /*COMPANYINFORMATION update */
   UPDATE "CompanyInformation"
    SET
        "CompanyId" = CompanyId,
        "IsTruckTarpAvaileble" = IsTruckTarpAvaileble,
        "IsTrucTarpMandatory" = IsTrucTarpMandatory,
        "ItemNotStrocked" =ItemNotStrocked,
        "ItemNotAvaileble" = ItemNotAvaileble,
        "QuoteExpirationDays" = QuoteExpirationDays,
        "ModifiedBy" = ModifiedBy,
        "ModifiedDate" = CURRENT_TIMESTAMP
    WHERE
    "CompanyInformationId" = CompanyInformationId;
--
--     /* COMPANYPORTALDETAIL update */
--
   UPDATE "CompanyPortalDetail"
        SET
            "CompanyId" = CompanyId,
            "PortalSoftwareName" = PortalSoftwareName,
            "PortalHeaderDescriptor" = PortalHeaderDescriptor,
            "PortalURL" = PortalURL,
            "GoogleTagManagerId" = GoogleTagManagerId,
            "BuilderWroxSoftwareName" =BuilderWroxSoftwareName,
            "FeedBackEmailAddress" = FeedBackEmailAddress,
            "Favaicon" = FavaiconId,
            "CompanyLogo" = CompanyLogoId,
            "CompanyPortalLogo" = CompanyPortalLogoId,
            "SignInPage" =SignInPageId,
            "SignInPageLogo" = SignInPageLogoId,
            "PurchaseOrderLogo" = PurchaseOrderLogoId,
--            "ModifiedBy" = ModifiedBy,
            "ModifiedDate" =CURRENT_TIMESTAMP,
            "IpAddress"=IpAddress
        WHERE
        "PortalDetailId" = PortalDetailId;
--
----    /* COMPANYLABELMESSAGINGDETAIL update */
--
    UPDATE "CompanyLabelMessagingDetail"
        SET
            "CompanyId" = CompanyId,
            "IsDefualtSetting" = IsDefualtSetting,
            "LoginWelcomeMessage" = LoginWelcomeMessage,
            "ForgotPasswordMeassage" =ForgotPasswordMeassage,
            "OrderNoteMessage" = OrderNoteMessage,
            "StartBuildingAction" = StartBuildingAction,
            "StartBuildingURL" =StartBuildingURL,
            "OrderComponent" =OrderComponent,
            "OrderComponntURL" =OrderComponntURL,
            "ReturnTowebsideName" = ReturnTowebsideName,
            "ReturnToWebSideUrl" = ReturnToWebSideUrl,
            "CompanyAddess" = CompanyAddess,
            "ModifiedBy" = ModifiedBy,
            "ModifiedDate" = CURRENT_TIMESTAMP,
            "IpAddress"=IpAddress
        WHERE
        "LabelMessagingDetailId" = LabelMessagingDetailId;
--
----    /*COMPANYCONTACTUSDETAIL update */
    UPDATE "CompanyContactUsDetail"
        SET
            "CompanyId" =CompanyId,
            "ContactUsPageURL" = ContactUsPageURL,
            "BuidldingSoftwareName" = BuidldingSoftwareName,
            "ComponentSoftwareName" = ComponentSoftwareName,
            "BuildingGoogleAnalyticsId" = BuildingGoogleAnalyticsId,
            "ComponenetAnalyticId" = ComponenetAnalyticId,
            "BuidlingPhone" = BuidlingPhone,
            "ComponentPhone" =ComponentPhone,
            "DistrictManager" =DistrictManager,
            "RegionalManager" = RegionalManager,
            "ServiceRepresentative" =ServiceRepresentative,
            "ModifiedBy" = ModifiedBy,
            "ModifiedDate" = CURRENT_TIMESTAMP,
            "IpAddress"=IpAddress
        WHERE
        "ContactUsDetailId" = ContactUsDetailId;
--
----    /*COMPANYEMAILNOTIFICATION update */
   UPDATE "CompanyEmailNotification"
        SET
            "CompanyId" =CompanyId,
            "PurchaseQueueEmailBuildings" =PurchaseQueueEmailBuildings,
            "PurchaseQueueEmailComponent" =PurchaseQueueEmailComponent,
            "ModifiedBy" = ModifiedBy,
            "ModifiedDate" = CURRENT_TIMESTAMP,
            "IpAddress"=IpAddress
        WHERE
        "CompanyEmailNotificationId" = CompanyEmailNotificationId;
--
----    /*COMPANYMAILSERVERDETAIL update */
     UPDATE "CompanyMailServerDetail"
        SET
            "CompanyId" = CompanyId,
            "IsDefualtSetting" = IsDefualtSettingMailServer,
            "SMTPPHost" = SMTPPHost,
            "SMTPPort" =SMTPPort,
            "IsAuthenticationRequired" = IsAuthenticationRequired,
            "IsUseSSLConnection" = IsUseSSLConnection,
            "UserName" = UserName,
            "Password" =Password,
            "ReplyToAddress" =ReplyToAddress,
            "ModifiedBy" =ModifiedBy,
            "ModifiedDate" =CURRENT_TIMESTAMP,
            "IpAddress"=IpAddress
        WHERE
        "CompanyMailServerDetailId" = CompanyMailServerDetailId;

----    /*COMPANYMAILSERVERDETAIL update */
--
    UPDATE "CompanyOrderDocumentationSetting"
        SET
            "CompanyId" = CompanyId,
            "IsFinalDrawing" = IsFinalDrawing,
            "IsPermitDrawing" =IsPermitDrawing,
            "IsSalesChangeOrder" = IsSalesChangeOrder,
            "IsCalculationFiles" = IsCalculationFiles,
            "IsBOMFiles" =IsBOMFiles,
            "IsApprovalDrawing" =IsApprovalDrawing,
            "IsOpenRegistration" =IsOpenRegistration,
            "IsLangualgeSelection" = IsLangualgeSelection,
            "ModifiedBy" = ModifiedBy,
            "ModifiedDate" = CURRENT_TIMESTAMP,
            "IpAddress"=IpAddress
        WHERE
        "OrderdocumentId" = OrderdocumentId;
END COMPANYINFORMATION_UPDATE;
/