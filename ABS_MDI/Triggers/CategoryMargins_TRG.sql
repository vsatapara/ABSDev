CREATE OR REPLACE TRIGGER abs_mdi."CategoryMargins_TRG" 
BEFORE INSERT ON abs_mdi."CategoryMargins" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
     IF INSERTING THEN
        BEGIN
            IF INSERTING AND :NEW."CategoryMarginId" IS NULL THEN
              SELECT "CategoryMargins_SEQ".NEXTVAL INTO :NEW."CategoryMarginId" FROM SYS.DUAL;
            END IF;
        END COLUMN_SEQUENCES;
      END IF;

    IF UPDATING THEN
        IF(:old."CategoryId" != :new."CategoryId")
        THEN 
            "HistoryEventsOP"(:new."ModifiedBy",'CategoryMargins','CategoryId', :old."CategoryId", :new."CategoryId",:new."IpAddress");
        END IF;
        IF(:old."AmountForBuilding" != :new."AmountForBuilding")
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'CategoryMargins','AmountForBuilding', :old."AmountForBuilding", :new."AmountForBuilding",:new."IpAddress");
        END IF;
        IF(:old."MultiplierForBuilding" != :new."MultiplierForBuilding")
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'CategoryMargins','MultiplierForBuilding', :old."MultiplierForBuilding", :new."MultiplierForBuilding",:new."IpAddress"); 
        END IF;
        IF(:old."AmountForComponents" != :new."AmountForComponents")
        THEN 
            "HistoryEventsOP"(:new."ModifiedBy",'CategoryMargins','AmountForComponents', :old."AmountForComponents", :new."AmountForComponents",:new."IpAddress");
        END IF;
        IF(:old."MultiplierForComponents" != :new."MultiplierForComponents") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'CategoryMargins','MultiplierForComponents', :old."MultiplierForComponents", :new."MultiplierForComponents",:new."IpAddress");
        END IF;
        IF(:old."IsBuyout" != :new."IsBuyout") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'CategoryMargins','IsBuyOut', :old."IsBuyout", :new."IsBuyout",:new."IpAddress");
        END IF;
        IF(:old."IsPurchased" != :new."IsPurchased")
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'CategoryMargins','IsPurchased', :old."IsPurchased", :new."IsPurchased",:new."IpAddress");
        END IF;
        IF(:old."IsDelete" != :new."IsDelete")
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'CategoryMargins','IsDelete', :old."IsDelete", :new."IsDelete",:new."IpAddress");
        END IF;

     END IF;

END;

/