CREATE OR REPLACE PROCEDURE abs_mdi."NETADDLINEDETAILS_SELECT" (
    Guid IN RAW DEFAULT NULL,    
    OUTPUT_NETADDLINEDETAILS OUT  SYS_REFCURSOR
    
) 
AS
BEGIN
   OPEN OUTPUT_NETADDLINEDETAILS FOR SELECT
   
                                Header."Id" "HeaderId",
                                NetAddLineDetails."NetAddLineDetailsId",
                                LOWER (RAW_TO_GUID (NetAddLineDetails."Guid")) "Guid",
                                CASE WHEN Header."Enum"='OtherDesc' THEN NetAddLineDetails."Description" ELSE Header."Name" END "Header" ,
                                CASE WHEN NetAddLineDetails."Description" IS NULL AND Header."Enum"!='OtherDesc' THEN Header."Enum" ELSE NetAddLineDetails."Description" END "Description",
                                NetAddLineDetails."Weight",
                                NetAddLineDetails."SellPrice",
                                NetAddLineDetails."Cost",
                                NetAddLineDetails."Margin",
                                NetAddLineDetails."Markup"
                                
                            FROM
                                    "Input_NetAddLineDetails" NetAddLineDetails
                               JOIN "Input_AddLines" AddLines ON NetAddLineDetails."Guid" = AddLines."Guid"
                               JOIN "BuildingInformation" Info ON AddLines."BuildingInformationId" = Info."BuildingInformationId"
                               RIGHT JOIN "M_NetAddlineHeader" Header ON NetAddLineDetails."HeaderId"=Header."Id"
                            AND
                                   NetAddLineDetails."Guid"=Guid
                            ORDER By Header."Id",NetAddLineDetails."NetAddLineDetailsId";
END NETADDLINEDETAILS_SELECT;
/