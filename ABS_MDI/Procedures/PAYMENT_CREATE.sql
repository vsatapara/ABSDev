CREATE OR REPLACE PROCEDURE abs_mdi."PAYMENT_CREATE" (
    ProjectId              IN   NUMBER,
    OrderedBy              IN   VARCHAR2,
    CreditTerms            IN   VARCHAR2,
    BuilderPO              IN   VARCHAR2,
    TaxExemptStatus        IN   VARCHAR2,
    TaxExemptNumber        IN   VARCHAR2,
    ClarificationDayPhone  IN   VARCHAR2,
    GCName                 IN   VARCHAR2,
    GCAddress1             IN   VARCHAR2,
    GCAddress2             IN   VARCHAR2,
    GCCountry              IN   VARCHAR2,
    GCState                IN   VARCHAR2,
    GCCounty               IN   VARCHAR2,
    GCCity                 IN   VARCHAR2,
    GCZipcode              IN   VARCHAR2,
    GCLongitude            IN   VARCHAR2,
    GCLatitude             IN   VARCHAR2,
    ErectorName            IN   VARCHAR2,
    ErectorAddress1        IN   VARCHAR2,
    ErectorAddress2        IN   VARCHAR2,
    ErectorCountry         IN   VARCHAR2,
    ErectorState           IN   VARCHAR2,
    ErectorCounty          IN   VARCHAR2,
    ErectorCity            IN   VARCHAR2,
    ErectorZipcode         IN   VARCHAR2,
    ErectorLongitude       IN   VARCHAR2,
    ErectorLatitude        IN   VARCHAR2,
    LenderName             IN   VARCHAR2,
    LenderPhone            IN   VARCHAR2,
    LenderAddress1         IN   VARCHAR2,
    LenderAddress2         IN   VARCHAR2,
    LenderCountry          IN   VARCHAR2,
    LenderState            IN   VARCHAR2,
    LenderCounty           IN   VARCHAR2,
    LenderCity             IN   VARCHAR2,
    LenderZipcode          IN   VARCHAR2,
    LenderLongitude        IN   VARCHAR2,
    LenderLatitude         IN   VARCHAR2,
    UserId                 IN   VARCHAR2,
    IpAddress              IN   VARCHAR2,
    OutputId               OUT  NUMBER,
    GCAddressId            IN OUT  NUMBER,
    ErectorAddressId       IN OUT  NUMBER,
    LenderAddressId        IN OUT  NUMBER
) IS
    rowCount          NUMBER := 0;
BEGIN
    SELECT
        COUNT(1)
    INTO rowCount
    FROM
        "EDSPrice_I_Payment"
    WHERE
        "ProjectId" = ProjectId;
    IF rowCount = 0 THEN
        INSERT INTO "EDSPrice_I_Payment" (
            "ProjectId",
            "OrderedBy",
            "CreditTerms",
            "BuilderPO",
            "TaxExemptStatus",
            "TaxExemptNumber",
            "ClarificationDayPhone",
            "GCName",
            "ErectorName",
            "LenderName",
            "LenderPhone",
            "CreatedBy",
            "IpAddress"
        ) VALUES (
            ProjectId,
            OrderedBy,
            CreditTerms,
            BuilderPO,
            TaxExemptStatus,
            TaxExemptNumber,
            ClarificationDayPhone,
            GCName,
            ErectorName,
            LenderName,
            LenderPhone,
            UserId,
            IpAddress
        ) RETURNING "PaymentId" INTO OutputId;
        Address_Create(ProjectId => ProjectId, Address1 => GCAddress1, Address2 => GCAddress2, Country => GCCountry,
                      State => GCState,
                      County => GCCounty,
                      City => GCCity,
                      Zipcode => GCZipcode,
                      Longitude => GCLongitude,
                      Latitude => GCLatitude,
                      CreatedBy => UserId,
                      IpAddress => IpAddress,
                      Addresstype => 'GC',
                      OutputId => GCAddressId);
        Address_Create(ProjectId => ProjectId, Address1 => ErectorAddress1, Address2 => ErectorAddress2, Country => ErectorCountry,
                      State => ErectorState,
                      County => ErectorCounty,
                      City => ErectorCity,
                      Zipcode => ErectorZipcode,
                      Longitude => ErectorLongitude,
                      Latitude => ErectorLatitude,
                      CreatedBy => UserId,
                      IpAddress => IpAddress,
                      Addresstype => 'ER',
                      OutputId => ErectorAddressId);
        Address_Create(ProjectId => ProjectId, Address1 => LenderAddress1, Address2 => LenderAddress2, Country => LenderCountry,
                      State => LenderState,
                      County => LenderCounty,
                      City => LenderCity,
                      Zipcode => LenderZipcode,
                      Longitude => LenderLongitude,
                      Latitude => LenderLatitude,
                      CreatedBy => UserId,
                      IpAddress => IpAddress,
                      Addresstype => 'LE',
                      OutputId => LenderAddressId);
    ELSE
        SELECT
            "PaymentId"
        INTO OutputId
        FROM
            "EDSPrice_I_Payment"
        WHERE
            "ProjectId" = ProjectId;
        SELECT
            COUNT(1)
        INTO rowCount
        FROM
            "I_Address"
        WHERE
                "ProjectId" = ProjectId
            AND "AddressType" = 'GC';
        IF rowcount > 0 THEN
            SELECT
                "AddressId"
            INTO GCAddressId
            FROM
                "I_Address"
            WHERE
                    "ProjectId" = ProjectId
                AND "AddressType" = 'GC';
        END IF;
        SELECT
            COUNT(1)
        INTO rowCount
        FROM
            "I_Address"
        WHERE
                "ProjectId" = ProjectId
            AND "AddressType" = 'ER';
        IF rowcount > 0 THEN
            SELECT
                "AddressId"
            INTO ErectorAddressId
            FROM
                "I_Address"
            WHERE
                    "ProjectId" = ProjectId
                AND "AddressType" = 'ER';
        END IF;
        SELECT
            COUNT(1)
        INTO rowCount
        FROM
            "I_Address"
        WHERE
                "ProjectId" = ProjectId
            AND "AddressType" = 'LE';
        IF rowcount > 0 THEN
            SELECT
                "AddressId"
            INTO LenderAddressId
            FROM
                "I_Address"
            WHERE
                    "ProjectId" = ProjectId
                AND "AddressType" = 'LE';
        END IF;
        Payment_Update(ProjectId => ProjectId, PaymentId => OutputId, OrderedBy => OrderedBy, CreditTerms => CreditTerms,
                      BuilderPO => BuilderPO,
                      TaxExemptStatus => TaxExemptStatus,
                      TaxExemptNumber => TaxExemptNumber,
                      ClarificationDayPhone => ClarificationDayPhone,
                      GCName => GCName,
                      GCAddressId => GCAddressId,
                      GCAddress1 => GCAddress1,
                      GCAddress2 => GCAddress2,
                      GCCountry => GCCountry,
                      GCState => GCState,
                      GCCounty => GCCounty,
                      GCCity => GCCity,
                      GCZipcode => GCZipcode,
                      GCLongitude => GCLongitude,
                      GCLatitude => GCLatitude,
                      ErectorName => ErectorName,
                      ErectorAddressId => ErectorAddressId,
                      ErectorAddress1 => ErectorAddress1,
                      ErectorAddress2 => ErectorAddress2,
                      ErectorCountry => ErectorCountry,
                      ErectorState => ErectorState,
                      ErectorCounty => ErectorCounty,
                      ErectorCity => ErectorCity,
                      ErectorZipcode => ErectorZipcode,
                      ErectorLongitude => ErectorLongitude,
                      ErectorLatitude => ErectorLatitude,
                      LenderName => LenderName,
                      LenderPhone => LenderPhone,
                      LenderAddressId => LenderAddressId,
                      LenderAddress1 => LenderAddress1,
                      LenderAddress2 => LenderAddress2,
                      LenderCountry => LenderCountry,
                      LenderState => LenderState,
                      LenderCounty => LenderCounty,
                      LenderCity => LenderCity,
                      LenderZipcode => LenderZipcode,
                      LenderLongitude => LenderLongitude,
                      LenderLatitude => LenderLatitude,
                      UserId => UserId,
                      IpAddress => IpAddress);
    END IF;
END Payment_Create;
/