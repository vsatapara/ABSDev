CREATE OR REPLACE PROCEDURE abs_mdi."INFOGEO_LIST" (
    ProjectId IN NUMBER ,   
    BuildingId IN NUMBER ,   
    Output_Data OUT SYS_REFCURSOR,
    OutputParapete_Data OUT SYS_REFCURSOR,
    OutputCanopy_Data OUT SYS_REFCURSOR,
    OutputFacade_Data OUT SYS_REFCURSOR,
    OutputDownspout_Data OUT SYS_REFCURSOR
    )
AS
BEGIN
   
    OPEN Output_Data FOR
        select
          DISTINCT(bi."BuildingInformationId"),
          NVL("Structure",'0') as "Structure",
          bi."ParentBuildingId",
          bi."Elevation",
          NVL("AttachmentElevation",'') as "AttachmentElevation",
          bi."FrameType",
          "BuildingWidth",
          "BuildingLength",
          case when ( "Category" = 'SymmetricalEndWall' OR "Category" = 'NonSymmetricalEndWall' ) THEN "EaveHeightSideWallB"
            when ( "Category" = 'SymmetricalSideWall' OR "Category" = 'NonSymmetricalSideWall' ) THEN "EaveHeightSideWallA"
            when ( "Category" = 'SingleSlopeEndWallB' OR "Category" = 'LeanToB' ) THEN "EaveHeightSideWallB"
            when ( "Category" = 'SingleSlopeSideWallC' OR "Category" = 'LeanToC' ) THEN "EaveHeightSideWallA"  
            when ( "Category" = 'SingleSlopeSideWallA' OR "Category" = 'LeanToA' ) THEN "EaveHeightSideWallA" 
            when ( "Category" = 'SingleSlopeEndWallD' OR "Category" = 'LeanToD' ) THEN "EaveHeightSideWallB" end AS "EaveHeightSideWallOne",
            
          case when ( "Category" = 'SymmetricalEndWall' OR "Category" = 'NonSymmetricalEndWall' ) THEN "EaveHeightSideWallD"
            when ( "Category" = 'SymmetricalSideWall' OR "Category" = 'NonSymmetricalSideWall' ) THEN "EaveHeightSideWallC"
            when ( "Category" = 'SingleSlopeEndWallB' OR "Category" = 'LeanToB' ) THEN "EaveHeightSideWallD"
            when ( "Category" = 'SingleSlopeSideWallC' OR "Category" = 'LeanToC' ) THEN "EaveHeightSideWallC"  
            when ( "Category" = 'SingleSlopeSideWallA' OR "Category" = 'LeanToA' ) THEN "EaveHeightSideWallC" 
            when ( "Category" = 'SingleSlopeEndWallD' OR "Category" = 'LeanToD' ) THEN "EaveHeightSideWallD" end AS "EaveHeightSideWallTwo",
          
          case when ( "Category" = 'SymmetricalEndWall' OR "Category" = 'NonSymmetricalEndWall' ) THEN "RoofSlopeSideWallB"
            when ( "Category" = 'SymmetricalSideWall' OR "Category" = 'NonSymmetricalSideWall' ) THEN "RoofSlopeSideWallA"
            when ( "Category" = 'SingleSlopeEndWallB' OR "Category" = 'LeanToB' ) THEN "RoofSlopeSideWallB"
            when ( "Category" = 'SingleSlopeSideWallC' OR "Category" = 'LeanToC' ) THEN "RoofSlopeSideWallA"  
            when ( "Category" = 'SingleSlopeSideWallA' OR "Category" = 'LeanToA' ) THEN "RoofSlopeSideWallA" 
            when ( "Category" = 'SingleSlopeEndWallD' OR "Category" = 'LeanToD' ) THEN "RoofSlopeSideWallB" end AS "RoofSlopeSideWallOne",
                    
          case when ( "Category" = 'SymmetricalEndWall' OR "Category" = 'NonSymmetricalEndWall' ) THEN "RoofSlopeSideWallD"
            when ( "Category" = 'SymmetricalSideWall' OR "Category" = 'NonSymmetricalSideWall' ) THEN "RoofSlopeSideWallC"
            when ( "Category" = 'SingleSlopeEndWallB' OR "Category" = 'LeanToB' ) THEN "RoofSlopeSideWallD"
            when ( "Category" = 'SingleSlopeSideWallC' OR "Category" = 'LeanToC' ) THEN "RoofSlopeSideWallC"  
            when ( "Category" = 'SingleSlopeSideWallA' OR "Category" = 'LeanToA' ) THEN "RoofSlopeSideWallC" 
            when ( "Category" = 'SingleSlopeEndWallD' OR "Category" = 'LeanToD' ) THEN "RoofSlopeSideWallD" end AS "RoofSlopeSideWallTwo",
          "AttachmentOffset",
          "PeakHeight",
               
          case when ( "Category" = 'SymmetricalEndWall' OR "Category" = 'NonSymmetricalEndWall' ) THEN "DistanceToRidgeSideWallB"
            when ( "Category" = 'SymmetricalSideWall' OR "Category" = 'NonSymmetricalSideWall' ) THEN "DistanceToRidgeSideWallA"
            when ( "Category" = 'SingleSlopeEndWallB' OR "Category" = 'LeanToB' ) THEN "DistanceToRidgeSideWallB"
            when ( "Category" = 'SingleSlopeSideWallC' OR "Category" = 'LeanToC' ) THEN "DistanceToRidgeSideWallA"  
            when ( "Category" = 'SingleSlopeSideWallA' OR "Category" = 'LeanToA' ) THEN "DistanceToRidgeSideWallA" 
            when ( "Category" = 'SingleSlopeEndWallD' OR "Category" = 'LeanToD' ) THEN "DistanceToRidgeSideWallB" end AS "DistanceToRidgeSideWallOne",
          
          case when ( "Category" = 'SymmetricalEndWall' OR "Category" = 'NonSymmetricalEndWall' ) THEN "DistanceToRidgeSideWallD"
            when ( "Category" = 'SymmetricalSideWall' OR "Category" = 'NonSymmetricalSideWall' ) THEN "DistanceToRidgeSideWallC"
            when ( "Category" = 'SingleSlopeEndWallB' OR "Category" = 'LeanToB' ) THEN "DistanceToRidgeSideWallD"
            when ( "Category" = 'SingleSlopeSideWallC' OR "Category" = 'LeanToC' ) THEN "DistanceToRidgeSideWallC"  
            when ( "Category" = 'SingleSlopeSideWallA' OR "Category" = 'LeanToA' ) THEN "DistanceToRidgeSideWallC" 
            when ( "Category" = 'SingleSlopeEndWallD' OR "Category" = 'LeanToD' ) THEN "DistanceToRidgeSideWallD" end  AS "DistanceToRidgeSideWallTwo",
          gi."XCoordinate",
          gi."YCoordinate"
     from "GeometryInformation" gi , 
     "BuildingInformation" bi
     where bi."ProjectId" = ProjectId and bi."IsDelete" != 'Y'
     and bi."BuildingInformationId" = gi."BuildingInformationId"
     order by bi."BuildingInformationId" ASC;
 OPEN OutputParapete_Data FOR
        select "BuildingInformationId", "Elevation", "StartColumn", "StopColumn"
        from "Accessories_Parapet"
        where "ProjectId" = ProjectId and "IsDelete" != 'Y' and "BuildingInformationId" = BuildingId;
        
 OPEN OutputFacade_Data FOR
       select "BuildingInformationId", "Elevation", "StartCol", "StopCol", MPT."Type" as "Type", "Gutter",  MPT2."TypeName" as "SoffitPanelType"
        from "Accessories_Facade" AF
         JOIN "M_PanelType" MPT on MPT."Id" = AF."Type" and MPT."FacadePanel" =1
        JOIN "M_Facade_Type" MPT2 on MPT2."Id" = AF."SoffitPanelType" 
        where "ProjectId" = ProjectId and "IsDelete" != 'Y' and "BuildingInformationId" = BuildingId;
        
 OPEN OutputCanopy_Data FOR
        select "AccessoriesCanopyId", "IncludeElbow", "Panel","Gutter", "GutterType", "GutterSize", "Length","Slope","CanopyType", "Select_Elevation",Case when "AtEave" = 'Y' then 1 else 0 End as "AtEave","BuildingNumber", "StartColumn", "StopColumn",Case when "ReturnDownspouts" = 'Y' then 1 else 0 End as "ReturnDownspouts", "Projection"
        from "Accessories_Canopy"
        where "ProjectId" = ProjectId and "IsDelete" != 'Y' and "BuildingNumber" = BuildingId;
    
 OPEN OutputDownspout_Data FOR
        select "Elevation" as "elevation", "BayNumber" as "bay_number", "DistFromLeftCorner" as "dist_from_left_corner", "BuildingNumber" as "building_number"
        from "EDSPrice_IO_Gutters"
        where "ProjectId" = ProjectId and "IsDeleted" != 'Y' and "BuildingNumber" = BuildingId;
        
 END ;
/