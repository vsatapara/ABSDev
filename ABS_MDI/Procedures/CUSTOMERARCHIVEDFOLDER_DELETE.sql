CREATE OR REPLACE PROCEDURE abs_mdi."CUSTOMERARCHIVEDFOLDER_DELETE" 
/*   Created ByMayuresh Jagtap
      Created Date  25 -3-2021
      Description   This stored Procedure used to update  data into CustomerArchiveFolders  */
(
CustomerArchiveFolderGuid IN RAW,
MODIFIEDBY IN NUMBER
)
AS 
BEGIN
   UPDATE "CustomerArchiveFolders" SET
        "ISDELETE"='Y',
        "MODIFIEDBY"=ModifiedBy,
        "MODIFIEDDATE"=CURRENT_TIMESTAMP
    WHERE "CustomerArchiveFolderGuid"=CustomerArchiveFolderGuid;
END CUSTOMERARCHIVEDFOLDER_DELETE;
/