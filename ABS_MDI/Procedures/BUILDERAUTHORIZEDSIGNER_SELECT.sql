CREATE OR REPLACE PROCEDURE abs_mdi."BUILDERAUTHORIZEDSIGNER_SELECT" 
(
    BuilderId IN NUMBER,
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
  OPEN Output_Data FOR 
    SELECT 
        "UserId",
        "BuilderId",
        "Type",
        "UserName"
    FROM "BuilderAuthorizedSigner" where "BuilderId" = BuilderId;
END BuilderAuthorizedSigner_Select;
/