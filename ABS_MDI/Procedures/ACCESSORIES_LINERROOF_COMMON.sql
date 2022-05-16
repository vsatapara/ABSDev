CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORIES_LINERROOF_COMMON" 
(
 LinerRoof_Common_Data  OUT  SYS_REFCURSOR
) AS 
BEGIN
 OPEN LinerRoof_Common_Data FOR SELECT  
                                    "OptionId",
                                    "Category",
                                    "SubCategory",
                                    "CategoryValue",
                                    "DisplayOrder"
                                    FROM "Accessories_Liner_Roof_Master";                                
END ACCESSORIES_LINERROOF_COMMON;
/