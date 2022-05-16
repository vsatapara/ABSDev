CREATE OR REPLACE PROCEDURE abs_mdi."NETADDLINEDETAILS_DELETE" 
(
    Guid IN RAW DEFAULT NULL
)
AS 
BEGIN
     DELETE FROM "Input_NetAddLineDetails"
     WHERE "Guid"=Guid;
END NetAddLineDetails_Delete;
/