CREATE OR REPLACE PROCEDURE abs_mdi.Skinning_Select
(
    CompanyID IN NUMBER,
    Output_Model OUT SYS_REFCURSOR,
    Output_List OUT SYS_REFCURSOR
)
AS
GetSkinningID Number;
TotalCount number;
BEGIN

    OPEN Output_Model FOR 
    SELECT
        "SkinningID",
        "CompanyID",
        "ShowWelcomeText",
        "ShowCompanyLogo",
        "BrandColor",
		"Color1",
		"Color2",
		"Color3",
		"Color4",
		"Color5",
		"White",
		"NotificationRed",
		"DisabledState",
		"NotesBackground",
		"NotesIcon",
		"LabelText"
		
    FROM "Skinning"    
    WHERE "CompanyID" = CompanyID;    

    select COUNT(*) INTO TotalCount FROM "Skinning" WHERE "CompanyID" = CompanyID;

    IF TotalCount != 0 then
        select "SkinningID" INTO GetSkinningID FROM "Skinning" WHERE "CompanyID" = CompanyID AND ROWNUM=1;
    ELSE
        GetSkinningID := 0;
    END IF;

    OPEN Output_List FOR 
    SELECT
        "SKH".ID as "SkinningTypographyHeaderID",
        "Name",
        "SKD"."FontId",
        "SKD"."FontSizeId",
        "T"."ItemText" as "Font",
        "T1"."ItemText" as "FontSize",
        "Color",
        "SkinningID"
    FROM "SkinningTypographyHeader" SKH
    LEFT OUTER JOIN "SkinningTypographyDetail" SKD ON "SKD"."SkinningTypographyHeaderID" = "SKH"."ID" and "SKD"."SkinningID" = GetSkinningID
    LEFT OUTER JOIN "TableOfTables" T ON "T"."Id" = "SKD"."FontId"
    LEFT OUTER JOIN "TableOfTables" T1 ON "T1"."Id" = "SKD"."FontSizeId"
    order by SKH."ID" asc;
END Skinning_Select;
/