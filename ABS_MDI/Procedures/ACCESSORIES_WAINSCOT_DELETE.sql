CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORIES_WAINSCOT_DELETE" 
(
    Id IN NUMBER
)
AS 
BEGIN
  UPDATE "Accesories_Wainscot"
    SET
       "IsDelete"='Y'
        WHERE
        "WainscotId" = Id;
END ACCESSORIES_WAINSCOT_DELETE;
/