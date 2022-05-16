CREATE OR REPLACE PROCEDURE abs_mdi."DEFLECTION_UPDATE" 
(
    DeflectionId IN NUMBER,
    ProjectId IN NUMBER,
    BuildingNumber IN NUMBER,
    PurlinsLive IN NUMBER,
    PurlinsSnow IN NUMBER,
    PurlinsWind IN NUMBER,
    PurlinsGravity IN NUMBER,
    PurlinsUplift IN NUMBER,
    RaftersLive IN NUMBER,
    RaftersSnow IN NUMBER,
    RaftersWind IN NUMBER,
    RaftersGravity IN NUMBER,
    RaftersUplift IN NUMBER,
    WallGirts IN NUMBER,
    WallCol IN NUMBER,
    WallWind IN NUMBER,
    RoofLive IN NUMBER,
    RoofSnow IN NUMBER,
    RoofWind IN NUMBER,
    RoofGravity IN NUMBER,
    RoofUplift IN NUMBER,
    FrameLive IN NUMBER,
    FrameSnow IN NUMBER,
    FrameWind IN NUMBER,
    FrameSeismic IN NUMBER,
    FrameCrane IN NUMBER,
    FrameTotalWind IN NUMBER,
    FrameTotalSeismic IN NUMBER,
    FrameTotalGravity IN NUMBER,
    FramePortalWind IN NUMBER,
    FramePortalSeismic IN NUMBER,
    SuspendedCeiling IN NUMBER,
    FaceBrickWall IN NUMBER,
    DryvitFinish IN NUMBER,
    PurlinsLiveFlag IN NUMBER,
    PurlinsSnowFlag IN NUMBER,
    PurlinsWindFlag IN NUMBER,
    PurlinsGravityFlag IN NUMBER,
    PurlinsUpliftFlag IN NUMBER,
    RaftersLiveFlag IN NUMBER,
    RaftersSnowFlag IN NUMBER,
    RaftersWindFlag IN NUMBER,
    RaftersGravityFlag IN NUMBER,
    RaftersUpliftFlag IN NUMBER,
    WallGirtsFlag IN NUMBER,
    WallColFlag IN NUMBER,
    WallWindFlag IN NUMBER,
    RoofLiveFlag IN NUMBER,
    RoofSnowFlag IN NUMBER,
    RoofWindFlag IN NUMBER,
    RoofGravityFlag IN NUMBER,
    RoofUpliftFlag IN NUMBER,
    FrameLiveFlag IN NUMBER,
    FrameSnowFlag IN NUMBER,
    FrameWindFlag IN NUMBER,
    FrameSeismicFlag IN NUMBER,
    FrameCraneFlag IN NUMBER,
    FrameTotalWindFlag IN NUMBER,
    FrameTotalSeismicFlag IN NUMBER,
    FrameTotalGravityFlag IN NUMBER,
    FramePortalWindFlag IN NUMBER,
    FramePortalSeismicFlag IN NUMBER,
    RoofPanelLive IN NUMBER,
    RoofPanelSnow IN NUMBER,
    RoofPanelWind IN NUMBER,
    RoofPanelGravity IN NUMBER,
    RoofPanelUplift IN NUMBER,
    WallPanel IN NUMBER,
    RoofPanelLiveFlag IN NUMBER,
    RoofPanelSnowFlag IN NUMBER,
    RoofPanelWindFlag IN NUMBER,
    RoofPanelGravityFlag IN NUMBER,
    RoofPanelUpliftFlag IN NUMBER,
    WallPanelFlag IN NUMBER,
    UserAccept IN NUMBER,
    AdvFrames IN NUMBER,
    AdvPurlins IN NUMBER,
    AdvRafters IN NUMBER,
    TempInteger1 IN NUMBER,
    TempInteger2 IN NUMBER,
    TempInteger3 IN NUMBER,
    TempDouble1 IN NUMBER,
    TempDouble2 IN NUMBER,
    TempDouble3 IN NUMBER,
    TempString1 IN VARCHAR2,
    TempString2 IN VARCHAR2,
    TempString3 IN VARCHAR2,
    ModifiedBy IN NUMBER,
    IpAddress IN VARCHAR2
) AS 
BEGIN
  UPDATE "Deflections" SET
     "PurlinsLive" = PurlinsLive
    , "PurlinsSnow" = PurlinsSnow
    , "PurlinsWind" = PurlinsWind
    , "PurlinsGravity" = PurlinsGravity
    , "PurlinsUplift" = PurlinsUplift
    , "RaftersLive" = RaftersLive
    , "RaftersSnow" = RaftersSnow
    , "RaftersWind" = RaftersWind
    , "RaftersGravity" = RaftersGravity
    , "RaftersUplift" = RaftersUplift
    , "WallGirts" = WallGirts
    , "WallCol" = WallCol
    , "WallWind" = WallWind
    , "RoofLive" = RoofLive
    , "RoofSnow" = RoofSnow
    , "RoofWind" = RoofWind
    , "RoofGravity" = RoofGravity
    , "RoofUplift" = RoofUplift
    , "FrameLive" = FrameLive
    , "FrameSnow" = FrameSnow
    , "FrameWind" = FrameWind
    , "FrameSeismic" = FrameSeismic
    , "FrameCrane" = FrameCrane
    , "FrameTotalWind" = FrameTotalWind
    , "FrameTotalSeismic" = FrameTotalSeismic
    , "FrameTotalGravity" = FrameTotalGravity
    , "FramePortalWind" = FramePortalWind
    , "FramePortalSeismic" = FramePortalSeismic
    , "SuspendedCeiling" =SuspendedCeiling
    , "FaceBrickWall" = FaceBrickWall
    , "DryvitFinish" = DryvitFinish
    , "PurlinsLiveFlag" = PurlinsLiveFlag
    , "PurlinsSnowFlag" = PurlinsSnowFlag
    , "PurlinsWindFlag" = PurlinsWindFlag
    , "PurlinsGravityFlag" = PurlinsGravityFlag
    , "PurlinsUpliftFlag" = PurlinsUpliftFlag
    , "RaftersLiveFlag" = RaftersLiveFlag
    , "RaftersSnowFlag" = RaftersSnowFlag
    , "RaftersWindFlag" = RaftersWindFlag
    , "RaftersGravityFlag" = RaftersGravityFlag
    , "RaftersUpliftFlag" = RaftersUpliftFlag
    , "WallGirtsFlag" = WallGirtsFlag
    , "WallColFlag" = WallColFlag
    , "WallWindFlag" = WallWindFlag
    , "RoofLiveFlag" = RoofLiveFlag
    , "RoofSnowFlag" = RoofSnowFlag
    , "RoofWindFlag" = RoofWindFlag
    , "RoofGravityFlag" = RoofGravityFlag
    , "RoofUpliftFlag" = RoofUpliftFlag
    , "FrameLiveFlag" = FrameLiveFlag
    , "FrameSnowFlag" = FrameSnowFlag
    , "FrameWindFlag" = FrameWindFlag
    , "FrameSeismicFlag" = FrameSeismicFlag
    , "FrameCraneFlag" = FrameCraneFlag
    , "FrameTotalWindFlag" = FrameTotalWindFlag
    , "FrameTotalSeismicFlag" = FrameTotalSeismicFlag
    , "FrameTotalGravityFlag" = FrameTotalGravityFlag
    , "FramePortalWindFlag" = FramePortalWindFlag
    , "FramePortalSeismicFlag" = FramePortalSeismicFlag
    , "RoofPanelLive" = RoofPanelLive
    , "RoofPanelSnow" = RoofPanelSnow
    , "RoofPanelWind" = RoofPanelWind
    , "RoofPanelGravity" = RoofPanelGravity
    , "RoofPanelUplift" = RoofPanelUplift
    , "WallPanel" = WallPanel
    , "RoofPanelLiveFlag" = RoofPanelLiveFlag
    , "RoofPanelSnowFlag" = RoofPanelSnowFlag
    , "RoofPanelWindFlag" = RoofPanelWindFlag
    , "RoofPanelGravityFlag" = RoofPanelGravityFlag
    , "RoofPanelUpliftFlag" = RoofPanelUpliftFlag
    , "WallPanelFlag" = WallPanelFlag
    , "UserAccept" = UserAccept
    , "AdvFrames" = AdvFrames
    , "AdvPurlins" = AdvPurlins
    , "AdvRafters" = AdvRafters
    , "TempInteger1" = TempInteger1
    , "TempInteger2" = TempInteger2
    , "TempInteger3" = TempInteger3
    , "TempDouble1" = TempDouble1
    , "TempDouble2" = TempDouble2
    , "TempDouble3" = TempDouble3
    , "TempString1" = TempString1
    , "TempString2" = TempString2
    , "TempString3" = TempString3
    , "ModifiedBy" = ModifiedBy
    , "ModifiedDate" = CURRENT_TIMESTAMP
    , "IpAddress" = IpAddress
	WHERE "ProjectId" = ProjectId AND "BuildingNumber" = BuildingNumber;
END DEFLECTION_UPDATE;
/