CREATE OR REPLACE TRIGGER abs_mdi."ShippingPlants_TRG" 
BEFORE INSERT OR UPDATE ON abs_mdi."ShippingPlants" 
FOR EACH ROW 
BEGIN
 IF INSERTING THEN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."ShippingPlantId" IS NULL THEN
      SELECT "ShippingPlants_SEQ".NEXTVAL INTO :NEW."ShippingPlantId" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END IF;
 IF UPDATING THEN
        IF (:old."IsActive" != :new."IsActive") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'ShippingPlants','IsActive', :old."IsActive", :new."IsActive",:new."IpAddress"); 
        END IF;
         IF (:old."PlantCode" != :new."PlantCode") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'ShippingPlants','PlantCode', :old."PlantCode", :new."PlantCode",:new."IpAddress"); 
        END IF;
         IF (:old."Name" != :new."Name") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'ShippingPlants','Name', :old."Name", :new."Name",:new."IpAddress"); 
        END IF;
         IF (:old."Latitude" != :new."Latitude") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'ShippingPlants','Latitude', :old."Latitude", :new."Latitude",:new."IpAddress"); 
        END IF;
         IF (:old."Longitude" != :new."Longitude") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'ShippingPlants','Longitude', :old."Longitude", :new."Longitude",:new."IpAddress"); 
        END IF;
         IF (:old."IsCanadaApproved" != :new."IsCanadaApproved") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'ShippingPlants','IsCanadaApproved', :old."IsCanadaApproved", :new."IsCanadaApproved",:new."IpAddress"); 
        END IF;
         IF (:old."PriceMultiplier" != :new."PriceMultiplier") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'ShippingPlants','PriceMultiplier', :old."PriceMultiplier", :new."PriceMultiplier",:new."IpAddress"); 
        END IF;
         IF (:old."IsExpressCapable" != :new."IsExpressCapable") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'ShippingPlants','IsExpressCapable', :old."IsExpressCapable", :new."IsExpressCapable",:new."IpAddress"); 
        END IF;
         IF (:old."IsMbciPlant" != :new."IsMbciPlant") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'ShippingPlants','IsMbciPlant', :old."IsMbciPlant", :new."IsMbciPlant",:new."IpAddress"); 
        END IF;
         IF (:old."MaximumWeightPerTruck" != :new."MaximumWeightPerTruck") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'ShippingPlants','MaximumWeightPerTruck', :old."MaximumWeightPerTruck", :new."MaximumWeightPerTruck",:new."IpAddress"); 
        END IF;
         IF (:old."MinimumFreightFee" != :new."MinimumFreightFee") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'ShippingPlants','MinimumFreightFee', :old."MinimumFreightFee", :new."MinimumFreightFee",:new."IpAddress"); 
        END IF;
         IF (:old."FreightSurcharge" != :new."FreightSurcharge") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'ShippingPlants','FreightSurcharge', :old."FreightSurcharge", :new."FreightSurcharge",:new."IpAddress"); 
        END IF;
         IF (:old."MinimumWeight" != :new."MinimumWeight") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'ShippingPlants','MinimumWeight', :old."MinimumWeight", :new."MinimumWeight",:new."IpAddress"); 
        END IF;
        IF (:old."FreightRate" != :new."FreightRate") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'ShippingPlants','FreightRate', :old."FreightRate", :new."FreightRate",:new."IpAddress"); 
        END IF;
        IF (:old."AdditionalPerTruckFee" != :new."AdditionalPerTruckFee") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'ShippingPlants','AdditionalPerTruckFee', :old."AdditionalPerTruckFee", :new."AdditionalPerTruckFee",:new."IpAddress"); 
        END IF;
        IF (:old."CpuAddressId" != :new."CpuAddressId") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'ShippingPlants','CpuAddressId', :old."CpuAddressId", :new."CpuAddressId",:new."IpAddress"); 
        END IF;
        IF (:old."IsCpuPlant" != :new."IsCpuPlant") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'ShippingPlants','IsCpuPlant', :old."IsCpuPlant", :new."IsCpuPlant",:new."IpAddress"); 
        END IF;
        IF (:old."TruckTarpFee" != :new."TruckTarpFee") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'ShippingPlants','TruckTarpFee', :old."TruckTarpFee", :new."TruckTarpFee",:new."IpAddress"); 
        END IF;
        IF (:old."IsComponentsPlant" != :new."IsComponentsPlant") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'ShippingPlants','IsComponentsPlant', :old."IsComponentsPlant", :new."IsComponentsPlant",:new."IpAddress"); 
        END IF;
        IF (:old."ComponentsLeadDays" != :new."ComponentsLeadDays") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'ShippingPlants','ComponentsLeadDays', :old."ComponentsLeadDays", :new."ComponentsLeadDays",:new."IpAddress"); 
        END IF;
        END IF;
END;



/