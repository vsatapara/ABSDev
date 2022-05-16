CREATE OR REPLACE TRIGGER abs_mdi."Accessory_TRG" 
BEFORE INSERT OR UPDATE ON abs_mdi."Accessory" 
FOR EACH ROW 
BEGIN
    IF INSERTING THEN
         <<COLUMN_SEQUENCES>>
        BEGIN
           IF INSERTING AND :NEW."AccessoryId" IS NULL THEN
             SELECT "Accessory_SEQ".NEXTVAL INTO :NEW."AccessoryId" FROM SYS.DUAL;
           END IF;
        END COLUMN_SEQUENCES;
         END IF;
   IF UPDATING THEN

     IF(:old."Name" != :new."Name") 
     THEN 
        "HistoryEventsOP"(:new."ModifiedBy",'Accessory','Name', :old."Name", :new."Name",:new."IpAddress"); 
     END IF;

   END IF;
END;



/