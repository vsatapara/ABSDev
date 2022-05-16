CREATE INDEX abs_mdi.xx_usgsseismicvalues_sptial_idx ON abs_mdi.xx_usgsseismicvalues(geopoint)
INDEXTYPE IS mdsys.spatial_index;