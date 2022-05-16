CREATE OR REPLACE PROCEDURE abs_mdi."TRIM_CREATE" (
    BuildingNumber            IN   NUMBER,
    SW1TrimOption             IN   VARCHAR2,
    SW2TrimOption             IN   VARCHAR2,
    EW3TrimOption             IN   VARCHAR2,
    EW4TrimOption             IN   VARCHAR2,
    SW1NorthernGutter         IN   NUMBER,
    SW2NorthernGutter         IN   NUMBER,
    EW3NorthernGutter         IN   NUMBER,
    EW4NorthernGutter         IN   NUMBER,
    SW1GutterSize             IN   NUMBER,
    SW2GutterSize             IN   NUMBER,
    EW3GutterSize             IN   NUMBER,
    EW4GutterSize             IN   NUMBER,
    SW1IncludeElbows          IN   NUMBER,
    SW2IncludeElbows          IN   NUMBER,
    EW3IncludeElbows          IN   NUMBER,
    EW4IncludeElbows          IN   NUMBER,
    SW1Drops                  IN   NUMBER,
    SW2Drops                  IN   NUMBER,
    EW3Drops                  IN   NUMBER,
    EW4Drops                  IN   NUMBER,
    SW1DropHeight             IN   DECIMAL,
    SW2DropHeight             IN   DECIMAL,
    EW3DropHeight             IN   DECIMAL,
    EW4DropHeight             IN   DECIMAL,
    TrimProfile               IN   VARCHAR2,
    AdditionalGutterSupports  IN   NUMBER,
    IsSW1MatchEavaHeight      IN   NUMBER,
    IsSW2MatchEavaHeight      IN   NUMBER,
    IsEW3MatchEavaHeight      IN   NUMBER,
    IsEW4MatchEavaHeight      IN   NUMBER,
    SW1GutterDesignSize      IN   NUMBER Default 0,
    SW2GutterDesignSize      IN   NUMBER Default 0,
    EW3GutterDesignSize      IN   NUMBER Default 0,
    EW4GutterDesignSize      IN   NUMBER Default 0,
    CreatedBy                 IN   NUMBER,
    IpAddress                 IN   VARCHAR2,
    OutputId                  OUT  NUMBER
) IS
    TotalCount NUMBER := 0;
BEGIN
    SELECT
        COUNT(1)
    INTO TotalCount
    FROM
        "Input_Trim"
    WHERE
            "BuildingNumber" = BuildingNumber
        AND "IsDelete" = 'N';
    IF TotalCount = 0 THEN
        INSERT INTO "Input_Trim" (
            "BuildingNumber",
            "SW1TrimOption",
            "SW2TrimOption",
            "EW3TrimOption",
            "EW4TrimOption",
            "SW1NorthernGutter",
            "SW2NorthernGutter",
            "EW3NorthernGutter",
            "EW4NorthernGutter",
            "SW1GutterSize",
            "SW2GutterSize",
            "EW3GutterSize",
            "EW4GutterSize",
            "SW1IncludeElbows",
            "SW2IncludeElbows",
            "EW3IncludeElbows",
            "EW4IncludeElbows",
            "SW1Drops",
            "SW2Drops",
            "EW3Drops",
            "EW4Drops",
            "SW1DropHeight",
            "SW2DropHeight",
            "EW3DropHeight",
            "EW4DropHeight",
            "TrimProfile",
            "AdditionalGutterSupports",
            "IsSW1MatchEavaHeight",
            "IsSW2MatchEavaHeight",
            "IsEW3MatchEavaHeight",
            "IsEW4MatchEavaHeight",
            "SW1GutterDesignSize",
            "SW2GutterDesignSize",
            "EW3GutterDesignSize",
            "EW4GutterDesignSize",
            "IsDelete",
            "CreatedBy",
            "CreatedDate",
            "IpAddress"
        ) VALUES (
            BuildingNumber,
            SW1TrimOption,
            SW2TrimOption,
            EW3TrimOption,
            EW4TrimOption,
            SW1NorthernGutter,
            SW2NorthernGutter,
            EW3NorthernGutter,
            EW4NorthernGutter,
            SW1GutterSize,
            SW2GutterSize,
            EW3GutterSize,
            EW4GutterSize,
            SW1IncludeElbows,
            SW2IncludeElbows,
            EW3IncludeElbows,
            EW4IncludeElbows,
            SW1Drops,
            SW2Drops,
            EW3Drops,
            EW4Drops,
            SW1DropHeight,
            SW2DropHeight,
            EW3DropHeight,
            EW4DropHeight,
            TrimProfile,
            AdditionalGutterSupports,
            IsSW1MatchEavaHeight,
            IsSW2MatchEavaHeight,
            IsEW4MatchEavaHeight,
            IsEW3MatchEavaHeight,
            SW1GutterDesignSize,
            SW2GutterDesignSize,
            EW3GutterDesignSize,
            EW4GutterDesignSize,
            'N',
            CreatedBy,
            CURRENT_TIMESTAMP,
            IpAddress
        ) RETURNING "TrimId" INTO OutputId;
    ELSE
        SELECT
            "TrimId"
        INTO OutputId
        FROM
            "Input_Trim"
        WHERE
                "BuildingNumber" = BuildingNumber
            AND "IsDelete" = 'N';
        TRIM_UPDATE(TrimId => OutputId, BuildingNumber => BuildingNumber, SW1TrimOption => SW1TrimOption, SW2TrimOption => SW2TrimOption,
                   EW3TrimOption => EW3TrimOption,
                   EW4TrimOption => EW4TrimOption,
                   SW1NorthernGutter => SW1NorthernGutter,
                   SW2NorthernGutter => SW2NorthernGutter,
                   EW3NorthernGutter => EW3NorthernGutter,
                   EW4NorthernGutter => EW4NorthernGutter,
                   SW1GutterSize => SW1GutterSize,
                   SW2GutterSize => SW2GutterSize,
                   EW3GutterSize => EW3GutterSize,
                   EW4GutterSize => EW4GutterSize,
                   SW1IncludeElbows => SW1IncludeElbows,
                   SW2IncludeElbows => SW2IncludeElbows,
                   EW3IncludeElbows => EW3IncludeElbows,
                   EW4IncludeElbows => EW4IncludeElbows,
                   SW1Drops => SW1Drops,
                   SW2Drops => SW2Drops,
                   EW3Drops => EW3Drops,
                   EW4Drops => EW4Drops,
                   SW1DropHeight => SW1DropHeight,
                   SW2DropHeight => SW2DropHeight,
                   EW3DropHeight => EW3DropHeight,
                   EW4DropHeight => EW4DropHeight,
                   TrimProfile => TrimProfile,
                   AdditionalGutterSupports => AdditionalGutterSupports,
                   IsSW1MatchEavaHeight => IsSW1MatchEavaHeight,
                   IsSW2MatchEavaHeight => IsSW2MatchEavaHeight,
                   IsEW3MatchEavaHeight => IsEW3MatchEavaHeight,
                   IsEW4MatchEavaHeight => IsEW4MatchEavaHeight,
                   SW1GutterDesignSize => SW1GutterDesignSize,
                   SW2GutterDesignSize => SW2GutterDesignSize,
                   EW3GutterDesignSize => EW3GutterDesignSize,
                   EW4GutterDesignSize => EW4GutterDesignSize,
                   ModifiedBy => CreatedBy,
                   IpAddress => IpAddress);
    END IF;
END TRIM_CREATE;
/