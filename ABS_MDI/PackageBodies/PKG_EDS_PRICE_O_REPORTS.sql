CREATE OR REPLACE PACKAGE BODY abs_mdi."PKG_EDS_PRICE_O_REPORTS" 
is
    -- insert
    procedure inserttbl (
    p_Description in EDS_Price_O_Reports.Description%type default null 
    ,p_Category in EDS_Price_O_Reports.Category%type default null 
    ,p_DraftingHours in EDS_Price_O_Reports.DraftingHours%type default null 
    ,p_PartNumber in EDS_Price_O_Reports.PartNumber%type default null 
    ,p_Hours in EDS_Price_O_Reports.Hours%type default null 
    ,p_TempInteger2 in EDS_Price_O_Reports.TempInteger2%type default null 
    ,p_TempInteger1 in EDS_Price_O_Reports.TempInteger1%type default null 
    ,p_ModifiedDate in EDS_Price_O_Reports.ModifiedDate%type default null 
    ,p_ModifiedBy in EDS_Price_O_Reports.ModifiedBy%type default null 
    ,p_Item in EDS_Price_O_Reports.Item%type default null 
    ,p_UnitWeight in EDS_Price_O_Reports.UnitWeight%type default null 
    ,p_Elevation in EDS_Price_O_Reports.Elevation%type default null 
    ,p_TempString1 in EDS_Price_O_Reports.TempString1%type default null 
    ,p_TempString2 in EDS_Price_O_Reports.TempString2%type default null 
    ,p_UnitLabor in EDS_Price_O_Reports.UnitLabor%type default null 
    ,p_O_ReportsId in EDS_Price_O_Reports.O_ReportsId%type
    ,p_PriceAppliedTo in EDS_Price_O_Reports.PriceAppliedTo%type default null 
    ,p_IsDeleted in EDS_Price_O_Reports.IsDeleted%type default null 
    ,p_CreatedBy in EDS_Price_O_Reports.CreatedBy%type default null 
    ,p_Quantity in EDS_Price_O_Reports.Quantity%type default null 
    ,p_UnitPrice in EDS_Price_O_Reports.UnitPrice%type default null 
    ,p_UOM in EDS_Price_O_Reports.UOM%type default null 
    ,p_TotalWeight in EDS_Price_O_Reports.TotalWeight%type default null 
    ,p_CustServHours in EDS_Price_O_Reports.CustServHours%type default null 
    ,p_Length in EDS_Price_O_Reports.Length%type default null 
    ,p_TempDouble2 in EDS_Price_O_Reports.TempDouble2%type default null 
    ,p_BuildingNumber in EDS_Price_O_Reports.BuildingNumber%type default null 
    ,p_TempDouble1 in EDS_Price_O_Reports.TempDouble1%type default null 
    ,p_TotalPrice in EDS_Price_O_Reports.TotalPrice%type default null 
    ,p_CreatedDate in EDS_Price_O_Reports.CreatedDate%type default null 
    ,p_IpAddress in EDS_Price_O_Reports.IpAddress%type default null 
    ,p_Id in EDS_Price_O_Reports.Id%type default null 
    ,p_EngHours in EDS_Price_O_Reports.EngHours%type default null 
    ) is
    begin
    insert into EDS_Price_O_Reports(
    Description
    ,Category
    ,DraftingHours
    ,PartNumber
    ,Hours
    ,TempInteger2
    ,TempInteger1
    ,ModifiedDate
    ,ModifiedBy
    ,Item
    ,UnitWeight
    ,Elevation
    ,TempString1
    ,TempString2
    ,UnitLabor
    ,O_ReportsId
    ,PriceAppliedTo
    ,IsDeleted
    ,CreatedBy
    ,Quantity
    ,UnitPrice
    ,UOM
    ,TotalWeight
    ,CustServHours
    ,Length
    ,TempDouble2
    ,BuildingNumber
    ,TempDouble1
    ,TotalPrice
    ,CreatedDate
    ,IpAddress
    ,Id
    ,EngHours
    ) values (
    p_Description
    ,p_Category
    ,p_DraftingHours
    ,p_PartNumber
    ,p_Hours
    ,p_TempInteger2
    ,p_TempInteger1
    ,p_ModifiedDate
    ,p_ModifiedBy
    ,p_Item
    ,p_UnitWeight
    ,p_Elevation
    ,p_TempString1
    ,p_TempString2
    ,p_UnitLabor
    ,p_O_ReportsId
    ,p_PriceAppliedTo
    ,p_IsDeleted
    ,p_CreatedBy
    ,p_Quantity
    ,p_UnitPrice
    ,p_UOM
    ,p_TotalWeight
    ,p_CustServHours
    ,p_Length
    ,p_TempDouble2
    ,p_BuildingNumber
    ,p_TempDouble1
    ,p_TotalPrice
    ,p_CreatedDate
    ,p_IpAddress
    ,p_Id
    ,p_EngHours
    );
    end;

    -- del
    procedure deletetbl (
    p_O_ReportsId in EDS_Price_O_Reports.O_ReportsId%type
    ) is
    begin

    delete from EDS_Price_O_Reports
    where O_ReportsId = p_O_ReportsId;

    end;

end pkg_EDS_Price_O_Reports;
/