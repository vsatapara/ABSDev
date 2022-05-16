CREATE OR REPLACE PROCEDURE abs_mdi."LOADS_CREATE" (
    ProjectId                 IN   NUMBER,
    BuildingNumber            IN   NUMBER,
    WindEnclosure             IN   VARCHAR2,
    AccessoryEnclosure        IN   VARCHAR2,
    OAEnclosure               IN   VARCHAR2,
    Occupancy                 IN   VARCHAR2,
    ThermalFactor             IN   VARCHAR2,
    WindLoad                  IN   NUMBER,
    BelowWindMin              IN   NUMBER,
    DeflectionWindSpeed       IN   NUMBER,
    UnobstructedFlow          IN   NUMBER,
    FrameLive                 IN   NUMBER,
    FrameSnow                 IN   NUMBER,
    FrameWind                 IN   NUMBER,
    FrameSeismic              IN   NUMBER,
    FrameCrane                IN   NUMBER,
    FrameTotalWind            IN   NUMBER,
    FrameTotalSeismic         IN   NUMBER,
    FrameTotalGravity         IN   NUMBER,
    FramePortalWind           IN   NUMBER,
    FramePortalSeismic        IN   NUMBER,
    HillHeight                IN   NUMBER,
    Lh                        IN   NUMBER,
    CrestDistance             IN   NUMBER,
    CrestUpwind               IN   NUMBER,
    FlatUpwindTerrain         IN   NUMBER,
    HillTallerBy2             IN   NUMBER,
    UpperHalfOfHill           IN   NUMBER,
    RidgeOfHill               IN   NUMBER,
    TempString1               IN   VARCHAR2,
    TempString2               IN   VARCHAR2,
    TempDouble1               IN   NUMBER,
    TempDouble2               IN   NUMBER,
    TempInteger1              IN   NUMBER,
    TempInteger2              IN   NUMBER,
    Answers                   IN   NUMBER,
    QuestionsAnswered         IN   NUMBER,
    Kzt                       IN   NUMBER,
    UserId                    IN   NUMBER,
    IpAddress                 IN   VARCHAR2,
    UseSeismicDesignCategory  IN   CHAR,
    OutputId                  OUT  NUMBER
) AS
    record_exists NUMBER;
BEGIN
    record_exists := 0;
    SELECT
        COUNT(*)
    INTO record_exists
    FROM
        "Collaterals" C
    WHERE
            C."BuildingNumber" = BuildingNumber
        AND C."IsDeleted" != 'Y';
    IF record_exists > 0 THEN
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
    ELSE
        INSERT INTO "Collaterals" (
            "ProjectId",
            "BuildingNumber",
            "Occupancy",
            "ThermalFactor",
            "UnobstructedFlow",
            "WindLoad",
            "BelowWindMin",
            "DeflectionWindSpeed",
            "CreatedBy",
            "CreatedDate",
            "IpAddress",
            "IsDeleted",
            "SeismicDesignCategory"
        ) VALUES (
            ProjectId,
            BuildingNumber,
            Occupancy,
            ThermalFactor,
            UnobstructedFlow,
            WindLoad,
            BelowWindMin,
            DeflectionWindSpeed,
            UserId,
            current_timestamp,
            IpAddress,
            'N',
            UseSeismicDesignCategory
        );
    END IF;
    UPDATE "GeometryInformation"
    SET
        "WindEnclosure" = WindEnclosure,
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
    record_exists := 0;
    SELECT
        COUNT(*)
    INTO record_exists
    FROM
        "Escarpment" E
    WHERE
            E."BuildingNumber" = BuildingNumber
        AND E."IsDeleted" != 'Y';
    IF record_exists > 0 THEN
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
            "QuestionsAnswered" = QuestionsAnswered,
            "Kzt" = Kzt,
            "ModifiedBy" = UserId,
            "ModifiedDate" = CURRENT_TIMESTAMP,
            "IpAddress" = IpAddress,
            "IsDeleted" = 'N'
        WHERE
                "BuildingNumber" = BuildingNumber
            AND "ProjectId" = ProjectId;
        SELECT
            "EscarpmentId"
        INTO OutputId
        FROM
            "Escarpment"
        WHERE
                "BuildingNumber" = BuildingNumber
            AND "ProjectId" = ProjectId;
    ELSE
        INSERT INTO "Escarpment" (
            "ProjectId",
            "BuildingNumber",
            "HillHeight",
            "Lh",
            "CrestDistance",
            "CrestUpwind",
            "FlatUpwindTerrain",
            "HillTallerBy2",
            "UpperHalfOfHill",
            "2ndRidgeOfHill",
            "TempString1",
            "TempString2",
            "TempDouble1",
            "TempDouble2",
            "TempInteger1",
            "TempInteger2",
            "Answers",
            "QuestionsAnswered",
            "Kzt",
            "CreatedBy",
            "CreatedDate",
            "IpAddress",
            "IsDeleted"
        ) VALUES (
            ProjectId,
            BuildingNumber,
            HillHeight,
            Lh,
            CrestDistance,
            CrestUpwind,
            FlatUpwindTerrain,
            HillTallerBy2,
            UpperHalfOfHill,
            RidgeOfHill,
            TempString1,
            TempString2,
            TempDouble1,
            TempDouble2,
            TempInteger1,
            TempInteger2,
            Answers,
            QuestionsAnswered,
            Kzt,
            UserId,
            CURRENT_TIMESTAMP,
            IpAddress,
            'N'
        ) RETURNING "EscarpmentId" INTO OutputId;
    END IF;
    UPDATE "BuildingInformation"
    SET
        "IsComplete" = 'Y',
        "UseSeismicDesignCategory" = UseSeismicDesignCategory
    WHERE
        "BuildingInformationId" = BuildingNumber;
END LOADS_CREATE;
/