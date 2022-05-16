CREATE OR REPLACE PROCEDURE abs_mdi."BOOKMARKS_DELETE" 
/*   Created By Mayuresh Jagtap
      Created Date  2 -2-2021
      Description   This stored Procedure used to delete data of bookmark order into Bookmarks table  */
(
    EntityId IN NVARCHAR2,
	UserGuid IN RAW,
	BookmarkType IN NUMBER,
    ModifiedBy IN NUMBER,
    IPAddress IN NVARCHAR2
)
AS 
BEGIN
UPDATE "Bookmarks" SET
    "ISDELETE"='Y', 
    "MODIFIEDBY"= ModifiedBy, 
    "MODIFIEDDATE"= CURRENT_TIMESTAMP,
    "IPADDRESS"=IPAddress
       WHERE "EntityId"=EntityId 
	   AND "UserGuid"=UserGuid 
	   AND "Type"= BookmarkType;	   
END BOOKMARKS_DELETE;
/