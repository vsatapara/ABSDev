CREATE OR REPLACE TRIGGER abs_mdi."ShippingZone_TRG" BEFORE
    INSERT OR UPDATE ON abs_mdi."ShippingZone"
    FOR EACH ROW
BEGIN
    << COLUMN_SEQUENCES >> BEGIN
        IF
            INSERTING
            AND :NEW."ShippingZoneId" IS NULL
        THEN
            SELECT
                "ShippingZone_SEQ".NEXTVAL
            INTO :NEW."ShippingZoneId"
            FROM
                SYS.DUAL;

        END IF;
    END COLUMN_SEQUENCES;

    IF UPDATING THEN
        IF ( :old."GeoRegionId" != :new."GeoRegionId" ) THEN
            "HistoryEventsOP"(:new."ModifiedBy", 'ShippingZone', 'GeoRegionId', :old."GeoRegionId", :new."GeoRegionId",
                             :new."IpAddress");
        END IF;

        IF ( :old."IsGeoRegionIncluded" != :new."IsGeoRegionIncluded" ) THEN
            "HistoryEventsOP"(:new."ModifiedBy", 'ShippingZone', 'IsGeoRegionIncluded', :old."IsGeoRegionIncluded", :new."IsGeoRegionIncluded",
                             :new."IpAddress");

        END IF;

        IF ( :old."Zone" != :new."Zone" ) THEN
            "HistoryEventsOP"(:new."ModifiedBy", 'ShippingZone', 'Zone', :old."Zone", :new."Zone",
                             :new."IpAddress");
        END IF;

    END IF;

END;

/