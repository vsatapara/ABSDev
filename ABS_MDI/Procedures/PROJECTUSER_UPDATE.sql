CREATE OR REPLACE PROCEDURE abs_mdi."PROJECTUSER_UPDATE" ( 
	FromUserId IN VARCHAR2,
    ProjectId IN STRING,
    IpAddress IN VARCHAR2,
    ToUserId IN VARCHAR2,
    ModifiedBy IN NUMBER
)
    AS
    l_exst number;
    
    
    cursor c_update
    IS
     SELECT
        regexp_substr(ProjectId, '[^,]+', 1, level) pid
    FROM
        dual
    CONNECT BY
        regexp_substr(ProjectId, '[^,]+', 1, level) IS NOT NULL;
    
    BEGIN
    
    SELECT COUNT(*) INTO l_exst FROM "ProjectUser" WHERE "ProjectId" in (SELECT
        regexp_substr(ProjectId, '[^,]+', 1, level) pid
    FROM
        dual
    CONNECT BY
        regexp_substr(ProjectId, '[^,]+', 1, level) IS NOT NULL) AND "FromUserId" = FromUserId and "IsActive"='Y';
        
    dbms_output.put_line('ffff');
    
    IF l_exst != 0 THEN
    
        FOR rec IN c_update 
        LOOP
    
            UPDATE "ProjectUser"
                SET
                "ProjectId"=rec.pid,
                "ModifiedBy"=ModifiedBy,
                "ModifiedDate"=CURRENT_TIMESTAMP,
                "IpAddress"=IpAddress,
                "IsActive"= 'N'
                WHERE "ProjectId"=rec.pid AND "FromUserId" = FromUserId;
                dbms_output.put_line(rec.pid);
               COMMIT;
               
           UPDATE "Project"
            SET "UserId" = ToUserId
            WHERE "ProjectId"=rec.pid;
            COMMIT;
                
            INSERT INTO "ProjectUser"("FromUserId","ProjectId","IsActive","ModifiedBy","ModifiedDate","IpAddress","CreatedDate", "CreatedBy")
           VALUES(ToUserId,rec.pid,'Y',ModifiedBy,CURRENT_TIMESTAMP,IpAddress,CURRENT_TIMESTAMP,ModifiedBy); 
        
            COMMIT;
        END LOOP;
    
    ELSE 
        FOR rec IN c_update 
        LOOP
            
            UPDATE "Project"
            SET "UserId" = ToUserId
            WHERE "ProjectId"=rec.pid;
            COMMIT;
            
            INSERT INTO "ProjectUser"("FromUserId","ProjectId","IsActive","ModifiedBy","ModifiedDate","IpAddress","CreatedDate", "CreatedBy")
            VALUES(ToUserId,rec.pid,'Y',ModifiedBy,CURRENT_TIMESTAMP,IpAddress,CURRENT_TIMESTAMP,ModifiedBy); 
    
            COMMIT;
        END LOOP;
    END IF;
END PROJECTUSER_UPDATE;
/