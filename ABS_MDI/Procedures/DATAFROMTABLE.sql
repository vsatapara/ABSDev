CREATE OR REPLACE PROCEDURE abs_mdi."DATAFROMTABLE" AS 
BEGIN
DECLARE
  match_count integer;
  v_search_string varchar2(4000) := 'advcgtfs000080000ict1mosqiomujrk';
BEGIN  
  FOR t IN (SELECT owner,
                   table_name, 
                   column_name 
              FROM all_tab_columns
             WHERE data_type in ('VARCHAR2') ) 
  LOOP   
    BEGIN
      EXECUTE IMMEDIATE    
        'SELECT COUNT(*) FROM '||t.owner || '.' || t.table_name||
        ' WHERE '||t.column_name||' = :1'   
         INTO match_count  
        USING v_search_string; 
      IF match_count > 0 THEN 
        dbms_output.put_line( t.owner || '.' || t.table_name ||' '||t.column_name||' '||match_count );
      END IF; 
    EXCEPTION
      WHEN others THEN
        dbms_output.put_line( 'Error encountered trying to read ' ||
                              t.column_name || ' from ' || 
                              t.owner || '.' || t.table_name );
    END;
  END LOOP;
END;
END DATAFROMTABLE;
/