CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORIES_PARAPET_UPDATE" (
ParapetIds IN VARCHAR2,
Flags IN VARCHAR2
) 
AS

l_exst number;
counts number DEFAULT 0;
TYPE ParapetCollection IS VARRAY(20) OF VARCHAR2(64);
ParapetArray ParapetCollection;
TYPE FlagCollection IS VARRAY(20) OF VARCHAR2(64);
FlagArray FlagCollection;
cursor c1 is
     SELECT
        regexp_substr(ParapetIds, '[^,]+', 1, level)
        FROM
            dual
        CONNECT BY
            regexp_substr(ParapetIds, '[^,]+', 1, level) IS NOT NULL;
    cursor f1 is
     SELECT
        regexp_substr(Flags, '[^,]+', 1, level)
        FROM
            dual
        CONNECT BY
            regexp_substr(Flags, '[^,]+', 1, level) IS NOT NULL;
    BEGIN
        open c1;
            fetch c1 bulk collect into ParapetArray;
        close c1;
        
        open f1;
            fetch f1 bulk collect into FlagArray;
        close f1;
        
       SELECT COUNT(*) INTO l_exst FROM "Accessories_Parapet" WHERE "ParapetId" in (SELECT
        regexp_substr(ParapetIds, '[^,]+', 1, level) pId
         FROM
        dual
        CONNECT BY
        regexp_substr(ParapetIds, '[^,]+', 1, level) IS NOT NULL);
        
    IF l_exst != 0 THEN
    
        FOR rec IN 1..ParapetArray.COUNT
        LOOP
        
          UPDATE "Accessories_Parapet"
        SET
          "IsInsulated"= FlagArray(rec)
        WHERE
          "ParapetId" = ParapetArray(rec);
      END LOOP;
        
    END IF;
END ACCESSORIES_Parapet_UPDATE;
/