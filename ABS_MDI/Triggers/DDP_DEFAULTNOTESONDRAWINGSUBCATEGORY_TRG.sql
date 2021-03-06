CREATE OR REPLACE TRIGGER abs_mdi."DDP_DEFAULTNOTESONDRAWINGSUBCATEGORY_TRG" 
BEFORE INSERT OR UPDATE ON abs_mdi.DDP_DEFAULTNOTESONDRAWINGSUBCATEGORY 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.SUBCATEGORYID IS NULL THEN
      SELECT DDP_DEFAULTNOTESONDRAWINGSUBCATEGORY_SEQ.NEXTVAL INTO :NEW.SUBCATEGORYID FROM SYS.DUAL;
    END IF;
    IF (:old."SUBCATEGORYNAME" != :new."SUBCATEGORYNAME") 
        THEN
            DDP_HISTORYOP(:new."MODIFIEDBY",'DDP_DEFAULTNOTESONDRAWINGSUBCATEGORY','SUBCATEGORYNAME',:old."SUBCATEGORYNAME", :new."SUBCATEGORYNAME", :new."IPADDRESS",null,null ); 
        END IF;
         IF (:old."ISDELETE" != :new."ISDELETE") 
        THEN
            DDP_HISTORYOP(:new."MODIFIEDBY",'DDP_DEFAULTNOTESONDRAWINGSUBCATEGORY','ISDELETE',:old."ISDELETE", :new."ISDELETE", :new."IPADDRESS",null,null ); 
        END IF;
  END COLUMN_SEQUENCES;
END;

/