CREATE OR REPLACE TRIGGER abs_mdi."BuilderInformation_TRG" 
BEFORE INSERT ON abs_mdi."BuilderInformation" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;

  IF UPDATING THEN

        IF(:old."BuilderName" != :new."BuilderName") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'BuilderInformation','BuilderName', :old."BuilderName", :new."BuilderName",:new."IpAddress");
        END IF;
        IF(:old."Website" != :new."Website") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'BuilderInformation','Website', :old."Website", :new."Website",:new."IpAddress");
        END IF;
        IF(:old."Phone" != :new."Phone") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'BuilderInformation','Phone', :old."Phone", :new."Phone",:new."IpAddress"); 
        END IF;
        IF(:old."Fax" != :new."Fax") 
        THEN 
            "HistoryEventsOP"(:new."ModifiedBy",'BuilderInformation','Fax', :old."Fax", :new."Fax",:new."IpAddress");
        END IF;
        IF(:old."BillToAddress" != :new."BillToAddress")
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'BuilderInformation','BillToAddress', :old."BillToAddress", :new."BillToAddress",:new."IpAddress");
        END IF;
        IF(:old."BillToCity" != :new."BillToCity")
        THEN 
            "HistoryEventsOP"(:new."ModifiedBy",'BuilderInformation','BillToCity', :old."BillToCity", :new."BillToCity",:new."IpAddress"); 
        END IF;
        IF(:old."BillToState" != :new."BillToState")
        THEN 
            "HistoryEventsOP"(:new."ModifiedBy",'BuilderInformation','BillToState', :old."BillToState", :new."BillToState",:new."IpAddress");
        END IF;
        IF(:old."BillToPostalCode" != :new."BillToPostalCode")
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'BuilderInformation','BillToPostalCode', :old."BillToPostalCode", :new."BillToPostalCode",:new."IpAddress"); 
        END IF;
        IF(:old."BillToCountry" != :new."BillToCountry")
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'BuilderInformation','BillToCountry', :old."BillToCountry", :new."BillToCountry",:new."IpAddress");
        END IF;
        IF(:old."ShipToAddress" != :new."ShipToAddress")
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'BuilderInformation','ShipToAddress', :old."ShipToAddress", :new."ShipToAddress",:new."IpAddress");
        END IF;
        IF(:old."ShipToCity" != :new."ShipToCity") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'BuilderInformation','ShipToCity', :old."ShipToCity", :new."ShipToCity",:new."IpAddress");
        END IF;
        IF(:old."ShipToState" != :new."ShipToState")
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'BuilderInformation','ShipToState', :old."ShipToState", :new."ShipToState",:new."IpAddress");
        END IF;
        IF(:old."ShipToPostalCode" != :new."ShipToPostalCode")
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'BuilderInformation','ShipToPostalCode', :old."ShipToPostalCode", :new."ShipToPostalCode",:new."IpAddress");
        END IF;
        IF(:old."ShipToCountry" != :new."ShipToCountry") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'BuilderInformation','ShipToCountry', :old."ShipToCountry", :new."ShipToCountry",:new."IpAddress");
        END IF;
        IF(:old."PrimaryContact" != :new."PrimaryContact")
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'BuilderInformation','PrimaryContact', :old."PrimaryContact", :new."PrimaryContact",:new."IpAddress");
        END IF;

    END IF;
END;

/