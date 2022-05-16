CREATE OR REPLACE PROCEDURE abs_mdi."COMMON_EXIST" 
(
  TableName IN VARCHAR2,
  TargetColumnId IN VARCHAR2, 
  CheckColumn IN VARCHAR2,
  CheckValue IN VARCHAR2,
  RecordId IN NUMBER,
  output_Data OUT SYS_REFCURSOR
)
IS 
str  VARCHAR2(2000);
BEGIN
    IF RecordId = 0 THEN        
        str :='
        OPEN Output_Data FOR 
        SELECT 
        count(*)
        FROM "'||TableName||'" WHERE  "'||CheckColumn||'" = '''||CheckValue||''' and ("IsDelete"=''N'' or "IsDelete" is null)';        
        --dbms_output.put_line(str);
        execute immediate str;   
    ELSE
        str :='
        OPEN Output_Data FOR 
        SELECT 
        count(*)
        FROM "'||TableName||'" WHERE  "'||CheckColumn||'" = '''||CheckValue||''' and  "'||TargetColumnId||'" != '''||RecordId||''' and ("IsDelete"=''N'' or "IsDelete" is null)';        
        --dbms_output.put_line(str);
        execute immediate str;            
    END IF;    
END COMMON_EXIST;
/