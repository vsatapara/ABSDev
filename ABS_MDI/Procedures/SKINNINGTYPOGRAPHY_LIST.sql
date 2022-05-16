CREATE OR REPLACE PROCEDURE abs_mdi."SKINNINGTYPOGRAPHY_LIST" 
(
    SkinningId IN NUMBER,
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
    OPEN Output_Data FOR 
    SELECT
        "SkinningTypographyHeaderID",
        "Name",
        "T"."ItemText" as "Font",
        "T1"."ItemText" as "FontSize",
        "Color"
    FROM "SkinningTypographyHeader" SKH
    LEFT OUTER JOIN "SkinningTypographyDetail" SKD ON "SKD"."SkinningTypographyHeaderID" = "SKH"."ID" and "SKD"."SkinningID" = SkinningId
    LEFT OUTER JOIN "TableOfTables" T ON "T"."Id" = "SKD"."FontId"
    LEFT OUTER JOIN "TableOfTables" T1 ON "T1"."Id" = "SKD"."FontSizeId"
    order by SKH."ID" asc;
END SKINNINGTYPOGRAPHY_LIST;
/