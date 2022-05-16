CREATE OR REPLACE PROCEDURE abs_mdi."GROUPS_SELECT" 
(
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
OPEN Output_Data FOR
  Select GP."GroupId",GP."GroupName",GP."IsActive"
  from "Groups" GP ;  
END Groups_Select;
/