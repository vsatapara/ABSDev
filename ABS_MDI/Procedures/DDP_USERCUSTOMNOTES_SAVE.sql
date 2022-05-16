CREATE OR REPLACE PROCEDURE abs_mdi."DDP_USERCUSTOMNOTES_SAVE" 
/*   Created By Banix Sheth
      Created Date   29-5-2021
      Description   This stored Procedure used to insert into  DDP_UserCustomNotes table  */
(
    par_USERDETAILID IN NUMBER,
    par_CUSTOMNOTE IN NCLOB,
    par_USERID IN NUMBER,
    par_IPADDRESS IN VARCHAR2,
    OutputId OUT NUMBER 
) AS 
BEGIN
    INSERT INTO DDP_UserCustomNotes(
                 "USERDETAILID",
                 "CUSTOMNOTE",
                 "CREATEDBY",
                 "CREATEDDATE",
                 "IPADDRESS"
                 )
        VALUES(
                 par_USERDETAILID,
                 par_CUSTOMNOTE,
                 par_USERID,
                 CURRENT_TIMESTAMP,
                 par_IPADDRESS
                 )
    RETURNING "CUSTOMNOTESID" into OutputId;
END DDP_UserCustomNotes_SAVE;
/