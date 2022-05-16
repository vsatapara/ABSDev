CREATE OR REPLACE PROCEDURE abs_mdi."USERDETAIL_CREATE" 
(
    UserGuid IN VARCHAR2,
    IsActive IN CHAR,
    ModuleName IN VARCHAR2,   
    IpAddress IN VARCHAR2,
    UserId IN NUMBER,
    MiddleName IN VARCHAR2,
    EmployeeNo IN NUMBER,
    CustomerNo IN NUMBER,
    IsRequireSignature IN CHAR,
    Notes IN VARCHAR2,
    IsCustomerAdmin IN CHAR,
    OutputId OUT NUMBER
)
AS 
BEGIN
    INSERT INTO "USR_UserDetail" 
    (
        "UserId",
        "IsActive",
        "ModuleName",
        "CreatedBy",
        "CreatedDate",
        "MiddleName",
        "EmployeeNo",
        "CustomerNo",
        "IsRequireSignature",
        "Notes",
        "IsCustomerAdmin"        
    ) 
    VALUES 
    (
        UserGuid,
        IsActive,    
        ModuleName,
        UserId,
        CURRENT_TIMESTAMP,
        MiddleName,
        EmployeeNo,
        CustomerNo,
        IsRequireSignature,
        Notes,
        IsCustomerAdmin
    )
    RETURNING "UserDetailId" into OutputId;
    
END USERDETAIL_CREATE;
/