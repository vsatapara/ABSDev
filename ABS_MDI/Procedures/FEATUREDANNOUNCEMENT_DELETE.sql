CREATE OR REPLACE PROCEDURE abs_mdi."FEATUREDANNOUNCEMENT_DELETE" 
(
    FAnnouncementId IN NUMBER,
    ModifiedBy IN NUMBER
)AS 
BEGIN
UPDATE "FeaturedAnnouncements" SET
        "IsDelete"='Y',
        "ModifiedBy"=ModifiedBy,
        "ModifiedDate"=CURRENT_TIMESTAMP
      WHERE "FAnnouncementId"=FAnnouncementId;
END FeaturedAnnouncement_Delete;
/