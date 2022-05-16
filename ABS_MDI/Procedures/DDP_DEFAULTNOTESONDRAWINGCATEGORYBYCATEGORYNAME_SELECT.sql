CREATE OR REPLACE PROCEDURE abs_mdi."DDP_DEFAULTNOTESONDRAWINGCATEGORYBYCATEGORYNAME_SELECT" 
 /*   Created By Foram Menpara
      Created Date   19-07-2021
      Description   This stored Procedure used to get the data from  table DDP_DEFAULTNOTESONDRAWINGCATEGORY by CATEGORYNAME */
(
    V_CategoryName IN VARCHAR2,
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
 OPEN Output_Data FOR 
     SELECT   
      ORDERPRIORITY,
      CATEGORYID,
      CATEGORYNAME
      FROM DDP_DEFAULTNOTESONDRAWINGCATEGORY  where LOWER(CATEGORYNAME) = LOWER(V_CategoryName)
      and ISDELETE = 'N'; --and "ModuleName"=ModuleName;
END DDP_DefaultNotesonDrawingCategoryByCategoryName_SELECT;
/