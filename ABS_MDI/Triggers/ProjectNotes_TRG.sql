CREATE OR REPLACE TRIGGER abs_mdi."ProjectNotes_TRG" 
BEFORE INSERT OR UPDATE ON abs_mdi."ProjectNotes" 
FOR EACH ROW 
BEGIN
 IF INSERTING THEN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."ProjectNoteId" IS NULL THEN
      SELECT "ProjectNotes_SEQ".NEXTVAL INTO :NEW."ProjectNoteId" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
      END IF;
IF UPDATING THEN

          IF (:old."CustomerId" != :new."CustomerId") 
        THEN
            "HistoryEventsOP"(:new."MODIFIEDBY",'ProjectNotes','CustomerId', :old."CustomerId", :new."CustomerId",:new."IPADDRESS"); 
        END IF;

        IF (:old."Year" != :new."Year") 
        THEN
            "HistoryEventsOP"(:new."MODIFIEDBY",'ProjectNotes','Year', :old."Year", :new."Year",:new."IPADDRESS"); 
        END IF;

        	IF (:old."Type"  != :new."Type") 
        THEN
            "HistoryEventsOP"(:new."MODIFIEDBY",'ProjectNotes','Type', :old."Type", :new."Type",:new."IPADDRESS"); 
        END IF; 

        IF (:old."Key"  != :new."Key") 
            THEN
                "HistoryEventsOP"(:new."MODIFIEDBY",'ProjectNotes','Key', :old."Key", :new."Key",:new."IPADDRESS"); 
            END IF;     

        IF (:old."Note"  != :new."Note") 
            THEN
                "HistoryEventsOP"(:new."MODIFIEDBY",'ProjectNotes','Note', :old."Note", :new."Note",:new."IPADDRESS"); 
            END IF; 

             IF (:old."IPADDRESS"  != :new."IPADDRESS") 
            THEN
                "HistoryEventsOP"(:new."MODIFIEDBY",'ProjectNotes','IPADDRESS', :old."IPADDRESS", :new."IPADDRESS",:new."IPADDRESS"); 
            END IF; 

             IF (:old."ISDELETE"  != :new."ISDELETE") 
            THEN
                "HistoryEventsOP"(:new."MODIFIEDBY",'ProjectNotes','ISDELETE', :old."ISDELETE", :new."ISDELETE",:new."IPADDRESS"); 
            END IF; 


    END IF; 
END;


/