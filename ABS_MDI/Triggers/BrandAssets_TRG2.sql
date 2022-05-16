CREATE OR REPLACE TRIGGER abs_mdi."BrandAssets_TRG2" 
BEFORE INSERT OR UPDATE ON abs_mdi."BrandAssets" 
FOR EACH ROW 
BEGIN
    IF INSERTING THEN
    <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
    END IF;
       IF UPDATING THEN
        IF (:old."BrandAssetsDisplayName" != :new."BrandAssetsDisplayName") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'BrandAssets','BrandAssetsDisplayName', :old."BrandAssetsDisplayName", :new."BrandAssetsDisplayName",:new."IpAddress"); 
        END IF;
        IF (:old."BrandAssetsFile" != :new."BrandAssetsFile") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'BrandAssets','BrandAssetsFile', :old."BrandAssetsFile", :new."BrandAssetsFile",:new."IpAddress"); 
        END IF;

    END IF;

END;



/