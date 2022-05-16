CREATE OR REPLACE PROCEDURE abs_mdi."LOADS_UPDATE" (
    ProjectId           IN   NUMBER,
    BuildingNumber      IN   NUMBER,
    WindEnclosure       IN   VARCHAR2,
    AccessoryEnclosure  IN   VARCHAR2,
    OAEnclosure         IN   VARCHAR2,
    Occupancy           IN   VARCHAR2,
    ThermalFactor       IN   VARCHAR2,
    WindLoad            IN   NUMBER,
    BelowWindMin        IN   NUMBER,
    DeflectionWindSpeed IN   NUMBER,
    UnobstructedFlow    IN   NUMBER,
    FrameLive           IN  NUMBER,
    FrameSnow           IN  NUMBER,
    FrameWind           IN  NUMBER,
    FrameSeismic        IN  NUMBER,
    FrameCrane          IN  NUMBER,
    FrameTotalWind      IN  NUMBER,
    FrameTotalSeismic   IN  NUMBER,
    FrameTotalGravity   IN  NUMBER,
    FramePortalWind     IN  NUMBER,
    FramePortalSeismic  IN  NUMBER,
    EscarpmentId        IN   NUMBER,
    HillHeight          IN   NUMBER,  
    Lh                  IN   NUMBER,  
    CrestDistance       IN   NUMBER,  
    CrestUpwind         IN   NUMBER,  
    FlatUpwindTerrain   IN   NUMBER,  
    HillTallerBy2       IN   NUMBER,  
    UpperHalfOfHill     IN   NUMBER,  
    RidgeOfHill         IN   NUMBER,  
    TempString1         IN   VARCHAR2,  
    TempString2         IN   VARCHAR2,   
    TempDouble1         IN   NUMBER,  
    TempDouble2         IN   NUMBER,  
    TempInteger1        IN   NUMBER,  
    TempInteger2        IN   NUMBER, 
    Answers             IN   NUMBER,  
    QuestionsAnswered   IN   NUMBER,  
    Kzt                 IN   NUMBER, 
    UserId           IN   NUMBER,
    IpAddress           IN  VARCHAR2,
    UseSeismicDesignCategory IN CHAR
) AS
BEGIN
       UPDATE "Collaterals"
        SET
            "Occupancy" = Occupancy,
            "ThermalFactor" = ThermalFactor,
            "UnobstructedFlow" = UnobstructedFlow,
            "WindLoad" = WindLoad,
            "BelowWindMin" = BelowWindMin,
            "DeflectionWindSpeed" = DeflectionWindSpeed,
            "ModifiedBy" = UserId,
           "ModifiedDate" = current_timestamp,
            "IpAddress" = IpAddress,
            "SeismicDesignCategory" = UseSeismicDesignCategory
        WHERE
                "BuildingNumber" = BuildingNumber
            AND "ProjectId" = ProjectId;

    UPDATE "GeometryInformation"
    SET
        "WindEnclosure"= WindEnclosure,
        "AccessoryEnclosure" = AccessoryEnclosure,
        "OAEnclosure" = OAEnclosure,
        "ModifiedBy" = UserId,
        "ModifiedDate" = current_timestamp
    WHERE
            "BuildingInformationId" = BuildingNumber;
    UPDATE "Deflections" 
      SET
        "FrameLive" = FrameLive,
        "FrameSnow" = FrameSnow,
        "FrameWind" = FrameWind,
        "FrameSeismic" = FrameSeismic,
        "FrameTotalWind" = FrameTotalWind,
        "FrameTotalSeismic" = FrameTotalSeismic,
        "FrameTotalGravity" = FrameTotalGravity,
        "FramePortalWind" = FramePortalWind,
        "FramePortalSeismic" = FramePortalSeismic,
        "ModifiedBy" = UserId,
        "ModifiedDate" = CURRENT_TIMESTAMP,
        "IpAddress" = IpAddress
	WHERE 
        "ProjectId" = ProjectId 
        AND "BuildingNumber" = BuildingNumber;
    UPDATE "Escarpment" 
    SET
         "ProjectId" = ProjectId,
        "BuildingNumber" = BuildingNumber,
        "HillHeight" = HillHeight,
        "Lh" = Lh,
        "CrestDistance" = CrestDistance,
        "CrestUpwind" = CrestUpwind,
        "FlatUpwindTerrain" = FlatUpwindTerrain,
        "HillTallerBy2" = HillTallerBy2,
        "UpperHalfOfHill" = UpperHalfOfHill,
        "2ndRidgeOfHill" = RidgeOfHill,
        "TempString1" = TempString1,
        "TempString2" = TempString2,
        "TempDouble1" = TempDouble1,
        "TempDouble2" = TempDouble2,
        "TempInteger1" = TempInteger1,
        "TempInteger2" = TempInteger2,
        "Answers" = Answers,
        "QuestionsAnswered"  = QuestionsAnswered,
        "Kzt" = Kzt,
        "ModifiedBy" = UserId,
        "ModifiedDate" = CURRENT_TIMESTAMP,
        "IpAddress" = IpAddress,
        "IsDeleted" = 'N'
    WHERE
            "BuildingNumber" = BuildingNumber
            AND "ProjectId" = ProjectId
            AND "EscarpmentId" = EscarpmentId;
    UPDATE "BuildingInformation"
    SET "UseSeismicDesignCategory" = UseSeismicDesignCategory
    WHERE "BuildingInformationId" = BuildingNumber;   
END LOADS_UPDATE;
/