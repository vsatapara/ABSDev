CREATE OR REPLACE PROCEDURE abs_mdi.SKINNING_CREATE
(
CompanyID IN number,
ShowWelcomeText IN CHAR,
ShowCompanyLogo IN CHAR,
UserId IN NUMBER,
IpAddress IN VARCHAR,
BrandColor IN VARCHAR,
Color1 IN VARCHAR,
Color2 IN VARCHAR,
Color3 IN VARCHAR,
Color4 IN VARCHAR,
Color5 IN VARCHAR,
White IN VARCHAR,
NotificationRed IN VARCHAR,
DisabledState IN VARCHAR,
NotesBackground IN VARCHAR,
NotesIcon IN VARCHAR,
LabelText IN VARCHAR,
OutputId OUT NUMBER
)
AS 
BEGIN
    INSERT INTO "Skinning"
    (
        "CompanyID",
        "ShowWelcomeText",
        "ShowCompanyLogo",
        "CreatedBy",
        "CreatedDate",
        "IpAddress",
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
    ) 
    VALUES 
    (
        CompanyID,
        ShowWelcomeText,
        ShowCompanyLogo,
        UserId,
        CURRENT_TIMESTAMP,
        IpAddress,
        BrandColor,
		Color1,
		Color2,
		Color3,
		Color4,
		Color5,
		White,
		NotificationRed,
		DisabledState,
		NotesBackground,
		NotesIcon,
		LabelText
    )
    RETURNING "SkinningID" into OutputId;
    
END SKINNING_CREATE;
/