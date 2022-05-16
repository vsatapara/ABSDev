CREATE OR REPLACE PACKAGE BODY abs_mdi."IO_ConcreteNotches_PKG" 
is

-- GetRecordById
procedure GetRecordById (
BuildingInformationId in "Input_Wall"."BuildingInformationId"%type,
output_data OUT  SYS_REFCURSOR
) is
begin
OPEN output_data FOR 
SELECT
IWall."BuildingInformationId",
IWall."NotchWidth",
IWall."NotchDepth",
IWall."NotchType"
FROM "Input_Wall" IWall

WHERE IWall."BuildingInformationId" in
                (
                        SELECT regexp_substr(BuildingInformationId,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingInformationId, '[^,]+', 1, level) is not null
                )AND ("IsDelete" IS NULL  OR "IsDelete" != 'Y');
END GetRecordById;

END "IO_ConcreteNotches_PKG";
/