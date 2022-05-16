CREATE OR REPLACE PROCEDURE abs_mdi."SHIPPINGPLANTS_CREATE" (
         ShippingPlantId IN NUMBER,
         PlantCode IN VARCHAR2,
         IsActive IN CHAR,
         Name IN VARCHAR2,
         Latitude IN NUMBER,
         Longitude IN NUMBER,
         IsCanadaApproved IN CHAR,
         PriceMultiplier IN NUMBER,
         IsExpressCapable IN CHAR,
         IsMbciPlant IN CHAR,
         MaximumWeightPerTruck IN NUMBER,
         MinimumFreightFee IN NUMBER,
         FreightSurcharge IN NUMBER,
         MinimumWeight IN NUMBER,
         FreightRate IN NUMBER,
         AdditionalPerTruckFee IN NUMBER,
         CpuAddressId IN NUMBER,
         IsCpuPlant IN CHAR,
         TruckTarpFee IN NUMBER,
         IsComponentsPlant IN CHAR,
         ComponentsLeadDays IN NUMBER,
         UserId IN NUMBER,
         IpAddress IN VARCHAR2,
         OutputId OUT NUMBER
)
AS 
BEGIN
 INSERT INTO "ShippingPlants"
     (
    "PlantCode",
    "IsActive",
    "Name",
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
    "CreatedBy",
    "CreatedDate",
    "IpAddress"
     )
     VALUES
     (
         PlantCode,
         IsActive,
         Name,
         Latitude,
         Longitude,
         IsCanadaApproved,
         PriceMultiplier,
         IsExpressCapable,
         IsMbciPlant,
         MaximumWeightPerTruck,
         MinimumFreightFee,
         FreightSurcharge,
         MinimumWeight,
         FreightRate,
         AdditionalPerTruckFee,
         CpuAddressId,
         IsCpuPlant,
         TruckTarpFee,
         IsComponentsPlant,
         ComponentsLeadDays,
         UserId,
         CURRENT_TIMESTAMP,
         IpAddress
     )
    RETURNING "ShippingPlantId" into OutputId;
    
END SHIPPINGPLANTS_CREATE;
/