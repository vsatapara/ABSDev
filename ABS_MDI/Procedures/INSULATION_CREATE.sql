CREATE OR REPLACE PROCEDURE abs_mdi."INSULATION_CREATE" 
(
    BuildingNumber IN NUMBER  DEFAULT NULL,
    ElevationOnSW1 IN NUMBER  DEFAULT NULL,
    ElevationOnSW2 IN NUMBER  DEFAULT NULL,
    ElevationOnEW3 IN NUMBER  DEFAULT NULL,
    ElevationOnEW4 IN NUMBER  DEFAULT NULL,
    ElevationOnRoof IN NUMBER  DEFAULT NULL,
    Facing IN VARCHAR2  DEFAULT NULL,
    Tabs IN VARCHAR2  DEFAULT NULL,
    RoofThick IN NUMBER  DEFAULT NULL,
    WallThick IN NUMBER  DEFAULT NULL,
    RoofSqft IN NUMBER  DEFAULT NULL,
    WallSqft IN NUMBER  DEFAULT NULL,
    StarterRoll IN NUMBER  DEFAULT NULL,
    RunningRoll IN NUMBER  DEFAULT NULL,
    FinishRoll IN NUMBER  DEFAULT NULL,
    Weight IN NUMBER  DEFAULT NULL,
    Price IN NUMBER  DEFAULT NULL,
    IsPriced IN NUMBER  DEFAULT NULL,
    ErrorCode IN NUMBER  DEFAULT NULL,
    ThickRoofInsulation IN NUMBER  DEFAULT NULL,
    InsulationType IN VARCHAR2  DEFAULT NULL,
    IncludeTape IN NUMBER  DEFAULT NULL,
    IncludeStaples IN NUMBER  DEFAULT NULL,
    ElevationOnPartition IN NUMBER  DEFAULT NULL,
    PartitionNumber IN NUMBER  DEFAULT NULL,
    ElevationOnEaveStrut IN NUMBER  DEFAULT NULL,
    SealedTapeTab IN NUMBER  DEFAULT NULL,
    FromWall IN NUMBER  DEFAULT NULL,
    DesignedRValue IN NUMBER  DEFAULT NULL,
    ByManufacturer IN NUMBER  DEFAULT NULL,
    OverPurlinGirt IN NUMBER  DEFAULT NULL,
    CavityPurlinBracable IN NUMBER  DEFAULT NULL,
    DesignedFacing IN VARCHAR2  DEFAULT NULL,
    Markup IN NUMBER  DEFAULT NULL,
    IpAddress IN VARCHAR2 DEFAULT NULL,
    CreatedBy IN VARCHAR2,
    OutputId OUT NUMBER
)
AS 
BEGIN
    INSERT INTO "Insulation" 
    (
        "BuildingNumber",
        "ElevationOnSW1",
        "ElevationOnSW2",
        "ElevationOnEW3",
        "ElevationOnEW4",
        "ElevationOnRoof",
        "Facing",
        "Tabs",
        "RoofThick",
        "WallThick",
        "RoofSqft",
        "WallSqft",
        "StarterRoll",
        "RunningRoll",
        "FinishRoll",
        "Weight",
        "Price",
        "IsPriced",
        "ErrorCode",
        "ThickRoofInsulation",
        "InsulationType",
        "IncludeTape",
        "IncludeStaples",
        "ElevationOnPartition",
        "PartitionNumber",
        "ElevationOnEaveStrut",
        "SealedTapeTab",
        "FromWall",
        "DesignedRValue",
        "ByManufacturer",
        "OverPurlinGirt",
        "CavityPurlinBracable",
        "DesignedFacing",
        "Markup",
        "CreatedBy",
        "CreatedDate",
        "IpAddress",
        "IsDelete"
    )
    VALUES 
    (
        BuildingNumber,
        ElevationOnSW1,
        ElevationOnSW2,
        ElevationOnEW3,
        ElevationOnEW4,
        ElevationOnRoof,
        Facing,
        Tabs,
        RoofThick,
        WallThick,
        RoofSqft,
        WallSqft,
        StarterRoll,
        RunningRoll,
        FinishRoll,
        Weight,
        Price,
        IsPriced,
        ErrorCode,
        ThickRoofInsulation,
        InsulationType,
        IncludeTape,
        IncludeStaples,
        ElevationOnPartition,
        PartitionNumber,
        ElevationOnEaveStrut,
        SealedTapeTab,
        FromWall,
        DesignedRValue,
        ByManufacturer,
        OverPurlinGirt,
        CavityPurlinBracable,
        DesignedFacing,
        Markup, 
        CreatedBy,
        CURRENT_TIMESTAMP,
        IpAddress,
        'N'
    )
    RETURNING "InsulationId" into OutputId;
END INSULATION_CREATE;
/