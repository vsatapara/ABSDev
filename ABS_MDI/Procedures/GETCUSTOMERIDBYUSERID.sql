CREATE OR REPLACE PROCEDURE abs_mdi."GETCUSTOMERIDBYUSERID" 
(
    UserId IN VARCHAR2,
    CompanyId In NUMBER,
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
      WHERE ud."UserId" = UserId and ubc."BrandId" = CompanyId
      AND ud."IsActive"='Y' AND ud."IsDelete"='N';
END GETCUSTOMERIDBYUSERID;
/