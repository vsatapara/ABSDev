CREATE OR REPLACE PROCEDURE abs_mdi."SHIPPLANTLEADDAYS_CREATE" 
(
 PlantLeadDayId IN NUMBER,
 ShipPlantCampaignId IN NUMBER ,
 LeadDayClassId IN NUMBER ,
 ShippingPlantId IN NUMBER ,
 DayInput IN NUMBER,
 UserId IN NUMBER,
 IpAddress IN VARCHAR2
)
AS 
BEGIN
  INSERT INTO "ShipPlantLeadDays"
  (
        "ShipPlantCampaignId",
        "LeadDayClassId",
        "ShippingPlantId",
        "DayInput", 
        "CreatedBy",
        "CreatedDate",
        "IpAddress"
     )
     VALUES
     (
        ShipPlantCampaignId,
        LeadDayClassId,
        ShippingPlantId,
        DayInput,
        UserId,
        CURRENT_TIMESTAMP,
        IpAddress
     );
END SHIPPLANTLEADDAYS_CREATE;
/