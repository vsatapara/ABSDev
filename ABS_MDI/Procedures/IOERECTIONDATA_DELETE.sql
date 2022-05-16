CREATE OR REPLACE PROCEDURE abs_mdi."IOERECTIONDATA_DELETE" 
(
	ProjectId IN NUMBER
)
AS 
BEGIN
      UPDATE "EDSPrice_IO_ErectionData"
	  SET	
		"IsDeleted" = 'Y'	
      WHERE
        "ProjectId" = ProjectId;
END IOErectionData_Delete;
/