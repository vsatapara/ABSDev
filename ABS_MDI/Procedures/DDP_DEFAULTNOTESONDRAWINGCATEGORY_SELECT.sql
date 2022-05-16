CREATE OR REPLACE PROCEDURE abs_mdi."DDP_DEFAULTNOTESONDRAWINGCATEGORY_SELECT" 
 /*   Created By Foram Menpara
      Created Date   16-07-2021
      Description   This stored Procedure used to get the data from  table DDP_DEFAULTNOTESONDRAWINGCATEGORY  */
(
    V_CategoryId IN NUMBER,
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
 OPEN Output_Data FOR 
     SELECT   
      CATEGORYID, 
      CATEGORYNAME,
      ORDERPRIORITY,
      IPADDRESS
      FROM DDP_DEFAULTNOTESONDRAWINGCATEGORY  where CATEGORYID = V_CategoryId 
      and ISDELETE='N'; --and "ModuleName"=ModuleName;
END DDP_DEFAULTNOTESONDRAWINGCATEGORY_SELECT;
/