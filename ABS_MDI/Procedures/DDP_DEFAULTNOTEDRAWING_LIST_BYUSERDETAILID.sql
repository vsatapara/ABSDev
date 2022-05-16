CREATE OR REPLACE PROCEDURE abs_mdi."DDP_DEFAULTNOTEDRAWING_LIST_BYUSERDETAILID" 
 /*   Created By    Ashlesha Diwate
      Created Date   25-5-2021
      Description   This stored Procedure used in the DDP and it will be used bind DDP > Notes on Drawing Data    */
( 
par_userDetailID IN Number,
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
    CASE when  dndc.categoryname = 'Custom'  THEN 
    (select   CustomNote from DDP_UserCustomNotes where UserDetailId = par_userDetailID and rownum = 1 and isdelete='N' ) 
    else
      dnd.description   
     END  description ,
    dndc.ORDERPRIORITY AS "CategoryOrderPriority",
    dndsc.ORDERPRIORITY as "SubCategoryOrderPriority"
    --dnd.identifier as "Identifier"
    
FROM
    
    DDP_DEFAULTNOTEDRAWING  dnd   
    inner join DDP_DEFAULTNOTESONDRAWINGCATEGORY dndc  on dndc.categoryid = dnd.categoryid 
    inner join DDP_DEFAULTNOTESONDRAWINGSUBCATEGORY dndsc  on dndsc.subcategoryid = dnd.subcategoryid
    where dnd.ISDELETE  = 'N' Order by dnd.categoryid, dnd.subcategoryid;
    
    
END DDP_DEFAULTNOTEDRAWING_LIST_BYUSERDETAILID;
/