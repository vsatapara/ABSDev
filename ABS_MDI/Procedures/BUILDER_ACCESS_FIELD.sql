CREATE OR REPLACE PROCEDURE abs_mdi."BUILDER_ACCESS_FIELD" 
(
    Output_Data  OUT  SYS_REFCURSOR
)
AS 
BEGIN
  OPEN Output_Data FOR 
    SELECT
        NVL("Screen",' ') "Screen",
        "SectionText",
        "MinValue",
        "MaxValue",
        "ProjectBuildingType"
    FROM "BuilderAccessFieldMaster";
END BUILDER_ACCESS_FIELD;
/