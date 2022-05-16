CREATE OR REPLACE PROCEDURE abs_mdi."SHIPPING_CREATE" (
    ProjectId              IN   NUMBER,
    ShippingPointId        IN   NUMBER,
    ShippingTerms          IN   VARCHAR2,
    ShippingContact        IN   VARCHAR2,
    Notification           IN   VARCHAR2,
    DayPhone               IN   VARCHAR2,
    NightPhone             IN   VARCHAR2,
    FreightTerms           IN   VARCHAR2,
    FreightExpense         IN   NUMBER,
    Carrier                IN   VARCHAR2,
    Country                IN   VARCHAR2,
    State                  IN   VARCHAR2,
    County                 IN   VARCHAR2,
    City                   IN   VARCHAR2,
    Address1               IN   VARCHAR2,
    Address2               IN   VARCHAR2,
    ZipCode                IN   VARCHAR2,
    Latitude               IN   VARCHAR2,
    Longitude              IN   VARCHAR2,
    RequestedDeliveryDate  IN   VARCHAR2,
    Miles1                 IN   VARCHAR2,
    Miles2                 IN   VARCHAR2,
    Miles3                 IN   VARCHAR2,
    Rate1                  IN   VARCHAR2,
    Rate2                  IN   VARCHAR2,
    Rate3                  IN   VARCHAR2,
    NumberLoads1           IN   VARCHAR2,
    NumberLoads2           IN   VARCHAR2,
    NumberLoads3           IN   VARCHAR2,
    TruckTarps             IN   CHAR,
    CopyFlag               IN   CHAR,
    AddIMPOverages         IN   CHAR,
    AddExportOverages      IN   CHAR,
    UserId                 IN   VARCHAR2,
    IpAddress              IN   VARCHAR2,
    OutputId               OUT  NUMBER
) IS
    rowCount NUMBER;
BEGIN
    SELECT
        COUNT(1)
    INTO rowCount
    FROM
        "Shipping"
    WHERE
        "ProjectId" = ProjectId;
    IF rowCount = 0 THEN
        INSERT INTO "Shipping" (
            "ProjectId",
            "ShippingPointId",
            "ShippingTerms",
            "ShippingContact",
            "Notification",
            "DayPhone",
            "NightPhone",
            "FreightTerms",
            "FreightExpense",
            "Carrier",
            "Country",
            "State",
            "County",
            "City",
            "Address1",
            "Address2",
            "ZipCode",
            "Latitude",
            "Longitude",
            "RequestedDeliveryDate",
            "Miles1",
            "Miles2",
            "Miles3",
            "Rate1",
            "Rate2",
            "Rate3",
            "NumberLoads1",
            "NumberLoads2",
            "NumberLoads3",
            "TruckTarps",
            "CopyFlag",
            "AddIMPOverages",
            "AddExportOverages",
            "CreatedBy",
            "CreatedDate",
            "IpAddress",
            "IsDeleted"
        ) VALUES (
            ProjectId,
            ShippingPointId,
            ShippingTerms,
            ShippingContact,
            Notification,
            DayPhone,
            NightPhone,
            FreightTerms,
            FreightExpense,
            Carrier,
            Country,
            State,
            County,
            City,
            Address1,
            Address2,
            ZipCode,
            Latitude,
            Longitude,
            TO_DATE(RequestedDeliveryDate, 'MM/DD/YYYY'),
            Miles1,
            Miles2,
            Miles3,
            Rate1,
            Rate2,
            Rate3,
            NumberLoads1,
            NumberLoads2,
            NumberLoads3,
            TruckTarps,
            CopyFlag,
            AddIMPOverages,
            AddExportOverages,
            UserId,
            CURRENT_TIMESTAMP,
            IpAddress,
            'N'
        ) RETURNING "ShippingId" INTO OutputId;
    ELSE
        SELECT
            "ShippingId"
        INTO OutputId
        FROM
            "Shipping"
        WHERE
            "ProjectId" = ProjectId;
        SHIPPING_UPDATE(ShippingId => OutputId, ProjectId => ProjectId, ShippingPointId => ShippingPointId, ShippingTerms => ShippingTerms,
                       ShippingContact => ShippingContact,
                       Notification => Notification,
                       DayPhone => DayPhone,
                       NightPhone => NightPhone,
                       FreightTerms => FreightTerms,
                       FreightExpense => FreightExpense,
                       Carrier => Carrier,
                       Country => Country,
                       State => State,
                       County => County,
                       City => City,
                       Address1 => Address1,
                       Address2 => Address2,
                       ZipCode => ZipCode,
                       Latitude => Latitude,
                       Longitude => Longitude,
                       RequestedDeliveryDate => RequestedDeliveryDate,
                       Miles1 => Miles1,
                       Miles2 => Miles2,
                       Miles3 => Miles3,
                       Rate1 => Rate1,
                       Rate2 => Rate2,
                       Rate3 => Rate3,
                       NumberLoads1 => NumberLoads1,
                       NumberLoads2 => NumberLoads2,
                       NumberLoads3 => NumberLoads3,
                       TruckTarps => TruckTarps,
                       CopyFlag => CopyFlag,
                       AddIMPOverages => AddIMPOverages,
                       AddExportOverages => AddExportOverages,
                       UserId => UserId,
                       IpAddress => IpAddress);
    END IF;
END SHIPPING_CREATE;
/