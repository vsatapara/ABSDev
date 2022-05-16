CREATE OR REPLACE PROCEDURE abs_mdi."CS_LAYERCOLOR_SELECT" (
/*
Created By: Yasin Mangroliya
Created Date: 23-11-2021
Description: This procedure is  used to Get Data from CS_LAYERCOLOR table
*/
    CS_LayerColor_Data  OUT  SYS_REFCURSOR
    )
AS 
BEGIN
    OPEN CS_LayerColor_Data  FOR SELECT
     "LayerColorId", 
	"LayerColorGlaz", 
	"LayerColorWall", 
	"LayerColorAnnoTb", 
	"LayerColorDoor", 
	"LayerColorRoof", 
	"LayerColorGrid", 
	"LayerColorElevSymbl", 
	"LayerColorAreaId", 
	"LayerColorParking", 
	"LayerColorCar", 
	"LayerColorAnnoLegn", 
	"LayerColorSite", 
	"LayerColorSiteUtil", 
	"LayerColorPlant", 
	"LayerColorDetailIdent", 
	"LayerColorNotes", 
	"LayerColorSectIdent", 
	"LayerColorDims", 
	"LayerColorTrim", 
	"LayerColorColumn", 
	"LayerColorRafter", 
	"LayerColorSecondary", 
	"LayerColorBracing", 
	"LayerColorBolt", 
	"LayerColorGridLayout", 
	"LayerColorSlab" 
                         FROM
                             "CS_LayerColor" ;

END CS_LAYERCOLOR_SELECT;
/