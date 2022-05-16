CREATE OR REPLACE PROCEDURE abs_mdi."GRIDLIST" 
(
  ViewName IN VARCHAR2,
  WhereCond IN VARCHAR2, 
  SortingCol IN VARCHAR2,
  SortingOrder IN VARCHAR2,
  StartRow IN NUMBER,
  LastRow IN NUMBER,
  Output_Data OUT SYS_REFCURSOR
)
IS 
str  VARCHAR2(2000);
strOrder  VARCHAR2(200);
v_count NUMBER(30);
BEGIN
    execute immediate 'SELECT count(*) FROM "' || ViewName || '" WHERE 1=1 ' || WhereCond || '' 
    into v_count;
 
    IF SortingCol = 'Text' THEN
      strOrder:='dbms_lob.substr("Text",4000)';
    ELSE
        strOrder:='"'||SortingCol || '"' ;
    END IF;
   
    str :='SELECT * FROM 
    (
        SELECT '||v_count||' "count",ROWNUM RNO,tbl.* FROM
        (
            SELECT * FROM "' || ViewName || '" 
            WHERE 1=1 ' || WhereCond || ' 
           ORDER BY ' || strOrder || ' ' || SortingOrder || '
        )tbl
    )WHERE RNO BETWEEN '|| StartRow || ' AND ' || LastRow ;
    dbms_output.put_line(str);
    --dbms_output.put_line(v_count);
    OPEN Output_Data FOR str;
END GridList ;
/