CREATE OR REPLACE PROCEDURE abs_mdi."SHIPPINGPLANTS_LIST_COMPANYID" 
(
CompanyId    IN   NUMBER,
Output_Data OUT SYS_REFCURSOR
)
IS  
ShippingPalntGroupId number;
BEGIN
    select NVL("ShippingPlantGroupFromParentId",0) into ShippingPalntGroupId from "Company" where "CompanyId"=CompanyId;
    if ShippingPalntGroupId != 0 then
    begin
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
        "ShippingPlants" S
        inner join "ShippingPlantGrouping" SPG on SPG."ShippingPlantID" = S."ShippingPlantId" and SPG."ShippingGroupID" = ShippingPalntGroupId;    
  end;
  else
  begin
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
   end;
END IF;
END SHIPPINGPLANTS_LIST_CompanyId;
/