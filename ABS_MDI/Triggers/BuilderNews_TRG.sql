CREATE OR REPLACE TRIGGER abs_mdi."BuilderNews_TRG" 
BEFORE INSERT OR UPDATE ON abs_mdi."BuilderNews" 
FOR EACH ROW 
BEGIN
    IF INSERTING THEN
         <<COLUMN_SEQUENCES>>
      BEGIN
        IF INSERTING AND :NEW."BuilderNewsId" IS NULL THEN
          SELECT "BuilderNews_SEQ".NEXTVAL INTO :NEW."BuilderNewsId" FROM SYS.DUAL;
        END IF;
      END COLUMN_SEQUENCES;
    END IF;
    IF UPDATING THEN
        IF (:old."Title" != :new."Title") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'BuilderNews','Title', :old."Title", :new."Title",:new."IpAddress");
        END IF;
        IF (:old."FilterTag" != :new."FilterTag") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'BuilderNews','FilterTag', :old."FilterTag", :new."FilterTag",:new."IpAddress");
        END IF;
        IF (:old."Content" != :new."Content") 
        THEN
            "HISTORYEVENTSCONTENT"(:new."ModifiedBy",'BuilderNews','Content', :old."Content", :new."Content",:new."IpAddress");
        END IF;        
        IF (:old."IsActive" != :new."IsActive") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'BuilderNews','IsActive', :old."IsActive", :new."IsActive",:new."IpAddress"); 
        END IF;
        IF (:old."PublishDate" != :new."PublishDate") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'BuilderNews','PublishDate', to_char(:old."PublishDate",'MM/DD/YYYY'), to_char(:new."PublishDate",'MM/DD/YYYY'),:new."IpAddress"); 
        END IF;
        IF (:old."UnpublishDate" != :new."UnpublishDate") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'BuilderNews','UnpublishDate', to_char(:old."UnpublishDate",'MM/DD/YYYY'), to_char(:new."UnpublishDate",'MM/DD/YYYY'),:new."IpAddress"); 
        END IF;        
    END IF;      
END;



/