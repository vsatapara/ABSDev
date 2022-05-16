CREATE OR REPLACE PROCEDURE abs_mdi."DDP_DEFAULTNOTESONDRAWINGCATEGORY_INSERT" 
/*   Created By Foram Menpara
      Created Date   16-07-2021
      Description   This stored Procedure used to INSERT the data  in  table DDP_DEFAULTNOTESONDRAWINGCATEGORY  */
(
    V_CATEGORYNAME IN VARCHAR2,
   -- V_ORDERPRIORITY IN NUMBER,
   V_UserId IN NUMBER, 
   V_IPADDRESS IN VARCHAR2,
    OutputId OUT NUMBER
) AS
BEGIN
    INSERT INTO "DDP_DEFAULTNOTESONDRAWINGCATEGORY"(
        "CATEGORYNAME",
        "ORDERPRIORITY",
        "CREATEDBY",
        "CREATEDDATE",
        "IPADDRESS"
    ) 
VALUES 
	(
     V_CATEGORYNAME,
     (select max("ORDERPRIORITY") + 1 from "DDP_DEFAULTNOTESONDRAWINGCATEGORY"),
     V_UserId,
     CURRENT_TIMESTAMP,
     V_IPADDRESS
    )	 RETURNING "CATEGORYID" into OutputId;
END DDP_DEFAULTNOTESONDRAWINGCATEGORY_INSERT;
/