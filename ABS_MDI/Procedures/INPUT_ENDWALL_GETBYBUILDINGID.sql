CREATE OR REPLACE PROCEDURE abs_mdi."INPUT_ENDWALL_GETBYBUILDINGID" 
(
    BuildingId IN VARCHAR2,
    OUTPUT_TABLE OUT  SYS_REFCURSOR
)
AS
BEGIN
    OPEN OUTPUT_TABLE FOR SELECT
            T1."EndWallID",
            T1."BuildingNo",
            T1."FrameType",
            T1."ProjectId",
            T1."EndWallNo",
            T1."ElevationType",
            T1."ColumnSpacingType",
            T1."InsulationTrim",
            T1."NonStandardSetback",
            T1."DesignedSetback",
            T1."SpecifiedSetback",
            T1."BayCount",
            T4."StyleName" AS "SW1Style",
            T5."StyleName" AS "SW2Style",
            T6."StyleName" AS "EW1Style",
            T7."StyleName" AS "EW2Style",
            T2."RoofPurlinStyle",
            T8."DepthValue" AS "SW1Depth",
            T9."DepthValue" AS "SW2Depth",
            T10."DepthValue" AS "EW1Depth",
            T11."DepthValue" AS "EW2Depth",
            T2."RoofPurlinDepth",
            T2."SW1Optimize",
            T2."SW2Optimize",
            T2."EW1Optimize",
            T2."EW2Optimize",
            T2."RoofPurlinOptimize",
            T2."RoofBaySpacing",
            T2."WallBaySpacing",
            T2."GirtSpacing",
            T2."PurlinSpacing",
            T2."LBPMinDepth",
            T2."LBPMaxDepth",
            T3."GirtSpacingId",
            T3."SW1Type",
            T3."SW2Type",
            T3."EW1Type",
            T3."EW2Type",
            (
                SELECT OA."MaterialType" 
                FROM "OpenAreas" OA 
                WHERE OA."BuildingNumber"=T1."BuildingNo" AND OA."OpeningType"='Full Height' AND ROWNUM <= 1
            ) AS MaterialType,
            (
                SELECT OA."Elevation" 
                FROM "OpenAreas" OA 
                WHERE OA."BuildingNumber"=T1."BuildingNo" AND OA."OpeningType"='Full Height' AND ROWNUM <= 1
            ) AS Elevation
        FROM
            "Input_Endwall" T1
        
        LEFT  JOIN "Input_GirtsBaySpacing" T2 ON T1."BuildingNo" = T2."BuildingInformationId"
        LEFT  JOIN "Input_GirtsBaySpacing_Girt" T3 ON T2."GirtSpacingId" = T3."GirtSpacingId"
        LEFT JOIN "GirtsAndPurlinStyle" T4 ON T4."StyleId" = T2."SW1Style"
        LEFT JOIN "GirtsAndPurlinStyle" T5 ON T5."StyleId" = T2."SW2Style"
        LEFT JOIN "GirtsAndPurlinStyle" T6 ON T6."StyleId" = T2."EW1Style"
        LEFT  JOIN "GirtsAndPurlinStyle" T7 ON T7."StyleId" = T2."EW2Style"
        LEFT JOIN "GirtsAndPurlinDepth" T8 ON T8."DepthId" = T2."SW1Depth"
        LEFT JOIN "GirtsAndPurlinDepth" T9 ON T9."DepthId" = T2."SW2Depth"
        LEFT JOIN "GirtsAndPurlinDepth" T10 ON T10."DepthId" = T2."EW1Depth"
        LEFT  JOIN "GirtsAndPurlinDepth" T11 ON T11."DepthId" = T2."EW2Depth"
        LEFT  JOIN "GirtsAndPurlinDepth" T11 ON T11."DepthId" = T2."EW2Depth"
        LEFT JOIN "GirtsAndPurlinDepth" T11 ON T11."DepthId" = T2."EW2Depth"
        WHERE 
            T1."BuildingNo" in
            ( 
                                SELECT regexp_substr(BuildingId,'[^,]+', 1, level) from dual
                                connect by regexp_substr(BuildingId, '[^,]+', 1, level) is not null
            )
        AND NVL(T1."IsDeleted",'N') != 'Y'
        GROUP BY
            T1."EndWallID",
            T1."BuildingNo",
            T1."FrameType",
            T1."ProjectId",
            T1."EndWallNo",
            T1."ElevationType",
            T1."ColumnSpacingType",
            T1."InsulationTrim",
            T1."NonStandardSetback",
            T1."DesignedSetback",
            T1."SpecifiedSetback",
            T1."BayCount",
            T4."StyleName",
            T5."StyleName",
            T6."StyleName" ,
            T7."StyleName",
            T2."RoofPurlinStyle",
            T8."DepthValue" ,
            T9."DepthValue",
            T10."DepthValue",
            T11."DepthValue",
            T2."RoofPurlinDepth",
            T2."SW1Optimize",
            T2."SW2Optimize",
            T2."EW1Optimize",
            T2."EW2Optimize",
            T2."RoofPurlinOptimize",
            T2."RoofBaySpacing",
            T2."WallBaySpacing",
            T2."GirtSpacing",
            T2."PurlinSpacing",
            T2."LBPMinDepth",
            T2."LBPMaxDepth",
            T3."GirtSpacingId",
            T3."SW1Type",
            T3."SW2Type",
            T3."EW1Type",
            T3."EW2Type"
        ;

END;
--create or replace PROCEDURE "INPUT_ENDWALL_GETBYBUILDINGID"
--(
--    BuildingId IN VARCHAR2,
--    OUTPUT_TABLE OUT  SYS_REFCURSOR
--)
--AS
--BEGIN
--
--    OPEN OUTPUT_TABLE FOR SELECT
--            T1."EndWallID",
--            T1."BuildingNo",
--            T1."FrameType",
--            T1."ProjectId",
--            T1."EndWallNo",
--            T1."ElevationType",
--            T1."ColumnSpacingType",
--            T1."InsulationTrim",
--            T1."NonStandardSetback",
--            T1."DesignedSetback",
--            T1."SpecifiedSetback",
--            T1."BayCount",
--            T4."StyleName" AS "SW1Style",
--            T5."StyleName" AS "SW2Style",
--            T6."StyleName" AS "EW1Style",
--            T7."StyleName" AS "EW2Style",
--            T2."RoofPurlinStyle",
--            T8."DepthValue" AS "SW1Depth",
--            T9."DepthValue" AS "SW2Depth",
--            T10."DepthValue" AS "EW1Depth",
--            T11."DepthValue" AS "EW2Depth",
--            T2."RoofPurlinDepth",
--            T2."SW1Optimize",
--            T2."SW2Optimize",
--            T2."EW1Optimize",
--            T2."EW2Optimize",
--            T2."RoofPurlinOptimize",
--            T2."RoofBaySpacing",
--            T2."WallBaySpacing",
--            T2."GirtSpacing",
--            T2."PurlinSpacing",
--            T2."LBPMinDepth",
--            T2."LBPMaxDepth",
--            T3."GirtSpacingId",
--            T3."SW1Type",
--            T3."SW2Type",
--            T3."EW1Type",
--            T3."EW2Type",
--            T12."MaterialType",
--            T12."Elevation"
--        FROM
--            "Input_Endwall" T1
--        
--        LEFT  JOIN "Input_GirtsBaySpacing" T2 ON T1."BuildingNo" = T2."BuildingInformationId"
--        LEFT  JOIN "Input_GirtsBaySpacing_Girt" T3 ON T2."GirtSpacingId" = T3."GirtSpacingId"
--        LEFT JOIN "GirtsAndPurlinStyle" T4 ON T4."StyleId" = T2."SW1Style"
--        LEFT JOIN "GirtsAndPurlinStyle" T5 ON T5."StyleId" = T2."SW2Style"
--        LEFT JOIN "GirtsAndPurlinStyle" T6 ON T6."StyleId" = T2."EW1Style"
--        LEFT  JOIN "GirtsAndPurlinStyle" T7 ON T7."StyleId" = T2."EW2Style"
--        LEFT JOIN "GirtsAndPurlinDepth" T8 ON T8."DepthId" = T2."SW1Depth"
--        LEFT JOIN "GirtsAndPurlinDepth" T9 ON T9."DepthId" = T2."SW2Depth"
--        LEFT JOIN "GirtsAndPurlinDepth" T10 ON T10."DepthId" = T2."EW1Depth"
--        LEFT  JOIN "GirtsAndPurlinDepth" T11 ON T11."DepthId" = T2."EW2Depth"
--        LEFT  JOIN "GirtsAndPurlinDepth" T11 ON T11."DepthId" = T2."EW2Depth"
--        LEFT JOIN "GirtsAndPurlinDepth" T11 ON T11."DepthId" = T2."EW2Depth"
--        LEFT  JOIN "OpenAreas" T12 ON T12."BuildingNumber" = T1."BuildingNo"
--        
--        WHERE 
--            T1."BuildingNo" in
--            ( 
--                                SELECT regexp_substr(BuildingId,'[^,]+', 1, level) from dual
--                                connect by regexp_substr(BuildingId, '[^,]+', 1, level) is not null
--            )
--            AND NVL(T1."IsDeleted",'N') != 'Y';
--
--END;
/