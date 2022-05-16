CREATE OR REPLACE PROCEDURE abs_mdi."ACCESORIES_VALLEYGUTTERS_SELECT" 
(
    ValleyGutterId IN NUMBER,
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
  OPEN Output_Data FOR 
    SELECT
        AV."ValleyguttersId",
        AV."BuildingInformationId",
        AV."ProjectId",
        AV."Quantity",
        AV."Length",
        AV."Weight",
        AV."Drainage",
        AV."Price",
        AV."IsPrice",
        AV."DownspoutLength",
        AV."ConductorHeadLocation",
		AV."IpAddress", 
		AV."IsDelete" ,
		AV."CreatedBy",
		AV."CreatedDate",
		AV."ModifiedBy",
		AV."ModifiedDate"
        FROM
        "Accessories_Valleygutters" AV
        Where AV."ValleyguttersId" = ValleyGutterId;                

END ACCESORIES_VALLEYGUTTERS_SELECT;
/