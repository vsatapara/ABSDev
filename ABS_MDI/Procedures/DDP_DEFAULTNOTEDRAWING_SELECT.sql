CREATE OR REPLACE PROCEDURE abs_mdi."DDP_DEFAULTNOTEDRAWING_SELECT" 
 /*   Created By Ashlesha Diwate
      Created Date   2-3-2021
      Description   This stored Procedure used to get the data from  table DDP_DEFAULTNOTEDRAWING  */
(
V_CategoryId IN NUMBER,
V_SubcategoryId IN NUMBER,
Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
 OPEN Output_Data FOR 
     SELECT 
      NOTEDRAWINGID, 
      SUBCATEGORYID,  
      CATEGORYID,  
      DESCRIPTION,
      EDSKEY
      FROM DDP_DEFAULTNOTEDRAWING  where CATEGORYID = V_CategoryId 
      and SUBCATEGORYID = V_SubcategoryId 
      and ISDELETE='N'; --and "ModuleName"=ModuleName;
END DDP_DEFAULTNOTEDRAWING_SELECT;
/