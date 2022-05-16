CREATE OR REPLACE TRIGGER abs_mdi."CompanyOrderDocumentationSetting_TRG" 
BEFORE INSERT ON abs_mdi."CompanyOrderDocumentationSetting" 
FOR EACH ROW 
BEGIN
 IF INSERTING THEN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."OrderdocumentId" IS NULL THEN
      SELECT "CompanyOrderDocumentationSetting_SEQ".NEXTVAL INTO :NEW."OrderdocumentId" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
  END IF;
  IF UPDATING THEN
        IF(:old."IsFinalDrawing" != :new."IsFinalDrawing") THEN 
            "HistoryEventsOP"(:new."ModifiedBy",'CompanyOrderDocumentationSetting','IsFinalDrawing', :old."IsFinalDrawing", :new."IsFinalDrawing",:new."IpAddress");
        END IF;
        IF(:old."IsPermitDrawing" != :new."IsPermitDrawing") THEN
            "HistoryEventsOP"(:new."ModifiedBy",'CompanyOrderDocumentationSetting','IsPermitDrawing', :old."IsPermitDrawing", :new."IsPermitDrawing",:new."IpAddress");
        END IF;
        IF(:old."IsSalesChangeOrder" != :new."IsSalesChangeOrder") THEN
            "HistoryEventsOP"(:new."ModifiedBy",'CompanyOrderDocumentationSetting','IsSalesChangeOrder', :old."IsSalesChangeOrder", :new."IsSalesChangeOrder",:new."IpAddress");
        END IF;
        IF(:old."IsCalculationFiles" != :new."IsCalculationFiles") THEN 
            "HistoryEventsOP"(:new."ModifiedBy",'CompanyOrderDocumentationSetting','IsCalculationFiles', :old."IsCalculationFiles", :new."IsCalculationFiles",:new."IpAddress"); 
        END IF;
        IF(:old."IsBOMFiles" != :new."IsBOMFiles") THEN
            "HistoryEventsOP"(:new."ModifiedBy",'CompanyOrderDocumentationSetting','IsBOMFiles', :old."IsBOMFiles", :new."IsBOMFiles",:new."IpAddress");
        END IF;
        IF(:old."IsApprovalDrawing" != :new."IsApprovalDrawing") THEN
            "HistoryEventsOP"(:new."ModifiedBy",'CompanyOrderDocumentationSetting','IsApprovalDrawing', :old."IsApprovalDrawing", :new."IsApprovalDrawing",:new."IpAddress"); 
        END IF;
        IF(:old."IsOpenRegistration" != :new."IsOpenRegistration") THEN
            "HistoryEventsOP"(:new."ModifiedBy",'CompanyOrderDocumentationSetting','IsOpenRegistration', :old."IsOpenRegistration", :new."IsOpenRegistration",:new."IpAddress");
        END IF;
        IF(:old."IsLangualgeSelection" != :new."IsLangualgeSelection") THEN
            "HistoryEventsOP"(:new."ModifiedBy",'CompanyOrderDocumentationSetting','IsLangualgeSelection', :old."IsLangualgeSelection", :new."IsLangualgeSelection",:new."IpAddress");
        END IF;

  END IF;
END;



/