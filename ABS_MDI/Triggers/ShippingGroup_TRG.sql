CREATE OR REPLACE TRIGGER abs_mdi."ShippingGroup_TRG" 
BEFORE INSERT OR UPDATE ON abs_mdi."ShippingGroup" 
FOR EACH ROW 
BEGIN
    IF INSERTING THEN
         <<COLUMN_SEQUENCES>>
      BEGIN
        IF INSERTING AND :NEW."ShippingGroupId" IS NULL THEN
          SELECT "ShippingGroup_SEQ".NEXTVAL INTO :NEW."ShippingGroupId" FROM SYS.DUAL;
        END IF;
      END COLUMN_SEQUENCES;
    END IF;  
    IF UPDATING THEN
        IF (:old."Name" != :new."Name") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'ShippingGroup','Name', :old."Name", :new."Name",:new."IpAddress");
        END IF;
        IF (:old."IsForComponents" != :new."IsForComponents") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'ShippingGroup','IsForComponents', :old."IsForComponents", :new."IsForComponents",:new."IpAddress");
        END IF;
        IF (:old."IsActive" != :new."IsActive") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'ShippingGroup','IsActive', :old."IsActive", :new."IsActive",:new."IpAddress"); 
        END IF;
    END IF;    
END;



/