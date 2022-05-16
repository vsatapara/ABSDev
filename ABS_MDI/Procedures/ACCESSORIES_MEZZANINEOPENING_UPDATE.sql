CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORIES_MEZZANINEOPENING_UPDATE" (
    MezzanineOpeningId IN NUMBER,
    MezzaninesId IN NUMBER,
    MezzanineNumber       IN  NUMBER,
	 BuildingNumber   IN   NUMBER,
    ProjectId        IN   NUMBER,
     OpeningNumber      IN   NUMBER,
    OpenDistFromSw              IN   NUMBER,
    OpenDistFromFrameline        IN   NUMBER,
    OpenWidthAlongEw       IN   NUMBER,
    OpenLengthAlongSw      IN   NUMBER, 
    UserId          IN  NUMBER DEFAULT NULL,
    IpAddress       IN  VARCHAR2
) AS
BEGIN
    UPDATE "EDSPrice_IO_MezzanineOpening"
    SET
    "BuildingNumber" = BuildingNumber,
    "ProjectId" = ProjectId,
	"MezzanineNumber"=  MezzanineNumber,
   "OpeningNumber" = OpeningNumber,
    "OpenDistFromSw" = OpenDistFromSw,
    "OpenDistFromFrameline" = OpenDistFromFrameline,
    "OpenWidthAlongEw"=OpenWidthAlongEw ,
    "OpenLengthAlongSw" = OpenLengthAlongSw,
        "ModifiedBy" = UserId,
        "ModifiedDate" = CURRENT_TIMESTAMP,
        "IpAddress" = IpAddress
    WHERE
        "MezzanineOpeningId" = MezzanineOpeningId;
END ACCESSORIES_MezzanineOpening_UPDATE;
/