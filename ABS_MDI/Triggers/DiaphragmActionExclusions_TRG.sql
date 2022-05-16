CREATE OR REPLACE TRIGGER abs_mdi."DiaphragmActionExclusions_TRG" 
BEFORE INSERT OR UPDATE ON abs_mdi."DiaphragmActionExclusions" 
FOR EACH ROW 
BEGIN
<<COLUMN_SEQUENCES>>
 IF INSERTING THEN
  BEGIN
    IF INSERTING AND :NEW."DiaphragmActionExclusionId" IS NULL THEN
      SELECT "DiaphragmActionExclusions_SEQ".NEXTVAL INTO :NEW."DiaphragmActionExclusionId" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
    END IF;

  IF UPDATING THEN

        IF(:old."IsGeoRegionExclude" != :new."IsGeoRegionExclude")
        THEN 
            "HistoryEventsOP"(:new."ModifiedBy",'DiaphragmActionExclusions','IsGeoRegionExclude', :old."IsGeoRegionExclude", :new."IsGeoRegionExclude",:new."IpAddress");
        END IF;
        IF(:old."GeoRegionId" != :new."GeoRegionId")
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'DiaphragmActionExclusions','GeoRegionId', :old."GeoRegionId", :new."GeoRegionId",:new."IpAddress");
        END IF;

    END IF;    

END;


/