CREATE OR REPLACE PROCEDURE abs_mdi."MISCADDLINES_SELECT" 
(
    AddLinesId IN NUMBER,
    AddLines_Data OUT  SYS_REFCURSOR
)
AS
BEGIN
OPEN AddLines_Data FOR SELECT
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
    LOWER(RAW_TO_GUID("Guid")) Guid,
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
    "RmgPrice",
	"ProjectId"
FROM
    "Input_AddLines"
     WHERE         
            "AddLinesId" = AddLinesId
        AND ("IsDelete" IS NULL  OR "IsDelete" != 'Y');
END MiscAddLines_Select;
/