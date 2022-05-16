CREATE OR REPLACE PROCEDURE abs_mdi."CUSTOMER_LIST" 
(
    CompanyId IN  NUMBER,
    Out_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
   OPEN Out_Data FOR 
      SELECT 
        "CustomerID",
        "CustomerNo",
        "CustomerName",
        "IsDefault" as "IsDefaultCustomer",
        C."IsActive",
        "IsPrivateLabelBuilder",
        "EnforceSignatureRule",
        (select "UserDetailId" from "USR_UserDetail" where "CustomerNo" = cast(C."CustomerNo" as number) and "IsCustomerAdmin"='Y' and rownum=1 and "IsDelete"='N') as "UserDetailId"
      FROM "Customer" C
      where C."CompanyId" = CompanyId and C."IsDelete" = 'N'
     -- order by "CustomerID" desc
   FETCH FIRST 100 ROWS ONLY; 
END Customer_List;
/