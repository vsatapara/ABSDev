CREATE OR REPLACE PROCEDURE abs_mdi."ROOFTCSELECT" 
(
    ProjectId in number,
    AssessoryType in varchar2,
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
    IF ( LOWER(AssessoryType) = 'roofltps' ) THEN
       OPEN Output_Data FOR 
        SELECT
        ARLTP."RoofLTPId" as Id,
        'Roof' as Category,
        'Roof LTPs' as AssessoryName,
        ("BuildingLabel" ||  '-' || "BuildingName") as Building,
        ARLTP."Qty" as Quantity,
        'N/A' as Elevation
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
            (B."BuildingLabel" ||  '-' ||B."BuildingName") as Building,
            ARPF."Quantity" as Quantity,
        'N/A' as Elevation
        FROM
            "Accessories_RubberPipeFlash" ARPF
            inner join "BuildingInformation" B on B."BuildingInformationId" = ARPF."BuildingId"
            WHERE ARPF."IsDelete" = 'N' and ARPF."ProjectId" = ProjectId;
            
    ELSIF ( LOWER(AssessoryType) = 'purlinextensions' ) THEN
       OPEN Output_Data FOR 
        SELECT
            APE."PurlinExtensionId" as Id,
            'Canopy/Purlin Extension' as Category,
            'Purlin Extension' as AssessoryName,
            (B."BuildingLabel" ||  '-' ||B."BuildingName") as Building,
            1 as Quantity,
            APE."Elevation" as Elevation
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
            0 as Quantity,
            'N/A' as Elevation
        FROM
            "Accessories_Canopy" AC
            inner join "BuildingInformation" B on B."BuildingInformationId" = AC."BuildingNumber"
            WHERE AC."IsDelete" = 'N';
    ELSIF ( LOWER(AssessoryType) = 'louvers' ) THEN
       OPEN Output_Data FOR 
         SELECT
            L."LouverId" as Id,
            'Wall/Partition' as Category,
            'Louvers' as AssessoryName,
            ("BuildingLabel" ||  '-' || "BuildingName") as Building,
            L."Quantity" as Quantity,
            L."Elevation" as Elevation
        FROM
            "Accessories_Louvers" L
            inner join "BuildingInformation" B on B."BuildingInformationId" = L."BuildingId"
            WHERE L."IsDelete" = 'N' AND L."ProjectId" = ProjectId;
     ELSIF ( LOWER(AssessoryType) = 'partitions' ) THEN
       OPEN Output_Data FOR 
        SELECT
        AP."PartitionId" as Id,
        'Partitions' as Category,
        'Partitions' as AssessoryName,
        ("BuildingLabel" ||  '-' || "BuildingName") as Building,
        0 as Quantity,
        'N/A' as Elevation
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
            END as Elevation
        FROM
            "OpenAreas" OA
            inner join "BuildingInformation" B on B."BuildingInformationId" = OA."BuildingNumber"
            WHERE OA."IsDeleted" = 'N' AND B."ProjectId" = ProjectId;
    ELSIF ( LOWER(AssessoryType) = 'fullheight' OR  LOWER(AssessoryType) = 'partialheight' OR LOWER(AssessoryType) = 'attachmentheight' OR LOWER(AssessoryType) = 'supportbeams') 
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
            END as Elevation
        FROM
            "OpenAreas" OA
        inner join "BuildingInformation" B on B."BuildingInformationId" = OA."BuildingNumber"
        WHERE OA."IsDeleted" = 'N' AND B."ProjectId" = ProjectId 
        AND 
        OA."OpeningType"= 
        CASE 
            WHEN LOWER(AssessoryType) = 'fullheight' THEN 'Full Height'
            WHEN LOWER(AssessoryType) = 'partialheight' THEN 'Partial Height' 
            WHEN LOWER(AssessoryType) = 'attachmentheight' THEN 'Attachment Height' 
            WHEN LOWER(AssessoryType) = 'supportbeams' THEN 'Support Beams' 
        END;
    ELSIF ( LOWER(AssessoryType) = 'wallpartitionltps' ) THEN
       OPEN Output_Data FOR  SELECT
        AWLTP."WallLTPId" as Id,
        'Wall' as Category,
        'Wall / Partition LTPs' as AssessoryName,
        ("BuildingLabel" ||  '-' || "BuildingName") as Building,
        AWLTP."Quantity" as Quantity,
        AWLTP."Elevation" as Elevation
    FROM
        "Accesories_WallLTP" AWLTP
        inner join "BuildingInformation" B on B."BuildingInformationId" = AWLTP."BuildingInformationId"
        WHERE AWLTP."IsDelete" = 'N' and B."ProjectId" = ProjectId;
    ELSE
        OPEN Output_Data FOR 
         SELECT
             ARLTP."RoofLTPId" as Id,
            'Roof' as Category,
            'Roof LTPs' as AssessoryName,
            ("BuildingLabel" ||  '-' || "BuildingName") as Building,
            ARLTP."Qty" as Quantity,
            'N/A' as Elevation
        FROM
            "Accesories_RoofLTP" ARLTP
            inner join "BuildingInformation" B on B."BuildingInformationId" = ARLTP."BuildingNumber"
            WHERE ARLTP."IsDelete" = 'N' and ARLTP."ProjectId" = ProjectId
        UNION
         SELECT
            APE."PurlinExtensionId" as Id,
            'Canopy/Purlin Extension' as Category,
            'Purlin Extension' as AssessoryName,
             ("BuildingLabel" ||  '-' || "BuildingName") as Building,
            0 as Quantity,
            'N/A' as Elevation
        FROM
            "Accesories_PurlinExtensions" APE
            inner join "BuildingInformation" B on B."BuildingInformationId" = APE."BuildingNumber"
            WHERE APE."IsDelete" = 'N' and APE."ProjectId" = ProjectId
        UNION
         SELECT
           AC."AccessoriesCanopyId" as Id,
            'Canopy/Purlin Extension' as Category,
            'Canopy' as AssessoryName,
             ("BuildingLabel" ||  '-' || "BuildingName") as Building,
            0 as Quantity,
            'N/A' as Elevation
        FROM
            "Accessories_Canopy" AC
            inner join "BuildingInformation" B on B."BuildingInformationId" = AC."BuildingNumber"
            WHERE AC."IsDelete" = 'N'
        UNION
          SELECT
            L."LouverId" as Id,
            'Wall/Partition' as Category,
            'Louvers' as AssessoryName,
            ("BuildingLabel" ||  '-' || "BuildingName") as Building,
            L."Quantity" as Quantity,
            L."Elevation" as Elevation
        FROM
            "Accessories_Louvers" L
            inner join "BuildingInformation" B on B."BuildingInformationId" = L."BuildingId"
            WHERE L."IsDelete" = 'N' AND L."ProjectId" = ProjectId
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
            END as Elevation
        FROM
            "OpenAreas" OA
            inner join "BuildingInformation" B on B."BuildingInformationId" = OA."BuildingNumber"
            WHERE OA."IsDeleted" = 'N' AND B."ProjectId" = ProjectId;
    END IF;
END ROOFTCSELECT;
/