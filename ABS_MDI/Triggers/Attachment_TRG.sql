CREATE OR REPLACE TRIGGER abs_mdi."Attachment_TRG" 
BEFORE INSERT OR UPDATE ON abs_mdi."Attachment" 
FOR EACH ROW 
BEGIN
    IF INSERTING THEN
      <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
    END IF;

    IF UPDATING THEN
        IF (:old."AttachmentType" != :new."AttachmentType") 
        THEN
            "HistoryEventsOP"(NULL,'Attachment','AttachmentType', :old."AttachmentType", :new."AttachmentType",NULL); 
        END IF;
        IF (:old."AttachmentName" != :new."AttachmentName") 
        THEN
            "HistoryEventsOP"(NULL,'Attachment','AttachmentName', :old."AttachmentName", :new."AttachmentName",NULL); 
        END IF;
        IF (:old."AttachmentPath" != :new."AttachmentPath") 
        THEN
            "HistoryEventsOP"(NULL,'Attachment','AttachmentPath', :old."AttachmentPath", :new."AttachmentPath",NULL); 
        END IF;
        --IF (:old."IsDelete" != :new."IsDelete") 
        --THEN
        --    "HistoryEventsOP"(NULL,'Attachment','IsDelete', :old."IsDelete", :new."IsDelete",NULL); 
       -- END IF;
        --IF (:old."AttachedDate" != :new."AttachedDate") 
       -- THEN
           -- "HistoryEventsOP"(NULL,'Attachment','AttachedDate', :old."AttachedDate", :new."AttachedDate",NULL); 
        --END IF;
    END IF;
END;

/