CREATE OR REPLACE PROCEDURE abs_mdi."DDP_DEFAULTNOTEDRAWING_SAVE" 
 /*   Created By Ashlesha Diwate
      Created Date   2-3-2021
      Description   This stored Procedure used to INSERT the data  in  table DDP_DEFAULTNOTEDRAWING  */
( 
    V_CategoryID IN NUMBER,
    V_SubcategoryId IN NUMBER,
    V_DescriptionNote IN NCLOB,
    V_UserId IN NUMBER,
    V_IPAddress IN VARCHAR2,
    OutputId OUT NUMBER
) AS 
BEGIN
   
        
    INSERT INTO "DDP_DEFAULTNOTEDRAWING"(
    "CATEGORYID",
    "SUBCATEGORYID",
    "DESCRIPTION",
    "CREATEDBY",
    "CREATEDDATE",
    "IPADDRESS")
    VALUES
    (V_CategoryID,
    V_SubcategoryId,
    V_DescriptionNote,
    V_UserId,
    CURRENT_TIMESTAMP,
    V_IPAddress)
    RETURNING "NOTEDRAWINGID" into OutputId;
END DDP_DEFAULTNOTEDRAWING_SAVE;
/