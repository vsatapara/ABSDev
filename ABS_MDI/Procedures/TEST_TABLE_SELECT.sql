CREATE OR REPLACE PROCEDURE abs_mdi."TEST_TABLE_SELECT" 
(
    UserId    IN   NUMBER,
    UserData_Data OUT  SYS_REFCURSOR
)
AS 
BEGIN
OPEN UserData_Data FOR 
SELECT
    "UserId",
    "Firstname",
    "Lastname",
    "Age",
    "Salary",
    "CompanyLogo",
    "UserImage",
    "IpAddress"
FROM
    "Test_Table";
END TEST_TABLE_SELECT;
/