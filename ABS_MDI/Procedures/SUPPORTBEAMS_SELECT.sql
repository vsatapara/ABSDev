CREATE OR REPLACE PROCEDURE abs_mdi."SUPPORTBEAMS_SELECT" 
(
/*   Created By    Hiren Prajapati    
     Created Date  02-09-2021
     Description   This stored Procedure used to Select SupportBeams.
*/
    SupportBeamsId IN NUMBER,
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
  OPEN Output_Data FOR 
      SELECT 
         SB."SupportBeamsId",   
         BI."BuildingLabel",
         BI."BuildingName",
         SB."BuildingNumber",
         SB."Elevation",
         SB."BeamStartCol",
         SB."BeamStopCol",
         SB."BeamHeight",
         SB."BeamFlanges",
         SB."BeamWebThick",
         SB."BeamWebDepth",
         SB."BeamFlangeThick",
         SB."BeamFlangeWidth",
         SB."MaterialWeight",
         SB."MaterialThickness",
         SB."BeamDeflection",
         SB."BeamAttachmentSpacing",
         SB."BeamSteelline",
         SB."BeamSection",
         SB."BeamWeight",
         SB."BeamPrice",
         SB."BeamIsPriced",
         SB."BeamErrorCode",
         SB."IsDelete",
         SB."IpAddress"
      FROM "SupportBeams" SB
      INNER JOIN "BuildingInformation" BI ON "BI"."BuildingInformationId" = SB."BuildingNumber"
       WHERE "SB"."SupportBeamsId" = SupportBeamsId;
END SUPPORTBEAMS_SELECT;
/