CREATE INDEX abs_mdi.clm_georegions_spatial_idx ON abs_mdi."CLM_GeoRegions"("Shape")
INDEXTYPE IS mdsys.spatial_index;