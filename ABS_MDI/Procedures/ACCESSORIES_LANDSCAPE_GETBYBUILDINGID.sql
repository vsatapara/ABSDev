CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORIES_LANDSCAPE_GETBYBUILDINGID" 
(
    ProjectId IN NUMBER,
    Output_Data OUT  SYS_REFCURSOR
)
AS 
BEGIN
  OPEN Output_Data FOR 
   SELECT
    "LandscapeId", 
	"ProjectId", 
	"DrawingName", 
	"BlockName", 
	"XCoordinate", 
	"YCoordinate", 
	"ZCoordinate", 
	"ScreenSize", 
	"Rotation" 
FROM
    "EDSPrice_CAD_Landscape"
        Where   "ProjectId"=ProjectId
             AND "IsDeleted" != 'Y';    
END ACCESSORIES_LANDSCAPE_GETBYBUILDINGID;
/