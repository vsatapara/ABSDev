CREATE OR REPLACE PROCEDURE abs_mdi."ACCESORIES_WALLLTP_COMMON" (
/*   Created By    Dipali Patel    
     Created Date  22-07-2021
     Description   This stored Procedure used to get data of "Accesories_WallLTP_Common","Accesories_WallLTP_Size" table for fill drop-down fields And Get Building Input data.
*/
    BuildingInformationId  IN   NUMBER,
    Master_Data          OUT  SYS_REFCURSOR,
    Common_Data            OUT  SYS_REFCURSOR,
    Output_GeometryData OUT SYS_REFCURSOR,
    Output_Partition_Data OUT SYS_REFCURSOR,
    Output_PartitionModuleSpacing_Data OUT SYS_REFCURSOR,
    Output_InformationData OUT SYS_REFCURSOR
) IS
     WTypeId NUMBER:=0;
     WType   VARCHAR2(50) := '';
     PanelType   VARCHAR2(20) := ''; 
     PriceStatus  VARCHAR2(20) := '';
     State      VARCHAR2(10) := '';
     CNT     NUMBER(5):=0;
     Category  VARCHAR2(40);
BEGIN
--Project Data
    SELECT "PriceStatus","State" Into PriceStatus,State from "Project" P JOIN "BuildingInformation" BI ON P."ProjectId"=BI."ProjectId" WHERE "BuildingInformationId" = BuildingInformationId;

--Geometry data
    SELECT
        COUNT(*)
    INTO CNT
    FROM
        "GeometryInformation"
    WHERE
            "BuildingInformationId" = BuildingInformationId
        AND ROWNUM = 1;
 
         SELECT
            "Category"
        INTO Category
        FROM
            "GeometryInformation"
        WHERE
                "BuildingInformationId" = BuildingInformationId
            AND ROWNUM = 1;
        
    IF ( Category = 'SymmetricalEndWall' OR Category = 'NonSymmetricalEndWall' ) THEN
        OPEN Output_GeometryData FOR SELECT
                                     "BuildingWidth",
                                     "BuildingLength",
                                     "DistanceToRidgeSideWallB"  AS "DistanceToRidgeSideWallOne",
                                     "DistanceToRidgeSideWallD"  AS "DistanceToRidgeSideWallTwo",
                                     "EaveHeightSideWallB"       AS "EaveHeightSideWallOne",
                                     "EaveHeightSideWallD"       AS "EaveHeightSideWallTwo",
                                     "RoofSlopeSideWallB"        AS "RoofSlopeSideWallOne",
                                     "RoofSlopeSideWallD"        AS "RoofSlopeSideWallTwo",  
                                     "PeakHeight"
                                 FROM
                                     "GeometryInformation"
                                 WHERE
                                     "BuildingInformationId" = BuildingInformationId;
    END IF;
    IF ( Category = 'SymmetricalSideWall' OR Category = 'NonSymmetricalSideWall' ) THEN
        OPEN Output_GeometryData FOR SELECT
                                     "BuildingWidth",
                                     "BuildingLength",
                                     "DistanceToRidgeSideWallA"  AS "DistanceToRidgeSideWallOne",
                                     "DistanceToRidgeSideWallC"  AS "DistanceToRidgeSideWallTwo",
                                     "EaveHeightSideWallA"       AS "EaveHeightSideWallOne",
                                     "EaveHeightSideWallC"       AS "EaveHeightSideWallTwo",
                                     "RoofSlopeSideWallA"        AS "RoofSlopeSideWallOne",
                                     "RoofSlopeSideWallC"        AS "RoofSlopeSideWallTwo",  
                                     "PeakHeight"
                                 FROM
                                     "GeometryInformation"
                                 WHERE
                                     "BuildingInformationId" = BuildingInformationId;
    END IF;
    IF ( Category = 'SingleSlopeEndWallB' OR Category = 'LeanToB' ) THEN
        OPEN Output_GeometryData FOR SELECT
                                     "BuildingWidth",
                                     "BuildingLength",
                                     "DistanceToRidgeSideWallB"  AS "DistanceToRidgeSideWallOne",
                                     "DistanceToRidgeSideWallD"  AS "DistanceToRidgeSideWallTwo",
                                     "EaveHeightSideWallB"       AS "EaveHeightSideWallOne",
                                     "EaveHeightSideWallD"       AS "EaveHeightSideWallTwo",
                                     "RoofSlopeSideWallB"        AS "RoofSlopeSideWallOne",
                                     "RoofSlopeSideWallD"        AS "RoofSlopeSideWallTwo",  
                                     "PeakHeight"
                                 FROM
                                     "GeometryInformation"
                                 WHERE
                                     "BuildingInformationId" = BuildingInformationId;
    END IF;
    IF ( Category = 'SingleSlopeSideWallC' OR Category = 'LeanToC' ) THEN
        OPEN Output_GeometryData FOR SELECT
                                     "BuildingWidth",
                                     "BuildingLength",
                                     "DistanceToRidgeSideWallA"  AS "DistanceToRidgeSideWallOne",
                                     "DistanceToRidgeSideWallC"  AS "DistanceToRidgeSideWallTwo",
                                     "EaveHeightSideWallA"       AS "EaveHeightSideWallOne",
                                     "EaveHeightSideWallC"       AS "EaveHeightSideWallTwo",
                                     "RoofSlopeSideWallA"        AS "RoofSlopeSideWallOne",
                                     "RoofSlopeSideWallC"        AS "RoofSlopeSideWallTwo",  
                                     "PeakHeight"
                                 FROM
                                     "GeometryInformation"
                                 WHERE
                                     "BuildingInformationId" = BuildingInformationId;
    END IF;
    IF ( Category = 'SingleSlopeSideWallA' OR Category = 'LeanToA' ) THEN
        OPEN Output_GeometryData FOR SELECT
                                     "BuildingWidth",
                                     "BuildingLength",
                                     "DistanceToRidgeSideWallA"  AS "DistanceToRidgeSideWallOne",
                                     "DistanceToRidgeSideWallC"  AS "DistanceToRidgeSideWallTwo",
                                     "EaveHeightSideWallA"       AS "EaveHeightSideWallOne",
                                     "EaveHeightSideWallC"       AS "EaveHeightSideWallTwo",
                                     "RoofSlopeSideWallA"        AS "RoofSlopeSideWallOne",
                                     "RoofSlopeSideWallC"        AS "RoofSlopeSideWallTwo",  
                                     "PeakHeight"
                                 FROM
                                     "GeometryInformation"
                                 WHERE
                                     "BuildingInformationId" = BuildingInformationId;
    END IF;
    IF ( Category = 'SingleSlopeEndWallD' OR Category = 'LeanToD' ) THEN
        OPEN Output_GeometryData FOR SELECT
                                     "BuildingWidth",
                                     "BuildingLength",
                                     "DistanceToRidgeSideWallB"  AS "DistanceToRidgeSideWallOne",
                                     "DistanceToRidgeSideWallD"  AS "DistanceToRidgeSideWallTwo",
                                     "EaveHeightSideWallB"       AS "EaveHeightSideWallOne",
                                     "EaveHeightSideWallD"       AS "EaveHeightSideWallTwo",
                                     "RoofSlopeSideWallB"        AS "RoofSlopeSideWallOne",
                                     "RoofSlopeSideWallD"        AS "RoofSlopeSideWallTwo",  
                                     "PeakHeight"
                                 FROM
                                     "GeometryInformation"
                                 WHERE
                                     "BuildingInformationId" = BuildingInformationId;
    END IF;
            
--Wall Data
    select count(*) into CNT from "Input_Wall" WHERE "BuildingInformationId" = BuildingInformationId;
    IF (CNT>0) THEN
        SELECT PanelType."Type",PanelType."Id" INTO WType,WTypeId 
        FROM "Input_Wall" Wall JOIN "M_PanelType" PanelType ON Wall."Type" = PanelType."Id" 
        WHERE Wall."BuildingInformationId" = BuildingInformationId;
    END IF;

    
--Master Data
    OPEN Master_Data FOR SELECT
                         WType AS "WallPanelType",
                         PriceStatus "PriceStatus",
                         State "State"
                     FROM dual;
--Size Data
    OPEN Common_Data FOR SELECT
                            wc."SizeId",
                            ws."Value" AS "Size",
                            ws."Height",
                            MPanel."Type" as "PanelType"
                        FROM "Accesories_WallLTP_Common" wc 
                        JOIN "Accesories_WallLTP_Size" ws ON ws."Id" = wc."SizeId"
                        JOIN "M_PanelType" MPanel ON wc."TypeId" = MPanel."Id";
                        
 OPEN  Output_Partition_Data FOR 
        SELECT Partition."PartitionId" "PartitionNumber",Partition."Length",PanelType."Type" "PanelType",PartitionMaster."CategoryValue" "PartitionType",
        CASE WHEN "FullHeight"='Y' THEN 1 ELSE 0 END "FullHeight","Height","DistFromEndWall" "DistFromWall","DistFromSideWall" "DistFromLeftCorner" 
        FROM "Accesories_Partition" Partition JOIN "M_PanelType" PanelType ON Partition."PanelType" = PanelType."Id" 
        JOIN "Accesories_PartitionMaster" PartitionMaster ON Partition."Type"=PartitionMaster."OptionId"
        WHERE Partition."BuildingNumber" = BuildingInformationId and Partition."PanelType" in(1,2) and "IsDelete"='N'
        order by "PartitionId";
        
 OPEN   Output_PartitionModuleSpacing_Data FOR
        SELECT Partition."PartitionId" "PartitionNumber",Spacing."Width","BayNumber"
        FROM "Accesories_PartitionModuleSpacing" Spacing JOIN "Accesories_Partition" Partition ON Spacing."PartitionId"=Partition."PartitionId"
        WHERE Partition."BuildingNumber" = BuildingInformationId and Partition."PanelType" in(1,2) and Partition."IsDelete"='N'
        ORDER BY Partition."PartitionId","BayNumber";
        
 -- Information data
   OPEN  Output_InformationData  FOR SELECT
             "FrameType",
             "Elevation",
             "HighSideWallElevation",
             "AttachmentElevation",
             "BuildingType"
            FROM 
            "BuildingInformation"
            WHERE "BuildingInformationId"=BuildingInformationId and "IsDelete"='N';
        
END ACCESORIES_WALLLTP_COMMON;
/