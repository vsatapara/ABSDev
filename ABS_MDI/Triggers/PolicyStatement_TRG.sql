CREATE OR REPLACE TRIGGER abs_mdi."PolicyStatement_TRG" 
BEFORE INSERT OR UPDATE ON abs_mdi."PolicyStatement" 
FOR EACH ROW 
BEGIN
   IF INSERTING THEN
      <<COLUMN_SEQUENCES>>
      BEGIN
        IF INSERTING AND :NEW."PolicyStatementId" IS NULL THEN
          SELECT "PolicyStatement_SEQ".NEXTVAL INTO :NEW."PolicyStatementId" FROM SYS.DUAL;
        END IF;
      END COLUMN_SEQUENCES;
    END IF;

    IF UPDATING THEN

        IF(:old."Title" != :new."Title")
        THEN "HistoryEventsOP"(:new."ModifiedBy",'PolicyStatement','Title', :old."Title", :new."Title",:new."IpAddress");
        END IF;

        IF(:old."Content" != :new."Content")
        THEN "HISTORYEVENTSCONTENT"(:new."ModifiedBy",'PolicyStatement','Content', :old."Content", :new."Content",:new."IpAddress");
        END IF;

        IF(:old."FileId" != :new."FileId")
        THEN "HistoryEventsOP"(:new."ModifiedBy",'PolicyStatement','FileId', :old."FileId", :new."FileId",:new."IpAddress");
        END IF;

    END IF;

END;



/