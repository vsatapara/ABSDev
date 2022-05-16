CREATE OR REPLACE PROCEDURE abs_mdi."PREPRICE_UPDATE" (
/*   Created By    Dipali Patel    
     Created Date  10-05-2021
     Description   This stored Procedure used to Update PrePrice data update to respective tables.
*/
    BuildingNumber IN  NUMBER,
    RafterFlangeBrace IN  VARCHAR2,
    ColumnFlangeBrace IN  VARCHAR2,
    WebDepth1 IN  NUMBER,
    WebDepth2 IN  NUMBER,
    RafterDepth1 IN  NUMBER,
    RafterDepth2 IN  NUMBER,
    Groups_IntColMaxWebDepth IN  NUMBER,
    Columns_IntColMaxWebDepth IN  NUMBER,
    PortalRafterDepth1 IN  NUMBER,
    PortalRafterDepth2 IN  NUMBER,
    PortalColumnDepth1 IN  NUMBER,
    PortalColumnDepth2 IN  NUMBER,
    RoofPanel_FastenerLength IN  VARCHAR2,
    WallPanel_FastenerLength IN  VARCHAR2,
    Partitions_FastenerLength IN  VARCHAR2,
    AdditionalGutterSupports IN  NUMBER,
    SW1Drops IN  NUMBER,
    SW2Drops IN  NUMBER,
    EW3Drops IN  NUMBER,
    EW4Drops IN  NUMBER,
    IncludeFramedOpening IN  NUMBER,
    SubFraming IN  NUMBER
) AS
BEGIN
    UPDATE "Bracing"
    SET
        "RafterFlangeBrace"=RafterFlangeBrace,
        "ColumnFlangeBrace"=ColumnFlangeBrace
    WHERE
        "BuildingNumber" = BuildingNumber;
    UPDATE "BFM_Groups"
    SET
        "WebDepth1"=WebDepth1,
        "WebDepth2"=WebDepth2,
        "RafterDepth1"=RafterDepth1,
        "RafterDepth2"=RafterDepth2,
        "IntColMaxWebDepth"=Groups_IntColMaxWebDepth
    WHERE
        "BuildingNumber" = BuildingNumber;
    UPDATE "EDSPrice_O_EWColumns"
    SET
       "WebDepth"=Columns_IntColMaxWebDepth
    WHERE
        "BuildingNumber" = BuildingNumber;   
    UPDATE "Input_GirtsBaySpacing"
    SET
        "PortalRafterDepth1"=PortalRafterDepth1,
        "PortalRafterDepth2"=PortalRafterDepth2,
        "PortalColumnDepth1"=PortalColumnDepth1,
        "PortalColumnDepth2"=PortalColumnDepth2
    WHERE
        "BuildingInformationId" = BuildingNumber;
    UPDATE "Input_Roof"
    SET 
        "FastenerLength"=RoofPanel_FastenerLength
    WHERE
        "BuildingInformationId" = BuildingNumber;
    UPDATE "Input_Wall"
    SET 
        "FastenerLength"=(select "Id" from "M_Panel_Dropdown" where "Value"=WallPanel_FastenerLength and "PanelTypeId"=(SELECT "Type" FROM "Input_Wall" WHERE "BuildingInformationId" = BuildingNumber and rownum =1))
    WHERE
        "BuildingInformationId" = BuildingNumber; 
    UPDATE "Input_Trim"
    SET 
        "AdditionalGutterSupports"=AdditionalGutterSupports,
        "SW1Drops"=SW1Drops,
        "SW2Drops"=SW2Drops,
        "EW3Drops"=EW3Drops,
        "EW4Drops"=EW4Drops
    WHERE
        "BuildingNumber" = BuildingNumber; 
    UPDATE "Accessories_Louvers"
    SET 
        "IncludeFramedOpening"=IncludeFramedOpening
    WHERE
        "BuildingId" = BuildingNumber; 
    UPDATE "Accesories_Windows"
    SET 
        "SubFraming"=SubFraming
    WHERE
        "BuildingNumber" = BuildingNumber; 
    UPDATE "Accesories_Partition"
    SET 
        "FastenerLength"=(select "Id" from "M_Panel_Dropdown" where "Value"=Partitions_FastenerLength and "PanelTypeId"=(SELECT "PanelType" FROM "Accesories_Partition" WHERE "BuildingNumber" = BuildingNumber and rownum =1))
    WHERE
        "BuildingNumber" = BuildingNumber; 
END PrePrice_Update;
/