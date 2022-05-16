CREATE OR REPLACE PROCEDURE abs_mdi."SHIPPINGPLANTS_LIST" 
(
Output_Data OUT SYS_REFCURSOR
)
as
BEGIN   
      OPEN Output_Data FOR 
        SELECT
        "ShippingPlantId",
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
        "ComponentsLeadDays"
      
    FROM
        "ShippingPlants";
 
END SHIPPINGPLANTS_LIST;
/