CREATE OR REPLACE PROCEDURE abs_mdi."MARKETINGADMIN_EXIST" (
    MarketingAdminId IN NUMBER,
    Title IN VARCHAR2,
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
IF MarketingAdminId = 0 then
 OPEN Output_Data FOR 
      SELECT 
       count(*)
      FROM "MarketingAdmin" WHERE LOWER("Title") = LOWER(Title) AND "IsDelete" != 'Y';
ELSE
 OPEN Output_Data FOR 
      SELECT 
       count(*)
      FROM "MarketingAdmin" WHERE LOWER("Title") = LOWER(Title) and "MarketingAdminId" != MarketingAdminId AND "IsDelete" != 'Y';
END IF;
END MARKETINGADMIN_EXIST;
/