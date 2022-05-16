CREATE OR REPLACE PROCEDURE abs_mdi."USERDETAIL_SELECT" 
(
/*   Modified By    Shreya Dhodi    
     Modified Date  23-09-2021
     Description    SS011-15133 Dashboard setting
*/
    UserId IN VARCHAR2,
    ModuleName IN VARCHAR2,   
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
 OPEN Output_Data FOR 
     SELECT 
        U."UserDetailId",
        "UserId",
        "EmployeeNo",
        "IsActive",
        "CustomerNo",
        "IsRequireSignature",
        "Notes",
        "MiddleName",
        "Orders",
        "Contacts",
        "Leads",
        "JobBoard",
        "UpcomingEvents",
        "Bookmarks",
        "GroupId",
        (select "CustomerName" from "Customer" where "CustomerNo" = cast(U."CustomerNo" as varchar(20)) and rownum=1) as CustomerName,
        (SELECT "BrandId" FROM "USR_Brand_PermissionGroup" where "UserDetailId"=U."UserDetailId" and rownum=1) as BrandId
      FROM "USR_UserDetail" U where U."UserId" = UserId and "IsDelete"='N';
END UserDetail_Select;
/