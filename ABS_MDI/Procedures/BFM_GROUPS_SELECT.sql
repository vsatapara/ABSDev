CREATE OR REPLACE PROCEDURE abs_mdi."BFM_GROUPS_SELECT" 
(
    GroupNumber IN NUMBER,
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
 OPEN Output_Data FOR 
        SELECT 
            "GroupNumber",
            "BuildingNumber",
            "ColType1",
            "ColType2",
            "WebDepth1",
            "WebDepth2",
            "RafterDepth1",
            "RafterDepth2",
            "Clearspan",
            "IsElevation1" as "Unsupported1",
            "IsElevation2" as "Unsupported2",
            "Elevation1" as "UnsupportedElevation1",
            "Elevation2" as "UnsupportedElevation2"
         FROM "BFM_Groups"
         WHERE "GroupNumber"=GroupNumber;
END BFM_GROUPS_SELECT;
/