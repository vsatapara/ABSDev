CREATE OR REPLACE TRIGGER abs_mdi."Photos_TRG1" 
BEFORE INSERT OR UPDATE ON abs_mdi."Photos" 
FOR EACH ROW 
BEGIN
        IF INSERTING THEN
            <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
        END IF;

        IF UPDATING THEN
        IF (:old."PhotosDisplayName" != :new."PhotosDisplayName") 
        THEN
            "HistoryEventsOP"(NULL,'Photos','PhotosDisplayName', :old."PhotosDisplayName", :new."PhotosDisplayName",NULL); 
        END IF;
        IF (:old."PhotosFile" != :new."PhotosFile") 
        THEN
            "HistoryEventsOP"(NULL,'Photos','PhotosFile', :old."PhotosFile", :new."PhotosFile",NULL); 
        END IF;

    END IF;

END;



/