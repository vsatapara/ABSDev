CREATE OR REPLACE PROCEDURE abs_mdi."IMPERSONATEUSER_LIST" 
(
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
    OPEN Output_Data FOR 
      SELECT 
        "UserName",
        "IsActive",
        "FirstName",
        "LastName",
        "IsLocked"
      FROM "UserManagement";
END ImpersonateUser_List;
/