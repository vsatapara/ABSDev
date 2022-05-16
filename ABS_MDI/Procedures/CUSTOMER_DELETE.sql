CREATE OR REPLACE PROCEDURE abs_mdi."CUSTOMER_DELETE" 
(
   CustomerNos IN VARCHAR2,
   UserId IN NUMBER
)
IS 
str  VARCHAR2(2000);
BEGIN
      
    str :='
    UPDATE "Customer"
	SET "IsDelete" = ''Y'',
    "ModifiedBy" ='||UserId||'
	WHERE "CustomerNo" in ('||CustomerNos||')';
    
    dbms_output.put_line(str);
    execute immediate str;  
     
END Customer_Delete;
/