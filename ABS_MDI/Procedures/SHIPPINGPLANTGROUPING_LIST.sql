CREATE OR REPLACE PROCEDURE abs_mdi."SHIPPINGPLANTGROUPING_LIST" 
(
ShippingGroupID number,
Output_Data OUT SYS_REFCURSOR
) AS 
BEGIN
  OPEN Output_Data FOR 
        SELECT 
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
        "ShippingPlantId",
        FN_CHECKSHIPPINGPLANTEXISTINGROUP("ShippingPlantId",ShippingGroupID) as RecordExist
FROM  "ShippingPlants"; --spg
--LEFT OUTER JOIN "ShippingPlants" sp ON spg."ShippingPlantID" = sp."ShippingPlantId"
 --where spg."ShippingGroupID" = ShippingGroupID;    
END shippingplantgrouping_LIST;
/