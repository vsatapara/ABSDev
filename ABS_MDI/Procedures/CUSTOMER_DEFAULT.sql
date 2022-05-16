CREATE OR REPLACE PROCEDURE abs_mdi."CUSTOMER_DEFAULT" 
(       
    CustomerId IN NUMBER
)    
IS  
TotalCount number; 
BEGIN
    IF CustomerId != 0 THEN
    BEGIN
    UPDATE "Customer" SET
        "IsDefault"='N'
    WHERE "CustomerID" != CustomerId;
    UPDATE "Customer" SET
        "IsDefault"='Y'
    WHERE "CustomerID"= CustomerId;
    end;
    ELSE      
    begin
        select count(*) into TotalCount from "Customer" where "IsDefault" = 'Y' and "IsDelete"='N';
        IF TotalCount = 0 THEN
            UPDATE "Customer" SET "IsDefault" = 'Y' WHERE ROWNUM=1 and "IsDelete"='N';
        END IF;
    end;
  END IF;
END CUSTOMER_DEFAULT;
/