CREATE OR REPLACE PROCEDURE abs_mdi."CAD_OPTIONS_MASTER" (
    ProjectId   IN NUMBER,
    Output_Data OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN Output_Data FOR SELECT
           P."ProjectId" AS "JobID",
           P."ProjectName" AS "JobName",
            p."EnteredBy" AS "JobEstimator",
           BI."BuilderName" AS "BuilderName",
           PR."BuyerContactName" AS "BuilderContact",
           BI."BillToAddress" AS "BuilderAddress1",
           BI."BillToCity" AS "BuilderCity",
           BI."BillToState" AS "BuilderState",
           BI."BillToPostalCode" AS "BuilderZip",
           BI."BillToCountry" AS "BuilderCountry",
           A."Address1" AS "OwnerAddress1",
           IO."BuildingOwner" AS "OwnerName",
           A."City" AS "OwnerCity",
           A."State" AS "OwnerState",
           A."ZipCode" AS "OwnerZip"
      FROM   "Project" P
      /*LEFT JOIN "Input_Owner" IO   ON P."ProjectId" = IO."ProjectId"*/
      LEFT JOIN "EDSPrice_I_Owner" IO   ON P."ProjectId" = IO."ProjectId"
      LEFT JOIN "I_Address" A   ON P."ProjectId" = A."ProjectId"  AND A."AddressType" = 'OL'
      LEFT JOIN "BuilderInformation" BI ON P."CustomerNo"=BI."CustomerNo" AND P."CompanyId"=BI."CompanyId" 
      LEFT JOIN "Purchaser" PR   ON P."ProjectId" = PR."ProjectId"
      WHERE  P."ProjectId" = ProjectId;
END CAD_OPTIONS_MASTER;
/