CREATE OR REPLACE PROCEDURE abs_mdi."PROGRAM_ERRORS" (
    Output_Data  OUT  SYS_REFCURSOR
) AS
BEGIN
    OPEN Output_Data FOR 
    SELECT
                             "Number",
                             "Message",
                             "Header"
                         FROM
                             "Program_Errors"
                         WHERE
                             "IsDelete" = 'N';
END PROGRAM_ERRORS;
/