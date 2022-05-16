CREATE OR REPLACE PROCEDURE abs_mdi."SHIPPING_GETBYBUILDINGID" 
(
    ProjectId IN VARCHAR2,
    OUTPUT_TABLE OUT  SYS_REFCURSOR
)
AS
BEGIN
OPEN OUTPUT_TABLE FOR SELECT
    "ShippingId",
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
    "InternationalSite"
FROM
    "Shipping"
WHERE
                "ProjectId"=ProjectId
             AND "IsDeleted" != 'Y';
END;
/