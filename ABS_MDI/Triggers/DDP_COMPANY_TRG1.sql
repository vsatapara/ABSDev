CREATE OR REPLACE TRIGGER abs_mdi."DDP_COMPANY_TRG1" 
BEFORE INSERT OR UPDATE ON abs_mdi.DDP_COMPANY 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.COMPANYID IS NULL THEN
      SELECT DDP_COMPANY_SEQ.NEXTVAL INTO :NEW.COMPANYID FROM SYS.DUAL;
    END IF;
     IF (:old."COMPANYPREFIX" != :new."COMPANYPREFIX") 
        THEN
            "DDP_HISTORYOP"(:new."MODIFIEDBY",'DDP_COMPANY','COMPANYPREFIX', :old."COMPANYPREFIX", :new."COMPANYPREFIX",:new."IPADDRESS",null,null); 
        END IF;
         IF (:old."COMPANYNAME" != :new."COMPANYNAME") 
        THEN
            "DDP_HISTORYOP"(:new."MODIFIEDBY",'DDP_COMPANY','COMPANYNAME', :old."COMPANYNAME", :new."COMPANYNAME",:new."IPADDRESS",null,null); 
        END IF;
         IF (:old."ISDELETE" != :new."ISDELETE") 
        THEN
            "DDP_HISTORYOP"(:new."MODIFIEDBY",'DDP_COMPANY','ISDELETE', :old."ISDELETE", :new."ISDELETE",:new."IPADDRESS",null,null); 
        END IF;
  END COLUMN_SEQUENCES;
END;

/