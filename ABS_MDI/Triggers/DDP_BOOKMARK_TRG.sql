CREATE OR REPLACE TRIGGER abs_mdi."DDP_BOOKMARK_TRG" 
BEFORE INSERT OR UPDATE ON abs_mdi.DDP_BOOKMARK 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.BOOKMARKID IS NULL THEN
      SELECT DDP_BOOKMARK_SEQ.NEXTVAL INTO :NEW.BOOKMARKID FROM SYS.DUAL;
    END IF;
     IF (:old."BOOKMARKNAME" != :new."BOOKMARKNAME") 
        THEN
            DDP_HISTORYOP(:new."MODIFIEDBY",'DDP_BOOKMARK','BOOKMARKNAME',:old."BOOKMARKNAME", :new."BOOKMARKNAME", :new."IPADDRESS",null,null ); 
        END IF;
         IF (:old."REGEXPRESSION" != :new."REGEXPRESSION") 
        THEN
            DDP_HISTORYOP(:new."MODIFIEDBY",'DDP_BOOKMARK','REGEXPRESSION',:old."REGEXPRESSION", :new."REGEXPRESSION", :new."IPADDRESS",null,null ); 
        END IF;
          IF (:old."GRAB0" != :new."GRAB0") 
        THEN
            DDP_HISTORYOP(:new."MODIFIEDBY",'DDP_BOOKMARK','GRAB0',:old."GRAB0", :new."GRAB0", :new."IPADDRESS",null,null ); 
        END IF;
           IF (:old."GRAB1" != :new."GRAB1") 
        THEN
            DDP_HISTORYOP(:new."MODIFIEDBY",'DDP_BOOKMARK','GRAB1',:old."GRAB1", :new."GRAB1", :new."IPADDRESS",null,null ); 
        END IF;
           IF (:old."ISDELETE" != :new."ISDELETE") 
        THEN
            DDP_HISTORYOP(:new."MODIFIEDBY",'DDP_BOOKMARK','ISDELETE',:old."ISDELETE", :new."ISDELETE", :new."IPADDRESS",null,null ); 
        END IF;
  END COLUMN_SEQUENCES;
END;

/