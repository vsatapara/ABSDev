CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORIES_CRANES_MASTER_LIST" 
(
  OUTPUT_TABLE OUT SYS_REFCURSOR
)AS 
BEGIN
  OPEN OUTPUT_TABLE FOR
SELECT
  "Id",
  "Type",
  "Tons",
  "Span",
  "WheelBase",
  "BridgeWeight",
  "TrolleyWeight",
  "RailSize",
  "Girder"
FROM
  "Accessories_Cranes_Master";
END ACCESSORIES_CRANES_MASTER_LIST;
/