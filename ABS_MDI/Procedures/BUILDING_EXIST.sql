CREATE OR REPLACE PROCEDURE abs_mdi."BUILDING_EXIST" 
(
BuildingInformationId IN NUMBER,
ProjectId IN NUMBER,
BuildingName IN VARCHAR2,
Output_Data OUT SYS_REFCURSOR
)
as
begin
if BuildingInformationId = 0 then
open Output_Data for 
select count(1) from "BuildingInformation" where LOWER("BuildingName") = LOWER(BuildingName) and "IsDelete" = 'N' and "ProjectId" = ProjectId;
else
open Output_Data for 
select count(1) from "BuildingInformation" where LOWER("BuildingName") = LOWER(BuildingName) and "IsDelete" = 'N' and "ProjectId" = ProjectId and "BuildingInformationId" <> BuildingInformationId;
end if;
end BUILDING_EXIST;
/