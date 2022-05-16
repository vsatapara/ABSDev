CREATE OR REPLACE PROCEDURE abs_mdi."DDP_DEFAULTNOTESONDRAWINGCATEGORYLIST" 
/*   Created By Ashlesha Diwate
      Created Date   2-3-2021
      Description   This stored Procedure used to get data of subcategory by categoryid from DDP_DEFAULTNOTESONDRAWINGSUBCATEGORY table and category from DDP_DEFAULTNOTESONDRAWINGCATEGORY table   */
(
 Output_Data_Category OUT SYS_REFCURSOR,
 Output_Data_SubCategory OUT SYS_REFCURSOR
)AS 
BEGIN
 
  
  OPEN Output_Data_SubCategory FOR 
  SELECT sc.CategoryId, sc.SubCategoryName, sc.SubcategoryId, d.Description,d.NOTEDRAWINGID  from DDP_DEFAULTNOTESONDRAWINGSUBCATEGORY sc
 left join DDP_DEFAULTNOTEDRAWING d on  d.SUBCATEGORYID = sc.SUBCATEGORYID
 left join DDP_DEFAULTNOTESONDRAWINGCATEGORY c on c.CATEGORYID=SC.CATEGORYID where sc.ISDELETE='N' order by Sc.categoryId ;
  
  OPEN Output_Data_Category FOR 
 select CATEGORYID,CATEGORYNAME from DDP_DEFAULTNOTESONDRAWINGCATEGORY where ISDELETE='N' and CATEGORYNAME!='Custom' order by CATEGORYNAME ;
  
END DDP_DEFAULTNOTESONDRAWINGCATEGORYLIST;
/