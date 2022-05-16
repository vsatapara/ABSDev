CREATE OR REPLACE PROCEDURE abs_mdi."INPUT_GIRTSBAYSPACING_WALL_GETBYBUILDINGID" 
(
    BuildingId IN VARCHAR2,
    OUTPUT_TABLE OUT  SYS_REFCURSOR
)
AS
BEGIN
    OPEN OUTPUT_TABLE FOR SELECT
    T1."GirtSpacingId",
    T1."BuildingInformationId",
    T3."StyleName" as "SW1Style",
    T4."StyleName" as "SW2Style",
    T5."StyleName" as "EW1Style",
    T6."StyleName" as "EW2Style",
    T7."StyleName" as "RoofPurlinStyle",
    T8."DepthValue" as "SW1Depth",
    T9."DepthValue" as "SW2Depth",
    T10."DepthValue" as "EW1Depth",
    T11."DepthValue" as "EW2Depth",
    T12."DepthValue" as "RoofPurlinDepth",
    T1."SW1Optimize",
    T1."SW2Optimize",
    T1."EW1Optimize",
    T1."EW2Optimize",
    T1."RoofPurlinOptimize",
    T1."RoofBaySpacing",
    T1."WallBaySpacing",
    T1."GirtSpacing",
    T1."PurlinSpacing",
    T1."LBPMinDepth",
    T1."LBPMaxDepth",
    T2."Elevation",
    T2."RoofBayNumber",
    T2."DistFromLeftColumn",
    T2."BaseRecess",
    T2."RoofBayWidth",
    T2."Sequence"
FROM
    "Input_GirtsBaySpacing_Wall" T2
left JOIN "Input_GirtsBaySpacing" T1 On T1."GirtSpacingId" = T2."GirtSpacingId"
left  JOIN  "GirtsAndPurlinStyle" T3 ON  T1."SW1Style"=T3."StyleId"
left  JOIN "GirtsAndPurlinStyle"  T4 ON    T1."SW2Style" =T4."StyleId"
left  JOIN  "GirtsAndPurlinStyle" T5 ON    T1."EW1Style"=T5."StyleId"
left  JOIN "GirtsAndPurlinStyle"  T6 ON    T1."EW2Style"=T6."StyleId"
left  JOIN  "GirtsAndPurlinStyle" T7 ON   T1."RoofPurlinStyle"=T7."StyleId"
left  JOIN  "GirtsAndPurlinDepth" T8 ON  T1."SW1Depth"=T8."DepthId"
left  JOIN "GirtsAndPurlinDepth"  T9 ON    T1."SW2Depth" =T9."DepthId"
left  JOIN  "GirtsAndPurlinDepth" T10 ON    T1."EW1Depth"=T10."DepthId"
left  JOIN "GirtsAndPurlinDepth"  T11 ON    T1."EW2Depth"=T11."DepthId"
left  JOIN  "GirtsAndPurlinDepth" T12 ON   T1."RoofPurlinDepth"=T12."DepthId"
WHERE 
                        T1."BuildingInformationId" in
                        ( 
                                SELECT regexp_substr(BuildingId,'[^,]+', 1, level) from dual
                                connect by regexp_substr(BuildingId, '[^,]+', 1, level) is not null
                         )
                         AND ("IsDelete" IS NULL  OR "IsDelete" != 'Y');
END;
/