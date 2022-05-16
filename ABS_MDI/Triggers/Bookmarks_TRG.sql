CREATE OR REPLACE TRIGGER abs_mdi."Bookmarks_TRG" 
BEFORE INSERT OR UPDATE ON abs_mdi."Bookmarks" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."BookmarkId" IS NULL THEN
      SELECT "Bookmarks_SEQ".NEXTVAL INTO :NEW."BookmarkId" FROM SYS.DUAL;
    END IF;

     IF (:old."UserGuid" != :new."UserGuid") 
        THEN
            "HistoryEventsOP"(:new."MODIFIEDBY",'Bookmarks','CustomerId', :old."UserGuid", :new."UserGuid",:new."IPADDRESS"); 
        END IF;       

        	IF (:old."Type"  != :new."Type") 
        THEN
            "HistoryEventsOP"(:new."MODIFIEDBY",'Bookmarks','Type', :old."Type", :new."Type",:new."IPADDRESS"); 
        END IF; 

        IF (:old."EntityId" != :new."EntityId") 
        THEN
            "HistoryEventsOP"(:new."MODIFIEDBY",'Bookmarks','EntityId', :old."EntityId", :new."EntityId",:new."IPADDRESS"); 
        END IF;

        IF (:old."BookmarkDate"  != :new."BookmarkDate") 
            THEN
                "HistoryEventsOP"(:new."MODIFIEDBY",'Bookmarks','BookmarkDate', :old."BookmarkDate", :new."BookmarkDate",:new."IPADDRESS"); 
            END IF;     

        IF (:old."DisplayData"  != :new."DisplayData") 
            THEN
                "HistoryEventsOP"(:new."MODIFIEDBY",'Bookmarks','DisplayData', :old."DisplayData", :new."DisplayData",:new."IPADDRESS"); 
            END IF; 

             IF (:old."IPADDRESS"  != :new."IPADDRESS") 
            THEN
                "HistoryEventsOP"(:new."MODIFIEDBY",'Bookmarks','IPADDRESS', :old."IPADDRESS", :new."IPADDRESS",:new."IPADDRESS"); 
            END IF; 

             IF (:old."ISDELETE"  != :new."ISDELETE") 
            THEN
                "HistoryEventsOP"(:new."MODIFIEDBY",'Bookmarks','ISDELETE', :old."ISDELETE", :new."ISDELETE",:new."IPADDRESS"); 
            END IF; 
  END COLUMN_SEQUENCES;
END;


/