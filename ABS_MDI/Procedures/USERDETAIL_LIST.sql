CREATE OR REPLACE PROCEDURE abs_mdi."USERDETAIL_LIST" 
(
    ModuleName IN varchar2,
    BrandId IN number,
    CustomerNo IN number,
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
   OPEN Output_Data FOR 
      SELECT 
        distinct
        U."UserDetailId",
        "UserId",
        "IsActive",
        "EmployeeNo",
        "CustomerNo",
        "IsRequireSignature",
        "Notes",
        "MiddleName",         
        --(SELECT CONCAT(CONCAT(cast("CompanyId" as varchar2(10)),'$$'),"CompanyName") from "Company" where "CompanyId" = UBP."BrandId") as Brand,
        (SELECT "CompanyName" from "Company" where "CompanyId" = UBP."BrandId") as Brand,
        (SELECT SUBSTR (SYS_CONNECT_BY_PATH ("PermissionGrpName", ', '), 2)
              FROM (SELECT "PermissionGrpName" , ROW_NUMBER () OVER (ORDER BY "PermissionGrpName" ) rn,
                           COUNT (*) OVER () cnt
                      FROM "USR_Brand_PermissionGroup" UPB,"Permission" P
                      where "BrandId" = UBP."BrandId" and "PermissionGroupId"="PermissionId" and UPB."UserDetailId"=UBP."UserDetailId")
             WHERE rn = cnt
        START WITH rn = 1
        CONNECT BY rn = PRIOR rn + 1) as PermissionGroup,
        U."IsCustomerAdmin"
        
      FROM "USR_UserDetail" U
      LEFT OUTER JOIN "USR_Brand_PermissionGroup" UBP ON U."UserDetailId" = UBP."UserDetailId"
      WHERE "IsDelete"='N' and "UserId" is not null
      and ((BrandId = 0 and 1=1) or (BrandId != 0 and UBP."BrandId"=BrandId)) 
      and ((CustomerNo = 0 and 1=1) or (CustomerNo != 0 and U."CustomerNo"=CustomerNo))
      order by U."UserDetailId";
END USERDETAIL_LIST;
/