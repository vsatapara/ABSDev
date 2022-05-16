CREATE OR REPLACE TRIGGER abs_mdi."CartingType_TRG" 
BEFORE INSERT OR UPDATE ON abs_mdi."CartingType" 
FOR EACH ROW 
BEGIN
    IF INSERTING THEN
      <<COLUMN_SEQUENCES>>
      BEGIN
        IF INSERTING AND :NEW."CartingTypeId" IS NULL THEN
          SELECT "CartingType_SEQ".NEXTVAL INTO :NEW."CartingTypeId" FROM SYS.DUAL;
        END IF;
      END COLUMN_SEQUENCES;
    END IF;

    IF UPDATING THEN
        IF (:old."Name" != :new."Name") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'CartingType','Name', :old."Name", :new."Name",:new."IpAddress"); 
        END IF;
        IF (:old."MetaName" != :new."MetaName") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'CartingType','MetaName', :old."MetaName", :new."MetaName",:new."IpAddress"); 
        END IF;
        IF (:old."IsDefault" != :new."IsDefault") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'CartingType','IsDefault', :old."IsDefault", :new."IsDefault",:new."IpAddress"); 
        END IF;
        IF (:old."DisplayOrder" != :new."DisplayOrder") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'CartingType','DisplayOrder', :old."DisplayOrder", :new."DisplayOrder",:new."IpAddress"); 
        END IF;
        IF (:old."IsActive" != :new."IsActive") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'CartingType','IsActive', :old."IsActive", :new."IsActive",:new."IpAddress"); 
        END IF;
    END IF;
END;



/