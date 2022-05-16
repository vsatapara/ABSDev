CREATE OR REPLACE PROCEDURE abs_mdi."ADDLINES_GETBYBUILDINGID" 
(
    BuildingId IN VARCHAR2,
    OUTPUT_TABLE OUT  SYS_REFCURSOR
)
AS
BEGIN
OPEN OUTPUT_TABLE FOR SELECT
    "AddLinesId",
    "BuildingInformationId",
    "Description",
    "UnitWeight",
    "UnitPrice",
    "ListOrNet",
    "ExpiresOn",
    "QuoteNumber",
    "QuoteYear",
    "EstInitials",
    LOWER (RAW_TO_GUID ("Guid")) Guid,
    "Quantity",
    "Internal",
    "IncludeFreight",
    "DontShowPriceWeight",
    "IsSpecialized",
    "ScreenType",
    "TaxApplied",
    "AdjustmentFactor",
    "Expired",
    "Category",
    "BuiltupWeight",
    "BuiltupPrice",
    "HotrolledWeight",
    "HotrolledPrice",
    "ColdformWeight",
    "ColdformPrice",
    "FabColdformWeight",
    "FabColdformPrice",
    "RoofpanelWeight",
    "RoofpanelPrice",
    "WallpanelWeight",
    "WallpanelPrice",
    "TrimWeight",
    "TrimPrice",
    "BuyoutsWeight",
    "BuyoutsPrice",
    "WarehouseWeight",
    "WarehousePrice",
    "OtherWeight",
    "OtherPrice",
    "AdditionalEngineering",
    "DrawingsCalcs",
    "WTWarranty",
    "INSULATION",
    "Freight",
    "FabricatedICF",
    "BuyoutMarkup",
    "DetailsByPercentage",
    "MezzanineNumber",
    "RmgPrice"
FROM
    "Input_AddLines"
     WHERE
                "BuildingInformationId" in
                ( 
                        SELECT regexp_substr(BuildingId,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingId, '[^,]+', 1, level) is not null
                );
END;
/