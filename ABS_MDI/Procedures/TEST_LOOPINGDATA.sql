CREATE OR REPLACE PROCEDURE abs_mdi."TEST_LOOPINGDATA" 
(
	BuildingNo  varchar,
    Rec_Data  OUT  SYS_REFCURSOR
)
is 
CountRecord varchar(1000);
	
BEGIN
OPEN Rec_Data FOR
select regexp_substr (
           BuildingNo,
           '[^,]+',
           1,
           level
         ) as "CountRecord" into CountRecord from dual connect by level <= 
    length ( BuildingNo ) - length ( replace ( BuildingNo, ',' ) ) + 1;
--OPEN Rec_Data FOR
	--<execution part>
--EXCEPTION
	--<exception handling part>
        --DBMS_OUTPUT.PUT_LINE('Loop no:' ||CountRecord ); 
    
    

END;
/