CREATE OR REPLACE PROCEDURE abs_mdi."SHIPPINGPLANTS_SELECT" 
(
    ShippingPlantId IN NUMBER,
    OUTPUT_DATA OUT SYS_REFCURSOR,
    OUTPUT_DATASHIPTO OUT SYS_REFCURSOR,
    OUTPUT_LEADDAY OUT SYS_REFCURSOR
)
AS 
BEGIN
 OPEN Output_Data FOR 
 SELECT
    "ShippingPlantId",
    "PlantCode",
    "ShippingPlants"."IsActive",
    "ShippingPlants"."Name",
    "Latitude",
    "Longitude",
    "IsCanadaApproved",
    "PriceMultiplier",
    "IsExpressCapable",
    "IsMbciPlant",
    "MaximumWeightPerTruck",
    "MinimumFreightFee",
    "FreightSurcharge",
    "MinimumWeight",
    "FreightRate",
    "AdditionalPerTruckFee",
    "CpuAddressId",
    "IsCpuPlant",
    "TruckTarpFee",
    "IsComponentsPlant",
    "ComponentsLeadDays",
    "Address1"
FROM
    "ShippingPlants"
    LEFT OUTER JOIN "CpuAddresses" on "ShippingPlants"."CpuAddressId" = "CpuAddresses"."AddressId"
WHERE "ShippingPlantId"=ShippingPlantId;
 
 OPEN Output_Datashipto FOR         
        SELECT 
          S."CountriesToShipId",
          S."ShippingPlantId",
          T."Id" as "CountryId",
          T."ItemText" as "CountryName"
        FROM "ShipPlantCountriesToShip" S
        RIGHT OUTER JOIN "TableOfTables" T ON  S."CountryId" = T."Id" AND "ShippingPlantId"=ShippingPlantId
        where T."Category"='Country';        
   
OPEN Output_Leadday FOR 
        SELECT 
        C."PlantLeadDayId",
        C."ShipPlantCampaignId",
        C."LeadDayClassId",
        C."ShippingPlantId",
        C."DayInput",
        C1."ItemText" as "CampaignName",
        C2."ItemText" as "ClassName"
        FROM "ShipPlantLeadDays" C
        LEFT JOIN "TableOfTables" C1
        ON C."ShipPlantCampaignId"=C1."Id"
        LEFT JOIN "TableOfTables" C2
        ON C."LeadDayClassId"=C2."Id"
        WHERE C."ShippingPlantId"=ShippingPlantId;             
        
END SHIPPINGPLANTS_SELECT;
/