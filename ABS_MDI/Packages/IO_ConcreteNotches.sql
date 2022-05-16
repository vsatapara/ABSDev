CREATE OR REPLACE PACKAGE abs_mdi."IO_ConcreteNotches" 
is

 -- InsertRecord
procedure InsertRecord (
--WallId in "Input_Wall"."WallId"%type default null 
BuildingInformationId in "Input_Wall"."BuildingInformationId"%type default null 
,NotchWidth in "Input_Wall"."NotchWidth"%type default null 
,NotchDepth in "Input_Wall"."NotchDepth"%type default null 
,NotchType in "Input_Wall"."NotchType"%type default null 
);

-- UpdateRecordate
procedure UpdateRecord (
WallId in "Input_Wall"."WallId"%type  
--,BuildingInformationId in "Input_Wall"."BuildingInformationId"%type  
,NotchWidth in "Input_Wall"."NotchWidth"%type  
,NotchDepth in "Input_Wall"."NotchDepth"%type  
,NotchType in "Input_Wall"."NotchType"%type  
);
-- DeleteByIdete
procedure DeleteById (
WallId in "Input_Wall"."WallId"%type
);
-- GetRecordById
procedure GetRecordById (
BuildingInformationId in "Input_Wall"."BuildingInformationId"%type,
output_data         OUT  SYS_REFCURSOR
);

-- GetAllRecord
procedure GetAllRecord (
output_data   OUT  SYS_REFCURSOR
);

END "IO_ConcreteNotches";
/