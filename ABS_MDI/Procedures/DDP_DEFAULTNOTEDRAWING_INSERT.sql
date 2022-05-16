CREATE OR REPLACE PROCEDURE abs_mdi."DDP_DEFAULTNOTEDRAWING_INSERT" 
 /*   Created By Foram Menpara
      Created Date   16-07-2021
      Description   This stored Procedure used to INSERT the data  in  table DDP_DEFAULTNOTEDRAWING  */
(
        --V_NOTEDRAWINGID IN NUMBER,
        V_CategoryID IN NUMBER,
        V_SubcategoryId IN NUMBER,
        V_DescriptionNote IN NCLOB,
        V_CREATEDBY IN NUMBER,
        V_IPAddress IN VARCHAR2,
        V_EDSKEY in NUMBER,
        OutputId OUT NUMBER
) AS
BEGIN
    INSERT INTO "DDP_DEFAULTNOTEDRAWING"(
        --"NOTEDRAWINGID",
        "CATEGORYID",
        "SUBCATEGORYID",
        "DESCRIPTION",
        "CREATEDBY",
        "CREATEDDATE",
        "IPADDRESS",
        "EDSKEY",
        "DDPKEY"
    ) 
VALUES 
	(
       -- V_NOTEDRAWINGID,
        V_CategoryID,
        V_SubcategoryId,
        V_DescriptionNote,
        V_CREATEDBY,
        CURRENT_TIMESTAMP,
        V_IPAddress,
        V_EDSKEY,
        (select max("DDPKEY") + 1 from "DDP_DEFAULTNOTEDRAWING")
    )	 RETURNING "NOTEDRAWINGID" into OutputId;
END DDP_DEFAULTNOTEDRAWING_INSERT;
/