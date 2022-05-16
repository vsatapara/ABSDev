CREATE OR REPLACE PROCEDURE abs_mdi."BRACING_XBRACING_UPDATE" (
    BracingId                 IN   NUMBER,
    BuildingNumber            IN   NUMBER,
    SW1BracingType            IN   VARCHAR2,
    SW1Tiers                  IN   NUMBER,
    SW1BracingLocations       IN   VARCHAR2,
    SW1UnbraceableLocations   IN   VARCHAR2,
    SW1ExcludeDiaphragm       IN   NUMBER,
    SW2BracingType            IN   VARCHAR2,
    SW2Tiers                  IN   NUMBER,
    SW2BracingLocations       IN   VARCHAR2,
    SW2UnbraceableLocations   IN   VARCHAR2,
    SW2ExcludeDiaphragm       IN   NUMBER,
    EW3BracingType            IN   VARCHAR2,
    EW3Tiers                  IN   NUMBER,
    EW3BracingLocations       IN   VARCHAR2,
    EW3UnbraceableLocations   IN   VARCHAR2,
    EW3ExcludeDiaphragm       IN   NUMBER,
    EW4BracingType            IN   VARCHAR2,
    EW4Tiers                  IN   NUMBER,
    EW4BracingLocations       IN   VARCHAR2,
    EW4UnbraceableLocations   IN   VARCHAR2,
    EW4ExcludeDiaphragm       IN   NUMBER,
    RoofBracingType           IN   VARCHAR2,
    RoofBracingLocations      IN   VARCHAR2,
    RoofUnbraceableLocations  IN   VARCHAR2,
    RoofExcludeDiaphragm      IN   NUMBER,
    Purlins                   IN   VARCHAR2,
    Girts                     IN   VARCHAR2,
    ErectionRods              IN   NUMBER,
    AllowTorsion              IN   NUMBER,
    ErectionBayWidth          IN   NUMBER,
    RafterFlangeBrace         IN   VARCHAR2,
    ColumnFlangeBrace         IN   VARCHAR2,
    SW1PFrameType             IN   NUMBER DEFAULT NULL,
    SW1PFrameHeight           IN   NUMBER DEFAULT NULL,
    PortalRafterDepth1        IN   NUMBER DEFAULT NULL,
    SW2PFrameType             IN   NUMBER DEFAULT NULL,
    SW2PFrameHeight           IN   NUMBER DEFAULT NULL,
    PortalRafterDepth2        IN   NUMBER DEFAULT NULL,
    SW1FBBCRight              IN   VARCHAR2 DEFAULT NULL,
    SW2FBBCRight              IN   VARCHAR2 DEFAULT NULL,
    SW1Girts                  IN   VARCHAR2 DEFAULT NULL,
    SW2Girts                  IN   VARCHAR2 DEFAULT NULL,
    EW3Girts                  IN   VARCHAR2 DEFAULT NULL,
    EW4Girts                  IN   VARCHAR2 DEFAULT NULL,
    EW3PFrameType             IN   NUMBER DEFAULT NULL,
    EW3PFrameHeight           IN   NUMBER DEFAULT NULL,
    PortalRafterDepth3        IN   NUMBER DEFAULT NULL,
    EW4PFrameType             IN   NUMBER DEFAULT NULL,
    EW4PFrameHeight           IN   NUMBER DEFAULT NULL,
    PortalRafterDepth4        IN   NUMBER DEFAULT NULL,
    OverrideFlangeBraceRoof   IN   NUMBER DEFAULT NULL,
    OverrideFlangeBraceWall   IN   NUMBER DEFAULT NULL,
    BuildingInformationId     IN   NUMBER,
    IpAddress                 IN   VARCHAR2 DEFAULT NULL,
    LBPBracingLocation        IN   VARCHAR2 DEFAULT NULL,
    UserId                    IN   NUMBER,
    PortalFrameId             IN   NUMBER DEFAULT NULL,
    IsAvailableSideWallPortalFrameData IN   CHAR DEFAULT NULL,
    SW1Height                 IN   CHAR DEFAULT NULL,
    SW1HeightValue            IN   NUMBER DEFAULT NULL,
    SW1RodTiers               IN   CHAR DEFAULT NULL,
    SW1WebDepthMaxColumn      IN   NUMBER DEFAULT NULL,
    SW1WebDepthMaxRafter      IN   NUMBER DEFAULT NULL,
    SW2Height                 IN   CHAR DEFAULT NULL,
    SW2HeightValue            IN   NUMBER DEFAULT NULL,
    SW2RodTiers               IN   CHAR DEFAULT NULL,
    SW2WebDepthMaxColumn      IN   VARCHAR2 DEFAULT NULL,
    SW2WebDepthMaxRafter      IN   NUMBER DEFAULT NULL,
    IsAvailableEndWallPortalFrameData  IN   CHAR DEFAULT NULL,
    EndWallProtalFrameId      IN   NUMBER DEFAULT NULL,
    EW3Height                 IN   CHAR DEFAULT NULL,
    EW3HeightValue            IN   NUMBER DEFAULT NULL,
    EW3RodTiers               IN   CHAR DEFAULT NULL,
    EW3WebDepthMaxColumn      IN   NUMBER DEFAULT NULL,
    EW3WebDepthMaxRafter      IN   NUMBER DEFAULT NULL,
    EW4Height                 IN   CHAR DEFAULT NULL,
    EW4HeightValue            IN   NUMBER DEFAULT NULL,
    EW4RodTiers               IN   CHAR DEFAULT NULL,
    EW4WebDepthMaxColumn      IN   NUMBER DEFAULT NULL,
    EW4WebDepthMaxRafter      IN   NUMBER DEFAULT NULL,
    BayNumber                 IN   VARCHAR2 DEFAULT NULL,
    DistFromLeftCornerLeft    IN   NUMBER DEFAULT NULL,
    DistFromLeftColumnLeft    IN   NUMBER DEFAULT NULL,
    DistFromLeftCornerRight   IN   NUMBER DEFAULT NULL,
    DistFromLeftColumnRight   IN   NUMBER DEFAULT NULL,
    LeftSteelLine             IN   CHAR DEFAULT NULL,
    Elevation                 IN   VARCHAR2 DEFAULT NULL,
    OutputId                  OUT  NUMBER
) AS
    IsExist         NUMBER;
	IsExistSideWallData         NUMBER;
	IsExistEndWallData         NUMBER;
    BracingIdCheck  NUMBER;
BEGIN
    BracingIdCheck := 0;
    SELECT
        COUNT(*)
    INTO IsExist
    FROM
        "Bracing"
    WHERE
        "BuildingInformationId" = BuildingInformationId;
		
	SELECT
        COUNT(*)
    INTO IsExistSideWallData
    FROM
        "SideWallPortalFrame"
    WHERE
        "BuildingInformationId" = BuildingInformationId;
		
	SELECT
        COUNT(*)
        INTO IsExistEndWallData
    FROM
        "EndWallPotalFrame"
    WHERE
        "BuildingInformationId" = BuildingInformationId;
		
    IF IsExist > 0 THEN
        SELECT
            "BracingId"
        INTO OutputId
        FROM
            "Bracing"
        WHERE
            "BuildingInformationId" = BuildingInformationId;
        UPDATE "Bracing"
        SET
            "BuildingNumber" = BuildingNumber,
            "SW1BracingType" = SW1BracingType,
            "SW1Tiers" = SW1Tiers,
            "SW1BracingLocations" = SW1BracingLocations,
            "SW1UnbraceableLocations" = SW1UnbraceableLocations,
            "SW1ExcludeDiaphragm" = SW1ExcludeDiaphragm,
            "SW2BracingType" = SW2BracingType,
            "SW2Tiers" = SW2Tiers,
            "SW2BracingLocations" = SW2BracingLocations,
            "SW2UnbraceableLocations" = SW2UnbraceableLocations,
            "SW2ExcludeDiaphragm" = SW2ExcludeDiaphragm,
            "EW3BracingType" = EW3BracingType,
            "EW3Tiers" = EW3Tiers,
            "EW3BracingLocations" = EW3BracingLocations,
            "EW3UnbraceableLocations" = EW3UnbraceableLocations,
            "EW3ExcludeDiaphragm" = EW3ExcludeDiaphragm,
            "EW4BracingType" = EW4BracingType,
            "EW4Tiers" = EW4Tiers,
            "EW4BracingLocations" = EW4BracingLocations,
            "EW4UnbraceableLocations" = EW4UnbraceableLocations,
            "EW4ExcludeDiaphragm" = EW4ExcludeDiaphragm,
            "RoofBracingType" = RoofBracingType,
            "RoofBracingLocations" = RoofBracingLocations,
            "RoofUnbraceableLocations" = RoofUnbraceableLocations,
            "RoofExcludeDiaphragm" = RoofExcludeDiaphragm,
            "Purlins" = Purlins,
            "Girts" = Girts,
            "ErectionRods" = ErectionRods,
            "AllowTorsion" = AllowTorsion,
            "ErectionBayWidth" = ErectionBayWidth,
            "RafterFlangeBrace" = RafterFlangeBrace,
            "ColumnFlangeBrace" = ColumnFlangeBrace,
            "SW1PFrameType" = SW1PFrameType,
            "SW1PFrameHeight" = SW1PFrameHeight,
            "PortalRafterDepth1" = PortalRafterDepth1,
            "SW2PFrameType" = SW2PFrameType,
            "SW2PFrameHeight" = SW2PFrameHeight,
            "PortalRafterDepth2" = PortalRafterDepth2,
            "SW1FBBCRight" = SW1FBBCRight,
            "SW2FBBCRight" = SW2FBBCRight,
            "SW1Girts" = SW1Girts,
            "SW2Girts" = SW2Girts,
            "EW3Girts" = EW3Girts,
            "EW4Girts" = EW4Girts,
            "EW3PFrameType" = EW3PFrameType,
            "EW3PFrameHeight" = EW3PFrameHeight,
            "PortalRafterDepth3" = PortalRafterDepth3,
            "EW4PFrameType" = EW4PFrameType,
            "EW4PFrameHeight" = EW4PFrameHeight,
            "PortalRafterDepth4" = PortalRafterDepth4,
            "OverrideFlangeBraceRoof" = OverrideFlangeBraceRoof,
            "OverrideFlangeBraceWall" = OverrideFlangeBraceWall,
            "BuildingInformationId" = BuildingInformationId,
            "IpAddress" = IpAddress,
            "LBPBracingLocation" = LBPBracingLocation,
            "IsReset" = 'N',
            "ModifiedBy" = UserId,
            "ModifiedDate" = CURRENT_TIMESTAMP
        WHERE
            "BracingId" = OutputId;
        IF IsExist > 0 AND IsAvailableSideWallPortalFrameData = 'Y' AND IsExistSideWallData > 0 THEN
            UPDATE "SideWallPortalFrame"
            SET
                "SW1Height" = SW1Height,
                "SW1HeightValue" = SW1HeightValue,
                "SW1RodTiers" = SW1RodTiers,
                "SW1WebDepthMaxColumn" = SW1WebDepthMaxColumn,
                "SW1WebDepthMaxRafter" = SW1WebDepthMaxRafter,
                "SW2Height" = SW2Height,
                "SW2HeightValue" = SW2HeightValue,
                "SW2RodTiers" = SW2RodTiers,
                "SW2WebDepthMaxColumn" = SW2WebDepthMaxColumn,
                "SW2WebDepthMaxRafter" = SW2WebDepthMaxRafter
            WHERE
                "BracingId" = OutputId;
        END IF;
        IF IsExist > 0 AND IsAvailableEndWallPortalFrameData = 'Y' AND IsExistEndWallData > 0 THEN
            UPDATE "EndWallPotalFrame"
            SET
                "EW3Height" = EW3Height,
                "EW3HeightValue" = EW3HeightValue,
                "EW3RodTiers" = EW3RodTiers,
                "EW3WebDepthMaxColumn" = EW3WebDepthMaxColumn,
                "EW3WebDepthMaxRafter" = EW3WebDepthMaxRafter,
                "EW4Height" = EW4Height,
                "EW4HeightValue" = EW4HeightValue,
                "EW4RodTiers" = EW4RodTiers,
                "EW4WebDepthMaxColumn" = EW4WebDepthMaxColumn,
                "EW4WebDepthMaxRafter" = EW4WebDepthMaxRafter
            WHERE
                "BracingId" = OutputId;
				END IF;
				
				IF IsExist > 0 AND IsAvailableSideWallPortalFrameData = 'Y' AND IsExistSideWallData < 1 THEN
             INSERT INTO "SideWallPortalFrame" (
                "SW1Height",
                "SW1HeightValue",
                "SW1RodTiers",
                "SW1WebDepthMaxColumn",
                "SW1WebDepthMaxRafter",
                "SW2Height",
                "SW2HeightValue",
                "SW2RodTiers",
                "SW2WebDepthMaxColumn",
                "SW2WebDepthMaxRafter",
                "BracingId",
                "BuildingInformationId"
            ) VALUES (
                SW1Height,
                SW1HeightValue,
                SW1RodTiers,
                SW1WebDepthMaxColumn,
                SW1WebDepthMaxRafter,
                SW2Height,
                SW2HeightValue,
                SW2RodTiers,
                SW2WebDepthMaxColumn,
                SW2WebDepthMaxRafter,
                OutputId,
                BuildingInformationId
            );
        END IF;
        IF IsExist > 0 AND IsAvailableEndWallPortalFrameData = 'Y' AND IsExistEndWallData < 1 THEN
            INSERT INTO "EndWallPotalFrame" (
                "EW3Height",
                "EW3HeightValue",
                "EW3RodTiers",
                "EW3WebDepthMaxColumn",
                "EW3WebDepthMaxRafter",
                "EW4Height",
                "EW4HeightValue",
                "EW4RodTiers",
                "EW4WebDepthMaxColumn",
                "EW4WebDepthMaxRafter",
                "BracingId",
                "BuildingInformationId"
            ) VALUES (
                EW3Height,
                EW3HeightValue,
                EW3RodTiers,
                EW3WebDepthMaxColumn,
                EW3WebDepthMaxRafter,
                EW4Height,
                EW4HeightValue,
                EW4RodTiers,
                EW4WebDepthMaxColumn,
                EW4WebDepthMaxRafter,
                OutputId,
                BuildingInformationId
            );

        END IF;
		
		IF IsExist > 0 AND IsAvailableEndWallPortalFrameData = 'N' AND IsExistEndWallData > 0 THEN
            DELETE FROM "EndWallPotalFrame" WHERE "BuildingInformationId" = BuildingInformationId;
        END IF;
		
		IF IsExist > 0 AND IsAvailableSideWallPortalFrameData = 'N' AND IsExistSideWallData > 0 THEN
			DELETE FROM "SideWallPortalFrame" WHERE "BuildingInformationId" = BuildingInformationId;	
		END IF;
    ELSE
        INSERT INTO "Bracing" (
            "BuildingNumber",
            "SW1BracingType",
            "SW1Tiers",
            "SW1BracingLocations",
            "SW1UnbraceableLocations",
            "SW1ExcludeDiaphragm",
            "SW2BracingType",
            "SW2Tiers",
            "SW2BracingLocations",
            "SW2UnbraceableLocations",
            "SW2ExcludeDiaphragm",
            "EW3BracingType",
            "EW3Tiers",
            "EW3BracingLocations",
            "EW3UnbraceableLocations",
            "EW3ExcludeDiaphragm",
            "EW4BracingType",
            "EW4Tiers",
            "EW4BracingLocations",
            "EW4UnbraceableLocations",
            "EW4ExcludeDiaphragm",
            "RoofBracingType",
            "RoofBracingLocations",
            "RoofUnbraceableLocations",
            "RoofExcludeDiaphragm",
            "Purlins",
            "Girts",
            "ErectionRods",
            "AllowTorsion",
            "ErectionBayWidth",
            "RafterFlangeBrace",
            "ColumnFlangeBrace",
            "SW1PFrameType",
            "SW1PFrameHeight",
            "PortalRafterDepth1",
            "SW2PFrameType",
            "SW2PFrameHeight",
            "PortalRafterDepth2",
            "SW1FBBCRight",
            "SW2FBBCRight",
            "SW1Girts",
            "SW2Girts",
            "EW3Girts",
            "EW4Girts",
            "EW3PFrameType",
            "EW3PFrameHeight",
            "PortalRafterDepth3",
            "EW4PFrameType",
            "EW4PFrameHeight",
            "PortalRafterDepth4",
            "OverrideFlangeBraceRoof",
            "OverrideFlangeBraceWall",
            "BuildingInformationId",
            "IpAddress",
            "LBPBracingLocation",
            "IsReset",
            "CreatedBy",
            "CreatedDate"
        ) VALUES (
            BuildingNumber,
            SW1BracingType,
            SW1Tiers,
            SW1BracingLocations,
            SW1UnbraceableLocations,
            SW1ExcludeDiaphragm,
            SW2BracingType,
            SW2Tiers,
            SW2BracingLocations,
            SW2UnbraceableLocations,
            SW2ExcludeDiaphragm,
            EW3BracingType,
            EW3Tiers,
            EW3BracingLocations,
            EW3UnbraceableLocations,
            EW3ExcludeDiaphragm,
            EW4BracingType,
            EW4Tiers,
            EW4BracingLocations,
            EW4UnbraceableLocations,
            EW4ExcludeDiaphragm,
            RoofBracingType,
            RoofBracingLocations,
            RoofUnbraceableLocations,
            RoofExcludeDiaphragm,
            Purlins,
            Girts,
            ErectionRods,
            AllowTorsion,
            ErectionBayWidth,
            RafterFlangeBrace,
            ColumnFlangeBrace,
            SW1PFrameType,
            SW1PFrameHeight,
            PortalRafterDepth1,
            SW2PFrameType,
            SW2PFrameHeight,
            PortalRafterDepth2,
            SW1FBBCRight,
            SW2FBBCRight,
            SW1Girts,
            SW2Girts,
            EW3Girts,
            EW4Girts,
            EW3PFrameType,
            EW3PFrameHeight,
            PortalRafterDepth3,
            EW4PFrameType,
            EW4PFrameHeight,
            PortalRafterDepth4,
            OverrideFlangeBraceRoof,
            OverrideFlangeBraceWall,
            BuildingInformationId,
            IpAddress,
            LBPBracingLocation,
            'N',
            UserId,
            CURRENT_TIMESTAMP
        ) RETURNING "BracingId" INTO OutputId;
        IF OutputId > 0 AND IsAvailableSideWallPortalFrameData = 'Y' THEN
            INSERT INTO "SideWallPortalFrame" (
                "SW1Height",
                "SW1HeightValue",
                "SW1RodTiers",
                "SW1WebDepthMaxColumn",
                "SW1WebDepthMaxRafter",
                "SW2Height",
                "SW2HeightValue",
                "SW2RodTiers",
                "SW2WebDepthMaxColumn",
                "SW2WebDepthMaxRafter",
                "BracingId",
                "BuildingInformationId"
            ) VALUES (
                SW1Height,
                SW1HeightValue,
                SW1RodTiers,
                SW1WebDepthMaxColumn,
                SW1WebDepthMaxRafter,
                SW2Height,
                SW2HeightValue,
                SW2RodTiers,
                SW2WebDepthMaxColumn,
                SW2WebDepthMaxRafter,
                OutputId,
                BuildingInformationId
            );
        END IF;
        IF OutputId > 0 AND IsAvailableEndWallPortalFrameData = 'Y'  THEN
            INSERT INTO "EndWallPotalFrame" (
                "EW3Height",
                "EW3HeightValue",
                "EW3RodTiers",
                "EW3WebDepthMaxColumn",
                "EW3WebDepthMaxRafter",
                "EW4Height",
                "EW4HeightValue",
                "EW4RodTiers",
                "EW4WebDepthMaxColumn",
                "EW4WebDepthMaxRafter",
                "BracingId",
                "BuildingInformationId"
            ) VALUES (
                EW3Height,
                EW3HeightValue,
                EW3RodTiers,
                EW3WebDepthMaxColumn,
                EW3WebDepthMaxRafter,
                EW4Height,
                EW4HeightValue,
                EW4RodTiers,
                EW4WebDepthMaxColumn,
                EW4WebDepthMaxRafter,
                OutputId,
                BuildingInformationId
            );
        END IF;
    END IF;
END BRACING_XBRACING_UPDATE;
/