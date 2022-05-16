CREATE OR REPLACE PROCEDURE abs_mdi."CUSTOMERARCHIVEDFOLDER_CREATE" 
/*   Created ByMayuresh Jagtap
      Created Date  25 -3-2021
      Description   This stored Procedure used to insert  data into CustomerArchiveFolders  */
(
CustomerArchiveFolderGuid IN RAW,
CustomerId  IN NUMBER,
Folder_Name IN VARCHAR2,
ParentCustomerArchiveFolderGuid  IN RAW,
SortOrder  IN NUMBER,
CREATEDBY  IN NUMBER,
IPADDRESS IN VARCHAR2
)
AS
BEGIN
   INSERT INTO "CustomerArchiveFolders"
     (
     "CustomerArchiveFolderGuid",
    "CustomerId",
     "Name",
     "ParentCustomerArchiveFolderGuid",
     "SortOrder",
     "CREATEDBY", 
     "CREATEDDATE" ,   
     "MODIFIEDBY",
     "MODIFIEDDATE",
     "IPADDRESS"
       )
    VALUES
     (    
        CustomerArchiveFolderGuid,
        CustomerId,
        Folder_Name,
        ParentCustomerArchiveFolderGuid,
        SortOrder,
        CREATEDBY,
        CURRENT_TIMESTAMP,
        null,
        null,
        IPADDRESS
        );
END CUSTOMERARCHIVEDFOLDER_CREATE;
/