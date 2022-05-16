CREATE OR REPLACE PROCEDURE abs_mdi."CUSTOMERARCHIVEDFOLDER_UPDATE" 
/*   Created By Mayuresh Jagtap
      Created Date  25 -3-2021
      Description   This stored Procedure used to update  data into CustomerArchiveFolders by using CustomerArchiveFolderGuid */
(
CustomerArchiveFolderGuid IN RAW,
CustomerId  IN NUMBER,
Folder_Name IN VARCHAR2,
ParentCustomerArchiveFolderGuid  IN RAW,
SortOrder  IN NUMBER,
MODIFIEDBY  IN NUMBER,
IPADDRESS IN VARCHAR2
 
)AS 
BEGIN
   UPDATE "CustomerArchiveFolders" SET
       
        "CustomerId"=CustomerId,
        "Name"=Folder_Name,
        "ParentCustomerArchiveFolderGuid"=ParentCustomerArchiveFolderGuid,
        "SortOrder"=SortOrder,       
        "IPADDRESS"=IPADDRESS, 
        "MODIFIEDBY"=MODIFIEDBY,
        "MODIFIEDDATE"=CURRENT_TIMESTAMP
    WHERE "CustomerArchiveFolderGuid"=CustomerArchiveFolderGuid;
END CUSTOMERARCHIVEDFOLDER_UPDATE;
/