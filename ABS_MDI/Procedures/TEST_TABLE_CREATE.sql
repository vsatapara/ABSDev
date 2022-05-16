CREATE OR REPLACE PROCEDURE abs_mdi."TEST_TABLE_CREATE" 
(
    Firstname IN VARCHAR2,
    Lastname IN VARCHAR2,
    Age IN   NUMBER,
    Salary IN   NUMBER,
    CompanyLogo IN NUMBER,
    UserImage IN NUMBER,
    IpAddress IN VARCHAR2,
    OutputId OUT NUMBER
)
AS 
BEGIN
INSERT INTO "Test_Table" 
(
    "Firstname",
    "Lastname",
    "Age",
    "Salary",
    "CompanyLogo",
    "UserImage",
    "IpAddress"
) 
VALUES 
(
    Firstname,
    Lastname,
    Age,
    Salary,
    10000,
    13,
    5    
)RETURNING "UserId" into OutputId;
END TEST_TABLE_CREATE;
/