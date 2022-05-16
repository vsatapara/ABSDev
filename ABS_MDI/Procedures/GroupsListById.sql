CREATE OR REPLACE PROCEDURE abs_mdi."GroupsListById" (
    UserDetailId in Number,
    Group_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
        OPEN Group_Data FOR 
        SELECT
            C."GroupId",
            C."GroupName",
            C."IsActive" as IsActive,
            (select "IsEnable" FROM "Groups_Users"  where "UserDetailId"=UserDetailId and rownum = 1) as IsEnable
        FROM
            "Groups" C        
        ORDER BY "UserDetailId" ASC; 
END GroupsListById;
/