CREATE OR REPLACE PROCEDURE abs_mdi."GETCUSTOMERIDFROMUSERID_LIST" 
/*   Created By Mayuresh Jagtap
      Created Date  25 -3-2021
      Description   This stored Procedure used to get  data from USR_UserDetail by userID  */
(
    UserId IN VARCHAR2,
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
   OPEN Output_Data FOR 
      SELECT c."CustomerID" 
      FROM "USR_UserDetail" ud 
      INNER JOIN "Customer" c 
      ON TO_NCHAR(ud."CustomerNo") = c."CustomerNo"
      WHERE ud."UserId" = UserId 
      AND ud."IsActive"='Y'
      AND ud."IsDelete"='N';
END GETCUSTOMERIDFROMUSERID_LIST;
/