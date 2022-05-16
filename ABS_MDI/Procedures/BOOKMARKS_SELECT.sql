CREATE OR REPLACE PROCEDURE abs_mdi."BOOKMARKS_SELECT" 
/*   Created By Mayuresh Jagtap
      Created Date  2 -2-2021
      Description   This stored Procedure used to get data of bookmark order from Bookmarks table  */
(
	UserGuid IN RAW,
	BookmarkType IN NUMBER,
    EntityId IN NVARCHAR2 :='0',
    Output_Data OUT SYS_REFCURSOR
    )
AS  
BEGIN
 OPEN Output_Data FOR 
       SELECT 
       "BookmarkId",
	   "Type",
       "UserGuid",
	   "BookmarkDate",
	   "DisplayData",
	   "IPADDRESS"
       FROM "Bookmarks"
	   WHERE "UserGuid"= UserGuid AND  "ISDELETE" = 'N' AND
       "Type"= BookmarkType
       AND ((EntityId = '0' and 1=1 ) OR (EntityId != '0'  and "EntityId" = EntityId));
END BOOKMARKS_SELECT;
/