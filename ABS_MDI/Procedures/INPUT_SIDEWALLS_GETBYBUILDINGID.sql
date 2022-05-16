CREATE OR REPLACE PROCEDURE abs_mdi."INPUT_SIDEWALLS_GETBYBUILDINGID" 
(
    BuildingId IN VARCHAR2,
    OUTPUT_TABLE OUT  SYS_REFCURSOR
)
AS
BEGIN
        OPEN OUTPUT_TABLE FOR SELECT
                T1."GirtSpacingId",
                T1."BuildingInformationId",
                T4."StyleName" as "SW1Style",
                T5."StyleName" as "SW2Style",
                T6."StyleName" as "EW1Style",
                T7."StyleName" as "EW2Style",
                T8."StyleName" as "RoofPurlinStyle",
                T9."DepthValue" as "SW1Depth",
                T10."DepthValue" as "SW2Depth",
                T11."DepthValue" as "EW1Depth",
                T12."DepthValue" as "EW2Depth",
                T13."DepthValue" as "RoofPurlinDepth",
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
                T2."ShopCoatId",
                T2."GalvanizedSecondary",
                T2."SealWelds",
                T2."HotDippedPrimary",
                T2."HotDippedPrice",
                T2."HotDippedWeight",
                T2."SealWeldsPrice",
                T2."SealWeldsWeight",
                T2."QuoteNumber",
                T2."QuoteYear",
                T2."EstimatorInitials",
                T2."ExpiresOn",
                T2."BoltFinish",
                T2."ShopCoatDrpId",
                T3."SW1Type",
                T3."SW2Type",
                T3."EW1Type",
                T3."EW2Type"
            FROM
                "Input_GirtsBaySpacing" T1
           left JOIN "Input_ShopCoat" T2 ON T1."BuildingInformationId" = T2."BuildingInformationId"
          left  JOIN "Input_GirtsBaySpacing_Girt" T3 ON T1."GirtSpacingId" = T3."GirtSpacingId"
          
         left  JOIN  "GirtsAndPurlinStyle"  T4 ON  T1."SW1Style"=T4."StyleId"
         left  JOIN "GirtsAndPurlinStyle"  T5 ON    T1."SW2Style" =T5."StyleId"
         left  JOIN  "GirtsAndPurlinStyle" T6 ON    T1."EW1Style"=T6."StyleId"
         left  JOIN "GirtsAndPurlinStyle"  T7 ON    T1."EW2Style"=T7."StyleId"
         left  JOIN  "GirtsAndPurlinStyle" T8 ON   T1."RoofPurlinStyle"=T8."StyleId"
         
          left  JOIN  "GirtsAndPurlinDepth"  T9 ON  T1."SW1Depth"=T9."DepthId"
         left  JOIN "GirtsAndPurlinDepth"  T10 ON    T1."SW2Depth" =T10."DepthId"
         left  JOIN  "GirtsAndPurlinDepth" T11 ON    T1."EW1Depth"=T11."DepthId"
         left  JOIN "GirtsAndPurlinDepth"  T12 ON    T1."EW2Depth"=T12."DepthId"
         left  JOIN  "GirtsAndPurlinDepth" T13 ON   T1."RoofPurlinDepth"=T13."DepthId"
         
            WHERE 
                T1."BuildingInformationId" in
                ( 
                                            SELECT regexp_substr(BuildingId,'[^,]+', 1, level) from dual
                                            connect by regexp_substr(BuildingId, '[^,]+', 1, level) is not null
                 )
                 AND (T1."IsDelete" IS NULL  OR T1."IsDelete" != 'Y');  
END;
/