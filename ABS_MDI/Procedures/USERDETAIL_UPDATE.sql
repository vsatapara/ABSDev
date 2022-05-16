CREATE OR REPLACE PROCEDURE abs_mdi."USERDETAIL_UPDATE" 
( 
/*   Modified By    Shreya Dhodi    
     Modified Date  23-09-2021
     Description    SS011-15133 Dashboard setting
     Modified By    Narendra Desai    
     Modified Date  25-09-2021
     Description    Updated by with current user login
*/
    UserDetailId IN NUMBER,
    IsActive IN CHAR,   
    EmployeeNo IN NUMBER,
    CustomerNo IN NUMBER,
    IsRequireSignature IN CHAR,
    Notes IN VARCHAR2, 
    MiddleName IN VARCHAR2,
    Orders IN CHAR,
    Contacts IN CHAR,
    Leads IN CHAR,
    JobBoard IN CHAR,
    UpcomingEvents IN CHAR,
    Bookmarks IN CHAR,
    UserId IN NUMBER
)
AS 
BEGIN
    UPDATE "USR_UserDetail"  SET   
        "EmployeeNo" = EmployeeNo,
        "ModifiedBy" = UserId, 
        "ModifiedDate" = CURRENT_TIMESTAMP,
        "CustomerNo" = CustomerNo,
        "IsRequireSignature" = IsRequireSignature,
        "Notes" = Notes,
        "MiddleName" = MiddleName,
        "Orders" = Orders,
        "Contacts" = Contacts,
        "Leads" = Leads,
        "JobBoard" = JobBoard,
        "UpcomingEvents" = UpcomingEvents,
        "Bookmarks" = Bookmarks
   WHERE "UserDetailId" = UserDetailId;
   
END USERDETAIL_UPDATE;
/