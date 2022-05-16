CREATE OR REPLACE PROCEDURE abs_mdi."DDP_DEFAULTNOTEDRAWING_LIST" 
 /*   Created By    Banix Sheth
      Created Date   2-3-2021
      Description   This stored Procedure used to get the data IN DDP>Note on drawing  table DDP_DEFAULTNOTEDRAWING  */
(
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
    Order by dndc.ORDERPRIORITY, dndsc.ORDERPRIORITY;
END DDP_DEFAULTNOTEDRAWING_LIST;
/