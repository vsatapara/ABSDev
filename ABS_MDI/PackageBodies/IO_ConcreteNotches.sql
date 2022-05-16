CREATE OR REPLACE PACKAGE BODY abs_mdi."IO_ConcreteNotches" 
is


procedure InsertRecord (
--WallId in "Input_Wall"."WallId"%type default null 
BuildingInformationId in "Input_Wall"."BuildingInformationId"%type default null 
,NotchWidth in "Input_Wall"."NotchWidth"%type default null 
,NotchDepth in "Input_Wall"."NotchDepth"%type default null 
,NotchType in "Input_Wall"."NotchType"%type default null 
) is
begin
Insert into "Input_Wall"(
"BuildingInformationId"
,"NotchWidth"
,"NotchDepth"
,"NotchType"

) values (
BuildingInformationId
,NotchWidth
,NotchDepth
,NotchType
);end;


-- UpdateRecordate
procedure UpdateRecord (
WallId in "Input_Wall"."WallId"%type  
--,BuildingInformationId in "Input_Wall"."BuildingInformationId"%type  
,NotchWidth in "Input_Wall"."NotchWidth"%type  
,NotchDepth in "Input_Wall"."NotchDepth"%type  
,NotchType in "Input_Wall"."NotchType"%type   
) is
begin
Update "Input_Wall" set
--"BuildingInformationId"=BuildingInformationId
"NotchWidth"=NotchWidth
,"NotchDepth"=NotchDepth
,"NotchType"=NotchType
where WallId = WallId;
end;


-- DeleteById
procedure DeleteById (
WallId in "Input_Wall"."WallId"%type
) is
begin
Delete from "Input_Wall"
where WallId = WallId;
end;


-- GetRecordById
procedure GetRecordById (
BuildingInformationId in "Input_Wall"."BuildingInformationId"%type,
output_data OUT  SYS_REFCURSOR
) is
begin
OPEN output_data FOR 
SELECT  *  FROM "Input_Wall" 
WHERE "BuildingInformationId" in
                (
                        SELECT regexp_substr(BuildingInformationId,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingInformationId, '[^,]+', 1, level) is not null
                )AND ("IsDelete" IS NULL  OR "IsDelete" != 'Y');
END GetRecordById;


-- GetAllRecord
procedure GetAllRecord (
output_data OUT  SYS_REFCURSOR
) is 
begin
OPEN output_data FOR 
SELECT  *  FROM "Input_Wall"; 
END GetAllRecord;

END "IO_ConcreteNotches";
/