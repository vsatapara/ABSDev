CREATE OR REPLACE PROCEDURE abs_mdi."ADDLINES_DELETE" 
(
    Guid IN RAW
)
AS 
BEGIN
--NetAddLines
     DELETE FROM "Input_NetAddLineDetails" WHERE "Guid"=Guid;
     
--AddLines
     DELETE FROM "Input_AddLines" WHERE "Guid"=Guid;
END AddLines_Delete;
/