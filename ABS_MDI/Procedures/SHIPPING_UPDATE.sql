CREATE OR REPLACE PROCEDURE abs_mdi."SHIPPING_UPDATE" (
		ShippingId IN NUMBER,
		ProjectId IN  NUMBER,
		ShippingPointId     IN  NUMBER,
		ShippingTerms     IN  VARCHAR2,
		ShippingContact     IN  VARCHAR2,
		Notification     IN  VARCHAR2,
		DayPhone     IN  VARCHAR2,
		NightPhone     IN  VARCHAR2,
		FreightTerms     IN  VARCHAR2,
		FreightExpense     IN  NUMBER,
		Carrier     IN  VARCHAR2,
		Country     IN  VARCHAR2,
		State     IN  VARCHAR2,
		County     IN  VARCHAR2,
		City     IN  VARCHAR2,
		Address1     IN  VARCHAR2,
		Address2     IN  VARCHAR2,
		ZipCode     IN  VARCHAR2,
		Latitude     IN  VARCHAR2,
		Longitude     IN  VARCHAR2,
		RequestedDeliveryDate     IN  VARCHAR2,
		Miles1     IN  VARCHAR2,
		Miles2     IN  VARCHAR2,
		Miles3     IN  VARCHAR2,
		Rate1     IN  VARCHAR2,
		Rate2     IN  VARCHAR2,
		Rate3     IN  VARCHAR2,
		NumberLoads1     IN  VARCHAR2,
		NumberLoads2     IN  VARCHAR2,
		NumberLoads3     IN  VARCHAR2,
		TruckTarps     IN  CHAR,
		CopyFlag     IN  CHAR,
		AddIMPOverages     IN  CHAR,
		AddExportOverages     IN CHAR,
		UserId          IN  VARCHAR2,
		IpAddress       IN   VARCHAR2
		) AS
BEGIN
    UPDATE "Shipping"
	SET
		"ProjectId"  =  ProjectId,
		"ShippingPointId"  =  ShippingPointId,
		"ShippingTerms"  =  ShippingTerms,
		"ShippingContact"  =  ShippingContact,
		"Notification"  =  Notification,
		"DayPhone"  =  DayPhone,
		"NightPhone"  =  NightPhone,
		"FreightTerms"  =  FreightTerms,
		"FreightExpense"  =  FreightExpense,
		"Carrier"  =  Carrier,
		"Country"  =  Country,
		"State"  =  State,
		"County"  =  County,
		"City"  =  City,
		"Address1"  =  Address1,
		"Address2"  =  Address2,
		"ZipCode"  =  ZipCode,
		"Latitude"  =  Latitude,
		"Longitude"  =  Longitude,
		"RequestedDeliveryDate"  =  TO_DATE(RequestedDeliveryDate, 'MM/DD/YYYY'),
		"Miles1"  =  Miles1,
		"Miles2"  =  Miles2,
		"Miles3"  =  Miles3,
		"Rate1"  =  Rate1,
		"Rate2"  =  Rate2,
		"Rate3"  =  Rate3,
		"NumberLoads1"  =  NumberLoads1,
		"NumberLoads2"  =  NumberLoads2,
		"NumberLoads3"  =  NumberLoads3,
		"TruckTarps"  =  TruckTarps,
		"CopyFlag"  =  CopyFlag,
		"AddIMPOverages"  =  AddIMPOverages,
		"AddExportOverages"  =  AddExportOverages,
        "ModifiedBy" = UserId,
        "ModifiedDate" = CURRENT_TIMESTAMP,
        "IpAddress" = IpAddress
    WHERE
        "ShippingId" = ShippingId;
END SHIPPING_UPDATE;
/