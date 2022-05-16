CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORIES_CANOPY_UPDATE" (
CanopyIds IN VARCHAR2,
Flags IN VARCHAR2
) 
AS
l_exst number;
counts number DEFAULT 0;
TYPE CanopyCollection IS VARRAY(20) OF VARCHAR2(64);
CanopyArray CanopyCollection;
TYPE FlagCollection IS VARRAY(20) OF VARCHAR2(64);
FlagArray FlagCollection;
    
    cursor c1 is
     SELECT
        regexp_substr(CanopyIds, '[^,]+', 1, level)
        FROM
            dual
        CONNECT BY
            regexp_substr(CanopyIds, '[^,]+', 1, level) IS NOT NULL;
    cursor f1 is
     SELECT
        regexp_substr(Flags, '[^,]+', 1, level)
        FROM
            dual
        CONNECT BY
            regexp_substr(Flags, '[^,]+', 1, level) IS NOT NULL;
    BEGIN
        open c1;
            fetch c1 bulk collect into CanopyArray;
        close c1;
        
        open f1;
            fetch f1 bulk collect into FlagArray;
        close f1;
        
       SELECT COUNT(*) INTO l_exst FROM "Accessories_Canopy" WHERE "AccessoriesCanopyId" in (SELECT
        regexp_substr(CanopyIds, '[^,]+', 1, level) cId
         FROM
        dual
        CONNECT BY
        regexp_substr(CanopyIds, '[^,]+', 1, level) IS NOT NULL);
        
    IF l_exst != 0 THEN
    
        FOR rec IN 1..CanopyArray.COUNT
        LOOP
        
        UPDATE "Accessories_Canopy" 
            SET
             "ExtendRoofInsulation" = FlagArray(rec)
         WHERE
             "AccessoriesCanopyId" = CanopyArray(rec);
        END LOOP;
        
    END IF;
END ACCESSORIES_CANOPY_UPDATE;
/