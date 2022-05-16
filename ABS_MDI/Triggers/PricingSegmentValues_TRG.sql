CREATE OR REPLACE TRIGGER abs_mdi."PricingSegmentValues_TRG" 
BEFORE INSERT OR UPDATE ON abs_mdi."PricingSegmentValues" 
FOR EACH ROW 
BEGIN
    IF INSERTING THEN
      <<COLUMN_SEQUENCES>>
      BEGIN
        IF INSERTING AND :NEW."PricingSegmentValueId" IS NULL THEN
          SELECT "PricingSegmentValues_SEQ".NEXTVAL INTO :NEW."PricingSegmentValueId" FROM SYS.DUAL;
        END IF;
      END COLUMN_SEQUENCES;
    END IF;

    IF UPDATING THEN
        IF (:old."Description" != :new."Description") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'PricingSegmentValues','Description', :old."Description", :new."Description",:new."IpAddress"); 
        END IF;
        IF (:old."SortOrder" != :new."SortOrder") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'PricingSegmentValues','SortOrder', :old."SortOrder", :new."SortOrder",:new."IpAddress"); 
        END IF;
        IF (:old."IsActive" != :new."IsActive") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'PricingSegmentValues','IsActive', :old."IsActive", :new."IsActive",:new."IpAddress"); 
        END IF;
        IF (:old."Multiplier" != :new."Multiplier") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'PricingSegmentValues','Multiplier', :old."Multiplier", :new."Multiplier",:new."IpAddress"); 
        END IF;
        IF (:old."ConditionalMinimum" != :new."ConditionalMinimum") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'PricingSegmentValues','ConditionalMinimum', :old."ConditionalMinimum", :new."ConditionalMinimum",:new."IpAddress"); 
        END IF;
        IF (:old."ConditionalMaximum" != :new."ConditionalMaximum") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'PricingSegmentValues','ConditionalMaximum', :old."ConditionalMaximum", :new."ConditionalMaximum",:new."IpAddress"); 
        END IF;
        IF (:old."BasedOn" != :new."BasedOn") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'PricingSegmentValues','BasedOn', :old."BasedOn", :new."BasedOn",:new."IpAddress"); 
        END IF;
    END IF;
END;



/