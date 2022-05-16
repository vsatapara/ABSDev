CREATE OR REPLACE PROCEDURE abs_mdi."MENUADMINBUTTON_SELECT" 
(
    CompanyId IN NUMBER,
    MenuAdminId IN NUMBER,
    Output_Data OUT SYS_REFCURSOR
)
AS
BEGIN
 OPEN Output_Data FOR
    SELECT A."BuilderWroxSoftwareName" AS BuilderWorxButtonText,
    B."StartBuildingAction" AS BuildingButtonText,
       B."OrderComponent" AS ComponentOrderText
    FROM "CompanyPortalDetail" A
    JOIN "CompanyLabelMessagingDetail" B ON A."CompanyId" = B."CompanyId"
    WHERE A."CompanyId" = CompanyId;
END MenuAdminButton_Select;
/