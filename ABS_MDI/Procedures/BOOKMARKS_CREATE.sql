CREATE OR REPLACE PROCEDURE abs_mdi."BOOKMARKS_CREATE" 
/*   Created By Mayuresh Jagtap
      Created Date  2 -2-2021
      Description   This stored Procedure used to insert data of bookmark order into Bookmarks table  */
(
    EntityId IN NVARCHAR2,
	UserGuid IN RAW,
	BookmarkType IN NUMBER,
	DisplayData IN NVARCHAR2,
	UserId IN NUMBER,
	IPAddress IN NVARCHAR2,
    OutputId OUT NUMBER
)
AS 
BEGIN
INSERT INTO "Bookmarks"
     (
		"UserGuid",
		"Type",
		"EntityId",
		"BookmarkDate",
		"DisplayData",
		"CREATEDBY",
		"CREATEDDATE",
        "MODIFIEDBY",
        "MODIFIEDDATE",
		"IPADDRESS"
     )
     VALUES
     (
        UserGuid,
		BookmarkType,
		EntityId,
		CURRENT_TIMESTAMP,
		DisplayData,
        UserId,
		CURRENT_TIMESTAMP,
        NULL,
        NULL,
		IPAddress
     )
     RETURNING "BookmarkId" into OutputId;   
END BOOKMARKS_CREATE;
/