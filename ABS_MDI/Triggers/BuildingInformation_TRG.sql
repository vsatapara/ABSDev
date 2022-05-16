CREATE OR REPLACE TRIGGER abs_mdi."BuildingInformation_TRG" 
BEFORE INSERT OR UPDATE ON abs_mdi."BuildingInformation" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."BuildingInformationId" IS NULL THEN
      SELECT "BuildingInformation_SEQ".NEXTVAL INTO :NEW."BuildingInformationId" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;

  IF UPDATING THEN
        IF(:old."BuildingLabel" != :new."BuildingLabel")
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'BuildingInformation','BuildingLabel', :old."BuildingLabel", :new."BuildingLabel",:new."IpAddress"); 
        END IF;
        IF(:old."Structure" != :new."Structure")
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'BuildingInformation','Structure', :old."Structure", :new."Structure",:new."IpAddress"); 
        END IF;
        IF(:old."BuildingName" != :new."BuildingName")
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'BuildingInformation','BuildingName', :old."BuildingName", :new."BuildingName",:new."IpAddress"); 
        END IF;
        IF(:old."BuildingType" != :new."BuildingType")
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'BuildingInformation','BuildingType', :old."BuildingType", :new."BuildingType",:new."IpAddress"); 
        END IF;
        IF(:old."Elevation" != :new."Elevation")
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'BuildingInformation','Elevation', :old."Elevation", :new."Elevation",:new."IpAddress"); 
        END IF;
        IF(:old."FrameType" != :new."FrameType")
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'BuildingInformation','FrameType', :old."FrameType", :new."FrameType",:new."IpAddress"); 
        END IF;
        IF(:old."IsDelete" != :new."IsDelete")
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'BuildingInformation','IsDelete', :old."IsDelete", :new."IsDelete",:new."IpAddress"); 
        END IF;
        IF(:old."HighSideWallElevation" != :new."HighSideWallElevation")
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'BuildingInformation','HighSideWallElevation', :old."HighSideWallElevation", :new."HighSideWallElevation",:new."IpAddress"); 
        END IF;
        IF(:old."AttachmentElevation" != :new."AttachmentElevation")
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'BuildingInformation','AttachmentElevation', :old."AttachmentElevation", :new."AttachmentElevation",:new."IpAddress"); 
        END IF;
        IF(:old."ParentBuildingId" != :new."ParentBuildingId")
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'BuildingInformation','ParentBuildingId', :old."ParentBuildingId", :new."ParentBuildingId",:new."IpAddress"); 
        END IF;
    END IF;     
END;
/