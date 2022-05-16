CREATE OR REPLACE PROCEDURE abs_mdi."TERMSCONDITIONS_SELECT" 
(
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
 OPEN Output_Data FOR 
        SELECT 
            "TermsConditionsId",
            "Title",
            "Content",
            "FileId",
            AT."AttachmentName" as FileName,
            AT."AttachmentPath" as FilePath  
          FROM "TermsConditions" T
          LEFT OUTER JOIN "Attachment" AT ON T."FileId" = AT."AttachmentId"
          WHERE ROWNUM=1;
END TermsConditions_Select;
/