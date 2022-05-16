CREATE OR REPLACE PROCEDURE abs_mdi."SHIPPINGPLANTS_UPDATE" 
(
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
         IpAddress IN VARCHAR2
)AS 
BEGIN
    UPDATE "ShippingPlants" SET
        "PlantCode"=PlantCode,
        "IsActive"=IsActive,
        "Name"=Name,
        "Latitude"=Latitude,
        "Longitude"=Longitude,
        "IsCanadaApproved"=IsCanadaApproved,
        "PriceMultiplier"=PriceMultiplier,
        "IsExpressCapable"=IsExpressCapable,
        "IsMbciPlant"=IsMbciPlant,
        "MaximumWeightPerTruck"=MaximumWeightPerTruck,
        "MinimumFreightFee"=MinimumFreightFee,
        "FreightSurcharge"=FreightSurcharge,
        "MinimumWeight"=MinimumWeight,
        "FreightRate"=FreightRate,
        "AdditionalPerTruckFee"=AdditionalPerTruckFee,
        "CpuAddressId"=CpuAddressId,
        "IsCpuPlant"=IsCpuPlant,
        "TruckTarpFee"=TruckTarpFee,
        "IsComponentsPlant"=IsComponentsPlant,
        "ComponentsLeadDays"=ComponentsLeadDays,
        "ModifiedBy"=UserId,
        "ModifiedDate"=CURRENT_TIMESTAMP,
        "IpAddress"=IpAddress
    WHERE "ShippingPlantId"=ShippingPlantId;
END SHIPPINGPLANTS_UPDATE;
/