CREATE OR REPLACE TRIGGER abs_mdi."Customer_TRG" 
BEFORE INSERT OR UPDATE ON abs_mdi."Customer" 
FOR EACH ROW 
BEGIN
    IF INSERTING THEN
      <<COLUMN_SEQUENCES>>
      BEGIN
        IF INSERTING AND :NEW."CustomerID" IS NULL THEN
          SELECT "Customer_SEQ".NEXTVAL INTO :NEW."CustomerID" FROM SYS.DUAL;
        END IF;
      END COLUMN_SEQUENCES;
    END IF; 
    IF UPDATING THEN
        IF (:old."CustomerNo" != :new."CustomerNo") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'Customer','CustomerNo', :old."CustomerNo", :new."CustomerNo",:new."IpAddress"); 
        END IF;
        IF (:old."CustomerName" != :new."CustomerName") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'Customer','CustomerName', :old."CustomerName", :new."CustomerName",:new."IpAddress"); 
        END IF;
        IF (:old."IsDefault" != :new."IsDefault") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'Customer','IsDefault', :old."IsDefault", :new."IsDefault",:new."IpAddress"); 
        END IF; 
        IF (:old."IsActive" != :new."IsActive") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'Customer','IsActive', :old."IsActive", :new."IsActive",:new."IpAddress"); 
        END IF;       
        IF (:old."IsPrivateLabelBuilder" != :new."IsPrivateLabelBuilder") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'Customer','IsPrivateLabelBuilder', :old."IsPrivateLabelBuilder", :new."IsPrivateLabelBuilder",:new."IpAddress"); 
        END IF; 
        IF (:old."EnforceSignatureRule" != :new."EnforceSignatureRule") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'Customer','EnforceSignatureRule', :old."EnforceSignatureRule", :new."EnforceSignatureRule",:new."IpAddress"); 
        END IF;       
     END IF; 
END;


/