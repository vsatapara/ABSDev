CREATE OR REPLACE PROCEDURE abs_mdi."INCLUSIONEXCLUSION_DELETE" 
(
    InclusionExclusionId IN NUMBER,
    UserId IN NUMBER
)
AS 
BEGIN
    UPDATE "ShippingZoneGroup" SET
        "IsDelete" = 'Y',
        "ModifiedBy" = UserId,
        "ModifiedDate"=CURRENT_TIMESTAMP
    WHERE "InclusionExclusionId" = InclusionExclusionId;
END INCLUSIONEXCLUSION_DELETE;
/