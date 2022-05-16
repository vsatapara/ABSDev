CREATE OR REPLACE PROCEDURE abs_mdi."Groups_User_Add" 
(
    GroupId IN VARCHAR2,
    UserDetailId IN NUMBER,
    OutputId OUT NUMBER
)AS 
BEGIN
  INSERT INTO "Groups_Users"
     (
        "GroupId",
        "UserDetailId"    
     )
     VALUES
     (
        GroupId,
        UserDetailId
     )
     RETURNING "GroupUserId" into OutputId;
END "Groups_User_Add";
/