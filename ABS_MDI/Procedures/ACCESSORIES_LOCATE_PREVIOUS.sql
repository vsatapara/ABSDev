CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORIES_LOCATE_PREVIOUS" 
(
        ProjectId IN NUMBER,
        Elevation IN VARCHAR2,
        Output_PreviousLocate OUT SYS_REFCURSOR 
)
AS
BEGIN
    OPEN  Output_PreviousLocate  FOR
           SELECT
            'Louvers/Exhausters' AS "AccessoryType",
            "BayNumber" AS "Bay",
            "DistFromLeftCol" AS "DistFromLeftCol",
            "DistFromLeftCorner" AS "LeftSteelLine",
            "SillHeight" AS "Floor"
          FROM 
          "Accessories_Louvers"
          WHERE "ProjectId" = ProjectId AND "Elevation"=Elevation AND "IsDelete"='N'
          Union All
          SELECT
            'Framed Openings' AS "AccessoryType",
            "BayNumber" AS "Bay",
            "DistFromLeftCol" AS "DistFromLeftCol",
            "DistFromLeftCorner" AS "LeftSteelLine",
            "SillHeight" AS "Floor"
          FROM 
          "Accessories_FramedOpening"
          WHERE "ProjectId" = ProjectId AND "Elevation"=Elevation AND "IsDelete"='N'
          Union All
          SELECT
            'Wall LTPs' AS "AccessoryType",
            "PatternPerBay" AS "Bay",
            "DistFromLeftCol" AS "DistFromLeftCol",
            "DistFromLeftCorner" AS "LeftSteelLine",
            null AS "Floor"
          FROM 
          "Accesories_WallLTP"
          WHERE "ProjectId" = ProjectId AND "Elevation"=Elevation AND "Continuous" ='N' AND "IsDelete"='N'
          Union All
          SELECT
            'DBCI Doors' AS "AccessoryType",
            "BayNumber" AS "Bay",
            "SillHeight" AS "Floor",
            "DistFromLeftCol" AS "DistFromLeftCol",
            "DistFromLeftCorner" AS "LeftSteelLine"
          FROM 
          "Accessories_DBCIDoor"
          WHERE "ProjectId" = ProjectId AND "Elevation"=Elevation AND "IsDelete"='N'
           Union All
          SELECT
            'Windows' AS "AccessoryType",
            "BayNumber" AS "Bay",
            "DistFromLeftCol" AS "DistFromLeftCol",
            "DistFromLeftCorner" AS "LeftSteelLine",
            "SillHeight" AS "Floor"
          FROM 
          "Accesories_Windows"
          WHERE "ProjectId" = ProjectId AND "Elevation"=Elevation AND "IsDelete"='N'
           Union All
          SELECT
            'Walk Doors' AS "AccessoryType",
            "BayNumber" AS "Bay",
            "DistFromLeftCol" AS "DistFromLeftCol",
            "DistFromLeftCorner" AS "LeftSteelLine",
            "DistanceFromFloor" AS "Floor"
          FROM 
          "Accessories_WalkDoors"
          WHERE "ProjectId" = ProjectId AND "Elevation"=Elevation AND "IsDelete"='N'
          
          Union All
          SELECT
            'Top-Mounted Slide Doors' AS "AccessoryType",
            "BayNumber" AS "Bay",
            "DistFromLeftCol" AS "DistFromLeftCol",
            "DistFromLeftCorner" AS "LeftSteelLine",
            null AS "Floor"
          FROM 
          "Accesories_TopMountedSlideDoor"
          WHERE "ProjectId" = ProjectId AND "Elevation"=Elevation AND "IsDelete"='N';
END ACCESSORIES_LOCATE_PREVIOUS;
/