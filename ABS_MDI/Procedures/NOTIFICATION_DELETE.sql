CREATE OR REPLACE PROCEDURE abs_mdi."NOTIFICATION_DELETE" 
(
    NotificationId IN NUMBER,
    ModifiedBy IN NUMBER
)
AS 
BEGIN
   UPDATE "Notification" SET
        "IsDelete"='Y',
        "ModifiedBy"=ModifiedBy,
        "ModifiedDate"=CURRENT_TIMESTAMP
    WHERE "NotificationId"=NotificationId;
END Notification_Delete;
/