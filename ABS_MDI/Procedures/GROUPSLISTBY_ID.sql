CREATE OR REPLACE PROCEDURE abs_mdi."GROUPSLISTBY_ID" (
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
            NVL((select "IsEnable" FROM "Groups_Users" where "GroupId" = C."GroupId" And "UserDetailId"=UserDetailId and rownum = 1),'N') as IsEnable
           
        FROM
            "Groups" C ;
END GroupsListBy_Id;
/