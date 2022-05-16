CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORYLOUVERS_SELECT" 
(
    LouverId IN NUMBER,
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
  OPEN Output_Data FOR 
    SELECT
        AL."LouverId",
        AL."ProjectId",
        AL."BuildingId",
        AL."Quantity",
        AL."Elevation",
        AL."BayNumber",
        AL."SillHeight",
        AL."HeaderHeight",
        AL."Width",
        AL."DistFromLeftCorner",
        AL."DistFromLeftCol",
        AL."TrimColor",
        AL."LouverColor",
        AL."SubFraming",
        AL."Type",
        AL."LouverSize",
        AL."LocatedInLiner",
        AL."IncludeFramedOpening",
        AL."RunOfLouvers",
        AL."PartitionNumber",
        AL."BracedBay",
        AL."LouverColorValsparCode",
        AL."LouverColorSpecialName",
        AL."TrimColorValsparCode",
        AL."TrimColorSpecialName"
        FROM
        "Accessories_Louvers" AL
        Where AL."LouverId" = LouverId;                
END ACCESSORYLOUVERS_SELECT;
/