CREATE OR REPLACE TRIGGER abs_mdi."CompanyContactUsDetail_TRG" 
BEFORE INSERT OR UPDATE ON abs_mdi."CompanyContactUsDetail" 
FOR EACH ROW 
BEGIN
    IF INSERTING THEN
      <<COLUMN_SEQUENCES>>
      BEGIN
            IF INSERTING AND :NEW."ContactUsDetailId" IS NULL THEN
              SELECT "CompanyContactUsDetail_SEQ".NEXTVAL INTO :NEW."ContactUsDetailId" FROM SYS.DUAL;
            END IF;
      END COLUMN_SEQUENCES;
    END IF;
    IF UPDATING THEN
        IF(:old."ContactUsPageURL" != :new."ContactUsPageURL")
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'CompanyContactUsDetail','ContactUsPageURL', :old."ContactUsPageURL", :new."ContactUsPageURL",:new."IpAddress");
        END IF;
        IF(:old."BuidldingSoftwareName" != :new."BuidldingSoftwareName")
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'CompanyContactUsDetail','BuidldingSoftwareName', :old."BuidldingSoftwareName", :new."BuidldingSoftwareName",:new."IpAddress");
        END IF;
        IF(:old."ComponentSoftwareName" != :new."ComponentSoftwareName")
        THEN 
            "HistoryEventsOP"(:new."ModifiedBy",'CompanyContactUsDetail','ComponentSoftwareName', :old."ComponentSoftwareName", :new."ComponentSoftwareName",:new."IpAddress");
        END IF;
        IF(:old."BuildingGoogleAnalyticsId" != :new."BuildingGoogleAnalyticsId")
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'CompanyContactUsDetail','BuildingGoogleAnalyticsId', :old."BuildingGoogleAnalyticsId", :new."BuildingGoogleAnalyticsId",:new."IpAddress");
        END IF;
        IF(:old."ComponenetAnalyticId" != :new."ComponenetAnalyticId")
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'CompanyContactUsDetail','ComponenetAnalyticId', :old."ComponenetAnalyticId", :new."ComponenetAnalyticId",:new."IpAddress");
        END IF;
        IF(:old."BuidlingPhone" != :new."BuidlingPhone")
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'CompanyContactUsDetail','BuidlingPhone', :old."BuidlingPhone", :new."BuidlingPhone",:new."IpAddress");
        END IF;
        IF(:old."ComponentPhone" != :new."ComponentPhone") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'CompanyContactUsDetail','ComponentPhone', :old."ComponentPhone", :new."ComponentPhone",:new."IpAddress");
        END IF;
        IF(:old."DistrictManager" != :new."DistrictManager")
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'CompanyContactUsDetail','DistrictManager', :old."DistrictManager", :new."DistrictManager",:new."IpAddress");
        END IF;
        IF(:old."RegionalManager" != :new."RegionalManager")
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'CompanyContactUsDetail','RegionalManager', :old."RegionalManager", :new."RegionalManager",:new."IpAddress");
        END IF;
       IF(:old."ServiceRepresentative" != :new."ServiceRepresentative")
       THEN 
            "HistoryEventsOP"(:new."ModifiedBy",'CompanyContactUsDetail','ServiceRepresentative', :old."ServiceRepresentative", :new."ServiceRepresentative",:new."IpAddress");
        END IF;



    END IF;
END;



/