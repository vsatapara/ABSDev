CREATE OR REPLACE PROCEDURE abs_mdi."SKINNING_EXIST" 
(
CompanyID IN number,
Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
   OPEN Output_Data FOR 
       SELECT 
        nvl(max("SkinningID"),0)       
      FROM "Skinning" where "CompanyID"=CompanyID;
END SKINNING_EXIST;
/