CREATE OR REPLACE PROCEDURE abs_mdi."XX_DEFAULTNOTEDRAWING_SELECT" 
(
XX_CategoryId IN NUMBER,
XX_SubcategoryId IN NUMBER,
Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
 OPEN Output_Data FOR 
     SELECT 
      NOTEDRAWINGID , 
      SUBCATEGORYID,  
      CATEGORYID,  
      DESCRIPTION       
      FROM DDP_DEFAULTNOTEDRAWING 
      where 
      CATEGORYID = XX_CategoryId 
      and SUBCATEGORYID = XX_SubcategoryId 
      and ISDELETE='N';
END XX_DEFAULTNOTEDRAWING_SELECT;
/