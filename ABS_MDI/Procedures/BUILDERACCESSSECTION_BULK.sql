CREATE OR REPLACE PROCEDURE abs_mdi."BUILDERACCESSSECTION_BULK" 
(
    Builder_Section IN BuilderAccessSection_Type
    
) AS 
BEGIN
    INSERT INTO "BuilderAccessSection"
           ("BuilderAccessSectionId",
           "BuilderAccessPermissionId",
           "SectionId",
           "IsAvailable",
           "MinValue",
           "MaxValue",
           "SelectiveTab",
           "CreatedBy",
           "CreatedDate",
           "ModifiedBy",
           "ModifiedDate",
           "IpAddress",
           "IsFeetInchFormat")
    SELECT BuilderAccessSectionId,
           BuilderAccessPermissionId,
           SectionId,
           IsAvailable,
           MinValue,
           MaxValue,
           SelectiveTab,
           CreatedBy,
           CreatedDate,
           ModifiedBy,
           ModifiedDate,
           IpAddress,
           IsFeetInchFormat
    FROM TABLE(Builder_Section);
END BuilderAccessSection_Bulk;
/