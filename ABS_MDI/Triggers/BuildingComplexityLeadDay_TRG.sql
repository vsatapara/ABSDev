CREATE OR REPLACE TRIGGER abs_mdi."BuildingComplexityLeadDay_TRG" 
BEFORE INSERT OR UPDATE ON abs_mdi."BuildingComplexityLeadDay" 
FOR EACH ROW 
BEGIN
  IF INSERTING THEN
      <<COLUMN_SEQUENCES>>
      BEGIN
        IF INSERTING AND :NEW."BuildingComplexityLeadDaysId" IS NULL THEN
          SELECT "BuildingComplexityLeadDay_SEQ".NEXTVAL INTO :NEW."BuildingComplexityLeadDaysId" FROM SYS.DUAL;
        END IF;
      END COLUMN_SEQUENCES;
  END IF;
  IF UPDATING THEN
        IF(:old."BuildingQuoteTypeId" != :new."BuildingQuoteTypeId")
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'BuildingComplexityLeadDay','BuildingQuoteTypeId', :old."BuildingQuoteTypeId", :new."BuildingQuoteTypeId",:new."IpAddress");
        END IF;
        IF(:old."ClassMasterId" != :new."ClassMasterId")
            THEN "HistoryEventsOP"(:new."ModifiedBy",'BuildingComplexityLeadDay','ClassMasterId', :old."ClassMasterId", :new."ClassMasterId",:new."IpAddress");
        END IF;
        IF(:old."ClassInput" != :new."ClassInput")
        THEN 
            "HistoryEventsOP"(:new."ModifiedBy",'BuildingComplexityLeadDay','ClassInput', :old."ClassInput", :new."ClassInput",:new."IpAddress");
        END IF;
   END IF;
END;



/