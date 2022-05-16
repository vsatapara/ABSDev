CREATE OR REPLACE PROCEDURE abs_mdi."DDP_USERCUSTOMNOTES_SELECT" 
/*    Created By Banix Sheth
      Created Date   29-5-2021
      Description   This stored Procedure used to get data from DDP_USERCUSTOMNOTES table  */
(
    par_USERID IN VARCHAR2,
    Output_Data OUT SYS_REFCURSOR
)
AS
BEGIN
        OPEN Output_Data FOR
        SELECT ucn.* FROM ddp_usercustomnotes ucn
        inner join "USR_UserDetail" ud on ud."UserDetailId" = ucn.userdetailid 
        WHERE ud."UserId" = par_USERID and ucn.isdelete = 'N' and ud."IsDelete" = 'N';
END DDP_USERCUSTOMNOTES_SELECT;
/