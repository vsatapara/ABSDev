CREATE OR REPLACE PROCEDURE abs_mdi."TEST_REC_BHAVIN" 
(
     BuildingNo IN NUMBER,
     Rec_Data  OUT  SYS_REFCURSOR
)AS 
CountBays NUMBER;
BEGIN

SELECT count("EndWallID") into CountBays  FROM "Input_Endwalls_ColumnSpacing" WHERE "BuildingNo"=BuildingNo   group by "EndWallID" fetch  first 1 rows only;

   OPEN Rec_Data FOR SELECT
    IER.ewrid,
    IER."BuildingNo",
    (CASE
    WHEN IE."EndWallNo"='1' THEN 'B'
    WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
    IER."RecessNo",
    IER."Recesses",
    IER."CreatedBy",
    IER."CreatedDate",
    IER."ModifiedBy",
    IER."ModifiedDate",
    IER."IpAddress",
    IER."EndWallID",
    IER."IsDeleted",
    IER."IsFrameColumn"
FROM
    "Input_Endwalls_Recesses" IER 
    left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
    WHERE IER."BuildingNo"=BuildingNo
    fetch  first CountBays rows only;


END Test_REC_Bhavin;
/