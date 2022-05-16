CREATE OR REPLACE PROCEDURE abs_mdi."DRAWINGSUBMITTAL_DELETE" 
(
	DrawingSubmittaleId IN NUMBER
)
AS 
BEGIN
      UPDATE "Drawing_SubmittalPackage"
	  SET	
		"IsDelete" = 'Y'	
      WHERE
        "DrawingSubmittaleId" = DrawingSubmittaleId;
END DRAWINGSUBMITTAL_DELETE;
/