CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORIES_MEZZANINESPACING_SELECT" (
    MezzaninesId    IN   NUMBER,
    MezzanineSpacing_Data  OUT  SYS_REFCURSOR
) AS
BEGIN
    OPEN MezzanineSpacing_Data FOR SELECT
     "MezzanineSpacingId",
     "MezzaninesId",
    "BuildingNumber",
	"ProjectId",
    "MezzanineNumber"  ,
     "FramelineNumber" , 
	 "AlltheSame", 
	 "Spacing1"   , 
	 "Spacing2", 
	 "Spacing3" , 
	 "Spacing4"  , 
	 "Spacing5", 
	 "Spacing6"  , 
	 "Spacing7" , 
	 "Spacing8" , 
	 "Spacing9"  , 
	 "Spacing10", 
	 "Spacing11" , 
	 "Spacing12"  , 
	 "Spacing13"  , 
	 "Spacing14" , 
	 "Spacing15", 
	 "Spacing16" , 
	 "Spacing17"  , 
	 "Spacing18", 
	 "Spacing19" , 
	 "Spacing20" , 
	 "Spacing21" , 
	 "Spacing22", 
	 "Spacing23", 
	 "Spacing24" , 
	 "Spacing25", 
	 "Spacing26" , 
	 "Spacing27" , 
	 "Spacing28" , 
	 "Spacing29" , 
	 "Spacing30",
     "ForLongitudinal"
     
 FROM
    "EDSPrice_IO_MezzanineSpacing"
    WHERE
    "MezzaninesId" = MezzaninesId AND "IsDelete" = 'N';
END ACCESSORIES_MezzanineSpacing_SELECT ;
/