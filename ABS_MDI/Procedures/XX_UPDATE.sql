CREATE OR REPLACE PROCEDURE abs_mdi."XX_UPDATE" ( 
	v_projectid IN STRING,
    v_ProjectUserId IN NUMBER,
    FromUserId IN VARCHAR2,
    ModifiedBy IN NUMBER,
    IpAddress IN VARCHAR2,
     ToUserId IN NUMBER
)
AS
l_exst number;
cursor c_update
IS
 SELECT
    regexp_substr(v_projectid, '[^,]+', 1, level) pid
FROM
    dual
CONNECT BY
    regexp_substr(v_projectid, '[^,]+', 1, level) IS NOT NULL
;
BEGIN
SELECT COUNT(*) INTO l_exst FROM XX_SELECT WHERE "ProjectId" in (SELECT
    regexp_substr(v_projectid, '[^,]+', 1, level) pid
FROM
    dual
CONNECT BY
    regexp_substr(v_projectid, '[^,]+', 1, level) IS NOT NULL) AND "FromUserId" = FromUserId and "IsActive"=1;
IF l_exst != 0 THEN
    FOR rec IN c_update 
    LOOP
 UPDATE XX_SELECT
        SET "FromUserId"=1,
        "ProjectId"=rec.pid,
        "ModifiedBy"=ModifiedBy,
        "ModifiedDate"=CURRENT_TIMESTAMP,
        ---"IpAddress"=IpAddress,
        "IsActive"=0
        WHERE "ProjectId"=rec.pid AND "FromUserId" =1;
        ---dbms_output.put_line(rec.pid);
       COMMIT;
INSERT INTO XX_SELECT("ProjectUserId","FromUserId","ProjectId","IsActive","ModifiedBy","ModifiedDate","IpAddress","CreatedDate", "CreatedBy")
  VALUES(v_ProjectUserId,FromUserId,rec.pid,1,ModifiedBy,CURRENT_TIMESTAMP,IpAddress,CURRENT_TIMESTAMP,ModifiedBy); 
COMMIT;
END LOOP;
END IF;
END xx_update;
/