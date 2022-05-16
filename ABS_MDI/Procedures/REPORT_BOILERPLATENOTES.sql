CREATE OR REPLACE PROCEDURE abs_mdi."REPORT_BOILERPLATENOTES" 
(
Output_Notes_Data OUT SYS_REFCURSOR
)
AS
BEGIN
OPEN Output_Notes_Data FOR  SELECT "ID",
"Note"
FROM "M_EDSPrice_Program_BoilerPlateNotes";
END Report_BoilerPlateNotes;
/