CREATE OR REPLACE PROCEDURE abs_mdi."DDP_DEFAULTNOTEDRAWINGGETBYID_LIST" 
 /*   Created By    Foram Menpara
      Created Date   19-07-2021
      Description   This stored Procedure used to get the data By ID IN DDP>Note on drawing  table DDP_DEFAULTNOTEDRAWING  */
(
        V_CategoryId IN NUMBER ,
        V_SubCategoryId IN NUMBER,
        V_EdsKey IN NUMBER ,
        Output_Data OUT SYS_REFCURSOR
)AS 
BEGIN
 OPEN Output_Data FOR 
  SELECT
    dnd.notedrawingid,
    dnd.categoryid,
    dndc.categoryname,
    dnd.subcategoryid,
    dndsc.subcategoryname,
    dnd.edskey,
    dnd.ddpkey,
    dnd.description,
    dndc.ORDERPRIORITY AS "CategoryOrderPriority",
    dndsc.ORDERPRIORITY as "SubCategoryOrderPriority"
    --dnd.identifier as "Identifier"
FROM
    DDP_DEFAULTNOTEDRAWING  dnd   
    inner join DDP_DEFAULTNOTESONDRAWINGCATEGORY dndc  on dndc.categoryid = dnd.categoryid 
    inner join DDP_DEFAULTNOTESONDRAWINGSUBCATEGORY dndsc  on dndsc.subcategoryid = dnd.subcategoryid 
    where dnd.ISDELETE  = 'N' and  dndc.ISDELETE  = 'N' and  dndsc.ISDELETE  = 'N' 
    AND dnd.categoryid = V_CategoryId
    AND dnd.subcategoryid = V_SubCategoryId
    AND (V_EdsKey = 0 OR dnd.edskey = V_EdsKey)
    
    --AND (V_CategoryId = null OR dnd.categoryid = V_CategoryId)
    --AND (V_SubCategoryId = null OR dnd.subcategoryid = V_SubCategoryId)
    --AND (V_EdsKey = null OR dnd.edskey = V_EdsKey)
    Order by dndc.ORDERPRIORITY, dndsc.ORDERPRIORITY;

END DDP_DEFAULTNOTEDRAWINGGETBYID_LIST;
/