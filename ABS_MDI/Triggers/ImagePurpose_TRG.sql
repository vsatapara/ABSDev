CREATE OR REPLACE TRIGGER abs_mdi."ImagePurpose_TRG" 
BEFORE INSERT OR UPDATE ON abs_mdi."ImagePurpose" 
FOR EACH ROW 
BEGIN
    IF INSERTING THEN
      <<COLUMN_SEQUENCES>>
      BEGIN
        IF INSERTING AND :NEW."ImagePurposeId" IS NULL THEN
          SELECT "ImagePurpose_SEQ".NEXTVAL INTO :NEW."ImagePurposeId" FROM SYS.DUAL;
        END IF;
      END COLUMN_SEQUENCES;
    END IF;

    IF UPDATING THEN
        IF (:old."Name" != :new."Name") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'ImagePurpose','Name', :old."Name", :new."Name",:new."IpAddress"); 
        END IF;
        IF (:old."PreferredPixelsWidth" != :new."PreferredPixelsWidth") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'ImagePurpose','PreferredPixelsWidth', :old."PreferredPixelsWidth", :new."PreferredPixelsWidth",:new."IpAddress"); 
        END IF;
        IF (:old."PreferredPixelHeight" != :new."PreferredPixelHeight") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'ImagePurpose','PreferredPixelHeight', :old."PreferredPixelHeight", :new."PreferredPixelHeight",:new."IpAddress"); 
        END IF;
        IF (:old."IsActive" != :new."IsActive") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'ImagePurpose','IsActive', :old."IsActive", :new."IsActive",:new."IpAddress"); 
        END IF;
    END IF;
END;



/