CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORIES_VENTS_DROPDOWN_SELECT" 
(
Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
OPEN Output_Data FOR 
SELECT
    "Id",
    "Type",
    "DropDownValue"
FROM
    "Accessories_Vents_DropdownValue";
END ACCESSORIES_VENTS_DROPDOWN_SELECT;
/