CREATE OR REPLACE PROCEDURE abs_mdi."TESTTABLE_FILES" 
(
    UserId IN NUMBER,
    CompanyLogo IN VARCHAR2,
    UserImage IN VARCHAR2
)
AS 
BEGIN
    UPDATE "Test_Table" 
    SET
        "CompanyLogo"=CompanyLogo,
        "UserImage"=UserImage
    WHERE "UserId"=UserId ;
END TestTable_Files;
/