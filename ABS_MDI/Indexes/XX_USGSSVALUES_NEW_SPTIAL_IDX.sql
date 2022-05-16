CREATE INDEX abs_mdi.xx_usgssvalues_new_sptial_idx ON abs_mdi.xx_usgssvalues_new(geopoint)
INDEXTYPE IS mdsys.spatial_index;