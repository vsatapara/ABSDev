CREATE OR REPLACE PROCEDURE abs_mdi."DDP_USERCUSTOMNOTES_CRUD" 
(
 /*   Created By    Ashlesha Diwate
      Created Date   25-5-2021
      Description   This stored Procedure used in the DDP and used for it will be used crud operations in DDP_UserCustomNotes table  */
par_USERDETAILID IN NUMBER,
par_CUSTOMNOTE IN NCLOB,
par_USERID IN NUMBER,
par_IPADDRESS IN VARCHAR2,
OutputId OUT NUMBER 
)
IS   
 INCUSTOMNOTESID NUMBER := 0;
  
BEGIN 
     begin
        select CUSTOMNOTESID into INCUSTOMNOTESID from DDP_UserCustomNotes
        WHERE USERDETAILID = par_USERDETAILID and ISDELETE='N';
     exception
       when no_data_found then
         INCUSTOMNOTESID := 0;
     end;
      
   IF INCUSTOMNOTESID > 0 THEN
   
        UPDATE  DDP_UserCustomNotes SET
                CUSTOMNOTE = par_CUSTOMNOTE,
                IPADDRESS = par_IPADDRESS,
                MODIFIEDDATE = CURRENT_TIMESTAMP,
                MODIFIEDBY=par_USERID
        WHERE CUSTOMNOTESID = INCUSTOMNOTESID
       RETURNING "INCUSTOMNOTESID" into OutputId;
       
   Else
    
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
        
    END IF;
END DDP_USERCUSTOMNOTES_CRUD;
/