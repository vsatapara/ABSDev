CREATE OR REPLACE PROCEDURE abs_mdi."TRIM_SELECT" 
(
    BuildingNumber IN NUMBER,
    Output_Data OUT SYS_REFCURSOR
)
AS 
 Category  VARCHAR2(40);
 L_COUNT   NUMBER(5);
BEGIN
SELECT
        COUNT(*)
    INTO L_COUNT
    FROM
        "GeometryInformation"
    WHERE
            "BuildingInformationId" = BuildingNumber
        AND ROWNUM = 1;
    IF ( L_COUNT > 0 ) THEN
        SELECT
            "Category"
        INTO Category
        FROM
            "GeometryInformation"
        WHERE
                "BuildingInformationId" = BuildingNumber
            AND ROWNUM = 1;
    END IF;
    IF ( Category = 'SymmetricalEndWall' OR Category = 'NonSymmetricalEndWall' ) THEN
        OPEN Output_Data FOR SELECT 
                                    it."TrimId",
                                    bi."BuildingInformationId" AS "BuildingNumber",
                                    it."SW1TrimOption", 
                                    it."SW2TrimOption",
                                    it."EW3TrimOption",
                                    it."EW4TrimOption",
                                    it."SW1NorthernGutter",
                                    it."SW2NorthernGutter",
                                    it."EW3NorthernGutter",
                                    it."EW4NorthernGutter",
                                    it."SW1GutterSize",
                                    it."SW2GutterSize",
                                    it."EW3GutterSize",
                                    it."EW4GutterSize",
                                    bi."Elevation" AS ParentElevationType,
                                    gi."EaveHeightSideWallB" AS ParentEaveHeight1,
                                    gi."EaveHeightSideWallD" AS ParentEaveHeight2
                                 FROM "BuildingInformation" bi
                                 LEFT JOIN "GeometryInformation" gi ON gi."BuildingInformationId" = bi."BuildingInformationId"
                                 LEFT JOIN "Input_Trim" it ON it."BuildingNumber" = bi."BuildingInformationId"
                                 WHERE bi."BuildingInformationId" = BuildingNumber;
    END IF;
    IF ( Category = 'SymmetricalSideWall' OR Category = 'NonSymmetricalSideWall' ) THEN
        OPEN Output_Data FOR SELECT
                                    it."TrimId",
                                    bi."BuildingInformationId" AS "BuildingNumber",
                                    it."SW1TrimOption", 
                                    it."SW2TrimOption",
                                    it."EW3TrimOption",
                                    it."EW4TrimOption",
                                    it."SW1NorthernGutter",
                                    it."SW2NorthernGutter",
                                    it."EW3NorthernGutter",
                                    it."EW4NorthernGutter",
                                    it."SW1GutterSize",
                                    it."SW2GutterSize",
                                    it."EW3GutterSize",
                                    it."EW4GutterSize",
                                    bi."Elevation" AS ParentElevationType,
                                    gi."EaveHeightSideWallA" AS ParentEaveHeight1,
                                    gi."EaveHeightSideWallC" AS ParentEaveHeight2
                                 FROM "BuildingInformation" bi
                                 LEFT JOIN "GeometryInformation" gi ON gi."BuildingInformationId" = bi."BuildingInformationId"
                                 LEFT JOIN "Input_Trim" it ON it."BuildingNumber" = bi."BuildingInformationId"
                                 WHERE bi."BuildingInformationId" = BuildingNumber;
    END IF;
    IF ( Category = 'SingleSlopeEndWallB' OR Category = 'LeanToB' ) THEN
        OPEN Output_Data FOR SELECT
                                    it."TrimId",
                                    bi."BuildingInformationId" AS "BuildingNumber",
                                    it."SW1TrimOption", 
                                    it."SW2TrimOption",
                                    it."EW3TrimOption",
                                    it."EW4TrimOption",
                                    it."SW1NorthernGutter",
                                    it."SW2NorthernGutter",
                                    it."EW3NorthernGutter",
                                    it."EW4NorthernGutter",
                                    it."SW1GutterSize",
                                    it."SW2GutterSize",
                                    it."EW3GutterSize",
                                    it."EW4GutterSize",
                                    bi."Elevation" AS ParentElevationType,
                                    gi."EaveHeightSideWallB" AS ParentEaveHeight1,
                                    gi."EaveHeightSideWallD" AS ParentEaveHeight2
                                 FROM "BuildingInformation" bi
                                 LEFT JOIN "GeometryInformation" gi ON gi."BuildingInformationId" = bi."BuildingInformationId"
                                 LEFT JOIN "Input_Trim" it ON it."BuildingNumber" = bi."BuildingInformationId"
                                 WHERE bi."BuildingInformationId" = BuildingNumber;
    END IF;
    IF ( Category = 'SingleSlopeSideWallC' OR Category = 'LeanToC' ) THEN
        OPEN Output_Data FOR SELECT
                                    it."TrimId",
                                    bi."BuildingInformationId" AS "BuildingNumber",
                                    it."SW1TrimOption", 
                                    it."SW2TrimOption",
                                    it."EW3TrimOption",
                                    it."EW4TrimOption",
                                    it."SW1NorthernGutter",
                                    it."SW2NorthernGutter",
                                    it."EW3NorthernGutter",
                                    it."EW4NorthernGutter",
                                    it."SW1GutterSize",
                                    it."SW2GutterSize",
                                    it."EW3GutterSize",
                                    it."EW4GutterSize",
                                    bi."Elevation" AS ParentElevationType,
                                    gi."EaveHeightSideWallA" AS ParentEaveHeight1,
                                    gi."EaveHeightSideWallC" AS ParentEaveHeight2
                                 FROM "BuildingInformation" bi
                                 LEFT JOIN "GeometryInformation" gi ON gi."BuildingInformationId" = bi."BuildingInformationId"
                                 LEFT JOIN "Input_Trim" it ON it."BuildingNumber" = bi."BuildingInformationId"
                                 WHERE bi."BuildingInformationId" = BuildingNumber;
    END IF;
    IF ( Category = 'SingleSlopeSideWallA' OR Category = 'LeanToA' ) THEN
        OPEN Output_Data FOR SELECT
                                    it."TrimId",
                                    bi."BuildingInformationId" AS "BuildingNumber",
                                    it."SW1TrimOption", 
                                    it."SW2TrimOption",
                                    it."EW3TrimOption",
                                    it."EW4TrimOption",
                                    it."SW1NorthernGutter",
                                    it."SW2NorthernGutter",
                                    it."EW3NorthernGutter",
                                    it."EW4NorthernGutter",
                                    it."SW1GutterSize",
                                    it."SW2GutterSize",
                                    it."EW3GutterSize",
                                    it."EW4GutterSize",
                                    bi."Elevation" AS ParentElevationType,
                                    gi."EaveHeightSideWallA" AS ParentEaveHeight1,
                                    gi."EaveHeightSideWallC" AS ParentEaveHeight2
                                 FROM "BuildingInformation" bi
                                 LEFT JOIN "GeometryInformation" gi ON gi."BuildingInformationId" = bi."BuildingInformationId"
                                 LEFT JOIN "Input_Trim" it ON it."BuildingNumber" = bi."BuildingInformationId"
                                 WHERE bi."BuildingInformationId" = BuildingNumber;
    END IF;
    IF ( Category = 'SingleSlopeEndWallD' OR Category = 'LeanToD' ) THEN
        OPEN Output_Data FOR SELECT
                                    it."TrimId",
                                    bi."BuildingInformationId" AS "BuildingNumber",
                                    it."SW1TrimOption", 
                                    it."SW2TrimOption",
                                    it."EW3TrimOption",
                                    it."EW4TrimOption",
                                    it."SW1NorthernGutter",
                                    it."SW2NorthernGutter",
                                    it."EW3NorthernGutter",
                                    it."EW4NorthernGutter",
                                    it."SW1GutterSize",
                                    it."SW2GutterSize",
                                    it."EW3GutterSize",
                                    it."EW4GutterSize",
                                    bi."Elevation" AS ParentElevationType,
                                    gi."EaveHeightSideWallB" AS ParentEaveHeight1,
                                    gi."EaveHeightSideWallD" AS ParentEaveHeight2
                                 FROM "BuildingInformation" bi
                                 LEFT JOIN "GeometryInformation" gi ON gi."BuildingInformationId" = bi."BuildingInformationId"
                                 LEFT JOIN "Input_Trim" it ON it."BuildingNumber" = bi."BuildingInformationId"
                                 WHERE bi."BuildingInformationId" = BuildingNumber;
    END IF;
END TRIM_SELECT;
/