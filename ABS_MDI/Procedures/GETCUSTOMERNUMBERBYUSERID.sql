CREATE OR REPLACE PROCEDURE abs_mdi."GETCUSTOMERNUMBERBYUSERID" 
(
    CompanyId IN NUMBER,
    UserId IN VARCHAR2,
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
   OPEN Output_Data FOR 
      SELECT c."CustomerNo" FROM "USR_UserDetail" ud 
      INNER JOIN "USR_Brand_Customer" ubc   
      ON ud."UserDetailId" = ubc."UserDetailId"
      INNER JOIN "Customer" c
      ON ubc."CustomerId" = c."CustomerID"
      WHERE ud."UserId" = UserId AND C."CompanyId" = CompanyId
      --WHERE ud."UserId" = UserId
      AND ud."IsActive"='Y'  AND ud."IsDelete"='N';
END GETCUSTOMERNUMBERBYUSERID;
/