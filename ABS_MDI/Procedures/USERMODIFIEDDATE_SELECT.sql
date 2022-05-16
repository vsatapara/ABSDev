CREATE OR REPLACE PROCEDURE abs_mdi."USERMODIFIEDDATE_SELECT" (
    UserId IN VARCHAR2, 
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
  OPEN Output_Data FOR 
     SELECT 
     
        "UserDetailId", "ModifiedDate", "CustomerNo"
      FROM "USR_UserDetail" where "UserId" = UserId and "IsDelete"='N';
END USERMODIFIEDDATE_SELECT;
/