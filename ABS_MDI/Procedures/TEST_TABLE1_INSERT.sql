CREATE OR REPLACE PROCEDURE abs_mdi."TEST_TABLE1_INSERT" 
(
  UserId IN NUMBER 
, Firstname IN VARCHAR2 
, Lastname IN VARCHAR2 
, Age IN NUMBER 
, Salary IN NUMBER 
, CompanyLogo IN NUMBER 
, UserImage IN NUMBER 
, IpAddress IN VARCHAR2 
, OutputId  OUT  NUMBER
) AS 
BEGIN
  INSERT INTO TEST_TABLE1 ("UserId","Firstname","Lastname","Age","Salary","CompanyLogo","UserImage","IpAddress") 
  VALUES (UserId,Firstname,Lastname,Age,Salary,CompanyLogo,UserImage,IpAddress)RETURNING "UserId" INTO OutputId;
  COMMIT;
END TEST_TABLE1_INSERT;
/