CREATE OR REPLACE PROCEDURE abs_mdi."DDP_GETUSERDETAILIDBYUSERID" 
/*   Created By Ashlesha Diwate
      Created Date   27-5-2021
      Description   This stored Procedure used to get data  by UserId from USR_UserDetail table   */
(
    par_UserId IN VARCHAR2,   
    Output_Data OUT SYS_REFCURSOR
)AS 
BEGIN
 OPEN Output_Data FOR 
 select "UserDetailId" from "USR_UserDetail" where "UserId"=par_UserId and "IsDelete" = 'N';
END DDP_GETUSERDETAILIDBYUSERID;
/