CREATE OR REPLACE PROCEDURE abs_mdi."CUSTOMERARCHIVEDFOLDER_DELETE_TREE" 
/*   Created By Mayuresh Jagtap
      Created Date  25 -3-2021
      Description   This stored Procedure used to update  data into CustomerArchiveFolders  */
(
CustomerArchiveFolderGuid IN RAW,
ParentCustomerArchiveFolderGuid IN RAW,
MODIFIEDBY IN NUMBER
)
AS 
BEGIN
    UPDATE "CustomerArchiveFolders" SET
        "ISDELETE"='Y',
        "MODIFIEDBY"=ModifiedBy,
        "MODIFIEDDATE"=CURRENT_TIMESTAMP
    WHERE "CustomerArchiveFolderGuid"=CustomerArchiveFolderGuid;    
    UPDATE "CustomerArchiveFolders" SET
        "ParentCustomerArchiveFolderGuid"=ParentCustomerArchiveFolderGuid
    WHERE "ParentCustomerArchiveFolderGuid"=CustomerArchiveFolderGuid;
    ORDERAECHIVEFOLDER_DELETE_TREE@OE(ParentCustomerArchiveFolderGuid,CustomerArchiveFolderGuid);
END CUSTOMERARCHIVEDFOLDER_DELETE_TREE;
/