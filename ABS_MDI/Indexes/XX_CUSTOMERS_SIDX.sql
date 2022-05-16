CREATE INDEX abs_mdi.xx_customers_sidx ON abs_mdi.xx_customers(cust_geo_location)
INDEXTYPE IS mdsys.spatial_index;