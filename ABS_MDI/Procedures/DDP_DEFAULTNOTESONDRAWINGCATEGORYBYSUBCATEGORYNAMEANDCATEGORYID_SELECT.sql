CREATE OR REPLACE PROCEDURE abs_mdi."DDP_DEFAULTNOTESONDRAWINGCATEGORYBYSUBCATEGORYNAMEANDCATEGORYID_SELECT" 
 /*   Created By Foram Menpara
      Created Date   19-07-2021
      Description   This stored Procedure used to get the data from  table DDP_DEFAULTNOTESONDRAWINGSUBCATEGORY By CATEGORYID And SUBCATEGORYNAME  */
(
    V_CategoryId IN NUMBER,
    V_SubCategoryName IN VARCHAR2,
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
 OPEN Output_Data FOR 
     SELECT   
      ORDERPRIORITY,
      CATEGORYID,
      SUBCATEGORYNAME,
      SUBCATEGORYID
      FROM DDP_DEFAULTNOTESONDRAWINGSUBCATEGORY  where LOWER(SUBCATEGORYNAME) = LOWER(V_SubCategoryName) and CATEGORYID = V_CategoryId
      and ISDELETE='N'; --and "ModuleName"=ModuleName;
END DDP_DefaultNotesonDrawingCategoryBySubCategoryNameAndCategoryId_SELECT;
/