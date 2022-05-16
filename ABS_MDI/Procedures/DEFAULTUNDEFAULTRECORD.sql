CREATE OR REPLACE PROCEDURE abs_mdi."DEFAULTUNDEFAULTRECORD" 
(
  CompanyId IN NUMBER,
  TableName IN VARCHAR2,
  TargetColumnId IN VARCHAR2, 
  Defaultvalue IN CHAR,
  RecordId IN NUMBER,
  UserId IN NUMBER,
  IpAddress IN VARCHAR2
)
IS 
str  VARCHAR2(2000);
BEGIN
    IF Defaultvalue = 'N' THEN
        str :='
        UPDATE "'||TableName||'" 
        SET "IsDefault"='''||Defaultvalue||''',
        "ModifiedBy"='||UserId||',
        "ModifiedDate"=CURRENT_TIMESTAMP,
        "IpAddress"='''||IpAddress||'''
        WHERE "CompanyId"='||CompanyId ||' and "'||TargetColumnId||'"='||RecordId;
        --dbms_output.put_line(str);
        execute immediate str;   
    ELSE
        str :='
        UPDATE "'||TableName||'" 
        SET "IsDefault"=''N'',
        "ModifiedBy"='||UserId||',
        "ModifiedDate"=CURRENT_TIMESTAMP,
        "IpAddress"='''||IpAddress||'''
        WHERE "CompanyId"='||CompanyId;        
        --dbms_output.put_line(str);
        execute immediate str ;     
        
        str :='
        UPDATE "'||TableName||'" 
        SET "IsDefault"='''||Defaultvalue||''',
        "ModifiedBy"='||UserId||',
        "ModifiedDate"=CURRENT_TIMESTAMP,
        "IpAddress"='''||IpAddress||'''
        WHERE "CompanyId"='||CompanyId ||' and "'||TargetColumnId||'"='||RecordId;
        --dbms_output.put_line(str);
        execute immediate str ;       
    END IF;
END DEFAULTUNDEFAULTRECORD;
/