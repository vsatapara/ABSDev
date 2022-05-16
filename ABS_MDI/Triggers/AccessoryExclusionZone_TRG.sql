CREATE OR REPLACE TRIGGER abs_mdi."AccessoryExclusionZone_TRG" 
BEFORE INSERT  OR UPDATE ON abs_mdi."AccessoryExclusionZone" 
FOR EACH ROW 
BEGIN
    IF INSERTING THEN
      <<COLUMN_SEQUENCES>>
      BEGIN
        IF INSERTING AND :NEW."AccessoryExclusionId" IS NULL THEN
          SELECT "AccessoryExclusionZone_SEQ".NEXTVAL INTO :NEW."AccessoryExclusionId" FROM SYS.DUAL;
        END IF;
      END COLUMN_SEQUENCES;
    END IF;

    IF UPDATING THEN

        IF(:old."CompanyId" != :new."CompanyId")
        THEN 
            "HistoryEventsOP"(:new."ModifiedBy",'AccessoryExclusionZone','CompanyId', :old."CompanyId", :new."CompanyId",:new."IpAddress");
        END IF;
        IF(:old."GeoRegionId" != :new."GeoRegionId")
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'AccessoryExclusionZone','GeoRegionId', :old."GeoRegionId", :new."GeoRegionId",:new."IpAddress");
        END IF;
        IF(:old."AccessoryId" != :new."AccessoryId")
        THEN 
            "HistoryEventsOP"(:new."ModifiedBy",'AccessoryExclusionZone','AccessoryId', :old."AccessoryId", :new."AccessoryId",:new."IpAddress");
        END IF;
        IF(:old."IsExcluded" != :new."IsExcluded")
        THEN 
            "HistoryEventsOP"(:new."ModifiedBy",'AccessoryExclusionZone','IsExcluded', :old."IsExcluded", :new."IsExcluded",:new."IpAddress");
        END IF;

    END IF;
END;



/