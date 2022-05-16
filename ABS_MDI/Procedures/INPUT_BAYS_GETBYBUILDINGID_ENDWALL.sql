CREATE OR REPLACE PROCEDURE abs_mdi."INPUT_BAYS_GETBYBUILDINGID_ENDWALL" 
(
   BuildingId IN VARCHAR2,
    OUTPUT_BAYS OUT  SYS_REFCURSOR,
    OUTPUT_COLUMNSPACING OUT  SYS_REFCURSOR,
    OUTPUT_COLUMNSPACING_TEMP OUT  SYS_REFCURSOR
) AS 
BEGIN
 OPEN OUTPUT_BAYS FOR SELECT
    "RoofBaySpaceId",
    "BuildingInformationId",
    "Elevation",
    "BayNumber",
    Cast("Width" as VARCHAR2(20)) as "Width"
FROM
    "Input_Bays"
    WHERE
    "BuildingInformationId" in
    ( 
                 SELECT regexp_substr(BuildingId,'[^,]+', 1, level) from dual
                 connect by regexp_substr(BuildingId, '[^,]+', 1, level) is not null
     );
     OPEN  OUTPUT_COLUMNSPACING_TEMP FOR SELECT
            T1."CSID"  as "RoofBaySpaceId" ,
            T1."BuildingNo" as "BuildingInformationId",
            T2."ElevationType"  as "Elevation",
            T2."EndWallNo"
            ,T1."BayNo" as "BayNumber"
            ,T1."BaySpacing" as "Width"
             ,T3."BuildingType"
             ,T3."Elevation"
             ,T3."AttachmentElevation"
        FROM
            "Input_Endwalls_ColumnSpacing" T1
            Inner JOIN "Input_Endwall" T2 On T1."EndWallID" = T2."EndWallID" AND NVL(T2."IsDeleted",'N') != 'Y'
            Inner JOIN "BuildingInformation" T3 On T1."BuildingNo" = T3."BuildingInformationId"
            where  T1."BuildingNo" in
    ( 
                 SELECT regexp_substr(BuildingId,'[^,]+', 1, level) from dual
                 connect by regexp_substr(BuildingId, '[^,]+', 1, level) is not null
     )
             AND NVL(T1."IsDeleted",'N') != 'Y';
        OPEN OUTPUT_COLUMNSPACING FOR SELECT
            csid,
            "BuildingNo",
            "CSType",
            "BayNo",
            "BaySpacing",
            "EndWallID",
            "IsDeleted"
        FROM
            "Input_Endwalls_ColumnSpacing"
             WHERE
             "BuildingNo" in
             ( 
                        SELECT regexp_substr(BuildingId,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingId, '[^,]+', 1, level) is not null
             )
             AND NVL("IsDeleted",'N') != 'Y';
END INPUT_BAYS_GETBYBUILDINGID_ENDWALL;
/