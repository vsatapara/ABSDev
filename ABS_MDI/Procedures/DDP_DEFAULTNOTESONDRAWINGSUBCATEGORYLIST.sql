CREATE OR REPLACE PROCEDURE abs_mdi."DDP_DEFAULTNOTESONDRAWINGSUBCATEGORYLIST" (
 Output_Data OUT SYS_REFCURSOR
)AS 
BEGIN
 OPEN Output_Data FOR 
  select * from DDP_DEFAULTNOTESONDRAWINGSUBCATEGORY;
END DDP_DEFAULTNOTESONDRAWINGSUBCATEGORYLIST;
/