CREATE OR REPLACE PROCEDURE abs_mdi."TEST_TABLE_DELETE" 
(
    UserId IN   NUMBER
)
AS 
BEGIN
delete from  "Test_Table"
WHERE
        "UserId" = UserId;
END TEST_TABLE_DELETE;
/