CREATE OR REPLACE PROCEDURE abs_mdi."BUILDERNEWS_DELETE" 
(
   BuilderNewsId IN NUMBER,
   ModifiedBy IN NUMBER
)
AS 
BEGIN
   UPDATE "BuilderNews"
	SET "IsDelete" = 'Y',"ModifiedBy" = ModifiedBy
	WHERE "BuilderNewsId" = BuilderNewsId;
END BuilderNews_Delete;
/