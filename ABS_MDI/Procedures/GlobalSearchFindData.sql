CREATE OR REPLACE PROCEDURE abs_mdi."GlobalSearchFindData" 
(
    JobNumber IN VARCHAR2,
    CustomerId IN NUMBER,
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
   
   IF JobNumber = '1' then
BEGIN
   OPEN Output_Data FOR SELECT 
    lo."JobNumber",
    lo."Type",
    lo."Status",
    --lo."Name",
    --lo."RecivedDate",
    lo."DateOrdered"
   FROM NXTGNOE."LatestOrders"@OE lo 
   join NXTGNOE."OrderDetails"@OE od on lo."CustomerId" = od."CustomerId"
   WHERE  JobNumber=to_number("JobNumber") 
   AND "JobNumber" NOT IN ( SELECT "JobNumber" FROM NXTGNOE."LatestOrders"@OE WHERE "IsArchive"=0 AND JobNumber=to_number("JobNumber"))  
   Group By "JobNumber"
   Order  By "JobNumber" desc;
END;
    ELSE
BEGIN
   OPEN Output_Data FOR SELECT  
   lo."JobNumber",
    lo."Type",
    lo."Status",
    --lo."Name",
    --lo."RecivedDate",
    lo."DateOrdered"
   FROM NXTGNOE."LatestOrders"@OE lo 
   join NXTGNOE."OrderDetails"@OE od on lo."CustomerId" = od."CustomerId" 
   WHERE lo."CustomerId"=CustomerId AND CustomerId NOT IN ( SELECT CustomerId FROM NXTGNOE."LatestOrders"@OE WHERE "IsArchive"=1 AND CustomerId=(SELECT DISTINCT "CustomerId" FROM NXTGNOE."LatestOrders"@OE WHERE "CustomerId"=CustomerId))
   Group By lo."CustomerId"
   Order  By lo."CustomerId" desc;
END;
   END IF;
   
END "GlobalSearchFindData";
/