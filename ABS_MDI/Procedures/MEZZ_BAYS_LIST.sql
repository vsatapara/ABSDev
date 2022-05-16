CREATE OR REPLACE PROCEDURE abs_mdi."MEZZ_BAYS_LIST" 
(
    BuildingInformationId IN   NUMBER,
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
OPEN output_data FOR 
--SELECT  *  FROM "Input_Bays"
SELECT * FROM (
SELECT IB."BuildingInformationId",IB."Elevation",IB."BayNumber",CAST(IB."Width"AS varchar(30)) as "Width"
FROM
"Input_Bays" IB
where IB."BuildingInformationId" in
   (
   SELECT regexp_substr(BuildingInformationId,'[^,]+', 1, level) from dual
   connect by regexp_substr(BuildingInformationId, '[^,]+', 1, level) is not null
   )
    UNION ALL
    SELECT IE."BuildingNo",
(case when BI."Structure" is null then
                                    (Case when "ElevationType" = 'S'
                                    then (Case when "EndWallNo" = 1 then 'B' else 'D' end)
                                    else (Case when "EndWallNo" = 1 then 'A' else 'C' end) end) 
                                    else  (Case when "ElevationType" = 'S'
                                    then (Case when "EndWallNo" = 1 then 'A' else 'C' end)
                                   else (Case when "EndWallNo" = 1 then 'D' else 'B' end) end)  end) as "Elevation",
"BayNo" as "BayNumber",
CAST ("BaySpacing" AS varchar(30)) as "Width"
FROM "Input_Endwall" IE
join "Input_Endwalls_ColumnSpacing" IECS on IE."EndWallID" = IECS."EndWallID"
left join "BuildingInformation" BI on BI."BuildingInformationId" = IE."BuildingNo"
--WHERE IE."BuildingNo" =BuildingInformationId;
WHERE IE."BuildingNo" in
 (
  SELECT regexp_substr(BuildingInformationId,'[^,]+', 1, level) from dual
  connect by regexp_substr(BuildingInformationId, '[^,]+', 1, level) is not null
                )
) ORDER BY 1,2,3;
END MEZZ_BAYS_LIST;
/