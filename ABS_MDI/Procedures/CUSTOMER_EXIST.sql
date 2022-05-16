CREATE OR REPLACE PROCEDURE abs_mdi."CUSTOMER_EXIST" (
    CustomerID IN NUMBER,
    CustomerNo IN VARCHAR2,
    CustomerName IN VARCHAR2,
    Output_Data OUT SYS_REFCURSOR
) AS BEGIN
IF CustomerID = 0 then
 OPEN Output_Data FOR 
      SELECT 
       count(*)
      FROM "Customer" WHERE ("CustomerNo" = CustomerNo or LOWER("CustomerName") = LOWER(CustomerName));
      
ELSE
 OPEN Output_Data FOR 
      SELECT 
       count(*)
      FROM "Customer" WHERE ("CustomerNo" = CustomerNo or LOWER("CustomerName") = LOWER(CustomerName)) and "CustomerID" != CustomerID;
      
END IF;
END CUSTOMER_EXIST;
/