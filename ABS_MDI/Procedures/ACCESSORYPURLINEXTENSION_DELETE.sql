CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORYPURLINEXTENSION_DELETE" (
    PurlinExtensionId IN NUMBER,
    UserId IN NUMBER
)
AS 
BEGIN
   UPDATE "Accesories_PurlinExtensions" SET
        "IsDelete"='Y',
        "ModifiedBy"=UserId,
        "ModifiedDate"=CURRENT_TIMESTAMP
    WHERE "PurlinExtensionId"=PurlinExtensionId;
END ACCESSORYPURLINEXTENSION_DELETE;
/