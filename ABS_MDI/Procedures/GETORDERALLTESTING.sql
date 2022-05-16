CREATE OR REPLACE PROCEDURE abs_mdi."GETORDERALLTESTING" 
(
    JobNumber IN VARCHAR2,
    CustomerId IN VARCHAR2,
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
   OPEN Output_Data FOR 
     SELECT 
        lo."JobNumber",
        od."OrderNumber",
        lo."DateOrdered"
     FROM NXTGNOE."LatestOrders"@OE lo
     join NXTGNOE."OrderDetails"@OE od on lo."CustomerId" = od."CustomerId"
     where lo."JobNumber" = JobNumber AND lo."CustomerId" = CustomerId;
END GETORDERALLTESTING;
/