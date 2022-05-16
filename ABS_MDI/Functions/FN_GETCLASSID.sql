CREATE OR REPLACE FUNCTION abs_mdi."FN_GETCLASSID" 
RETURN VARCHAR2
IS 
    TotalClassId VARCHAR2(5000);
BEGIN
    SELECT SUBSTR (SYS_CONNECT_BY_PATH ("Id", ','), 2) into TotalClassId
          FROM (SELECT "Id" , ROW_NUMBER () OVER (ORDER BY "Id" ) rn,
                       COUNT (*) OVER () cnt
                  FROM "TableOfTables" where "Category"='BuildingClass')
         WHERE rn = cnt
    START WITH rn = 1
    CONNECT BY rn = PRIOR rn + 1;

    return TotalClassId;
END FN_GETCLASSID;
/