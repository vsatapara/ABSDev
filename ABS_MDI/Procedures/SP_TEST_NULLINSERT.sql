CREATE OR REPLACE PROCEDURE abs_mdi."SP_TEST_NULLINSERT" (
    FirstName IN VARCHAR2,
    LastName IN VARCHAR2 default null,
    City IN VARCHAR2 default null
 
) AS 
BEGIN
INSERT INTO "Test_NullInsert" ("FirstName","LastName")
    VALUES (FirstName,LastName);
END Sp_Test_NullInsert;
/