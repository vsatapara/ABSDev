CREATE OR REPLACE PROCEDURE abs_mdi."SHIPPING_SELECT" (
    ProjectId     IN   NUMBER,
    Shipping_Data  OUT  SYS_REFCURSOR
) AS BEGIN
OPEN Shipping_Data FOR SELECT
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
                      "CreatedBy",
                      "CreatedDate",
                      "IpAddress",
                      "IsDeleted"
                  FROM
                      "Shipping"
                  WHERE
                      "ProjectId" = ProjectId;
END SHIPPING_SELECT;
/