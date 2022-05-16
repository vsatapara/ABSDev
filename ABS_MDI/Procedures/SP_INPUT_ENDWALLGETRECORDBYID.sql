CREATE OR REPLACE PROCEDURE abs_mdi."SP_INPUT_ENDWALLGETRECORDBYID" 
(
     BuildingNo  varchar,
     Rec_Data  OUT  SYS_REFCURSOR
)is 
CountBays NUMBER;
begin
SELECT max("BayNo") into CountBays  FROM "Input_Endwalls_ColumnSpacing" WHERE ("IsDeleted" IS NULL  OR "IsDeleted" != 'Y') and "BuildingNo" in (SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null);
if CountBays=1 THEN 
begin
            OPEN Rec_Data FOR
            SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                1 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=1 and rownum=1
            union all
            SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                2 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=1 and rownum=1
            --ENDWALL 2
           union all 
             SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                1 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=2 and rownum=1
            union all
            SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                2 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=2 and rownum=1;

end;   
end if;

if CountBays=2 THEN 
begin
            OPEN Rec_Data FOR
            SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                1 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=1 and rownum=1
            union all
            SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                2 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=1 and rownum=1
            union all
                SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                3 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=1 and rownum=1
            --ENDWALL 2
           union all 
             SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                1 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=2 and rownum=1
            union all
            SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                2 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=2 and rownum=1
            union all
                SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                3 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=2 and rownum=1;

end;   
end if;
if CountBays=3 THEN 
begin
            OPEN Rec_Data FOR
            SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                1 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=1 and rownum=1
            union all
            SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                2 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=1 and rownum=1
            union all
                SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                3 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=1 and rownum=1
            union all
            SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                4 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=1 and rownum=1
            --ENDWALL 2
           union all 
             SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                1 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=2 and rownum=1
            union all
            SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                2 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=2 and rownum=1
            union all
                SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                3 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=2 and rownum=1
            union all
            SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                4 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=2 and rownum=1;
end;   
end if; 
if CountBays=4 THEN 
begin
            OPEN Rec_Data FOR
            SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                1 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=1 and rownum=1
            union all
            SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                2 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=1 and rownum=1
            union all
                SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                3 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=1 and rownum=1
            union all
            SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                4 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=1 and rownum=1
                union all
            SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                5 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=1 and rownum=1
            --ENDWALL 2
           union all 
             SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                1 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=2 and rownum=1
            union all
            SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                2 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=2 and rownum=1
            union all
                SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                3 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=2 and rownum=1
            union all
            SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                4 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=2 and rownum=1
                union all
            SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                5 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=2 and rownum=1;
end;   
end if; 
if CountBays=5 THEN 
begin
            OPEN Rec_Data FOR
            SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                1 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=1 and rownum=1
            union all
            SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                2 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=1 and rownum=1
            union all
                SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                3 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=1 and rownum=1
            union all
            SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                4 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=1 and rownum=1
            union all
            SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                5 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=1 and rownum=1
            union all
            SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                6 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=1 and rownum=1
            --ENDWALL 2
           union all 
             SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                1 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=2 and rownum=1
            union all
            SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                2 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=2 and rownum=1
            union all
                SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                3 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=2 and rownum=1
            union all
            SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                4 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=2 and rownum=1
                union all
            SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                5 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=2 and rownum=1
                union all
            SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                6 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=2 and rownum=1;
end;   
end if; 
if CountBays=6 THEN 
begin
            OPEN Rec_Data FOR
            SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                1 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=1 and rownum=1
            union all
            SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                2 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=1 and rownum=1
            union all
                SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                3 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=1 and rownum=1
            union all
            SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                4 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=1 and rownum=1
            union all
            SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                5 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=1 and rownum=1
            union all
            SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                6 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=1 and rownum=1
            union all
            SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                7 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=1 and rownum=1
            --ENDWALL 2
           union all 
             SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                1 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=2 and rownum=1
            union all
            SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                2 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=2 and rownum=1
            union all
                SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                3 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=2 and rownum=1
            union all
            SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                4 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=2 and rownum=1
                union all
            SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                5 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=2 and rownum=1
                union all
            SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                6 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=2 and rownum=1
            union all
            SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                7 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=2 and rownum=1;
end;   
end if; 
if CountBays=7 THEN 
begin
            OPEN Rec_Data FOR
            SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                1 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=1 and rownum=1
            union all
            SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                2 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=1 and rownum=1
            union all
                SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                3 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=1 and rownum=1
            union all
            SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                4 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=1 and rownum=1
            union all
            SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                5 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=1 and rownum=1
            union all
            SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                6 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=1 and rownum=1
            union all
            SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                7 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=1 and rownum=1
         union all
            SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                8 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=1 and rownum=1
            --ENDWALL 2
           union all 
             SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                1 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=2 and rownum=1
            union all
            SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                2 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=2 and rownum=1
            union all
                SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                3 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=2 and rownum=1
            union all
            SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                4 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=2 and rownum=1
                union all
            SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                5 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=2 and rownum=1
                union all
            SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                6 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=2 and rownum=1
            union all
            SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                7 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=2 and rownum=1
        union all
            SELECT
                IER."BuildingNo",
                (CASE
                WHEN IE."EndWallNo"='1' THEN 'B'
                WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
                8 as "RecessNo",
                IER."Recesses",
                IER."EndWallID",
                IER."IsFrameColumn"
            FROM
                "Input_Endwalls_Recesses" IER 
                left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
                WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                )
                and IE."EndWallNo"=2 and rownum=1;
end;   
end if; 
if CountBays>=8 THEN 
begin
            OPEN Rec_Data FOR
         SELECT
    IER.ewrid,
    IER."BuildingNo",
    (CASE
    WHEN IE."EndWallNo"='1' THEN 'B'
    WHEN IE."EndWallNo"='2' THEN 'D'END) as "EWRType",
    IER."RecessNo",
    IER."Recesses",
    IER."CreatedBy",
    IER."CreatedDate",
    IER."ModifiedBy",
    IER."ModifiedDate",
    IER."IpAddress",
    IER."EndWallID",
    IER."IsDeleted",
    IER."IsFrameColumn"
FROM
    "Input_Endwalls_Recesses" IER 
    left join "Input_Endwall" IE on IE."EndWallID"=IER."EndWallID"
    WHERE IER."BuildingNo" in
                (
                        SELECT regexp_substr(BuildingNo,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNo, '[^,]+', 1, level) is not null
                ); 
end;   
end if; 
END Sp_Input_EndwallGetRecordById;
/