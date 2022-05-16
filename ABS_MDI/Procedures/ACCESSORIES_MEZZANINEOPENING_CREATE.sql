CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORIES_MEZZANINEOPENING_CREATE" (
    MezzaninesId IN NUMBER,
    BuildingNumber   IN   NUMBER,
    ProjectId        IN   NUMBER,
    MezzanineNumber    IN   NUMBER,
    OpeningNumber      IN   NUMBER,
    OpenDistFromSw              IN   NUMBER,
    OpenDistFromFrameline        IN   NUMBER,
    OpenWidthAlongEw       IN   NUMBER,
    OpenLengthAlongSw      IN   NUMBER,   
    IpAddress     IN   VARCHAR2,
    OutputId   OUT  NUMBER) AS
BEGIN
   INSERT INTO  "EDSPrice_IO_MezzanineOpening"  (
   "MezzaninesId",
    "BuildingNumber" ,
    "ProjectId"    ,
    "MezzanineNumber"  ,
    "OpeningNumber"  ,
    "OpenDistFromSw"  ,
    "OpenDistFromFrameline"  ,
    "OpenWidthAlongEw" ,
    "OpenLengthAlongSw" ,
     "CreatedDate" ,
     "IpAddress" ,
     "IsDelete"
    ) 
    VALUES (  
    MezzaninesId,
      BuildingNumber ,
    ProjectId    ,
    MezzanineNumber  ,
    OpeningNumber  ,
    OpenDistFromSw  ,
    OpenDistFromFrameline  ,
    OpenWidthAlongEw ,
    OpenLengthAlongSw ,
      CURRENT_TIMESTAMP,
      IpAddress,
      'N'
    ) RETURNING  "MezzanineOpeningId"  INTO OutputId;
END ACCESSORIES_MezzanineOpening_CREATE;
/