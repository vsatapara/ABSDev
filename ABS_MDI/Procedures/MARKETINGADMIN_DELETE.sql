CREATE OR REPLACE PROCEDURE abs_mdi."MARKETINGADMIN_DELETE" 
(
   MarketingAdminId IN NUMBER,
   UserId IN NUMBER
)
AS 
BEGIN
   UPDATE "MarketingAdmin"
	SET "IsDelete" = 'Y',"ModifiedBy" = UserId
	WHERE "MarketingAdminId" = MarketingAdminId;
END MarketingAdmin_Delete;
/