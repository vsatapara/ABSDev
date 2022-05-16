CREATE OR REPLACE PROCEDURE abs_mdi."DDP_USERCUSTOMNOTES_UPDATE" 
/*    Created By   Banix Sheth
      Created Date   29-5-2021
      Description   This stored Procedure used in the DDP and used for it will be used crud operations in DDP_UserCustomNotes table  */
(
    par_CUSTOMNOTESID IN NUMBER,
    par_CUSTOMNOTE IN NCLOB,
    par_USERID IN NUMBER,
    par_IPADDRESS IN VARCHAR2 
)
AS
BEGIN
        UPDATE  DDP_UserCustomNotes SET
                CUSTOMNOTE = par_CUSTOMNOTE,
                IPADDRESS = par_IPADDRESS,
                MODIFIEDDATE = CURRENT_TIMESTAMP,
                MODIFIEDBY= par_USERID
            WHERE CUSTOMNOTESID = par_CUSTOMNOTESID AND ISDELETE = 'N';
END DDP_USERCUSTOMNOTES_UPDATE;
/