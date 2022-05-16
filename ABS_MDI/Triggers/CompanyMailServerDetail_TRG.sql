CREATE OR REPLACE TRIGGER abs_mdi."CompanyMailServerDetail_TRG" 
BEFORE INSERT OR UPDATE ON abs_mdi."CompanyMailServerDetail" 
FOR EACH ROW 
BEGIN
  IF INSERTING THEN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."CompanyMailServerDetailId" IS NULL THEN
      SELECT "CompanyMailServerDetail_SEQ".NEXTVAL INTO :NEW."CompanyMailServerDetailId" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
  END IF;
  IF UPDATING THEN
        IF(:old."IsDefualtSetting" != :new."IsDefualtSetting") THEN
            "HistoryEventsOP"(:new."ModifiedBy",'CompanyMailServerDetail','IsDefualtSetting', :old."IsDefualtSetting", :new."IsDefualtSetting",:new."IpAddress"); 
        END IF;
        IF(:old."SMTPPHost" != :new."SMTPPHost") THEN
            "HistoryEventsOP"(:new."ModifiedBy",'CompanyMailServerDetail','SMTPPHost', :old."SMTPPHost", :new."SMTPPHost",:new."IpAddress");
        END IF;
        IF(:old."SMTPPort" != :new."SMTPPort") THEN
             "HistoryEventsOP"(:new."ModifiedBy",'CompanyMailServerDetail','SMTPPort', :old."SMTPPort", :new."SMTPPort",:new."IpAddress");
        END IF;
        IF(:old."IsAuthenticationRequired" != :new."IsAuthenticationRequired") THEN
             "HistoryEventsOP"(:new."ModifiedBy",'CompanyMailServerDetail','IsAuthenticationRequired', :old."IsAuthenticationRequired", :new."IsAuthenticationRequired",:new."IpAddress");
        END IF;
        IF(:old."IsUseSSLConnection" != :new."IsUseSSLConnection") THEN
            "HistoryEventsOP"(:new."ModifiedBy",'CompanyMailServerDetail','IsUseSSLConnection', :old."IsUseSSLConnection", :new."IsUseSSLConnection",:new."IpAddress"); 
        END IF;
        IF(:old."UserName" != :new."UserName") THEN 
            "HistoryEventsOP"(:new."ModifiedBy",'CompanyMailServerDetail','UserName', :old."UserName", :new."UserName",:new."IpAddress");
        END IF;
        IF(:old."Password" != :new."Password") THEN
            "HistoryEventsOP"(:new."ModifiedBy",'CompanyMailServerDetail','Password', :old."Password", :new."Password",:new."IpAddress"); 
        END IF;
        IF(:old."ReplyToAddress" != :new."ReplyToAddress") THEN 
            "HistoryEventsOP"(:new."ModifiedBy",'CompanyMailServerDetail','ReplyToAddress', :old."ReplyToAddress", :new."ReplyToAddress",:new."IpAddress");
        END IF;

  END IF;
END;



/