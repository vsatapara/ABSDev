CREATE OR REPLACE TRIGGER abs_mdi."PricingSegments_TRG" 
BEFORE INSERT OR UPDATE ON abs_mdi."PricingSegments" 
FOR EACH ROW 
BEGIN
    IF INSERTING THEN
    <<COLUMN_SEQUENCES>>
      BEGIN
        IF INSERTING AND :NEW."PricingSegmentId" IS NULL THEN
          SELECT "PricingSegments_SEQ".NEXTVAL INTO :NEW."PricingSegmentId" FROM SYS.DUAL;
        END IF;
      END COLUMN_SEQUENCES;
  END IF;

  IF UPDATING THEN
        IF (:old."Description" != :new."Description") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'PricingSegments','Description', :old."Description", :new."Description",:new."IpAddress"); 
        END IF;
        IF (:old."SortOrder" != :new."SortOrder") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'PricingSegments','SortOrder', :old."SortOrder", :new."SortOrder",:new."IpAddress"); 
        END IF;
        IF (:old."IsActive" != :new."IsActive") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'PricingSegments','IsActive', :old."IsActive", :new."IsActive",:new."IpAddress"); 
        END IF;
        IF (:old."IsDefault" != :new."IsDefault") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'PricingSegments','IsDefault', :old."IsDefault", :new."IsDefault",:new."IpAddress"); 
        END IF;
        IF (:old."IsForComponents" != :new."IsForComponents") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'PricingSegments','IsForComponents', :old."IsForComponents", :new."IsForComponents",:new."IpAddress"); 
        END IF;
    END IF;  
END;



/