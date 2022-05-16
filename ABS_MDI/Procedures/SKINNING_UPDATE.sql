CREATE OR REPLACE PROCEDURE abs_mdi.SKINNING_UPDATE
(
SkinningID IN NUMBER,
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
LabelText IN VARCHAR

)
AS 
BEGIN
    UPDATE "Skinning" SET
        "ShowWelcomeText" = ShowWelcomeText,
        "ShowCompanyLogo" = ShowCompanyLogo,
        "ModifiedBy" = UserId,
        "ModifiedDate" = CURRENT_TIMESTAMP,
        "IpAddress" = IpAddress,
        "BrandColor" = BrandColor ,
		"Color1" = Color1,
		"Color2" = Color2,
		"Color3" = Color3,
		"Color4" = Color4,
		"Color5" = Color5,
		"White" = White,
		"NotificationRed" = NotificationRed,
		"DisabledState" = DisabledState,
		"NotesBackground" = NotesBackground,
		"NotesIcon" = NotesIcon,
		"LabelText" = LabelText
		
    WHERE "SkinningID" = SkinningID;    
  
END SKINNING_UPDATE;
/