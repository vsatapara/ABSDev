CREATE OR REPLACE PROCEDURE abs_mdi."PURCHASER_CREATE" (
    ProjectId             IN   NUMBER,
    PurchaserNumber       IN   VARCHAR2,
    PurchaserName         IN   VARCHAR2,
    PurchaserNameCO       IN   VARCHAR2,
    PurchaserContactName  IN   VARCHAR2,
    EmailAddress          IN   VARCHAR2,
    ManagerName           IN   VARCHAR2,
    MobileNumber          IN   VARCHAR2,
    FaxNumber             IN   VARCHAR2,
    DayPhone              IN   VARCHAR2,
    NightPhone            IN   VARCHAR2,
    PhyAddress1           IN   VARCHAR2,
    PhyAddress2           IN   VARCHAR2,
    PhyCountry            IN   VARCHAR2,
    PhyState              IN   VARCHAR2,
    PhyCounty             IN   VARCHAR2,
    PhyCity               IN   VARCHAR2,
    PhyZipcode            IN   VARCHAR2,
    PhyLongitude          IN   VARCHAR2,
    PhyLatitude           IN   VARCHAR2,
    MailAddress1          IN   VARCHAR2,
    MailAddress2          IN   VARCHAR2,
    MailCountry           IN   VARCHAR2,
    MailState             IN   VARCHAR2,
    MailCounty            IN   VARCHAR2,
    MailCity              IN   VARCHAR2,
    MailZipcode           IN   VARCHAR2,
    MailLongitude         IN   VARCHAR2,
    MailLatitude          IN   VARCHAR2,
    UserId                IN   VARCHAR2,
    IpAddress             IN   VARCHAR2,
    OutputId              OUT  NUMBER
) IS
    rowCount       NUMBER := 0;
    phyAddressId   NUMBER := 0;
    mailAddressId  NUMBER := 0;
BEGIN
    SELECT
        COUNT(1)
    INTO rowCount
    FROM
        "Purchaser"
    WHERE
        "ProjectId" = ProjectId;
    IF rowCount = 0 THEN
        INSERT INTO "Purchaser" (
            "ProjectId",
            "BuyerNumber",
            "BuyerName",
            "BuyerCareOf",
            "BuyerContactName",
            "BuyerEmail1",
            "ManagerName",
            "BuyerMobileNumber",
            "BuyerFaxNumber",
            "BuyerDayPhone",
            "BuyerNightPhone",
            "CreatedBy",
            "CreatedDate",
            "IpAddress",
            "IsDelete"
        ) VALUES (
            ProjectId,
            PurchaserNumber,
            PurchaserName,
            PurchaserNameCO,
            PurchaserContactName,
            EmailAddress,
            ManagerName,
            MobileNumber,
            FaxNumber,
            DayPhone,
            NightPhone,
            0,
            CURRENT_TIMESTAMP,
            IpAddress,
            'N'
        ) RETURNING "PurchaserId" INTO OutputId;
        Address_Create(ProjectId => ProjectId, Address1 => PhyAddress1, Address2 => PhyAddress2, Country => PhyCountry,
                      State => PhyState,
                      County => PhyCounty,
                      City => PhyCity,
                      Zipcode => PhyZipcode,
                      Longitude => PhyLongitude,
                      Latitude => PhyLatitude,
                      CreatedBy => UserId,
                      IpAddress => IpAddress,
                      Addresstype => 'BP',
                      OutputId => phyAddressId);
        Address_Create(ProjectId => ProjectId, Address1 => MailAddress1, Address2 => MailAddress2, Country => MailCountry,
                      State => MailState,
                      County => MailCounty,
                      City => MailCity,
                      Zipcode => MailZipcode,
                      Longitude => MailLongitude,
                      Latitude => MailLatitude,
                      CreatedBy => UserId,
                      IpAddress => IpAddress,
                      Addresstype => 'BM',
                      OutputId => mailAddressId);
    ELSE
        SELECT
            "PurchaserId"
        INTO OutputId
        FROM
            "Purchaser"
        WHERE
            "ProjectId" = ProjectId;
        SELECT
            COUNT(1)
        INTO rowCount
        FROM
            "I_Address"
        WHERE
                "ProjectId" = ProjectId
            AND "AddressType" = 'BP';
        IF rowcount > 0 THEN
            SELECT
                "AddressId"
            INTO PhyAddressId
            FROM
                "I_Address"
            WHERE
                    "ProjectId" = ProjectId
                AND "AddressType" = 'BP';
        END IF;
        SELECT
            COUNT(1)
        INTO rowCount
        FROM
            "I_Address"
        WHERE
                "ProjectId" = ProjectId
            AND "AddressType" = 'BM';
        IF rowcount > 0 THEN
            SELECT
                "AddressId"
            INTO MailAddressId
            FROM
                "I_Address"
            WHERE
                    "ProjectId" = ProjectId
                AND "AddressType" = 'BM';
        END IF;
        Purchaser_Update(PurchaserId => OutputId, ProjectId => ProjectId, PurchaserNumber => PurchaserNumber, PurchaserName => PurchaserName,
                        PurchaserNameCO => PurchaserNameCO,
                        PurchaserContactName => PurchaserContactName,
                        EmailAddress => EmailAddress,
                        ManagerName => ManagerName,
                        MobileNumber => MobileNumber,
                        FaxNumber => FaxNumber,
                        DayPhone => DayPhone,
                        NightPhone => NightPhone,
                        UserId => UserId,
                        IpAddress => IpAddress,
                        PhyAddressId => PhyAddressId,
                        PhyAddress1 => PhyAddress1,
                        PhyAddress2 => PhyAddress2,
                        PhyCountry => PhyCountry,
                        PhyState => PhyState,
                        PhyCounty => PhyCounty,
                        PhyCity => PhyCity,
                        PhyZipcode => PhyZipcode,
                        PhyLongitude => PhyLongitude,
                        PhyLatitude => PhyLatitude,
                        MailAddressId => MailAddressId,
                        MailAddress1 => MailAddress1,
                        MailAddress2 => MailAddress2,
                        MailCountry => MailCountry,
                        MailState => MailState,
                        MailCounty => MailCounty,
                        MailCity => MailCity,
                        MailZipcode => MailZipcode,
                        MailLongitude => MailLongitude,
                        MailLatitude => MailLatitude);
    END IF;
END Purchaser_Create;
/