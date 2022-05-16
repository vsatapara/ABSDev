CREATE OR REPLACE PROCEDURE abs_mdi."DDP_DEFAULTNOTESONDRAWINGSUBCATEGORY_UPDATE" 
 /*   Created By Foram Menpara
      Created Date   16-07-2021
      Description   This stored Procedure used to update the data  in  table DDP_DEFAULTNOTESONDRAWINGSUBCATEGORY  */
(
    V_SUBCATEGORYID IN NUMBER,
    V_SUBCATEGORYNAME IN VARCHAR2,
     --V_ORDERPRIORITY IN NUMBER,
     V_UserId IN NUMBER, 
     V_IPADDRESS IN VARCHAR2
)AS 
BEGIN
   UPDATE  DDP_DEFAULTNOTESONDRAWINGSUBCATEGORY SET
               SUBCATEGORYNAME = V_SUBCATEGORYNAME,
               --ORDERPRIORITY = V_ORDERPRIORITY,
               MODIFIEDBY = V_UserId,
               MODIFIEDDATE=  CURRENT_TIMESTAMP,
            IPADDRESS=V_IPADDRESS
        WHERE SUBCATEGORYID = V_SUBCATEGORYID AND ISDELETE = 'N';
END DDP_DEFAULTNOTESONDRAWINGSUBCATEGORY_UPDATE;
/