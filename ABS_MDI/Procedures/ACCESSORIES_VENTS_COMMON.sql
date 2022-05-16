CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORIES_VENTS_COMMON" 
(
    BuildingInformationId  IN   NUMBER,
    RoofType               OUT  SYS_REFCURSOR,
    FrameType              OUT  SYS_REFCURSOR 
)
AS 
BEGIN
  OPEN RoofType FOR 
SELECT
            "Type"
        FROM
            "Input_Roof"
        WHERE
            "BuildingInformationId" = BuildingInformationId;
            
OPEN FrameType FOR 
SELECT
            "FrameType",
            "IsComplete" IsComplete
        FROM
            "BuildingInformation"
        WHERE
            "BuildingInformationId" = BuildingInformationId AND "IsDelete" != 'Y';
END ACCESSORIES_VENTS_COMMON;
/