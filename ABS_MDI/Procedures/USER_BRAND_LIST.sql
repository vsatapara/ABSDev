CREATE OR REPLACE PROCEDURE abs_mdi."USER_BRAND_LIST" (
/*   Modified By    Shreya Dhodi    
     Modified Date  14-10-2021
     Description   
*/
    UserId       IN   VARCHAR2,
    Output_Data  OUT  SYS_REFCURSOR
) 
AS
CustomerNo varchar2(20);
TotalCount number;
BEGIN
    
    --select count(*) into TotalCount from "USR_UserDetail" where "UserId" = UserId and "IsDelete"='N';
   -- if TotalCount != 0 then
   -- begin
   --     select cast(nvl("CustomerNo",0) as varchar2(20)) into CustomerNo from "USR_UserDetail" where "UserId" = UserId and rownum=1 and "IsDelete"='N';
  --  end;
   -- end if;
    OPEN Output_Data FOR 
            SELECT DISTINCT
                 C."CompanyId",
                 C."CompanyName",
                   C."CRMCompanyId",
                 --case nvl(CustomerNo,'') when '' then (SELECT "CustomerNo" FROM "Customer" where "CompanyId" = C."CompanyId" and "IsDefault"='Y' and rownum=1) 
                 --when '0' then (SELECT "CustomerNo" FROM "Customer" where "CompanyId" = C."CompanyId" and "IsDefault"='Y' and rownum=1) 
                 --else CustomerNo end as CustomerNo
                 case nvl("CustomerNo",0) when 0 then cast((SELECT "CustomerNo" FROM "Customer" where "CompanyId" = C."CompanyId" and "IsDefault"='Y' and rownum=1) as number)
                 else "CustomerNo" end as CustomerNo,
                 case nvl("CustomerNo",0) when 0 then (SELECT "CustomerName" FROM "Customer" where "CompanyId" = C."CompanyId" and "IsDefault"='Y' and rownum=1)
                 else '' end as CustomerName,
                 C."CompanyCode"
                 FROM
                      "Company" C
                 INNER JOIN "USR_PER_BuilderAccess"  UB ON C."CompanyId" = UB."BrandId"
                 INNER JOIN "USR_UserDetail"         UD ON UB."UserDetailId" = UD."UserDetailId"
                                                   AND UD."UserId" = UserId
                 where C."IsActive"='Y' and C."IsDelete" = 'N';                                  
END USER_BRAND_LIST;
/