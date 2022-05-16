CREATE OR REPLACE TRIGGER abs_mdi."InformationPageAdministrations_TRG" 
BEFORE INSERT OR UPDATE ON abs_mdi."InformationPageAdministrations" 
FOR EACH ROW 
BEGIN
    IF INSERTING THEN
      <<COLUMN_SEQUENCES>>
      BEGIN
            IF INSERTING AND :NEW."InformationPageId" IS NULL THEN
              SELECT "InformationPageAdministrations_SEQ".NEXTVAL INTO :NEW."InformationPageId" FROM SYS.DUAL;
            END IF;
       END COLUMN_SEQUENCES;
    END IF; 

    IF UPDATING THEN
        IF (:old."Title" != :new."Title") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'InformationPageAdministrations','Title', :old."Title", :new."Title",:new."IpAddress");
        END IF;
        IF (:old."Content" != :new."Content") 
        THEN
            "HISTORYEVENTSCONTENT"(:new."ModifiedBy",'InformationPageAdministrations','Content', :old."Content", :new."Content",:new."IpAddress");
        END IF;
    END IF;

END;



/