CREATE OR REPLACE TRIGGER abs_mdi."TermsConditions_TRG" 
BEFORE INSERT  OR UPDATE ON abs_mdi."TermsConditions" 
FOR EACH ROW 
BEGIN
   IF INSERTING THEN
     <<COLUMN_SEQUENCES>>
        BEGIN  
            IF INSERTING AND :NEW."TermsConditionsId" IS NULL THEN
              SELECT "TermsConditions_SEQ".NEXTVAL INTO :NEW."TermsConditionsId" FROM SYS.DUAL;
            END IF;
          END COLUMN_SEQUENCES;  
    END IF;

    IF UPDATING THEN

        IF(:old."Title" != :new."Title")
        THEN "HistoryEventsOP"(:new."ModifiedBy",'TermsConditions','Title', :old."Title", :new."Title",:new."IpAddress");
        END IF;

        IF(:old."Content" != :new."Content")
        THEN "HISTORYEVENTSCONTENT"(:new."ModifiedBy",'TermsConditions','Content', :old."Content", :new."Content",:new."IpAddress");
        END IF;

        IF(:old."FileId" != :new."FileId")
        THEN "HistoryEventsOP"(:new."ModifiedBy",'TermsConditions','FileId', :old."FileId", :new."FileId",:new."IpAddress");
        END IF;

    END IF;

END;



/