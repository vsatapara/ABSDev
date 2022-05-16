CREATE OR REPLACE PROCEDURE abs_mdi."DDP_DEFAULTNOTESONDRAWINGCATEGORYBYSUBCATEGORYNAME_SELECT" 
 /*   Created By Foram Menpara
      Created Date   19-07-2021
      Description   This stored Procedure used to get the data from  table DDP_DEFAULTNOTESONDRAWINGSUBCATEGORY by SUBCATEGORYNAME */
(
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
      SUBCATEGORYID,
      IPADDRESS
      FROM DDP_DEFAULTNOTESONDRAWINGSUBCATEGORY  where SUBCATEGORYNAME = V_SubCategoryName
      and ISDELETE = 'N'; --and "ModuleName"=ModuleName;
END DDP_DefaultNotesonDrawingCategoryBySubCategoryName_SELECT;
/