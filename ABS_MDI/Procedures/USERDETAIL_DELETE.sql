CREATE OR REPLACE PROCEDURE abs_mdi."USERDETAIL_DELETE" 
(
    UserId IN varchar2,
    BrandId IN number,
    ModuleName IN varchar2,
    ModifiedBy IN NUMBER,
    OutputId OUT NUMBER
)
IS  
UserDetailId number;
TotalCount number;
BEGIN
select count(*) into TotalCount from "USR_UserDetail" where "UserId" = UserId and "IsDelete"='N';
if TotalCount != 0 then
begin
    select "UserDetailId" into UserDetailId from "USR_UserDetail" where "UserId" = UserId and rownum=1 and "IsDelete"='N';
    OutputId := 0;
    IF BrandId != 0 then    
        delete from "USR_PER_BuilderAccess" where "BrandId"=BrandId and "UserDetailId"= UserDetailId;
        delete from "USR_Brand_PermissionGroup" where "BrandId"=BrandId and "UserDetailId"= UserDetailId;  
        select count(*) into OutputId from "USR_Brand_PermissionGroup" where "BrandId" != BrandId  and "UserDetailId"= UserDetailId;   
        if OutputId = 0 then 
        begin
            OutputId := 2;
            UPDATE "USR_UserDetail" 
            SET "IsDelete"='Y', "ModifiedBy"=ModifiedBy, "ModifiedDate"=CURRENT_TIMESTAMP 
            WHERE "UserId"= UserId; --and "ModuleName"=ModuleName;   
        end;  
        ELSIF OutputId != 0 then
            OutputId := 1;
        END IF;
    ELSE      
      begin
            OutputId := 2;
            UPDATE "USR_UserDetail" 
            SET "IsDelete"='Y', "ModifiedBy"=ModifiedBy, "ModifiedDate"=CURRENT_TIMESTAMP 
            WHERE "UserId"= UserId; --and "ModuleName"=ModuleName; 
       end;
    END IF;
end;
else
begin
    OutputId := 2;
end; 
end if;
END UserDetail_Delete;
/