CREATE OR REPLACE TRIGGER abs_mdi."CompanyInformation_TRG" 
BEFORE INSERT OR UPDATE ON abs_mdi."CompanyInformation" 
FOR EACH ROW 
BEGIN
 IF INSERTING THEN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."CompanyInformationId" IS NULL THEN
      SELECT "CompanyInformation_SEQ".NEXTVAL INTO :NEW."CompanyInformationId" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
  END IF;
   IF UPDATING THEN
        IF(:old."IsTruckTarpAvaileble" != :new."IsTruckTarpAvaileble")
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'CompanyInformation','IsTruckTarpAvaileble', :old."IsTruckTarpAvaileble", :new."IsTruckTarpAvaileble",:new."IpAddress");
        END IF;
        IF(:old."IsTrucTarpMandatory" != :new."IsTrucTarpMandatory")
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'CompanyInformation','IsTrucTarpMandatory', :old."IsTrucTarpMandatory", :new."IsTrucTarpMandatory",:new."IpAddress");
        END IF;
        IF(:old."ItemNotStrocked" != :new."ItemNotStrocked")
        THEN 
            "HistoryEventsOP"(:new."ModifiedBy",'CompanyInformation','ItemNotStrocked', :old."ItemNotStrocked", :new."ItemNotStrocked",:new."IpAddress");
        END IF;
        IF(:old."ItemNotAvaileble" != :new."ItemNotAvaileble")
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'CompanyInformation','ItemNotAvaileble', :old."ItemNotAvaileble", :new."ItemNotAvaileble",:new."IpAddress");
        END IF;
        IF(:old."QuoteExpirationDays" != :new."QuoteExpirationDays")
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'CompanyInformation','QuoteExpirationDays', :old."QuoteExpirationDays", :new."QuoteExpirationDays",:new."IpAddress");
        END IF;

   END IF;
END;



/