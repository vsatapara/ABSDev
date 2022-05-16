CREATE OR REPLACE PROCEDURE abs_mdi."DDP_EDSDB_BOXLAYGEOM_SELECT" 
/*   Created By Mayuresh  Jagtap  
      Created Date   2-3-2021
      Description   This stored Procedure used to get data to DDP_EDSDB_BOXLAYGEOM table  */
(
    UserId IN NVARCHAR2,
    JobNumber IN NVARCHAR2,
    Output_Data OUT SYS_REFCURSOR
)AS 
BEGIN
    OPEN Output_Data FOR 
        SELECT
            "BOXLAYGEOMID",
            "BUILDING_NAME",
            "BLDG_WIDTH",
            "BLDG_LENGTH",
            "BLDG_EAVE_HT1",
            "BLDG_EAVE_HT2"
        FROM
            "DDP_EDSDB_BOXLAYGEOM"
        WHERE 
        "ISDELETE" = 'N'
    AND "USERID" = UserId
    AND "JOBNUMBER" = JobNumber;
END DDP_EDSDB_BOXLAYGEOM_SELECT;
/