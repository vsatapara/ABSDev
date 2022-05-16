CREATE OR REPLACE PROCEDURE abs_mdi."PROJECTREASSIGNMENT_SELECT" 
(
    UserId IN NUMBER,
    Output_Project OUT SYS_REFCURSOR,
    Output_ProjectUser OUT SYS_REFCURSOR
)
AS 
BEGIN
 OPEN Output_Project FOR 
        SELECT 
            "ProjectId",
            "ProjectName",
            "BuildingsCount",
            "BuildingLocation",
            "ProjectStatus",
            to_char("ExpiryDate",'MM/DD/YYYY') "ExpiryDate",
           "Price"
        FROM "Project";
    OPEN Output_ProjectUser FOR 
        SELECT 
           "ProjectUserId",
            "UserId",
            "ProjectId"
        FROM "ProjectUser"
        WHERE "UserId"=UserId;
END PROJECTREASSIGNMENT_SELECT;
/