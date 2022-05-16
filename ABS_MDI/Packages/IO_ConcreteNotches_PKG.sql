CREATE OR REPLACE PACKAGE abs_mdi."IO_ConcreteNotches_PKG" 
is

-- GetRecordById
procedure GetRecordById (
BuildingInformationId in "Input_Wall"."BuildingInformationId"%type,
output_data         OUT  SYS_REFCURSOR
);


END "IO_ConcreteNotches_PKG";
/