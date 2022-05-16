CREATE OR REPLACE PROCEDURE abs_mdi."DDP_DEFAULTNOTEDRAWING_UPDATE" 
 /*   Created By Ashlesha Diwate
      Created Date   2-3-2021
      Description   This stored Procedure used to update the data  in  table DDP_DEFAULTNOTEDRAWING  */
(
    V_NOTEDRAWINGID IN NUMBER,
    V_DescriptionNote IN NCLOB,
    V_UserId IN NUMBER,
    V_IPAddress IN VARCHAR2,
    V_EDSKEY in NUMBER
)AS 
BEGIN
    If(V_EDSKEY > 0) THEN
        UPDATE  DDP_DEFAULTNOTEDRAWING SET
                --DESCRIPTION = V_DescriptionNote,
               --MODIFIEDBY = V_UserId,
                --MODIFIEDDATE = CURRENT_TIMESTAMP,
                --IPADDRESS = V_IPAddress,
                EDSKEY = V_EDSKEY
        WHERE NOTEDRAWINGID = V_NOTEDRAWINGID AND ISDELETE = 'N';
    
    ELSE     
         UPDATE  DDP_DEFAULTNOTEDRAWING SET
                DESCRIPTION = V_DescriptionNote,
                MODIFIEDBY = V_UserId,
                MODIFIEDDATE = CURRENT_TIMESTAMP,
                IPADDRESS = V_IPAddress
                --EDSKEY = V_EDSKEY
        WHERE NOTEDRAWINGID = V_NOTEDRAWINGID AND ISDELETE = 'N';
    End if;   
END DDP_DEFAULTNOTEDRAWING_UPDATE;
/