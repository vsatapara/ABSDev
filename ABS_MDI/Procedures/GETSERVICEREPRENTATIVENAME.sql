CREATE OR REPLACE PROCEDURE abs_mdi."GETSERVICEREPRENTATIVENAME" 
/*   Created By Ashlesha Diwate
      Created Date  18 -3-2021
      Description   This stored Procedure used to get the servive reprentative name from  CompanyContactUsDetail table by CompanyId from Customer  */
(
    CustomerId IN NUMBER,  
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
 OPEN Output_Data FOR 
   SELECT ccd."ServiceRepresentative" FROM "CompanyContactUsDetail" ccd inner join "Customer" c on c."CompanyId" = ccd."CompanyId" 
   where c."CustomerNo"=CustomerId;
END GETSERVICEREPRENTATIVENAME;
/