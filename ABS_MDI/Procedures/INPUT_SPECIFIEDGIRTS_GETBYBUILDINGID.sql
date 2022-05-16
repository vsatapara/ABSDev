CREATE OR REPLACE PROCEDURE abs_mdi."INPUT_SPECIFIEDGIRTS_GETBYBUILDINGID" 
(
    BuildingId IN VARCHAR2,
    OUTPUT_TABLE OUT  SYS_REFCURSOR
)
AS
BEGIN
    OPEN OUTPUT_TABLE FOR SELECT
                T1."GirtSpacingId",
                T1."BuildingInformationId",
                T4."StyleName" AS "SW1Style",
                T5."StyleName" AS "SW2Style",
                T6."StyleName" AS "EW1Style",
                T7."StyleName" "EW2Style",
                T1."RoofPurlinStyle",
                T8."DepthValue" AS "SW1Depth",
                T9."DepthValue" AS "SW2Depth",
                T10."DepthValue" AS "EW1Depth",
                T11."DepthValue" AS "EW2Depth",
                T1."RoofPurlinDepth",
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
                T2."SW1Type",
                T2."SW2Type",
                T2."EW1Type",
                T2."EW2Type",
                T3."Elevation",
                T3."SpacingNumber",
                T3."Spacing",
                T3."Type"
            FROM
                "Input_GirtsBaySpacing" T1
            JOIN "Input_GirtsBaySpacing_Girt" T2 ON T1."GirtSpacingId" = T2."GirtSpacingId"
            JOIN "Input_GirtsBaySpacing_GirtSpecified" T3 ON T2."GirtBaySpaceId"=T3."GirtBaySpaceId"
            JOIN "GirtsAndPurlinStyle" T4 ON  T1."SW1Style"=T4."StyleId"
            JOIN "GirtsAndPurlinStyle" T5 ON  T1."SW2Style"=T5."StyleId"
            JOIN "GirtsAndPurlinStyle" T6 ON  T1."EW1Depth"=T6."StyleId"
            JOIN "GirtsAndPurlinStyle" T7 ON  T1."EW2Style"=T7."StyleId"
            JOIN "GirtsAndPurlinDepth" T8 ON  T1."SW1Depth"=T8."DepthId"
            JOIN "GirtsAndPurlinDepth" T9 ON  T1."SW2Depth"=T9."DepthId"
            JOIN "GirtsAndPurlinDepth" T10 ON  T1."EW1Depth"=T10."DepthId"
            JOIN "GirtsAndPurlinDepth" T11 ON  T1."EW2Depth"=T11."DepthId"
            
            
            
            WHERE 
                        T1."BuildingInformationId" in
                        ( 
                                            SELECT regexp_substr(BuildingId,'[^,]+', 1, level) from dual
                                            connect by regexp_substr(BuildingId, '[^,]+', 1, level) is not null
                        )
                        AND (T1."IsDelete" IS NULL  OR T1."IsDelete" != 'Y');
END;
/