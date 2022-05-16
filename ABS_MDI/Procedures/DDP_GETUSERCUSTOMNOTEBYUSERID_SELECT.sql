CREATE OR REPLACE PROCEDURE abs_mdi."DDP_GETUSERCUSTOMNOTEBYUSERID_SELECT" 
/*   Created By Ashlesha Diwate
      Created Date   02-6-2021
      Description   This stored Procedure used to get user custom note by userby table   */
(
    par_UserId IN VARCHAR2,   
    Output_Data OUT SYS_REFCURSOR
)AS 
BEGIN
 OPEN Output_Data FOR 
  select ucn.* from DDP_UserCustomNotes ucn
  inner join "USR_UserDetail" ud on ud."UserDetailId" = ucn.UserDetailId 
  where ud."UserId"=par_UserId and ud."IsDelete" = 'N' and ucn.IsDelete = 'N';
END DDP_GETUSERCUSTOMNOTEBYUSERID_SELECT;
/