CREATE OR REPLACE PROCEDURE abs_mdi."INPUT_BAYS_GETBYBUILDINGID" 
(
    BuildingId IN VARCHAR2,
    OUTPUT_BAYS OUT  SYS_REFCURSOR,
    OUTPUT_COLUMNSPACING OUT  SYS_REFCURSOR
 )
AS
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
     )
                 
        union
        SELECT
            T1."CSID"  as "RoofBaySpaceId" ,
            T1."BuildingNo" as "BuildingInformationId",
            CASE WHEN T2."ElevationType" ='S' THEN  'B' 
            WHEN T2."ElevationType" ='E' THEN  'A' END as "Elevation"
            ,T1."BayNo" as "BayNumber"
            ,T1."BaySpacing" as "Width"
        FROM
            "Input_Endwalls_ColumnSpacing" T1
            Inner JOIN "Input_Endwall" T2 On T1."EndWallID" = T2."EndWallID" and T2."EndWallNo" = 1  AND NVL(T2."IsDeleted",'N') != 'Y'
            where  T1."BuildingNo" in
            ( 
                        SELECT regexp_substr(BuildingId,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingId, '[^,]+', 1, level) is not null
             ) 
             AND NVL(T1."IsDeleted",'N') != 'Y'
                         
        union
        SELECT
            T1."CSID"  as "RoofBaySpaceId" ,
            T1."BuildingNo" as "BuildingInformationId",
             CASE WHEN T2."ElevationType" ='S' THEN  'D' 
            WHEN T2."ElevationType" ='E' THEN  'C' END as "Elevation"
            ,
            T1."BayNo" as "BayNumber"
            ,T1."BaySpacing" as "Width"
        FROM
            "Input_Endwalls_ColumnSpacing" T1
            Inner JOIN "Input_Endwall" T2 On T1."EndWallID" = T2."EndWallID" and T2."EndWallNo" = 2 AND NVL(T2."IsDeleted",'N') != 'Y' 
            where  T1."BuildingNo"  in
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
END;
/