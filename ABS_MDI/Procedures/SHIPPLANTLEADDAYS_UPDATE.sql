CREATE OR REPLACE PROCEDURE abs_mdi."SHIPPLANTLEADDAYS_UPDATE" 
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
 UPDATE "ShipPlantLeadDays" SET
        "ShipPlantCampaignId"=ShipPlantCampaignId,
        "LeadDayClassId"=LeadDayClassId,
        "ShippingPlantId"=ShippingPlantId,
        "DayInput"=DayInput,
        "ModifiedBy"=UserId,
        "ModifiedDate"=CURRENT_TIMESTAMP,
        "IpAddress"=IpAddress
    WHERE "PlantLeadDayId"=PlantLeadDayId;
END SHIPPLANTLEADDAYS_UPDATE;
/