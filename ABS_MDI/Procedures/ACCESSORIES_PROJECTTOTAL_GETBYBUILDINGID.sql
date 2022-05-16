CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORIES_PROJECTTOTAL_GETBYBUILDINGID" 
(
    ProjectId IN VARCHAR2,
    OUTPUT_TABLE OUT  SYS_REFCURSOR
)
AS
BEGIN
OPEN OUTPUT_TABLE FOR SELECT
    "ProjectTotalId",
    "ProjectNumber",
    "BaseTotalWeight",
    "BaseTotalPrice",
    "AccessoryTotalWeight",
    "AccessoryTotalPrice",
    "ListAddlinesWeight",
    "ListAddlinesPrice",
    "NetAddlinesWeight",
    "NetAddlinesPrice",
    "BuyoutsWeight",
    "BuyoutsPrice",
    "DiscountWeight",
    "DiscountPrice",
    "MultiplierWeight",
    "MultiplierPrice",
    "InsulationWeight",
    "InsulationPrice",
    "IncompletePricing",
    "ProcessingCharges",
    "Surcharge",
    "MezzNetWeight",
    "MezzNetPrice",
    "MezzListWeight",
    "MezzListPrice",
    "ComponentsWeight",
    "ComponentsPrice",
    "FreightPrice",
    "FreightWeight",
    "FreightRate1",
    "FreightRate2",
    "FreightLoads1",
    "FreightLoads2",
    "SalesTax",
    "FreightMiles1",
    "FreightMiles2",
    "SalesTaxPercent",
    "DunnageWeight",
    "ErectionPrice",
    "AdditionalCut",
    "SingleArticleTax",
    "FreightTaxable",
    "TotalSellFobPlant",
    "TotalFreight",
    "TotalTax",
    "GrandTotal",
    "StandardMultiplier",
    "SellingPrice",
    "TransferCost",
    "NetAddlinesWeightFreight",
    "SubmittalPackagesPrice",
    "RegionalAdjustment",
    "IPSFreightPrice",
    "IPSFreightWeight",
    "IPSFreightRate",
    "IPSFreightLoads",
    "AuthorizedAdjustment",
    "TotalGrossMargin",
    "ComponentsListWeight",
    "ComponentsListPrice",
    "ListMargin",
    "NetMargin",
    "LBPFreightPrice",
    "LBPFreightWeight",
    "LBPFreightRate",
    "LBPFreightLoads",
    "ListMarginPercentage",
    "NetMarginPercentage",
    "ProjectId"
FROM
    "EDSPrice_O_ProjectTotal"
     WHERE 
     "ProjectId" in
    (
            SELECT regexp_substr(ProjectId,'[^,]+', 1, level) from dual
            connect by regexp_substr(ProjectId, '[^,]+', 1, level) is not null
    )
    AND NVL("IsDeleted",'N') != 'Y';
END ACCESSORIES_PROJECTTOTAL_GETBYBUILDINGID;
/