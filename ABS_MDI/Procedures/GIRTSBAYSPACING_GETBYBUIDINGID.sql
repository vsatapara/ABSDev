CREATE OR REPLACE PROCEDURE abs_mdi."GIRTSBAYSPACING_GETBYBUIDINGID" 
(
    BuildingInformationId                 IN   NUMBER,
    OUTPUT_BUILDINGINFORMATION            OUT  SYS_REFCURSOR
) AS
      Category  VARCHAR2(40);
      L_COUNT   NUMBER(5);
      ProjectId NUMBER;
      PeakHeight NUMBER Default Null;
      EaveHeightSideWallOne NUMBER Default Null;
      EaveHeightSideWallTwo NUMBER Default Null;
      
BEGIN
select "ProjectId" INTO ProjectId from "BuildingInformation" Where "BuildingInformationId"= BuildingInformationId;
    SELECT
        COUNT(*)
    INTO L_COUNT
    FROM
        "GeometryInformation"
    WHERE
            "BuildingInformationId" = BuildingInformationId
        AND ROWNUM = 1;
    IF ( L_COUNT > 0 ) THEN
        SELECT
            "Category"
        INTO Category
        FROM
            "GeometryInformation"
        WHERE
                "BuildingInformationId" = BuildingInformationId
            AND ROWNUM = 1;
    END IF;
    IF ( Category = 'SymmetricalEndWall' OR Category = 'NonSymmetricalEndWall' ) THEN
        SELECT
                                     "EaveHeightSideWallB",
                                     "EaveHeightSideWallD",
                                     
                                     "PeakHeight" Into EaveHeightSideWallOne,EaveHeightSideWallTwo,PeakHeight
                                 FROM
                                     "GeometryInformation"
                                 WHERE
                                     "BuildingInformationId" = BuildingInformationId;
    END IF;
    IF ( Category = 'SymmetricalSideWall' OR Category = 'NonSymmetricalSideWall' ) THEN
        SELECT
                                    
                                     "EaveHeightSideWallA",
                                     "EaveHeightSideWallC",
                                    
                                     "PeakHeight" Into EaveHeightSideWallOne,EaveHeightSideWallTwo,PeakHeight
                                 FROM
                                     "GeometryInformation"
                                 WHERE
                                     "BuildingInformationId" = BuildingInformationId;
    END IF;
    IF ( Category = 'SingleSlopeEndWallB' OR Category = 'LeanToB' ) THEN
        SELECT
                                    
                                     "EaveHeightSideWallB",
                                     "EaveHeightSideWallD",
                                    
                                     "PeakHeight" Into EaveHeightSideWallOne,EaveHeightSideWallTwo,PeakHeight
                                 FROM
                                     "GeometryInformation"
                                 WHERE
                                     "BuildingInformationId" = BuildingInformationId;
    END IF;
    IF ( Category = 'SingleSlopeSideWallC' OR Category = 'LeanToC' ) THEN
        SELECT
                                     
                                     "EaveHeightSideWallA",
                                     "EaveHeightSideWallC",
                                     
                                     "PeakHeight" Into EaveHeightSideWallOne,EaveHeightSideWallTwo,PeakHeight
                                 FROM
                                     "GeometryInformation"
                                 WHERE
                                     "BuildingInformationId" = BuildingInformationId;
    END IF;
    IF ( Category = 'SingleSlopeSideWallA' OR Category = 'LeanToA' ) THEN
        SELECT
                                    
                                     "EaveHeightSideWallA",
                                     "EaveHeightSideWallC",
                                   
                                     "PeakHeight" Into EaveHeightSideWallOne,EaveHeightSideWallTwo,PeakHeight
                                 FROM
                                     "GeometryInformation"
                                 WHERE
                                     "BuildingInformationId" = BuildingInformationId;
    END IF;
    IF ( Category = 'SingleSlopeEndWallD' OR Category = 'LeanToD' ) THEN
        SELECT
                                  
                                     "EaveHeightSideWallB",
                                     "EaveHeightSideWallD",
                                   
                                     "PeakHeight" Into EaveHeightSideWallOne,EaveHeightSideWallTwo,PeakHeight
                                 FROM
                                     "GeometryInformation"
                                 WHERE
                                     "BuildingInformationId" = BuildingInformationId;
    END IF;

      OPEN OUTPUT_BUILDINGINFORMATION FOR 
                                SELECT EaveHeightSideWallOne "EaveHeightSideWallOne",EaveHeightSideWallTwo "EaveHeightSideWallTwo",PeakHeight "PeakHeight",
                                       Info."BuildingInformationId",
                                       Info."Elevation",
                                       BaySpacing."SW1Style",
                                       BaySpacing."SW2Style",
                                       BaySpacing."EW1Style",
                                       BaySpacing."EW2Style",
                                       BaySpacing."SW1Depth",
                                       BaySpacing."SW2Depth",
                                       BaySpacing."EW1Depth",
                                       BaySpacing."EW2Depth",
                                       BaySpacing."SW1Optimize",
                                       BaySpacing."SW2Optimize",
                                       BaySpacing."EW1Optimize",
                                       BaySpacing."EW2Optimize",
                                       BaySpacing."RoofPurlinDepth",
                                       BaySpacing."RoofPurlinStyle",
                                       BaySpacing."RoofBaySpacing"
                                   FROM
                                            "Input_GirtsBaySpacing" BaySpacing
                                       JOIN "BuildingInformation" Info ON BaySpacing."BuildingInformationId" = Info."BuildingInformationId"
                                   WHERE
                                           BaySpacing."BuildingInformationId" = BuildingInformationId
                                       AND Info."ProjectId" = ProjectId
                                       AND (BaySpacing."IsDelete" IS NULL  OR BaySpacing."IsDelete" != 'Y');
                                       
END GirtsBaySpacing_GetByBuidingId;
/