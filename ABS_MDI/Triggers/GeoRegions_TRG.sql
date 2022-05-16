CREATE OR REPLACE TRIGGER abs_mdi."GeoRegions_TRG" 
BEFORE INSERT OR UPDATE ON abs_mdi."GeoRegions" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."GeoRegionId" IS NULL THEN
      SELECT "GeoRegions_SEQ".NEXTVAL INTO :NEW."GeoRegionId" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;

  IF UPDATING THEN
        IF(:old."IsActive" != :new."IsActive")
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'GeoRegions','IsActive', :old."IsActive", :new."IsActive",:new."IpAddress"); 
        END IF;

        IF(:old."Name" != :new."Name") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'GeoRegions','Name', :old."Name", :new."Name",:new."IpAddress"); 
        END IF;

        IF(:old."IsDelete" != :new."IsDelete")
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'GeoRegions','IsDelete', :old."IsDelete", :new."IsDelete",:new."IpAddress"); 
        END IF;

        IF(:old."Region" != :new."Region")
        THEN "HISTORYEVENTSCONTENT"(:new."ModifiedBy",'GeoRegions','Region', :old."Region", :new."Region",:new."IpAddress");
        END IF;        
    END IF;
END;



/