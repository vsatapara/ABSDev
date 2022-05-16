CREATE OR REPLACE TRIGGER abs_mdi."SideWallPortalFrame_TRG1" 
BEFORE INSERT ON abs_mdi."SideWallPortalFrame" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."PortalFrameId" IS NULL THEN
      SELECT "SideWallPortalFrame_SEQ1".NEXTVAL INTO :NEW."PortalFrameId" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;


/