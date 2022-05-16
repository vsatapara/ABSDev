CREATE OR REPLACE PROCEDURE abs_mdi."TEST_TABLE_UPDATE" 
(
    UserId IN   NUMBER,
    Firstname IN VARCHAR2,
    Lastname IN VARCHAR2,
    Age IN   NUMBER,
    Salary IN   NUMBER
)
AS 
BEGIN
UPDATE "Test_Table"
SET
     "Firstname" = Firstname,
     "Lastname" = Lastname,
     "Age" = Age,
     "Salary" = Salary
WHERE
        "UserId" = UserId;
END TEST_TABLE_UPDATE;
/