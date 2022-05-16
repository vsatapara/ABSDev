CREATE OR REPLACE PROCEDURE abs_mdi."DDP_CONTRACTINGADDRESSES_SELECT" (
 /*   Created By    Mayuresh Jagtap
      Created Date   07-06-2021
      Description   This stored Procedure used to get the contracting engineer addresses data from DDP_CONTRACTENGINEERSADDRESSES table    */
    EngineerId   IN   NVARCHAR2,
    output_data  OUT  SYS_REFCURSOR
) AS
BEGIN
    OPEN output_data FOR
    SELECT
         "MONIKER",
         "ADDRESS",
         "CITY",
         "STATE",
         "ZIPCODE",
         "PHONE"
     FROM
         "DDP_CONTRACTENGINEERSADDRESSES"
     WHERE
         "MONIKER" = EngineerId;
END ddp_contractingaddresses_select;
/