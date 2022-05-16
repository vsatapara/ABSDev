CREATE OR REPLACE PROCEDURE abs_mdi."ENDWALLS_RECESSES_GETBYBUILDINGID" 
(
    BuildingId IN VARCHAR2,
    OUTPUT_TABLE OUT  SYS_REFCURSOR
)
AS
BEGIN
OPEN OUTPUT_TABLE FOR SELECT
    ER.ewrid,
    ER."BuildingNo",
    ER."EWRType",
    ER."RecessNo",
    ER."Recesses",
    ER."CreatedBy",
    ER."CreatedDate",
    ER."ModifiedBy",
    ER."ModifiedDate",
    ER."IpAddress",
    ER."EndWallID",
    ER."IsDeleted",
    ER."IsFrameColumn",
    IECS."Elevation"
FROM
    "Input_Endwalls_Recesses" ER
                left join "Input_Endwall" Endwall on Endwall."EndWallID" = ER."EndWallID"
		        inner join "Input_Endwalls_ColumnSpacing" IECS on IECS."EndWallID" = Endwall."EndWallID" AND IECS."BuildingNo" = Endwall."BuildingNo" AND IECS."BayNo" = 1
                WHERE
                ER."BuildingNo" in
                ( 
                        SELECT regexp_substr(BuildingId,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingId, '[^,]+', 1, level) is not null
                 )
                 AND (ER."IsDeleted" IS NULL  OR ER."IsDeleted" != 'Y');
END;
/