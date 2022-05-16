CREATE OR REPLACE TRIGGER abs_mdi."CpuAddresses_TRG" 
BEFORE INSERT OR UPDATE ON abs_mdi."CpuAddresses" 
FOR EACH ROW 
BEGIN
    IF INSERTING THEN
            <<COLUMN_SEQUENCES>>
                BEGIN
                    IF INSERTING AND :NEW."AddressId" IS NULL THEN
                    SELECT "CpuAddresses_SEQ".NEXTVAL INTO :NEW."AddressId" FROM SYS.DUAL;
                END IF;
            END COLUMN_SEQUENCES;
     END IF;
    IF UPDATING THEN
        IF (:old."IsActive" != :new."IsActive") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'CpuAddresses','IsActive', :old."IsActive", :new."IsActive",:new."IpAddress"); 
        END IF;
         IF (:old."CanUseForMailing" != :new."CanUseForMailing") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'CpuAddresses','CanUseForMailing', :old."CanUseForMailing", :new."CanUseForMailing",:new."IpAddress"); 
        END IF;
         IF (:old."Address1" != :new."Address1") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'CpuAddresses','Address1', :old."Address1", :new."Address1",:new."IpAddress"); 
        END IF;
         IF (:old."Address2" != :new."Address2") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'CpuAddresses','Address2', :old."Address2", :new."Address2",:new."IpAddress"); 
        END IF;
         IF (:old."City" != :new."City") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'CpuAddresses','City', :old."City", :new."City",:new."IpAddress"); 
        END IF;
         IF (:old."CountyRegion" != :new."CountyRegion") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'CpuAddresses','CountyRegion', :old."CountyRegion", :new."CountyRegion",:new."IpAddress"); 
        END IF;
    END IF;
END;



/