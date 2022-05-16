CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORY_LIST" 
(
    ProjectId in number,
    AssessoryType in varchar2,
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
    IF ( LOWER(AssessoryType) = 'topmountedslidedoors' ) THEN
       OPEN Output_Data FOR 
        SELECT
            T."TopMountedSlideDoorId" as Id,
            'Wall/Partition' as Category,
            'Top-Mounted Slide Doors' as AssessoryName,
            (B."BuildingLabel" ||  '-' ||B."BuildingName") as Building,
            T."Quantity" as Quantity,
            NVL(T."Elevation",'N/A') as Elevation,
            T."BuildingNumber" as BuildingId
        FROM
            "Accesories_TopMountedSlideDoor" T
            inner join "BuildingInformation" B on B."BuildingInformationId" = T."BuildingNumber"
            WHERE T."IsDelete" = 'N' and T."ProjectId" = ProjectId;  
            
     ELSIF ( LOWER(AssessoryType) = 'dbcidoors' ) THEN
       OPEN Output_Data FOR 
         SELECT
            D."DbciDoorId" as Id,
            'Wall/Partition' as Category,
            'DBCI Doors' as AssessoryName,
            ("BuildingLabel" ||  '-' || "BuildingName") as Building,
            D."Quantity" as Quantity,
            NVL(D."Elevation",'N/A') as Elevation,
            D."BuildingId" as BuildingId
        FROM
            "Accessories_DBCIDoor" D
            inner join "BuildingInformation" B on B."BuildingInformationId" = D."BuildingId"
            WHERE D."IsDelete" = 'N' AND D."ProjectId" = ProjectId;
            
   ELSIF ( LOWER(AssessoryType) = 'wainscot' ) THEN
       OPEN Output_Data FOR 
        SELECT
        WNCT."WainscotId" as Id,
        'Wall/Partition' as Category,
        'Wainscot' as AssessoryName,
        ("BuildingLabel" ||  '-' || "BuildingName") as Building,
        WNCT."Qty" as Quantity,
        WNCT."Elevation" as Elevation,
         WNCT."BuildingInformationId" as BuildingId
    FROM 
         
        "Accesories_Wainscot" WNCT
        inner join "BuildingInformation" B on B."BuildingInformationId" = WNCT."BuildingInformationId"
        WHERE WNCT."IsDelete" = 'N' and WNCT."ProjectId" = ProjectId;
        
     ELSIF ( LOWER(AssessoryType) = 'roofltps' ) THEN
       OPEN Output_Data FOR 
        SELECT
        ARLTP."RoofLTPId" as Id,
        'Roof' as Category,
        'Roof LTPs' as AssessoryName,
        ("BuildingLabel" ||  '-' || "BuildingName") as Building,
        ARLTP."Qty" as Quantity,
        'N/A' as Elevation,
         ARLTP."BuildingNumber" as BuildingId
    FROM
        "Accesories_RoofLTP" ARLTP
        inner join "BuildingInformation" B on B."BuildingInformationId" = ARLTP."BuildingNumber"
        WHERE ARLTP."IsDelete" = 'N' and ARLTP."ProjectId" = ProjectId;
        
    ELSIF ( LOWER(AssessoryType) = 'rubberpipeflash' ) THEN
       OPEN Output_Data FOR 
        SELECT
        ARPF."RubberPipeFlashId" as Id,
        'Roof' as Category,
        'Rubber Pipe Flash' as AssessoryName,
        ("BuildingLabel" ||  '-' || "BuildingName") as Building,
        ARPF."Quantity" as Quantity,
        'N/A' as Elevation,
         ARPF."BuildingId" as BuildingId
    FROM
        "Accessories_RubberPipeFlash" ARPF
        inner join "BuildingInformation" B on B."BuildingInformationId" = ARPF."BuildingId"
        WHERE ARPF."IsDelete" = 'N' and ARPF."ProjectId" = ProjectId;
        
   ELSIF ( LOWER(AssessoryType) = 'vents' ) THEN
       OPEN Output_Data FOR 
        SELECT
        AV."VentsId" as Id,
        'Roof' as Category,
        'Vents' as AssessoryName,
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
        AV."BuildingId" as BuildingId          
    FROM
        "Accessories_Vents" AV
        inner join "BuildingInformation" B on B."BuildingInformationId" = AV."BuildingId"
        WHERE AV."IsDelete" = 'N' and AV."ProjectId" = ProjectId; 
        
    ELSIF ( LOWER(AssessoryType) = 'purlinextensions' ) THEN
       OPEN Output_Data FOR 
        SELECT
            APE."PurlinExtensionId" as Id,
            'Canopy/Purlin Extension' as Category,
            'Purlin Extension' as AssessoryName,
            (B."BuildingLabel" ||  '-' ||B."BuildingName") as Building,
            1 as Quantity,
            APE."Elevation" as Elevation,
            APE."BuildingNumber" as BuildingId  
        FROM
            "Accesories_PurlinExtensions" APE
            inner join "BuildingInformation" B on B."BuildingInformationId" = APE."BuildingNumber"
            WHERE APE."IsDelete" = 'N' and APE."ProjectId" = ProjectId;
    ELSIF ( LOWER(AssessoryType) = 'canopy' ) THEN
       OPEN Output_Data FOR 
        SELECT
            AC."AccessoriesCanopyId" as Id,
            'Canopy/Purlin Extension' as Category,
            'Canopy' as AssessoryName,
             ("BuildingLabel" ||  '-' || "BuildingName") as Building,
            1 as Quantity,
            CASE
                WHEN AC."Select_Elevation"='SWA' OR AC."Select_Elevation"='EWA' THEN 'A' 
                WHEN AC."Select_Elevation"='SWB' OR AC."Select_Elevation"='EWB' THEN 'B'
                WHEN AC."Select_Elevation"='SWC' OR AC."Select_Elevation"='EWC' THEN 'C'
                WHEN AC."Select_Elevation"='SWD' OR AC."Select_Elevation"='EWD' THEN 'D'
               
            END as Elevation,
            AC."BuildingNumber" as BuildingId  
        FROM
            "Accessories_Canopy" AC
            inner join "BuildingInformation" B on B."BuildingInformationId" = AC."BuildingNumber"
            WHERE AC."IsDelete" = 'N' and AC."ProjectId" = ProjectId;
    ELSIF ( LOWER(AssessoryType) = 'louvers' ) THEN
       OPEN Output_Data FOR 
         SELECT
            L."LouverId" as Id,
            'Wall/Partition' as Category,
            'Louvers' as AssessoryName,
            ("BuildingLabel" ||  '-' || "BuildingName") as Building,
            L."Quantity" as Quantity,
            NVL(L."Elevation",'N/A') as Elevation,
            L."BuildingId" as BuildingId  
        FROM
            "Accessories_Louvers" L
            inner join "BuildingInformation" B on B."BuildingInformationId" = L."BuildingId"
            WHERE L."IsDelete" = 'N' AND L."ProjectId" = ProjectId;
     ELSIF ( LOWER(AssessoryType) = 'valleygutters' OR LOWER(AssessoryType) = 'trim') THEN
       OPEN Output_Data FOR 
         SELECT
            V."ValleyguttersId" as Id,
            'Trim' as Category,
            'Valley Gutters' as AssessoryName,
            ("BuildingLabel" ||  '-' || "BuildingName") as Building,
            V."Quantity" as Quantity,
            'N/A' as Elevation,
             V."BuildingInformationId" as BuildingId  
        FROM
            "Accessories_Valleygutters" V
            inner join "BuildingInformation" B on B."BuildingInformationId" = V."BuildingInformationId"
            WHERE V."IsDelete" != 'Y' AND V."ProjectId" = ProjectId;
     ELSIF ( LOWER(AssessoryType) = 'partitions' ) THEN
       OPEN Output_Data FOR 
        SELECT
        AP."PartitionId" as Id,
        'Partitions' as Category,
        'Partitions' as AssessoryName,
        ("BuildingLabel" ||  '-' || "BuildingName") as Building,
        1 as Quantity,
        'N/A' as Elevation,
        AP."BuildingNumber" as BuildingId  
    FROM
        "Accesories_Partition" AP
        inner join "BuildingInformation" B on B."BuildingInformationId" = AP."BuildingNumber"
        WHERE AP."IsDelete" = 'N' and AP."ProjectId" = ProjectId;         
    ELSIF ( LOWER(AssessoryType) = 'openareas' ) 
    THEN
       OPEN Output_Data FOR 
         SELECT
           OA."Id" as Id,
            'Open Areas' as Category,
            OA."OpeningType" as AssessoryName,
            (B."BuildingLabel" ||  '-' || B."BuildingName") as Building,
            1 as Quantity,
            CASE
                WHEN OA."Elevation"='EWA' OR OA."Elevation"='SWA' THEN 'A' 
                WHEN OA."Elevation"='EWB' OR OA."Elevation"='SWB' THEN 'B'
                WHEN OA."Elevation"='EWC' OR OA."Elevation"='SWC' THEN 'C'
                WHEN OA."Elevation"='EWD' OR OA."Elevation"='SWD' THEN 'D'
                ELSE OA."Elevation"
            END as Elevation,
            OA."BuildingNumber" as BuildingId  
        FROM
            "OpenAreas" OA
            inner join "BuildingInformation" B on B."BuildingInformationId" = OA."BuildingNumber"
            WHERE OA."IsDeleted" = 'N' AND B."ProjectId" = ProjectId AND OA."OpenEndwall" = 0
            UNION
             SELECT
               SB."SupportBeamsId" as Id,
               'Open Areas' as Category,
               'Support Beams' as AssessoryName,
               (B."BuildingLabel" ||  '-' || B."BuildingName") as Building,
                1 as Quantity,           
               SB."Elevation" as Elevation,
               SB."BuildingNumber" as BuildingId  
        FROM
            "SupportBeams" SB
        inner join "BuildingInformation" B on B."BuildingInformationId" = SB."BuildingNumber"
        WHERE SB."IsDelete" = 'N' AND B."ProjectId" = ProjectId;
            
    ELSIF ( LOWER(AssessoryType) = 'windows' ) 
    THEN
       OPEN Output_Data FOR 
         SELECT
           AW."WindowId" as Id,
            'Wall/Partition' as Category,
            'Windows' as AssessoryName,
            (B."BuildingLabel" ||  '-' || B."BuildingName") as Building,
            AW."Quantity" as Quantity,
            AW."Elevation" as Elevation,
            AW."BuildingNumber" as BuildingId  
        FROM
             "Accesories_Windows" AW
            inner join "BuildingInformation" B on B."BuildingInformationId" = AW."BuildingNumber"
            WHERE AW."IsDelete" = 'N' AND AW."ProjectId" = ProjectId;
            
    ELSIF ( LOWER(AssessoryType) = 'fullheight' OR  LOWER(AssessoryType) = 'partialheight' OR LOWER(AssessoryType) = 'attachmentheight' ) 
    THEN
       OPEN Output_Data FOR 
         SELECT
           OA."Id" as Id,
            'Open Areas' as Category,
            OA."OpeningType" as AssessoryName,
            (B."BuildingLabel" ||  '-' || B."BuildingName") as Building,
            1 as Quantity,
            CASE
                WHEN OA."Elevation"='EWA' OR OA."Elevation"='SWA' THEN 'A' 
                WHEN OA."Elevation"='EWB' OR OA."Elevation"='SWB' THEN 'B'
                WHEN OA."Elevation"='EWC' OR OA."Elevation"='SWC' THEN 'C'
                WHEN OA."Elevation"='EWD' OR OA."Elevation"='SWD' THEN 'D'
                ELSE OA."Elevation"
            END as Elevation,
            OA."BuildingNumber" as BuildingId  
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
            'Open Areas' as Category,
            'Support Beams' as AssessoryName,
            (B."BuildingLabel" ||  '-' || B."BuildingName") as Building,
            1 as Quantity,           
             SB."Elevation" as Elevation,
             SB."BuildingNumber" as BuildingId 
        FROM
            "SupportBeams" SB
        inner join "BuildingInformation" B on B."BuildingInformationId" = SB."BuildingNumber"
        WHERE SB."IsDelete" = 'N' AND B."ProjectId" = ProjectId;
    ELSIF ( LOWER(AssessoryType) = 'wallpartitionltps' ) THEN
       OPEN Output_Data FOR  SELECT
        AWLTP."WallLTPId" as Id,
        Case when AWLTP."Elevation"='Partition' then 'Partition' else 'Wall' end as Category,
        Case when AWLTP."Elevation"='Partition' then 'Partition LTP' else 'Wall LTP' end as AssessoryName,
        ("BuildingLabel" ||  '-' || "BuildingName") as Building,
        AWLTP."Quantity" as Quantity,
        Case when AWLTP."Elevation"='Partition' then (AWLTP."Elevation" ||  ' ' || AWLTP."PartitionNumber") else AWLTP."Elevation" End as Elevation
    FROM
        "Accesories_WallLTP" AWLTP
        inner join "BuildingInformation" B on B."BuildingInformationId" = AWLTP."BuildingInformationId"
        WHERE AWLTP."IsDelete" = 'N' and B."ProjectId" = ProjectId;
    ELSIF ( LOWER(AssessoryType) = 'framedopenings' ) THEN
       OPEN Output_Data FOR 
        SELECT
            AFO."FramedOpeningId" as Id,
            'Wall/Partition' as Category,
            'Framed Openings' as AssessoryName,
            (B."BuildingLabel" ||  '-' ||B."BuildingName") as Building,
            AFO."Quantity" as Quantity,
            NVL(AFO."Elevation",'N/A') as Elevation,
             AFO."BuildingNumber" as BuildingId 
        FROM
            "Accessories_FramedOpening" AFO
            inner join "BuildingInformation" B on B."BuildingInformationId" = AFO."BuildingNumber"
            WHERE AFO."IsDelete" = 'N' and AFO."ProjectId" = ProjectId;
     ELSIF ( LOWER(AssessoryType) = 'parapetwalls' ) THEN
       OPEN Output_Data FOR  
       SELECT
            AParapet."ParapetId" as Id,
            'Facade/Parapet Walls' as Category,
            'Parapet Walls' as AssessoryName,
            ("BuildingLabel" ||  '-' || "BuildingName") as Building,
            1 as Quantity,
            NVL(AParapet."Elevation",'N/A') as Elevation,
           AParapet."BuildingInformationId" as BuildingId 
        FROM
            "Accessories_Parapet" AParapet
            inner join "BuildingInformation" B on B."BuildingInformationId" = AParapet."BuildingInformationId"
            WHERE AParapet."IsDelete" = 'N' and B."ProjectId" = ProjectId;
     ELSIF ( LOWER(AssessoryType) = 'facade' ) THEN
       OPEN Output_Data FOR  
       SELECT
            AFacade."FacadeId" as Id,
            'Facade/Parapet Walls' as Category,
            'Facade' as AssessoryName,
            ("BuildingLabel" ||  '-' || "BuildingName") as Building,
            1 as Quantity,
            NVL(AFacade."Elevation",'N/A') as Elevation,
             AFacade."BuildingInformationId" as BuildingId 
        FROM
            "Accessories_Facade" AFacade
            inner join "BuildingInformation" B on B."BuildingInformationId" = AFacade."BuildingInformationId"
            WHERE AFacade."IsDelete" = 'N' and B."ProjectId" = ProjectId;
            
      ELSIF ( LOWER(AssessoryType) = 'roofliner' ) THEN    	
        OPEN Output_Data FOR   	
             SELECT	
                ALR."LinerId" as Id,	
                'Liner' as Category,	
                'Roof Liner' as AssessoryName,	
                ("BuildingLabel" ||  '-' || "BuildingName") as Building,	
                1 as Quantity,	
                'N/A' as Elevation,
                 ALR."BuildingNumber" as BuildingId 
            FROM	
                "Accessories_Liners" ALR	
                inner join "BuildingInformation" B on B."BuildingInformationId" = ALR."BuildingNumber"	
                WHERE ALR."IsDelete" = 'N'and ALR."Elevation" = 'R' and B."ProjectId" = ProjectId;
       ELSIF ( LOWER(AssessoryType) = 'walkdoors' ) THEN
       OPEN Output_Data FOR 
         SELECT
           AWD."WalkDoorId" as Id,
            'Wall/Partition' as Category,
            'Walk Doors' as AssessoryName,
            (B."BuildingLabel" ||  '-' || B."BuildingName") as Building,
            AWD."Quantity" as Quantity,
            CASE
                WHEN AWD."Elevation"='EWA' OR AWD."Elevation"='SWA' THEN 'A' 
                WHEN AWD."Elevation"='EWB' OR AWD."Elevation"='SWB' THEN 'B'
                WHEN AWD."Elevation"='EWC' OR AWD."Elevation"='SWC' THEN 'C'
                WHEN AWD."Elevation"='EWD' OR AWD."Elevation"='SWD' THEN 'D'
                WHEN AWD."Elevation" IS NULL THEN 'N/A'
                WHEN AWD."Elevation" IS NOT NULL THEN AWD."Elevation"
            END as Elevation,
            AWD."BuildingId" as BuildingId 
        FROM
             "Accessories_WalkDoors" AWD
            inner join "BuildingInformation" B on B."BuildingInformationId" = AWD."BuildingId"
            WHERE AWD."IsDelete" = 'N' AND AWD."ProjectId" = ProjectId;
            
        ELSIF ( LOWER(AssessoryType) = 'wallpartitionliner' ) THEN    
        OPEN Output_Data FOR   
             SELECT
                AL."LinerId" as Id,
                'Liner' as Category,
                'Wall / Partition Liner' as AssessoryName,
                ("BuildingLabel" ||  '-' || "BuildingName") as Building,
                1 as Quantity,
                AL."Elevation" as Elevation,
                AL."BuildingNumber" as BuildingId 
            FROM
                "Accessories_Liners" AL
                inner join "BuildingInformation" B on B."BuildingInformationId" = AL."BuildingNumber"
                WHERE AL."IsDelete" = 'N' and (AL."Elevation" != 'R' or AL."Elevation" is null ) and B."ProjectId" = ProjectId;  
                
        ELSIF ( LOWER(AssessoryType) = 'liner' ) THEN    
        OPEN Output_Data FOR   
             SELECT
                AL."LinerId" as Id,
                'Liner' as Category,
                'Wall / Partition Liner' as AssessoryName,
                ("BuildingLabel" ||  '-' || "BuildingName") as Building,
                1 as Quantity,
                AL."Elevation" as Elevation,
                AL."BuildingNumber" as BuildingId 
            FROM
                "Accessories_Liners" AL
                inner join "BuildingInformation" B on B."BuildingInformationId" = AL."BuildingNumber"
                WHERE AL."IsDelete" = 'N'and (AL."Elevation" != 'R' or AL."Elevation" is null ) and B."ProjectId" = ProjectId  
        UNION        	
             SELECT	
                ALR."LinerId" as Id,	
                'Liner' as Category,	
                'Roof Liner' as AssessoryName,	
                ("BuildingLabel" ||  '-' || "BuildingName") as Building,	
                1 as Quantity,	
                'N/A' as Elevation,
                ALR."BuildingNumber" as BuildingId 	
            FROM	
                "Accessories_Liners" ALR	
                inner join "BuildingInformation" B on B."BuildingInformationId" = ALR."BuildingNumber"	
                WHERE ALR."IsDelete" = 'N'and ALR."Elevation" = 'R' and B."ProjectId" = ProjectId;
  ELSIF ( LOWER(AssessoryType) = 'cranes' ) 
    THEN
       OPEN Output_Data FOR 
         SELECT
           AC."CraneId" as Id,
            'Others' as Category,
            'Cranes' as AssessoryName,
            (B."BuildingLabel" ||  '-' || B."BuildingName") as Building,
            AC."Quantity" as Quantity,
            'N/A' as Elevation,
            AC."BuildingId" as BuildingId  
        FROM
             "Accessories_Cranes" AC
            inner join "BuildingInformation" B on B."BuildingInformationId" = AC."BuildingId"
            WHERE AC."IsDelete" = 'N' AND AC."ProjectId" = ProjectId;
         
    ELSIF ( LOWER(AssessoryType) = 'miscellaneousadds' ) 
    THEN
       OPEN Output_Data FOR 
         SELECT
           MA."AddLinesId" as Id,
            'Others' as Category,
            'Miscellaneous Adds' as AssessoryName,
            (B."BuildingLabel" ||  '-' || B."BuildingName") as Building,
            MA."Quantity" as Quantity,
            'N/A' as Elevation,
            MA."BuildingInformationId" as BuildingId  
        FROM
             "Input_AddLines" MA
            inner join "BuildingInformation" B on B."BuildingInformationId" = MA."BuildingInformationId"
            WHERE MA."IsDelete" != 'Y' AND MA."ProjectId" = ProjectId AND MA."ScreenType" = 'MiscellaneousAdds';
            
              
          --mezzanine start    
 ELSIF ( LOWER(AssessoryType) = 'mezzanines' ) 
    THEN
       OPEN Output_Data FOR 
         SELECT
           EM."MezzaninesId" as Id,
            'Others' as Category,
            'Mezzanines' as AssessoryName,
            (B."BuildingLabel" ||  '-' || B."BuildingName") as Building,
            1 as Quantity,
            'N/A' as Elevation,
            EM."BuildingNumber" as BuildingId  
        FROM
             "EDSPrice_IO_Mezzanines" EM
            inner join "BuildingInformation" B on B."BuildingInformationId" = EM."BuildingNumber"
            WHERE EM."IsDelete" = 'N' AND EM."ProjectId" = ProjectId; 
    
          -- mezzanine end  
                      
    ELSE
        OPEN Output_Data FOR 
         SELECT
             ARLTP."RoofLTPId" as Id,
            'Roof' as Category,
            'Roof LTPs' as AssessoryName,
            ("BuildingLabel" ||  '-' || "BuildingName") as Building,
            ARLTP."Qty" as Quantity,
            'N/A' as Elevation,
           ARLTP."BuildingNumber" as BuildingId             
        FROM
            "Accesories_RoofLTP" ARLTP
            inner join "BuildingInformation" B on B."BuildingInformationId" = ARLTP."BuildingNumber"
            WHERE ARLTP."IsDelete" = 'N' and ARLTP."ProjectId" = ProjectId
        UNION
            SELECT
            AWLTP."WallLTPId" as Id,
            Case when AWLTP."Elevation"='Partition' then 'Partition' else 'Wall' end as Category,
            Case when AWLTP."Elevation"='Partition' then 'Partition LTP' else 'Wall LTP' end as AssessoryName,
            ("BuildingLabel" ||  '-' || "BuildingName") as Building,
            AWLTP."Quantity" as Quantity,
            Case when AWLTP."Elevation"='Partition' then (AWLTP."Elevation" ||  ' ' || AWLTP."PartitionNumber") else AWLTP."Elevation" End as Elevation,
            AWLTP."BuildingInformationId" as BuildingId            
        FROM
            "Accesories_WallLTP" AWLTP
            inner join "BuildingInformation" B on B."BuildingInformationId" = AWLTP."BuildingInformationId"
            WHERE AWLTP."IsDelete" = 'N' and B."ProjectId" = ProjectId
        UNION
            SELECT
            APE."PurlinExtensionId" as Id,
            'Canopy/Purlin Extension' as Category,
            'Purlin Extension' as AssessoryName,
             ("BuildingLabel" ||  '-' || "BuildingName") as Building,
            1 as Quantity,
            'N/A' as Elevation,
            APE."BuildingNumber" as BuildingId
        FROM
            "Accesories_PurlinExtensions" APE
            inner join "BuildingInformation" B on B."BuildingInformationId" = APE."BuildingNumber"
            WHERE APE."IsDelete" = 'N' and APE."ProjectId" = ProjectId
        UNION
            SELECT
              ARPF."RubberPipeFlashId" as Id,
              'Roof' as Category,
              'Rubber Pipe Flash' as AssessoryName,
              ("BuildingLabel" ||  '-' || "BuildingName") as Building,
               ARPF."Quantity" as Quantity,
              'N/A' as Elevation,
              ARPF."BuildingId" as BuildingId
       FROM
           "Accessories_RubberPipeFlash" ARPF
           inner join "BuildingInformation" B on B."BuildingInformationId" = ARPF."BuildingId"
           WHERE ARPF."IsDelete" = 'N' and ARPF."ProjectId" = ProjectId
        UNION
           SELECT
           AC."AccessoriesCanopyId" as Id,
            'Canopy/Purlin Extension' as Category,
            'Canopy' as AssessoryName,
             ("BuildingLabel" ||  '-' || "BuildingName") as Building,
            1 as Quantity,
            CASE
                WHEN AC."Select_Elevation"='SWA' OR AC."Select_Elevation"='EWA' THEN 'A' 
                WHEN AC."Select_Elevation"='SWB' OR AC."Select_Elevation"='EWB' THEN 'B'
                WHEN AC."Select_Elevation"='SWC' OR AC."Select_Elevation"='EWC' THEN 'C'
                WHEN AC."Select_Elevation"='SWD' OR AC."Select_Elevation"='EWD' THEN 'D'
               
            END as Elevation,
            AC."BuildingNumber" as BuildingId
        FROM
            "Accessories_Canopy" AC
            inner join "BuildingInformation" B on B."BuildingInformationId" = AC."BuildingNumber"
            WHERE AC."IsDelete" = 'N' and AC."ProjectId" = ProjectId
        UNION
         SELECT
           AV."VentsId" as Id,
           'Roof' as Category,
           'Vents' as AssessoryName,
           ("BuildingLabel" ||  '-' || "BuildingName") as Building,
           AV."Quantity" as Quantity,
           CASE
                WHEN AV."Elevation"='R' THEN 'Roof Peak' 
                WHEN AV."Elevation"='E' AND B."Elevation"='S' THEN 'Roof A'
                WHEN AV."Elevation"='F' AND B."Elevation"='S' THEN 'Roof C'
                WHEN AV."Elevation"='E' AND B."Elevation"='E' THEN 'Roof D'
                WHEN AV."Elevation"='F' AND B."Elevation"='E' THEN 'Roof B'
            END as Elevation,
            AV."BuildingId" as BuildingId
         FROM
           "Accessories_Vents" AV
           inner join "BuildingInformation" B on B."BuildingInformationId" = AV."BuildingId"
           WHERE AV."IsDelete" = 'N' and AV."ProjectId" = ProjectId
        UNION
         SELECT
           AFO."FramedOpeningId" as Id,
            'Wall/Partition' as Category,
            'Framed Openings' as AssessoryName,
            ("BuildingLabel" ||  '-' || "BuildingName") as Building,
            AFO."Quantity" as Quantity,
            NVL(AFO."Elevation",'N/A') as Elevation,
            AFO."BuildingNumber" as BuildingId
        FROM
            "Accessories_FramedOpening" AFO
            inner join "BuildingInformation" B on B."BuildingInformationId" = AFO."BuildingNumber"
            WHERE AFO."IsDelete" = 'N' and AFO."ProjectId" = ProjectId
        UNION
          SELECT
            L."LouverId" as Id,
            'Wall/Partition' as Category,
            'Louvers' as AssessoryName,
            ("BuildingLabel" ||  '-' || "BuildingName") as Building,
            L."Quantity" as Quantity,
            NVL(L."Elevation",'N/A') as Elevation,
            L."BuildingId" as BuildingId
        FROM
            "Accessories_Louvers" L
            inner join "BuildingInformation" B on B."BuildingInformationId" = L."BuildingId"
            WHERE L."IsDelete" = 'N' AND L."ProjectId" = ProjectId
        UNION
        SELECT
            V."ValleyguttersId" as Id,
            'Trim' as Category,
            'Valley Gutters' as AssessoryName,
            ("BuildingLabel" ||  '-' || "BuildingName") as Building,
            V."Quantity" as Quantity,
            'N/A' as Elevation,
            V."BuildingInformationId" as BuildingId
        FROM
            "Accessories_Valleygutters" V
            inner join "BuildingInformation" B on B."BuildingInformationId" = V."BuildingInformationId"
            WHERE V."IsDelete" != 'Y' AND V."ProjectId" = ProjectId
        UNION
        SELECT
           OA."Id" as Id,
            'Open Areas' as Category,
            OA."OpeningType" as AssessoryName,
            (B."BuildingLabel" ||  '-' || B."BuildingName") as Building,
            1 as Quantity,
            CASE
                WHEN OA."Elevation"='EWA' OR OA."Elevation"='SWA' THEN 'A' 
                WHEN OA."Elevation"='EWB' OR OA."Elevation"='SWB' THEN 'B'
                WHEN OA."Elevation"='EWC' OR OA."Elevation"='SWC' THEN 'C'
                WHEN OA."Elevation"='EWD' OR OA."Elevation"='SWD' THEN 'D'
                ELSE OA."Elevation"
            END as Elevation,
            OA."BuildingNumber" as BuildingId
        FROM
            "OpenAreas" OA
            inner join "BuildingInformation" B on B."BuildingInformationId" = OA."BuildingNumber"
            WHERE OA."IsDeleted" = 'N' AND B."ProjectId" = ProjectId and OA."OpenEndwall" = 0
        UNION
        SELECT
               SB."SupportBeamsId" as Id,
               'Open Areas' as Category,
               'Support Beams' as AssessoryName,
               (B."BuildingLabel" ||  '-' || B."BuildingName") as Building,
                1 as Quantity,           
               SB."Elevation" as Elevation,
               SB."BuildingNumber" as BuildingId
        FROM
            "SupportBeams" SB
            inner join "BuildingInformation" B on B."BuildingInformationId" = SB."BuildingNumber"
            WHERE SB."IsDelete" = 'N' AND B."ProjectId" = ProjectId
        UNION
        SELECT
            AP."PartitionId" as Id,
            'Partitions' as Category,
            'Partitions' as AssessoryName,
            ("BuildingLabel" ||  '-' || "BuildingName") as Building,
            1 as Quantity,
            'N/A' as Elevation,
            AP."BuildingNumber" as BuildingId
        FROM
            "Accesories_Partition" AP
            inner join "BuildingInformation" B on B."BuildingInformationId" = AP."BuildingNumber"
            WHERE AP."IsDelete" = 'N' and AP."ProjectId" = ProjectId
       UNION
        SELECT
           AW."WindowId" as Id,
            'Wall/Partition' as Category,
            'Windows' as AssessoryName,
            (B."BuildingLabel" ||  '-' || B."BuildingName") as Building,
            AW."Quantity" as Quantity,
            NVL(AW."Elevation",'N/A') as Elevation,
            AW."BuildingNumber" as BuildingId
        FROM
            "Accesories_Windows" AW
            inner join "BuildingInformation" B on B."BuildingInformationId" = AW."BuildingNumber"
            WHERE AW."IsDelete" = 'N' AND AW."ProjectId" = ProjectId
        UNION
             SELECT
                AParapet."ParapetId" as Id,
                'Facade/Parapet Walls' as Category,
                'Parapet Walls' as AssessoryName,
                ("BuildingLabel" ||  '-' || "BuildingName") as Building,
                1 as Quantity,
                NVL(AParapet."Elevation",'N/A') as Elevation,
                 AParapet."BuildingInformationId" as BuildingId
            FROM
                "Accessories_Parapet" AParapet
                inner join "BuildingInformation" B on B."BuildingInformationId" = AParapet."BuildingInformationId"
                WHERE AParapet."IsDelete" = 'N' and B."ProjectId" = ProjectId
        UNION
            SELECT
                AFacade."FacadeId" as Id,
                'Facade/Parapet Walls' as Category,
                'Facade' as AssessoryName,
                ("BuildingLabel" ||  '-' || "BuildingName") as Building,
                1 as Quantity,
                NVL(AFacade."Elevation",'N/A') as Elevation,
                AFacade."BuildingInformationId" as BuildingId
            FROM
                "Accessories_Facade" AFacade
                inner join "BuildingInformation" B on B."BuildingInformationId" = AFacade."BuildingInformationId"
                WHERE AFacade."IsDelete" = 'N' and B."ProjectId" = ProjectId
         UNION
           SELECT
            T."TopMountedSlideDoorId" as Id,
            'Wall/Partition' as Category,
            'Top-Mounted Slide Doors' as AssessoryName,
            (B."BuildingLabel" ||  '-' ||B."BuildingName") as Building,
            T."Quantity" as Quantity,
            NVL(T."Elevation",'N/A') as Elevation,
            T."BuildingNumber" as BuildingId
            FROM
            "Accesories_TopMountedSlideDoor" T
            inner join "BuildingInformation" B on B."BuildingInformationId" = T."BuildingNumber"
            WHERE T."IsDelete" = 'N' and T."ProjectId" = ProjectId
        UNION
           SELECT
           AWD."WalkDoorId" as Id,
            'Wall/Partition' as Category,
            'Walk Doors' as AssessoryName,
            (B."BuildingLabel" ||  '-' || B."BuildingName") as Building,
            AWD."Quantity" as Quantity,
            NVL(AWD."Elevation",'N/A') as Elevation,
            AWD."BuildingId" as BuildingId
        FROM
            "Accessories_WalkDoors" AWD
            inner join "BuildingInformation" B on B."BuildingInformationId" = AWD."BuildingId"
            WHERE AWD."IsDelete" = 'N' AND AWD."ProjectId" = ProjectId           
       UNION
             SELECT
                AL."LinerId" as Id,
                'Liner' as Category,
                'Wall / Partition Liner' as AssessoryName,
                ("BuildingLabel" ||  '-' || "BuildingName") as Building,
                1 as Quantity,
                AL."Elevation" as Elevation,
               AL."BuildingNumber"  as BuildingId
            FROM
                "Accessories_Liners" AL
                inner join "BuildingInformation" B on B."BuildingInformationId" = AL."BuildingNumber"
                WHERE AL."IsDelete" = 'N' and (AL."Elevation" != 'R' or AL."Elevation" is null ) and B."ProjectId" = ProjectId
      UNION        	
           SELECT	
                ALR."LinerId" as Id,	
                'Liner' as Category,	
                'Roof Liner' as AssessoryName,	
                ("BuildingLabel" ||  '-' || "BuildingName") as Building,	
                1 as Quantity,	
                'N/A' as Elevation,
                 ALR."BuildingNumber"as BuildingId
            FROM	
                "Accessories_Liners" ALR	
                inner join "BuildingInformation" B on B."BuildingInformationId" = ALR."BuildingNumber"	
                WHERE ALR."IsDelete" = 'N'and ALR."Elevation" = 'R' and B."ProjectId" = ProjectId   
       UNION
               SELECT
                    WNCT."WainscotId" as Id,
                    'Wall/Partition' as Category,
                    'Wainscot' as AssessoryName,
                    ("BuildingLabel" ||  '-' || "BuildingName") as Building,
                    WNCT."Qty" as Quantity,
                    WNCT."Elevation" as Elevation,
                     WNCT."BuildingInformationId" as BuildingId
                FROM                      
                    "Accesories_Wainscot" WNCT
                    inner join "BuildingInformation" B on B."BuildingInformationId" = WNCT."BuildingInformationId"
                    WHERE WNCT."IsDelete" = 'N' and WNCT."ProjectId" = ProjectId
        UNION
                 SELECT
                    D."DbciDoorId" as Id,
                    'Wall/Partition' as Category,
                    'DBCI Doors' as AssessoryName,
                    ("BuildingLabel" ||  '-' || "BuildingName") as Building,
                    D."Quantity" as Quantity,
                    NVL(D."Elevation",'N/A') as Elevation,
                    D."BuildingId" as BuildingId
                FROM
                    "Accessories_DBCIDoor" D
                    inner join "BuildingInformation" B on B."BuildingInformationId" = D."BuildingId"
                    WHERE D."IsDelete" = 'N' AND D."ProjectId" = ProjectId 
        UNION
                SELECT
                   AC."CraneId" as Id,
                    'Others' as Category,
                    'Cranes' as AssessoryName,
                    (B."BuildingLabel" ||  '-' || B."BuildingName") as Building,
                    AC."Quantity" as Quantity,
                    'N/A' as Elevation,
                    AC."BuildingId" as BuildingId  
                FROM
                     "Accessories_Cranes" AC
                    inner join "BuildingInformation" B on B."BuildingInformationId" = AC."BuildingId"
                    WHERE AC."IsDelete" = 'N' AND AC."ProjectId" = ProjectId
                    
        UNION
                SELECT
                   MA."AddLinesId" as Id,
                    'Others' as Category,
                    'Miscellaneous Adds' as AssessoryName,
                    (B."BuildingLabel" ||  '-' || B."BuildingName") as Building,
                    MA."Quantity" as Quantity,
                    'N/A' as Elevation,
                    MA."BuildingInformationId" as BuildingId  
                FROM
                     "Input_AddLines" MA
                    inner join "BuildingInformation" B on B."BuildingInformationId" = MA."BuildingInformationId"
                    WHERE MA."IsDelete" != 'Y' AND MA."ProjectId" = ProjectId AND MA."ScreenType" = 'MiscellaneousAdds'
     UNION
                SELECT
                   EM."MezzaninesId" as Id,
                    'Others' as Category,
                    'Mezzanines' as AssessoryName,
                    (B."BuildingLabel" ||  '-' || B."BuildingName") as Building,
                    1 as Quantity,
                    'N/A' as Elevation,
                    EM."BuildingNumber" as BuildingId  
                FROM
                     "EDSPrice_IO_Mezzanines" EM
                    inner join "BuildingInformation" B on B."BuildingInformationId" = EM."BuildingNumber"
                    WHERE EM."IsDelete" = 'N' AND EM."ProjectId" = ProjectId;
           
        END IF;
    
END ACCESSORY_LIST;
/