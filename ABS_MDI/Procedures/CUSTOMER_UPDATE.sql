CREATE OR REPLACE PROCEDURE abs_mdi."CUSTOMER_UPDATE" 
(       
    CustomerId IN NUMBER,
	CustomerNo IN VARCHAR2,
	IsActive IN CHAR,
	IsPrivateLabelBuilder IN CHAR,
	EnforceSignatureRule IN CHAR,   
    IpAddress IN VARCHAR2,
    CompanyId IN  NUMBER,
    UserId IN NUMBER,
    UserDetailId IN NUMBER,
    PermissionGroupId IN NUMBER,
    BuilderAccessPermissionId IN NUMBER
)
AS 
BEGIN
    UPDATE "Customer" SET         
        "IsActive" = IsActive,
        "IsPrivateLabelBuilder" = IsPrivateLabelBuilder,
        "EnforceSignatureRule" = EnforceSignatureRule,
        "ModifiedBy" = UserId,
        "ModifiedDate" = CURRENT_TIMESTAMP,
        "IpAddress" = IpAddress
     WHERE 
        "CustomerID"=CustomerId;         
    
    delete from "USR_Brand_PermissionGroup" where "BrandId"=CompanyId and "UserDetailId"= UserDetailId;      
        
    insert into "USR_Brand_PermissionGroup"("PermissionGroupId","BrandId","UserDetailId","IsEnable")  values(PermissionGroupId,CompanyId,UserDetailId,'Y');  
           
    delete from "USR_PER_BuilderAccess" where "BrandId"=CompanyId and "UserDetailId"= UserDetailId;
    
    insert into "USR_PER_BuilderAccess"("BuilderAccessPermissionId","PermissionGroupId","BrandId","UserDetailId")  values(BuilderAccessPermissionId,PermissionGroupId,CompanyId,UserDetailId);
    
END Customer_Update;
/