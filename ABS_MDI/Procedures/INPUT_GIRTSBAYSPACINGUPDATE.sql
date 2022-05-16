CREATE OR REPLACE PROCEDURE abs_mdi."INPUT_GIRTSBAYSPACINGUPDATE" (
BuildingInformationId In Number,
GrayPrimer In Number,
OptimizeGirt1 In Number,
OptimizeGirt2 In Number,
PortalColumnDepth1 In Number,
PortalColumnDepth2  In Number,
FrameBoltWashers In Number,
LBPMinDepth In Number,
PurlinSpacing  In VARCHAR2,
LBPMaxDepth In Number,
GirtWidth2 In Number,
PortalRafterDepth2 In Number,
PortalRafterDepth1 In Number,
--SW2Depth  In Number,
SW2Depth_  In VARCHAR2,
LBPBracingLoc  In VARCHAR2,
OptimizePurlin In Number,
GirtSpacingId In Number,
--RoofPurlinDepth In Number,
RoofPurlinDepth_ In VARCHAR2,
GirtWidth1 In Number,
PurlinWidth In Number,
--SW1Depth In Number,
SW1Depth_ In VARCHAR2
) AS
     SW1D number;
     SW2D number;
     RoofPurl number;
     Idd number;
BEGIN
    select "DepthId" INTO SW1D  from "GirtsAndPurlinDepth" where "DepthName"=SW1Depth_ and rownum = 1;
    select "DepthId" INTO SW2D from "GirtsAndPurlinDepth" where "DepthName"=SW2Depth_ and rownum = 1;
    select "DepthId" INTO RoofPurl from "GirtsAndPurlinDepth" where "DepthName"=RoofPurlinDepth_ and rownum = 1;
    select "GirtSpacingId" INTO Idd  from "Input_GirtsBaySpacing" where "BuildingInformationId"=BuildingInformationId;
    UPDATE "Input_GirtsBaySpacing"
    SET
    "BuildingInformationId"=BuildingInformationId
    ,"GrayPrimer"=GrayPrimer
    ,"OptimizeGirt1"=OptimizeGirt1
    ,"OptimizeGirt2"=OptimizeGirt2
    ,"PortalColumnDepth1"=PortalColumnDepth1
    ,"PortalColumnDepth2"=PortalColumnDepth2
    ,"FrameBoltWashers"=FrameBoltWashers
    ,"LBPMinDepth"=LBPMinDepth
    ,"PurlinSpacing"=PurlinSpacing
    ,"LBPMaxDepth"=LBPMaxDepth
    ,"GirtWidth2"=GirtWidth2
    ,"PortalRafterDepth2"=PortalRafterDepth2
    ,"PortalRafterDepth1"=PortalRafterDepth1
    ,"SW2Depth"=SW2D
    --,"SW2Depth_"=SW2Depth_
    ,"LBPBracingLoc"=LBPBracingLoc
    ,"OptimizePurlin"=OptimizePurlin
    ,"GirtSpacingId"=GirtSpacingId
    ,"RoofPurlinDepth"=RoofPurl
    --,"RoofPurlinDepth_"=RoofPurlinDepth_
    ,"GirtWidth1"=GirtWidth1
    ,"PurlinWidth"=PurlinWidth
    ,"SW1Depth"=SW1D
    --,"SW1Depth_"=SW1Depth_
    WHERE
        GirtSpacingId = Idd;
END Input_GirtsBaySpacingUpdate;
/