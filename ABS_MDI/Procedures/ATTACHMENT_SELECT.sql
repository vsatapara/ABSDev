CREATE OR REPLACE PROCEDURE abs_mdi."ATTACHMENT_SELECT" (
    AttachmentId IN NUMBER,
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
 OPEN Output_Data FOR 
       SELECT 
        "AttachmentPath",
        "AttachmentName"
       FROM "Attachment" where "AttachmentId"=AttachmentId;
END ATTACHMENT_SELECT;
/