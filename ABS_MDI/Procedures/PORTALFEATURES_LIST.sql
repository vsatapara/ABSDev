CREATE OR REPLACE PROCEDURE abs_mdi."PORTALFEATURES_LIST" 
(
    Output_Data OUT SYS_REFCURSOR
)
AS
BEGIN
OPEN Output_Data FOR
    SELECT
        "FeatureId",
        "FeatureName",
        "FeatureDescription",
        "CreatedBy",
        "CreatedDate",
        "ModifiedBy",
        "ModifiedDate"
	FROM "PortalFeatures"; 
END PORTALFEATURES_LIST;
/