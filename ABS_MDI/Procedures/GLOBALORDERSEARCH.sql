CREATE OR REPLACE PROCEDURE abs_mdi."GLOBALORDERSEARCH" (
  JobNumber IN VARCHAR2,
  UserId IN VARCHAR2, 
  CompanyId IN NUMBER, 
  Output_Data OUT SYS_REFCURSOR
) 
AS 
BEGIN 
    OPEN Output_Data FOR 
         select 
            lo."ReceivedDate", 
            lo."Key", 
            lo."Description", 
            lo."JobNumber", 
            --od."OrderNumber",
            lo."CustomerId", 
            lo."Status", 
            lo."Type", 
            lo."Year", 
            lo."DateOrdered" 
         FROM 
            NXTGNOE."LatestOrders" @OE lo --JOIN NXTGNOE."OrderDetails"@OE od on lo."CustomerId" = od."CustomerId"
         WHERE 
            lo."JobNumber" = JobNumber 
            AND lo."CustomerId" IN (SELECT c."CustomerNo" FROM "USR_UserDetail" ud 
                INNER JOIN "USR_Brand_Customer" ubc ON ud."UserDetailId" = ubc."UserDetailId" 
                INNER JOIN "Customer" c ON ubc."CustomerId" = c."CustomerID" 
         WHERE 
            ud."UserId" = UserId AND ubc."BrandId" = CompanyId AND ud."IsActive" = 'Y' AND ud."IsDelete" = 'N') 
            AND lo."IsArchive" = '0' 
            GROUP BY lo."ReceivedDate",lo."Key",lo."Description",lo."JobNumber",lo."CustomerId",lo."Status",lo."Type",lo."Year",lo."DateOrdered" 
            ORDER BY lo."JobNumber";
END GLOBALORDERSEARCH;
/