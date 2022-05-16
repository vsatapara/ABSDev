CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORIES_MEZZANINEOPENING_SELECT" (
    MezzaninesId    IN   NUMBER,
    MezzanineOpening_Data  OUT  SYS_REFCURSOR
) AS
BEGIN
    OPEN MezzanineOpening_Data FOR SELECT
    "MezzanineOpeningId",
     "MezzaninesId",
    "BuildingNumber",
	"ProjectId",
    "MezzanineNumber"  ,
     "OpeningNumber"  ,
    "OpenDistFromSw"  ,
    "OpenDistFromFrameline"  ,
    "OpenWidthAlongEw" ,
    "OpenLengthAlongSw" 
 FROM
    "EDSPrice_IO_MezzanineOpening"
    WHERE
    "MezzaninesId" = MezzaninesId AND "IsDelete" = 'N';
END ACCESSORIES_MezzanineOpening_SELECT ;
/