CREATE OR REPLACE PROCEDURE abs_mdi."PRE_PRICING_TABLE_UPDATE" 
(
RafterFlangeBrace  IN   VARCHAR2,
ColumnFlangeBrace  IN   VARCHAR2,
BracingBuildingNumber IN VARCHAR2,
WebDepth1 IN NUMBER,
WebDepth2  IN NUMBER,
RafterDepth1  IN NUMBER,
RafterDepth2  IN NUMBER,
GroupBuildingNumber IN VARCHAR2,
IntColMaxWebDepth IN NUMBER,
ColumnBuildingNumber IN VARCHAR2,
PortalRafterDepth1 IN NUMBER,
PortalRafterDepth2 IN NUMBER,
PortalRafterDepth3 IN NUMBER,
PortalRafterDepth4 IN NUMBER,
SidewallBuildingNumber IN VARCHAR2,
FastenerLength IN VARCHAR2,
RoofBuildingNumber  IN VARCHAR2,
WallPanelFastenerLength  IN NUMBER,
SW1Drops IN NUMBER,
SW2Drops IN NUMBER,
EW3Drops IN NUMBER,
EW4Drops IN NUMBER,
WallPanelBuildingNumber IN VARCHAR2,
IncludeFramedOpening IN VARCHAR2,
LouverBuildingNumber IN VARCHAR2,
SubFraming IN NUMBER,
WindowBuildingNumber IN VARCHAR2,
PartitionFastenerLength  IN NUMBER,
PartitionBuildingNumber IN VARCHAR2
) AS 
BEGIN
IF BracingBuildingNumber IS NOT NULL THEN
UPDATE "Bracing"
SET
    "RafterFlangeBrace" = rafterflangebrace,
    "ColumnFlangeBrace" = columnflangebrace
WHERE
    "BuildingNumber" = BracingBuildingNumber;
END IF;
IF GroupBuildingNumber is NOT NULL THEN 
UPDATE "BFM_Groups"
SET
    "WebDepth1" = webdepth1,
    "WebDepth2" = webdepth2,
    "RafterDepth1" = rafterdepth1,
    "RafterDepth2" = rafterdepth2
WHERE
    "BuildingNumber" = groupbuildingnumber;
END IF;

IF ColumnBuildingNumber IS NOT NULL THEN
UPDATE "BFM_Columns"
SET
    "IntColMaxWebDepth" = IntColMaxWebDepth  
WHERE
    "BuildingNumber" =ColumnBuildingNumber;
END IF;  
  
  IF SidewallBuildingNumber IS NOT NULL THEN
UPDATE "Bracing"
SET
   "PortalRafterDepth1"=PortalRafterDepth1,
"PortalRafterDepth2"=PortalRafterDepth2,
"PortalRafterDepth3"=PortalRafterDepth3,
"PortalRafterDepth4"=PortalRafterDepth4
WHERE
    "BuildingNumber" = SidewallBuildingNumber;
END IF;
  
  IF RoofBuildingNumber IS NOT NULL THEN
UPDATE "Input_Roof"
SET
    "FastenerLength" = FastenerLength  
WHERE
    "BuildingInformationId" =RoofBuildingNumber;
END IF; 
  
 
if wallpanelbuildingnumber is NOT NULL THEN 
UPDATE "Input_Wall"
SET
    "FastenerLength" = WallPanelFastenerLength
    WHERE
    "BuildingInformationId" = wallpanelbuildingnumber;
UPDATE "Input_Trim"
SET
    "SW1Drops" = sw1drops,
    "SW2Drops" = sw2drops,
    "EW3Drops" = ew3drops,
    "EW4Drops" = ew4drops
WHERE
    "BuildingNumber" = wallpanelbuildingnumber;
    
    
END IF; 
  
  
   IF LouverBuildingNumber IS NOT NULL THEN
UPDATE "Accessories_Louvers"
SET
   "IncludeFramedOpening"=IncludeFramedOpening  
WHERE
    "BuildingId" =LouverBuildingNumber;
END IF;   
  
     IF WindowBuildingNumber IS NOT NULL THEN
UPDATE "Accesories_Windows"
SET
   "SubFraming"=SubFraming  
WHERE
    "BuildingNumber" =WindowBuildingNumber;
END IF;  
  
  
IF partitionbuildingnumber IS NOT NULL THEN
    UPDATE "Accesories_Partition"
    SET
        "FastenerLength" = partitionfastenerlength
    WHERE
        "BuildingNumber" = partitionbuildingnumber;
END IF;
  
  
END PRE_PRICING_TABLE_UPDATE;
/