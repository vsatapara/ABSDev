CREATE OR REPLACE PROCEDURE abs_mdi."OPENAREAS_DELETERECORD" 
(
  RecordId IN NUMBER,
  UserId IN NUMBER,
  IpAddress IN VARCHAR2
)
IS 
str  VARCHAR2(2000);
BEGIN
    str :='
    UPDATE "OpenAreas" 
    SET "IsDeleted"=''Y'',
    "ModifiedBy"='||UserId||',
    "ModifiedDate"=CURRENT_TIMESTAMP,
    "IpAddress"='''||IpAddress||'''
    WHERE "Id"='||RecordId;
    --dbms_output.put_line(str);
    execute immediate str ;
END OpenAreas_DeleteRecord;
/