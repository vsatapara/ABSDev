CREATE OR REPLACE PROCEDURE abs_mdi."DDP_BOOKMARK_SELECT" ( 
 /*   Created By   Ashlesha Diwate
      Created Date   07-06-2021
      Description   This stored Procedure used to get the bookmark  data from DDP_BOOKMARK table    */
output_data  OUT  SYS_REFCURSOR
) AS
BEGIN
    OPEN output_data FOR
    SELECT
    BOOKMARKID,
    BOOKMARKNAME,
    REGEXPRESSION,
    GRAB0,
    GRAB1
    from  DDP_BOOKMARK where ISDELETE='N';
END DDP_BOOKMARK_SELECT;
/