CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORY_LIST_NEW" 
(
    ProjectId in number,
    AssessoryType in varchar2,
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
    IF ( LOWER(AssessoryType) = 'vents' ) THEN
       OPEN Output_Data FOR 
        SELECT
        AV."VentsId" as Id,
        'Vents' as AssessoryName,
        AV."BuildingId" as BuildingId,
         'Roof' as Category,
        ("BuildingLabel" ||  '-' || "BuildingName") as Building,
        AV."Quantity" as Quantity,
        CASE
                WHEN AV."Elevation"='R' THEN 'Roof Peak' 
                WHEN AV."Elevation"='E' AND B."Elevation"='S' THEN 'Roof A'
                WHEN AV."Elevation"='F' AND B."Elevation"='S' THEN 'Roof C'
                WHEN AV."Elevation"='E' AND B."Elevation"='E' THEN 'Roof D'
                WHEN AV."Elevation"='F' AND B."Elevation"='E' THEN 'Roof B'
                WHEN AV."Elevation" IS NULL THEN 'N/A'
            END as Elevation,
        AV."BayNumber" as BayNumber,
        AV."DistFromLeftCol" as DistFromLeftColumn,
        AV."RoofVent" as Type,
        AV."Operator" as Operator,
        AV."OperatorWithCable" as OperatorWithCable,
         AV."Color" as Color
    FROM
        "Accessories_Vents" AV
        inner join "BuildingInformation" B on B."BuildingInformationId" = AV."BuildingId"
        WHERE AV."IsDelete" = 'N' and AV."ProjectId" = ProjectId; 
		
    ELSIF ( LOWER(AssessoryType) = 'topmountedslidedoors' ) THEN
       OPEN Output_Data FOR 
        SELECT
            T."TopMountedSlideDoorId" as Id,
            'Top-Mounted Slide Doors' as AssessoryName,
			  T."BuildingNumber" as BuildingId,
            (B."BuildingLabel" ||  '-' ||B."BuildingName") as Building,
			'Wall/Partition' as Category,
            T."Quantity" as Quantity,
            NVL(T."Elevation",'N/A') as Elevation
          
        FROM
            "Accesories_TopMountedSlideDoor" T
            inner join "BuildingInformation" B on B."BuildingInformationId" = T."BuildingNumber"
            WHERE T."IsDelete" = 'N' and T."ProjectId" = ProjectId;  
			
			ELSIF ( LOWER(AssessoryType) = 'dbcidoors' ) THEN
       OPEN Output_Data FOR 
         SELECT
            D."DbciDoorId" as Id,
            'DBCI Doors' as AssessoryName,
             D."BuildingId" as BuildingId,
			'Wall/Partition' as Category,
            ("BuildingLabel" ||  '-' || "BuildingName") as Building,
            D."Quantity" as Quantity,
            NVL(D."Elevation",'N/A') as Elevation,
           D."PartitionNumber" as PartitionNumber,
           D."BayNumber" as BayNumber,
           D."DistFromLeftCol" as DistanceFromLeftColumn,
           D."DistFromFloor" as DistanceFromFloor,
            D."ResistWind" as ResistWind,
            D."DoorSeries" as Series,
             D."DoorSize" as DoorSize
        FROM
            "Accessories_DBCIDoor" D
            inner join "BuildingInformation" B on B."BuildingInformationId" = D."BuildingId"
            WHERE D."IsDelete" = 'N' AND D."ProjectId" = ProjectId;
			
	ELSIF ( LOWER(AssessoryType) = 'wallpartitionltps' ) THEN
       OPEN Output_Data FOR  SELECT
        
        Case when AWLTP."Elevation"='Partition' then 'Partition' else 'Wall' end as Category,
        Case when AWLTP."Elevation"='Partition' then 'Partition LTP' else 'Wall LTP' end as AssessoryName,
        AWLTP."BuildingInformationId" as BuildingId,
        ("BuildingLabel" ||  '-' || "BuildingName") as Building,
        AWLTP."Quantity" as Quantity,
        AWLTP."WallLTPId" as Id,
        Case when AWLTP."Elevation"='Partition' then (AWLTP."Elevation" ||  ' ' || AWLTP."PartitionNumber") else AWLTP."Elevation" End as Elevation,
        AWLTP."PartitionNumber" as PartitionNumber,
        AWLTP."DistFromLeftCol" as DistFromLeftColumn,
        AWLTP."Size" as "Size",
        AWLTP."Continuous" as Continuous,
        AWLTP."Length" as Length,
        AWLTP."EaveCondition" as EaveCondition,
        AWLTP. "TopElevation" as TopElevation
    FROM
        "Accesories_WallLTP" AWLTP
        inner join "BuildingInformation" B on B."BuildingInformationId" = AWLTP."BuildingInformationId"
        WHERE AWLTP."IsDelete" = 'N' and B."ProjectId" = ProjectId;
		
	ELSIF ( LOWER(AssessoryType) = 'wainscot' ) THEN
       OPEN Output_Data FOR 
        SELECT
        WNCT."WainscotId" as Id,
        'Wainscot' as AssessoryName,
		WNCT."BuildingInformationId" as BuildingId,
		'Wall/Partition' as Category,
        ("BuildingLabel" ||  '-' || "BuildingName") as Building,
        WNCT."Qty" as Quantity,
        WNCT."Elevation" as Elevation
    FROM 
         
        "Accesories_Wainscot" WNCT
        inner join "BuildingInformation" B on B."BuildingInformationId" = WNCT."BuildingInformationId"
        WHERE WNCT."IsDelete" = 'N' and WNCT."ProjectId" = ProjectId;
			
			ELSIF ( LOWER(AssessoryType) = 'roofltps' ) THEN
       OPEN Output_Data FOR 
        SELECT
        ARLTP."RoofLTPId" as Id,
        'Roof LTPs' as AssessoryName,
		ARLTP."BuildingNumber" as BuildingId,
		'Roof' as Category,
        'N/A' as Elevation,
         ("BuildingLabel" ||  '-' || "BuildingName") as Building,
        ARLTP."Qty" as Quantity,
        ARLTP."IsInsulated" as Insulated,
        ARLTP."Location" as Location
    FROM
        "Accesories_RoofLTP" ARLTP
        inner join "BuildingInformation" B on B."BuildingInformationId" = ARLTP."BuildingNumber"
        WHERE ARLTP."IsDelete" = 'N' and ARLTP."ProjectId" = ProjectId;
	 ELSIF ( LOWER(AssessoryType) = 'liner' ) THEN    
        OPEN Output_Data FOR   
             SELECT
                AL."LinerId" as Id,
                'Wall / Partition Liner' as AssessoryName,
                AL."BuildingNumber" as BuildingId,
                'Liner' as Category,
                ("BuildingLabel" ||  '-' || "BuildingName") as Building,
                1 as Quantity,
                AL."Elevation" as Elevation
            FROM
                "Accessories_Liners" AL
                inner join "BuildingInformation" B on B."BuildingInformationId" = AL."BuildingNumber"
                WHERE AL."IsDelete" = 'N'and (AL."Elevation" != 'R' or AL."Elevation" is null ) and B."ProjectId" = ProjectId ;		
     ELSIF ( LOWER(AssessoryType) = 'partitions' ) THEN
       OPEN Output_Data FOR 
        SELECT
        AP."PartitionId" as Id,
		'Partitions' as AssessoryName,
		AP."BuildingNumber" as BuildingId, 
        'Partitions' as Category,
        ("BuildingLabel" ||  '-' || "BuildingName") as Building,
        1 as Quantity,
        'N/A' as Elevation,
		AP."DistFromSideWall" as DistFromSideWall, 
		AP."Type" as Type
    FROM
        "Accesories_Partition" AP
        inner join "BuildingInformation" B on B."BuildingInformationId" = AP."BuildingNumber"
        WHERE AP."IsDelete" = 'N' and AP."ProjectId" = ProjectId;  
ELSIF ( LOWER(AssessoryType) = 'rubberpipeflash' ) THEN
       OPEN Output_Data FOR 
        SELECT
        ARPF."RubberPipeFlashId" as Id,
        'Rubber Pipe Flash' as AssessoryName,
		ARPF."BuildingId" as BuildingId,
		'Roof' as Category,
        ("BuildingLabel" ||  '-' || "BuildingName") as Building,
        ARPF."Quantity" as Quantity,
        ARPF."OutsideDiameter" as RubberPipeFlashSize
         
    FROM
        "Accessories_RubberPipeFlash" ARPF
        inner join "BuildingInformation" B on B."BuildingInformationId" = ARPF."BuildingId"
        WHERE ARPF."IsDelete" = 'N' and ARPF."ProjectId" = ProjectId;	
        
ELSIF ( LOWER(AssessoryType) = 'purlinextensions' ) THEN
       OPEN Output_Data FOR 
        SELECT
            APE."PurlinExtensionId" as Id,
            'Purlin Extension' as AssessoryName,
            APE."BuildingNumber" as BuildingId ,
			'Canopy/Purlin Extension' as Category,
            1 as Quantity,
            (B."BuildingLabel" ||  '-' ||B."BuildingName") as Building,
            APE."Elevation" as Elevation,
            APE."Projection" as Projection,
            APE."SoffitPanelType" as SoffitPanel,
            APE."SoffitPanelGauge" as SoffitGauge,
            APE."SoffitPanelColor" as SoffitColor,
            APE."IsInsulated" as SoffitTrim
        FROM
            "Accesories_PurlinExtensions" APE
            inner join "BuildingInformation" B on B."BuildingInformationId" = APE."BuildingNumber"
            WHERE APE."IsDelete" = 'N' and APE."ProjectId" = ProjectId;
			
ELSIF ( LOWER(AssessoryType) = 'canopy' ) THEN
       OPEN Output_Data FOR 
        SELECT
            AC."AccessoriesCanopyId" as Id,
            'Canopy' as AssessoryName,
            AC."BuildingNumber" as BuildingId, 
            'Canopy/Purlin Extension' as Category,			
             ("BuildingLabel" ||  '-' || "BuildingName") as Building,
            1 as Quantity,
            CASE
                WHEN AC."Select_Elevation"='SWA' OR AC."Select_Elevation"='EWA' THEN 'A' 
                WHEN AC."Select_Elevation"='SWB' OR AC."Select_Elevation"='EWB' THEN 'B'
                WHEN AC."Select_Elevation"='SWC' OR AC."Select_Elevation"='EWC' THEN 'C'
                WHEN AC."Select_Elevation"='SWD' OR AC."Select_Elevation"='EWD' THEN 'D'
               
            END as Elevation,
            AC."StartColumn" as StartColumn,  
            AC."StopColumn" as StopColumn,  
            AC."CanopyType" as Type,
            AC."Projection" as Projection,
            AC."Select_Elevation" as AttachmentElevation,
            AC."Slope" as CanopySlope,
            AC."Panel" as CanopyPanel,
            AC."CanopyPanelColor" as CanopyColor,
            AC."SoffitPanel" as SoffitPanel,
            AC."SoffitGaudge" as SoffitGauge,
            AC."SoffitPanelColor" as SoffitColor,
            AC."SoffitTrim" as SoffitTrim,
            AC."CanopyCornerTrimColor" as CornerTrim,
            AC."CanopySillCapTrimColor" as SillCapTrim,
            AC."Gutter" as Gutters,
            AC."ReturnDownspouts" as ReturnDownSpot
        FROM
            "Accessories_Canopy" AC
            inner join "BuildingInformation" B on B."BuildingInformationId" = AC."BuildingNumber"
            WHERE AC."IsDelete" = 'N' and AC."ProjectId" = ProjectId;
			
			ELSIF ( LOWER(AssessoryType) = 'louvers' ) THEN
       OPEN Output_Data FOR 
         SELECT
            L."LouverId" as Id,
            'Louvers' as AssessoryName,
			L."BuildingId" as BuildingId,
			'Wall/Partition' as Category,
            ("BuildingLabel" ||  '-' || "BuildingName") as Building,
            L."Quantity" as Quantity,
            NVL(L."Elevation",'N/A') as Elevation,
            L."PartitionNumber" as PartitionNumber,
            L."BayNumber" as Bay,
            L."DistFromLeftCol" as FromLeftColumn,
            L."Type" as LouverType,
            L."LouverSize" as LouverSize,
            L."LouverColor" as Color,
            L."LocatedInLiner" as LocatedInLiner,
            L."IncludeFramedOpening" as IncludeFramedOpening
            
        FROM
            "Accessories_Louvers" L
            inner join "BuildingInformation" B on B."BuildingInformationId" = L."BuildingId"
            WHERE L."IsDelete" = 'N' AND L."ProjectId" = ProjectId;
    ELSIF ( LOWER(AssessoryType) = 'windows' ) 
    THEN
       OPEN Output_Data FOR 
         SELECT
           AW."WindowId" as Id,
            'Windows' as AssessoryName,
             AW."BuildingNumber" as BuildingId, 
			'Wall/Partition' as Category,			 
            (B."BuildingLabel" ||  '-' || B."BuildingName") as Building,
            AW."Quantity" as Quantity,
            AW."Elevation" as Elevation,
            AW."BayNumber" as BayNumber,
            AW."PartitionNumber" as PartitionNumber,
            AW."DistFromLeftCol" as DistFromLeftColumn,
            AW."WindowCategory" as WindowCategory,
            AW."WindowSize" as WindowSize,
            AW."Type" as WindowType,
            AW."WindowColor" as Color,
            AW."GlassType" as Glass,
            AW."SubFraming" as SubFraming
            
        FROM
             "Accesories_Windows" AW
            inner join "BuildingInformation" B on B."BuildingInformationId" = AW."BuildingNumber"
            WHERE AW."IsDelete" = 'N' AND AW."ProjectId" = ProjectId;
			
	ELSIF ( LOWER(AssessoryType) = 'fullheight' OR  LOWER(AssessoryType) = 'partialheight' OR LOWER(AssessoryType) = 'attachmentheight' ) 
    THEN
       OPEN Output_Data FOR 
         SELECT
           OA."Id" as Id,
            OA."OpeningType" as AssessoryName,
			OA."BuildingNumber" as BuildingId,
			'Open Areas' as Category,
            1 as Quantity,
            (B."BuildingLabel" ||  '-' || B."BuildingName") as Building,
            CASE
                WHEN OA."Elevation"='EWA' OR OA."Elevation"='SWA' THEN 'A' 
                WHEN OA."Elevation"='EWB' OR OA."Elevation"='SWB' THEN 'B'
                WHEN OA."Elevation"='EWC' OR OA."Elevation"='SWC' THEN 'C'
                WHEN OA."Elevation"='EWD' OR OA."Elevation"='SWD' THEN 'D'
                ELSE OA."Elevation"
            END as Elevation,
            OA."PartitionNumber" as PartitionNumber,
            OA."BayNumber" as Bay,
            OA."DistFromLeftColumn" as FromLeftColumn,
            OA."OpeningWidth" as OpeningWidth,
            OA."OpeningHeight" as OpeningHeight,
            OA."MaterialThickness" as MaterialThickness  ,
            OA."MaterialWeight" as MaterialWeight  ,
            OA."DistSteelLinetoMaterial" as SteelLineToOutsideMaterial  ,
            OA."DistSteelLinetoBeam" as SteelLineToSupportBeam  ,
            OA."PercentOpenforWind" as PercentOpenForWind  ,
            OA."MasonryType" as MasonryType  ,
            OA."MaterialDirection" as MaterialDirection  ,
            OA."ShearWall" as ShearWall  ,
            OA."HeaderFlash" as HearderFlash  ,
            OA."AttachmentNumber" as Attachment
        FROM
            "OpenAreas" OA
        inner join "BuildingInformation" B on B."BuildingInformationId" = OA."BuildingNumber"
        WHERE OA."IsDeleted" = 'N' AND B."ProjectId" = ProjectId AND OA."OpenEndwall" = 0
        AND 
        OA."OpeningType"= 
        CASE 
            WHEN LOWER(AssessoryType) = 'fullheight' THEN 'Full Height'
            WHEN LOWER(AssessoryType) = 'partialheight' THEN 'Partial Height' 
            WHEN LOWER(AssessoryType) = 'attachmentheight' THEN 'Attachment Height' 
            WHEN LOWER(AssessoryType) = 'supportbeams' THEN 'Support Beams' 
        END;
   ELSIF ( LOWER(AssessoryType) = 'supportbeams') 
    THEN
       OPEN Output_Data FOR 
         SELECT
           SB."SupportBeamsId" as Id,
            'Support Beams' as AssessoryName,
            SB."BuildingNumber" as BuildingId, 
			'Open Areas' as Category,
            1 as Quantity,
            (B."BuildingLabel" ||  '-' || B."BuildingName") as Building,           
             SB."Elevation" as Elevation,
             SB."BeamStartCol" as StartColumn,
             SB."BeamStopCol" as StopColumn,
             SB."BeamHeight" as BeamHeight,
             SB."MaterialThickness" as MaterialThickness,
             SB."MaterialWeight" as MaterialWeight,
             SB."BeamDeflection" as BeamDeflection,
             SB."BeamFlanges" as UseFlangeBracing,
             SB."BeamAttachmentSpacing" as BeamConnectionSpacing,
             SB."BeamSteelline" as InSteelLine
        FROM
            "SupportBeams" SB
        inner join "BuildingInformation" B on B."BuildingInformationId" = SB."BuildingNumber"
        WHERE SB."IsDelete" = 'N' AND B."ProjectId" = ProjectId;
		
		 ELSIF ( LOWER(AssessoryType) = 'framedopenings' ) THEN
       OPEN Output_Data FOR 
        SELECT
            AFO."FramedOpeningId" as Id,
            'Framed Openings' as AssessoryName,
            AFO."BuildingNumber" as BuildingId ,
			'Wall/Partition' as Category,
            (B."BuildingLabel" ||  '-' ||B."BuildingName") as Building,
            AFO."Quantity" as Quantity,
            NVL(AFO."Elevation",'N/A') as Elevation,
            AFO."PartitionNumber" as PartitionNumber,
            AFO."BayNumber" as Bay,
            AFO."Width" as OpeningWidth,
            AFO."Height" as OpeningHeight,
            AFO."Type" as FramedOpeningType,
            AFO."ClosureTrimColor" as Color
        FROM
            "Accessories_FramedOpening" AFO
            inner join "BuildingInformation" B on B."BuildingInformationId" = AFO."BuildingNumber"
            WHERE AFO."IsDelete" = 'N' and AFO."ProjectId" = ProjectId;
			
			ELSIF ( LOWER(AssessoryType) = 'parapetwalls' ) THEN
       OPEN Output_Data FOR  
       SELECT
            AParapet."ParapetId" as Id,
            'Parapet Walls' as AssessoryName,
			AParapet."BuildingInformationId" as BuildingId ,
			'Facade/Parapet Walls' as Category,
            ("BuildingLabel" ||  '-' || "BuildingName") as Building,
            1 as Quantity,
            NVL(AParapet."Elevation",'N/A') as Elevation
        FROM
            "Accessories_Parapet" AParapet
            inner join "BuildingInformation" B on B."BuildingInformationId" = AParapet."BuildingInformationId"
            WHERE AParapet."IsDelete" = 'N' and B."ProjectId" = ProjectId;
			
ELSIF ( LOWER(AssessoryType) = 'valleygutters' OR LOWER(AssessoryType) = 'trim') THEN
       OPEN Output_Data FOR 
         SELECT
            V."ValleyguttersId" as Id,
            'Valley Gutters' as AssessoryName,
			V."BuildingInformationId" as BuildingId,
			'Trim' as Category,
            ("BuildingLabel" ||  '-' || "BuildingName") as Building,
            V."Quantity" as Quantity,
            'N/A' as Elevation,
             V."Length" as Length,
              V."ConductorHeadLocation" as ConductorHeadLocationLocation
              
        FROM
            "Accessories_Valleygutters" V
            inner join "BuildingInformation" B on B."BuildingInformationId" = V."BuildingInformationId"
            WHERE V."IsDelete" != 'Y' AND V."ProjectId" = ProjectId;
ELSIF ( LOWER(AssessoryType) = 'openareas' ) 
    THEN
       OPEN Output_Data FOR 
         SELECT
           OA."Id" as Id,
            OA."OpeningType" as AssessoryName,
			OA."BuildingNumber" as BuildingId,
			'Open Areas' as Category,
            (B."BuildingLabel" ||  '-' || B."BuildingName") as Building,
            1 as Quantity,
            CASE
                WHEN OA."Elevation"='EWA' OR OA."Elevation"='SWA' THEN 'A' 
                WHEN OA."Elevation"='EWB' OR OA."Elevation"='SWB' THEN 'B'
                WHEN OA."Elevation"='EWC' OR OA."Elevation"='SWC' THEN 'C'
                WHEN OA."Elevation"='EWD' OR OA."Elevation"='SWD' THEN 'D'
                ELSE OA."Elevation"
            END as Elevation
              
        FROM
            "OpenAreas" OA
            inner join "BuildingInformation" B on B."BuildingInformationId" = OA."BuildingNumber"
            WHERE OA."IsDeleted" = 'N' AND B."ProjectId" = ProjectId AND OA."OpenEndwall" = 0
            UNION
             SELECT
               SB."SupportBeamsId" as Id,
               'Support Beams' as AssessoryName,
			   SB."BuildingNumber" as BuildingId ,
			   'Open Areas' as Category,
               (B."BuildingLabel" ||  '-' || B."BuildingName") as Building,
                1 as Quantity,           
               SB."Elevation" as Elevation
                
        FROM
            "SupportBeams" SB
        inner join "BuildingInformation" B on B."BuildingInformationId" = SB."BuildingNumber"
        WHERE SB."IsDelete" = 'N' AND B."ProjectId" = ProjectId;
		
ELSIF ( LOWER(AssessoryType) = 'facade' ) THEN
       OPEN Output_Data FOR  
       SELECT
            AFacade."FacadeId" as Id,
            'Facade' as AssessoryName,
            AFacade."BuildingInformationId" as BuildingId,
            'Facade/Parapet Walls' as Category,
            ("BuildingLabel" ||  '-' || "BuildingName") as Building,
            1 as Quantity,
            NVL(AFacade."Elevation",'N/A') as Elevation,
            AFacade."StartCol" as StartColumn,
            AFacade."StopCol" as StopColumn,
            AFacade."Height" as Height,
            AFacade."Projection" as Projection,
            AFacade."Type" as Type,
            AFacade."SoffitElevation" as SoffitElevation,
            AFacade."PanelType" as PanelType,
            AFacade."PanelGauge" as PanelGauge,
            AFacade."SoffitPanelGauge" as SoffitGauge,
            AFacade."BackupCover" as BackUpCover,
            AFacade."BackPanelGauge" as BackUpGauge,
            AFacade."BackPanelColor" as BackUpColor,
            AFacade."SillCapTrim" as SillCapTrim,
            AFacade."SoffitTrim" as SoffitTrim,
            AFacade."CornerTrim" as CornerTrim
              
        FROM
            "Accessories_Facade" AFacade
            inner join "BuildingInformation" B on B."BuildingInformationId" = AFacade."BuildingInformationId"
            WHERE AFacade."IsDelete" = 'N' and B."ProjectId" = ProjectId;
			
ELSIF ( LOWER(AssessoryType) = 'roofliner' ) THEN    	
        OPEN Output_Data FOR   	
             SELECT	
                ALR."LinerId" as Id,
                'Roof Liner' as AssessoryName,
                ALR."BuildingNumber" as BuildingId,	
                'Liner' as Category,
                ("BuildingLabel" ||  '-' || "BuildingName") as Building,	
                1 as Quantity,	
                'N/A' as Elevation,
                ALR."StartColumn" as StartColumn,
                ALR."StopColumn"as StopColumn,
                ALR."XFrom" as AlongWallAFrom,
                ALR."XTo" as AlongWallATo,
                ALR."YFrom" as AlongWallBFrom,
                ALR."YTo" as AlongWallBTo,
                ALR."BaseType" as Type,
                ALR."PanelType" as PanelType,
                ALR."PanelGauge" as PanelGauge,
                ALR."PanelColor" as PanelColor,
                ALR."RidgeTrimGauge" as RidgeTrimGauge,
                ALR."RidgeTrimColor" as RidgeTrimColor,
                ALR."RafterTieTrimGauge" as RafterTieTrimGauge,
                ALR."RafterTieTrimColor" as RafterTieTrimColor,
                ALR."EaveToWallTrimColor" as EaveToWallTrimColor,
                ALR."EaveToWallTrimGauge" as EaveToWallTrimGauge,
                ALR."ReverseRoll" as ReverseRoll
                 
            FROM	
                "Accessories_Liners" ALR	
                inner join "BuildingInformation" B on B."BuildingInformationId" = ALR."BuildingNumber"	
                WHERE ALR."IsDelete" = 'N'and ALR."Elevation" = 'R' and B."ProjectId" = ProjectId;
				
ELSIF ( LOWER(AssessoryType) = 'wallpartitionliner' ) THEN    
        OPEN Output_Data FOR   
             SELECT
                AL."LinerId" as Id,
                'Wall / Partition Liner' as AssessoryName,
                AL."BuildingNumber" as BuildingId,
                'Liner' as Category,
                ("BuildingLabel" ||  '-' || "BuildingName") as Building,
                1 as Quantity,
                AL."Elevation" as Elevation,
                AL."Elevation" as Elevation,
                AL."Elevation" as Elevation,
                AL."Elevation" as Elevation,
                AL."Elevation" as Elevation,
                AL."Elevation" as Elevation,
                AL."PartitionNumber" as PartitionNumber,
                AL."BayNumber" as Bay,
                AL."DistFromLeftCol" as FromLeftColumn,
                AL."Length" as Length,
                AL."Height" as Height,
                AL."BaseType" as BaseType,
                AL."PanelType" as PanelType,
                AL."PanelGauge" as PanelGauge,
                AL."PanelColor" as PanelColor,
                AL."CapTrim" as CapTrimColor,
                AL."PurlinTrimColor" as PurlinTrimColor,
                AL."InsideCornerTrimColor" as InsideCornerTrimColor,
                AL."ColumnTieTrimColor" as ColumnTieTrimColor,
                AL."ReverseRoll" as ReverseRoll
                
            FROM
                "Accessories_Liners" AL
                inner join "BuildingInformation" B on B."BuildingInformationId" = AL."BuildingNumber"
                WHERE AL."IsDelete" = 'N' and (AL."Elevation" != 'R' or AL."Elevation" is null ) and B."ProjectId" = ProjectId;  
				
ELSIF ( LOWER(AssessoryType) = 'cranes' ) 
    THEN
       OPEN Output_Data FOR 
         SELECT
           AC."CraneId" as Id,
            'Cranes' as AssessoryName,
            AC."BuildingId" as BuildingId,
            'Others' as Category,
            (B."BuildingLabel" ||  '-' || B."BuildingName") as Building,
            AC."Quantity" as Quantity,
            'N/A' as Elevation,
            AC."StartFrameline" as StartFrameLine,
            AC."StopFrameLine" as StopFrameLine,
            AC."SType" as SystemType,
            AC."CraneClass" as Class,
            AC."Control" as Control,
            AC."Brackets" as Brackets,
            AC."RunwayBeam" as RunWayBeams,
            AC."CraneNumber1" as CraneNumber,
            AC."RunwayBeamSize" as RunWayBeamSize,
            AC."Tonnage1" as Tonnage,
            AC."BridgeWeight1" as BridgeWeight,
            AC."HoistWeight1" as HoistWeight,
            AC."WheelSpacing1" as WheelSpacing,
            AC."DistanceBetweenCranes" as DistanceBetweenCranes
              
        FROM
             "Accessories_Cranes" AC
            inner join "BuildingInformation" B on B."BuildingInformationId" = AC."BuildingId"
            WHERE AC."IsDelete" = 'N' AND AC."ProjectId" = ProjectId; 
			
ELSIF ( LOWER(AssessoryType) = 'miscellaneousadds' ) 
    THEN
       OPEN Output_Data FOR 
         SELECT
           MA."AddLinesId" as Id,
            'Miscellaneous Adds' as AssessoryName,
            MA."BuildingInformationId" as BuildingId,
            'Others' as Category,
            (B."BuildingLabel" ||  '-' || B."BuildingName") as Building,
            MA."Quantity" as Quantity,
            'N/A' as Elevation
              
        FROM
             "Input_AddLines" MA
            inner join "BuildingInformation" B on B."BuildingInformationId" = MA."BuildingInformationId"
            WHERE MA."IsDelete" != 'Y' AND MA."ProjectId" = ProjectId AND MA."ScreenType" = 'MiscellaneousAdds';
			
ELSIF ( LOWER(AssessoryType) = 'mezzanines' ) 
    THEN
       OPEN Output_Data FOR 
         SELECT
           EM."MezzaninesId" as Id,
            'Mezzanines' as AssessoryName,
            EM."BuildingNumber" as BuildingId,
            'Others' as Category,
            (B."BuildingLabel" ||  '-' || B."BuildingName") as Building,
            EM."MezzanineNumber" as Quantity,
            'N/A' as Elevation,
            EM."StartFrameline" as StartFrameline,
            EM."StopFrameline" as StopFrameLine,
            EM."DistFromSW" as DistanceFromSW,
            EM."Width" as Width,
            EM."Design" as IncludeDesign,
            EM."Beams" as IncludeBeams,
            EM."Joists" as IncludeJoists,
            EM."Deck" as IncludeDeck,
            EM."SupportColumns" as IncludeSupportColumns,
            EM."EdgeAngle" as IncludeEdgeAngle,
            EM."LiveLoad" as LiveLoad,
            EM."DeadLoad" as DeadLoad,
            EM."CollateralLoad" as CollatralLoad,
            EM."PartitionLoad" as ParttionLoad,
            EM."Vibration" as VibrationAnalysis,
            EM."HumanActivity" as ForHumanActivity,
            EM."MezzUse" as MezzanineUse,
            EM."StairwellWeight" as StairwellWeight,
            EM."FloorThickness" as FloorThickness,
            EM."FloorHeight" as FloorHeight,
            EM."FloorMaterial" as FloorMaterial,
            EM."InsideClearBeams" as InsideClearToBeams,
            EM."ClearToRafter" as ClearFromMezzToRafter,
            EM."JoistShopcoat" as JoistShop,
            EM."DeckType" as DeckType
              
        FROM
             "EDSPrice_IO_Mezzanines" EM
            inner join "BuildingInformation" B on B."BuildingInformationId" = EM."BuildingNumber"
            WHERE EM."IsDelete" = 'N' AND EM."ProjectId" = ProjectId;
			
ELSIF ( LOWER(AssessoryType) = 'parapetwalls' ) THEN
       OPEN Output_Data FOR  
       SELECT
            AParapet."ParapetId" as Id,
            'Parapet Walls' as AssessoryName,
            AParapet."BuildingInformationId" as BuildingId,
            'Facade/Parapet Walls' as Category,
            ("BuildingLabel" ||  '-' || "BuildingName") as Building,
            1 as Quantity,
            NVL(AParapet."Elevation",'N/A') as Elevation,
            AParapet."StartColumn" as StartColumn,
            AParapet."StopColumn" as StopColumn,
            AParapet."IsInsulated" as Insulated
        FROM
            "Accessories_Parapet" AParapet
            inner join "BuildingInformation" B on B."BuildingInformationId" = AParapet."BuildingInformationId"
            WHERE AParapet."IsDelete" = 'N' and B."ProjectId" = ProjectId;
			
ELSE
        OPEN Output_Data FOR 
         SELECT
             ARLTP."RoofLTPId" as Id,
            'Roof LTPs' as AssessoryName,
			ARLTP."BuildingNumber" as BuildingId,
			'Roof' as Category,
            ("BuildingLabel" ||  '-' || "BuildingName") as Building,
            ARLTP."Qty" as Quantity,
            'N/A' as Elevation
        FROM
            "Accesories_RoofLTP" ARLTP
            inner join "BuildingInformation" B on B."BuildingInformationId" = ARLTP."BuildingNumber"
            WHERE ARLTP."IsDelete" = 'N' and ARLTP."ProjectId" = ProjectId
        UNION
            SELECT
            AWLTP."WallLTPId" as Id,
            Case when AWLTP."Elevation"='Partition' then 'Partition LTP' else 'Wall LTP' end as AssessoryName,
			AWLTP."BuildingInformationId" as BuildingId,
			Case when AWLTP."Elevation"='Partition' then 'Partition' else 'Wall' end as Category,
            ("BuildingLabel" ||  '-' || "BuildingName") as Building,
            AWLTP."Quantity" as Quantity,
            Case when AWLTP."Elevation"='Partition' then (AWLTP."Elevation" ||  ' ' || AWLTP."PartitionNumber") else AWLTP."Elevation" End as Elevation
                        
        FROM
            "Accesories_WallLTP" AWLTP
            inner join "BuildingInformation" B on B."BuildingInformationId" = AWLTP."BuildingInformationId"
            WHERE AWLTP."IsDelete" = 'N' and B."ProjectId" = ProjectId
        UNION
            SELECT
            APE."PurlinExtensionId" as Id,
            'Purlin Extension' as AssessoryName,
            APE."BuildingNumber" as BuildingId,
			'Canopy/Purlin Extension' as Category,
             ("BuildingLabel" ||  '-' || "BuildingName") as Building,
            1 as Quantity,
            
            'N/A' as Elevation
        FROM
            "Accesories_PurlinExtensions" APE
            inner join "BuildingInformation" B on B."BuildingInformationId" = APE."BuildingNumber"
            WHERE APE."IsDelete" = 'N' and APE."ProjectId" = ProjectId
        UNION
            SELECT
              ARPF."RubberPipeFlashId" as Id,
              'Rubber Pipe Flash' as AssessoryName,
			  ARPF."BuildingId" as BuildingId,
			  'Roof' as Category,
              ("BuildingLabel" ||  '-' || "BuildingName") as Building,
               ARPF."Quantity" as Quantity,
              'N/A' as Elevation
              
       FROM
           "Accessories_RubberPipeFlash" ARPF
           inner join "BuildingInformation" B on B."BuildingInformationId" = ARPF."BuildingId"
           WHERE ARPF."IsDelete" = 'N' and ARPF."ProjectId" = ProjectId
        UNION
           SELECT
           AC."AccessoriesCanopyId" as Id,
            'Canopy' as AssessoryName,
			AC."BuildingNumber" as BuildingId,
			'Canopy/Purlin Extension' as Category,
             ("BuildingLabel" ||  '-' || "BuildingName") as Building,
            1 as Quantity,
            CASE
                WHEN AC."Select_Elevation"='SWA' OR AC."Select_Elevation"='EWA' THEN 'A' 
                WHEN AC."Select_Elevation"='SWB' OR AC."Select_Elevation"='EWB' THEN 'B'
                WHEN AC."Select_Elevation"='SWC' OR AC."Select_Elevation"='EWC' THEN 'C'
                WHEN AC."Select_Elevation"='SWD' OR AC."Select_Elevation"='EWD' THEN 'D'
               
            END as Elevation
            
        FROM
            "Accessories_Canopy" AC
            inner join "BuildingInformation" B on B."BuildingInformationId" = AC."BuildingNumber"
            WHERE AC."IsDelete" = 'N' and AC."ProjectId" = ProjectId
        UNION
         SELECT
           AV."VentsId" as Id,
           'Vents' as AssessoryName,
		   AV."BuildingId" as BuildingId,
		   'Roof' as Category,
           ("BuildingLabel" ||  '-' || "BuildingName") as Building,
           AV."Quantity" as Quantity,
           CASE
                WHEN AV."Elevation"='R' THEN 'Roof Peak' 
                WHEN AV."Elevation"='E' AND B."Elevation"='S' THEN 'Roof A'
                WHEN AV."Elevation"='F' AND B."Elevation"='S' THEN 'Roof C'
                WHEN AV."Elevation"='E' AND B."Elevation"='E' THEN 'Roof D'
                WHEN AV."Elevation"='F' AND B."Elevation"='E' THEN 'Roof B'
            END as Elevation
            
         FROM
           "Accessories_Vents" AV
           inner join "BuildingInformation" B on B."BuildingInformationId" = AV."BuildingId"
           WHERE AV."IsDelete" = 'N' and AV."ProjectId" = ProjectId
        UNION
         SELECT
           AFO."FramedOpeningId" as Id,
            'Framed Openings' as AssessoryName,
			AFO."BuildingNumber" as BuildingId,
			'Wall/Partition' as Category,
            ("BuildingLabel" ||  '-' || "BuildingName") as Building,
            AFO."Quantity" as Quantity,
            NVL(AFO."Elevation",'N/A') as Elevation
            
        FROM
            "Accessories_FramedOpening" AFO
            inner join "BuildingInformation" B on B."BuildingInformationId" = AFO."BuildingNumber"
            WHERE AFO."IsDelete" = 'N' and AFO."ProjectId" = ProjectId
        UNION
          SELECT
            L."LouverId" as Id,
            'Louvers' as AssessoryName,
			L."BuildingId" as BuildingId,
			'Wall/Partition' as Category,
            ("BuildingLabel" ||  '-' || "BuildingName") as Building,
            L."Quantity" as Quantity,
            NVL(L."Elevation",'N/A') as Elevation
            
        FROM
            "Accessories_Louvers" L
            inner join "BuildingInformation" B on B."BuildingInformationId" = L."BuildingId"
            WHERE L."IsDelete" = 'N' AND L."ProjectId" = ProjectId
        UNION
        SELECT
            V."ValleyguttersId" as Id,
            'Valley Gutters' as AssessoryName,
			V."BuildingInformationId" as BuildingId,
			'Trim' as Category,
            ("BuildingLabel" ||  '-' || "BuildingName") as Building,
            V."Quantity" as Quantity,
            'N/A' as Elevation
            
        FROM
            "Accessories_Valleygutters" V
            inner join "BuildingInformation" B on B."BuildingInformationId" = V."BuildingInformationId"
            WHERE V."IsDelete" != 'Y' AND V."ProjectId" = ProjectId
        UNION
        SELECT
           OA."Id" as Id,
            OA."OpeningType" as AssessoryName,
			OA."BuildingNumber" as BuildingId,
			'Open Areas' as Category,
            (B."BuildingLabel" ||  '-' || B."BuildingName") as Building,
            1 as Quantity,
            CASE
                WHEN OA."Elevation"='EWA' OR OA."Elevation"='SWA' THEN 'A' 
                WHEN OA."Elevation"='EWB' OR OA."Elevation"='SWB' THEN 'B'
                WHEN OA."Elevation"='EWC' OR OA."Elevation"='SWC' THEN 'C'
                WHEN OA."Elevation"='EWD' OR OA."Elevation"='SWD' THEN 'D'
                ELSE OA."Elevation"
            END as Elevation
            
        FROM
            "OpenAreas" OA
            inner join "BuildingInformation" B on B."BuildingInformationId" = OA."BuildingNumber"
            WHERE OA."IsDeleted" = 'N' AND B."ProjectId" = ProjectId and OA."OpenEndwall" = 0
        UNION
        SELECT
               SB."SupportBeamsId" as Id,
               'Support Beams' as AssessoryName,
			   SB."BuildingNumber" as BuildingId,
			   'Open Areas' as Category,
               (B."BuildingLabel" ||  '-' || B."BuildingName") as Building,
                1 as Quantity,           
               SB."Elevation" as Elevation
               
        FROM
            "SupportBeams" SB
            inner join "BuildingInformation" B on B."BuildingInformationId" = SB."BuildingNumber"
            WHERE SB."IsDelete" = 'N' AND B."ProjectId" = ProjectId
        UNION
        SELECT
            AP."PartitionId" as Id,
            'Partitions' as AssessoryName,
			AP."BuildingNumber" as BuildingId,
			'Partitions' as Category,
            ("BuildingLabel" ||  '-' || "BuildingName") as Building,
            1 as Quantity,
            'N/A' as Elevation
            
        FROM
            "Accesories_Partition" AP
            inner join "BuildingInformation" B on B."BuildingInformationId" = AP."BuildingNumber"
            WHERE AP."IsDelete" = 'N' and AP."ProjectId" = ProjectId
       UNION
        SELECT
           AW."WindowId" as Id,
            'Windows' as AssessoryName,
			 AW."BuildingNumber" as BuildingId,
			 'Wall/Partition' as Category,
            (B."BuildingLabel" ||  '-' || B."BuildingName") as Building,
            AW."Quantity" as Quantity,
            NVL(AW."Elevation",'N/A') as Elevation
           
        FROM
            "Accesories_Windows" AW
            inner join "BuildingInformation" B on B."BuildingInformationId" = AW."BuildingNumber"
            WHERE AW."IsDelete" = 'N' AND AW."ProjectId" = ProjectId
        UNION
             SELECT
                AParapet."ParapetId" as Id,
                'Parapet Walls' as AssessoryName,
				AParapet."BuildingInformationId" as BuildingId,
				'Facade/Parapet Walls' as Category,
                ("BuildingLabel" ||  '-' || "BuildingName") as Building,
                1 as Quantity,
                NVL(AParapet."Elevation",'N/A') as Elevation
                 
            FROM
                "Accessories_Parapet" AParapet
                inner join "BuildingInformation" B on B."BuildingInformationId" = AParapet."BuildingInformationId"
                WHERE AParapet."IsDelete" = 'N' and B."ProjectId" = ProjectId
        UNION
            SELECT
                AFacade."FacadeId" as Id,
                'Facade' as AssessoryName,
				AFacade."BuildingInformationId" as BuildingId,
				'Facade/Parapet Walls' as Category,
                ("BuildingLabel" ||  '-' || "BuildingName") as Building,
                1 as Quantity,
                NVL(AFacade."Elevation",'N/A') as Elevation
                
            FROM
                "Accessories_Facade" AFacade
                inner join "BuildingInformation" B on B."BuildingInformationId" = AFacade."BuildingInformationId"
                WHERE AFacade."IsDelete" = 'N' and B."ProjectId" = ProjectId
         UNION
           SELECT
            T."TopMountedSlideDoorId" as Id,
            'Top-Mounted Slide Doors' as AssessoryName,
			T."BuildingNumber" as BuildingId,
			'Wall/Partition' as Category,
            (B."BuildingLabel" ||  '-' ||B."BuildingName") as Building,
            T."Quantity" as Quantity,
            NVL(T."Elevation",'N/A') as Elevation
            
            FROM
            "Accesories_TopMountedSlideDoor" T
            inner join "BuildingInformation" B on B."BuildingInformationId" = T."BuildingNumber"
            WHERE T."IsDelete" = 'N' and T."ProjectId" = ProjectId
        UNION
           SELECT
           AWD."WalkDoorId" as Id,
            'Walk Doors' as AssessoryName,
			AWD."BuildingId" as BuildingId,
			'Wall/Partition' as Category,
            (B."BuildingLabel" ||  '-' || B."BuildingName") as Building,
            AWD."Quantity" as Quantity,
            NVL(AWD."Elevation",'N/A') as Elevation
            
        FROM
            "Accessories_WalkDoors" AWD
            inner join "BuildingInformation" B on B."BuildingInformationId" = AWD."BuildingId"
            WHERE AWD."IsDelete" = 'N' AND AWD."ProjectId" = ProjectId           
       UNION
             SELECT
                AL."LinerId" as Id,
                'Wall / Partition Liner' as AssessoryName,
				AL."BuildingNumber"  as BuildingId,
				'Liner' as Category,
                ("BuildingLabel" ||  '-' || "BuildingName") as Building,
                1 as Quantity,
                AL."Elevation" as Elevation
               
            FROM
                "Accessories_Liners" AL
                inner join "BuildingInformation" B on B."BuildingInformationId" = AL."BuildingNumber"
                WHERE AL."IsDelete" = 'N' and (AL."Elevation" != 'R' or AL."Elevation" is null ) and B."ProjectId" = ProjectId
      UNION        	
           SELECT	
                ALR."LinerId" as Id,	
                'Roof Liner' as AssessoryName,
				 ALR."BuildingNumber"as BuildingId,	
				'Liner' as Category,				 
                ("BuildingLabel" ||  '-' || "BuildingName") as Building,	
                1 as Quantity,	
                'N/A' as Elevation
                 
            FROM	
                "Accessories_Liners" ALR	
                inner join "BuildingInformation" B on B."BuildingInformationId" = ALR."BuildingNumber"	
                WHERE ALR."IsDelete" = 'N'and ALR."Elevation" = 'R' and B."ProjectId" = ProjectId   
       UNION
               SELECT
                    WNCT."WainscotId" as Id,
                    'Wainscot' as AssessoryName,
					WNCT."BuildingInformationId" as BuildingId,
					'Wall/Partition' as Category,
                    ("BuildingLabel" ||  '-' || "BuildingName") as Building,
                    WNCT."Qty" as Quantity,
                    WNCT."Elevation" as Elevation
                     
                FROM                      
                    "Accesories_Wainscot" WNCT
                    inner join "BuildingInformation" B on B."BuildingInformationId" = WNCT."BuildingInformationId"
                    WHERE WNCT."IsDelete" = 'N' and WNCT."ProjectId" = ProjectId
        UNION
                 SELECT
                    D."DbciDoorId" as Id,
                    'DBCI Doors' as AssessoryName,
					D."BuildingId" as BuildingId,
					'Wall/Partition' as Category,
                    ("BuildingLabel" ||  '-' || "BuildingName") as Building,
                    D."Quantity" as Quantity,
                    NVL(D."Elevation",'N/A') as Elevation
                    
                FROM
                    "Accessories_DBCIDoor" D
                    inner join "BuildingInformation" B on B."BuildingInformationId" = D."BuildingId"
                    WHERE D."IsDelete" = 'N' AND D."ProjectId" = ProjectId 
        UNION
                SELECT
                   AC."CraneId" as Id,
                    'Cranes' as AssessoryName,
					AC."BuildingId" as BuildingId,
					'Others' as Category,
                    (B."BuildingLabel" ||  '-' || B."BuildingName") as Building,
                    AC."Quantity" as Quantity,
                    'N/A' as Elevation
                    
                FROM
                     "Accessories_Cranes" AC
                    inner join "BuildingInformation" B on B."BuildingInformationId" = AC."BuildingId"
                    WHERE AC."IsDelete" = 'N' AND AC."ProjectId" = ProjectId
                    
        UNION
                SELECT
                   MA."AddLinesId" as Id,
                    'Miscellaneous Adds' as AssessoryName,
					MA."BuildingInformationId" as BuildingId,
					'Others' as Category,
                    (B."BuildingLabel" ||  '-' || B."BuildingName") as Building,
                    MA."Quantity" as Quantity,
                    'N/A' as Elevation
                      
                FROM
                     "Input_AddLines" MA
                    inner join "BuildingInformation" B on B."BuildingInformationId" = MA."BuildingInformationId"
                    WHERE MA."IsDelete" != 'Y' AND MA."ProjectId" = ProjectId AND MA."ScreenType" = 'MiscellaneousAdds'
     UNION
                SELECT
                   EM."MezzaninesId" as Id,
                    'Mezzanines' as AssessoryName,
					EM."BuildingNumber" as BuildingId ,
					'Others' as Category,
                    (B."BuildingLabel" ||  '-' || B."BuildingName") as Building,
                    EM."MezzanineNumber" as Quantity,
                    'N/A' as Elevation
                     
                FROM
                     "EDSPrice_IO_Mezzanines" EM
                    inner join "BuildingInformation" B on B."BuildingInformationId" = EM."BuildingNumber"
                    WHERE EM."IsDelete" = 'N' AND EM."ProjectId" = ProjectId;
 END IF;
END ACCESSORY_LIST_NEW;
/