CREATE OR REPLACE PROCEDURE abs_mdi."POLICYSTATEMENT_SELECT" 
(
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
 OPEN Output_Data FOR 
        SELECT 
            "PolicyStatementId",
            "Title",
            "Content",
            "FileId",
            AT."AttachmentName" as FileName,
            AT."AttachmentPath" as FilePath   
          FROM "PolicyStatement" P
          LEFT OUTER JOIN "Attachment" AT ON P."FileId" = AT."AttachmentId"
          WHERE ROWNUM=1;
END PolicyStatement_Select;
/