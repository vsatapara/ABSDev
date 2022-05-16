CREATE OR REPLACE TRIGGER abs_mdi."BuilderAdministrator_TRG" 
BEFORE INSERT ON abs_mdi."BuilderAdministrator" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."BuilderAdministratorId" IS NULL THEN
      SELECT "BuilderAdministrator_SEQ".NEXTVAL INTO :NEW."BuilderAdministratorId" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;

   IF UPDATING THEN
       IF(:old."Email" != :new."Email")
       THEN
       "HistoryEventsOP"(:new."ModifiedBy",'BuilderAdministrator','Email', :old."Email", :new."Email",:new."IpAddress");
       END IF;

       IF(:old."BuilderInformationInstruction" != :new."BuilderInformationInstruction")
       THEN
       "HISTORYEVENTSCONTENT"(:new."ModifiedBy",'BuilderAdministrator','BuilderInformationInstruction', :old."BuilderInformationInstruction", :new."BuilderInformationInstruction",:new."IpAddress");
       END IF;

       IF(:old."BuilderContactInstruction" != :new."BuilderContactInstruction") THEN 
       "HISTORYEVENTSCONTENT"(:new."ModifiedBy",'BuilderAdministrator','BuilderContactInstruction', :old."BuilderContactInstruction", :new."BuilderContactInstruction",:new."IpAddress");
       END IF;

       IF(:old."SubmissionConfirmationInstruction" != :new."SubmissionConfirmationInstruction")
       THEN "HISTORYEVENTSCONTENT"(:new."ModifiedBy",'BuilderAdministrator','SubmissionConfirmationInstruction', :old."SubmissionConfirmationInstruction", :new."SubmissionConfirmationInstruction",:new."IpAddress");
       END IF;

   END IF;  
END;


/