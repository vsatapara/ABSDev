CREATE OR REPLACE PROCEDURE abs_mdi."SP_BFM_FRAMELINES" 
(
     BuildingNumber IN NUMBER,
     Rec_Data  OUT  SYS_REFCURSOR
)is 
CountEW1 NUMBER;
CountEW2 NUMBER;
begin
select count(*) into CountEW1 from "Input_Endwall" where "BuildingNo"=BuildingNumber and "FrameType"='Rigid Bearing Frame' and "EndWallNo"=1 AND ("IsDeleted" IS NULL  OR "IsDeleted" != 'Y');
select count(*) into CountEW2 from "Input_Endwall" where "BuildingNo"=BuildingNumber and "FrameType"='Rigid Bearing Frame' and "EndWallNo"=2 AND ("IsDeleted" IS NULL  OR "IsDeleted" != 'Y');
if CountEW1>=1 THEN 
begin
OPEN Rec_Data FOR
        SELECT
            "FrameLineId",
            "BuildingNumber",
            1 as "GroupNumber",
            "CreatedBy",
            "CreatedDate",
            "ModifiedBy",
            "ModifiedDate",
            "IpAddress",
            "IsDeleted",
            "ProjectId",
            "FrameLineNumber",
            "DesignGroupNumber"
        FROM
          "BFM_FrameLines" WHERE "BuildingNumber" in
                        (
                                SELECT regexp_substr(BuildingNumber,'[^,]+', 1, level) from dual
                                connect by regexp_substr(BuildingNumber, '[^,]+', 1, level) is not null
                        )
                        AND ("IsDeleted" IS NULL  OR "IsDeleted" != 'Y')
        union all
        SELECT
            "FrameLineId",
            "BuildingNumber",
            8 as "GroupNumber",
            "CreatedBy",
            "CreatedDate",
            "ModifiedBy",
            "ModifiedDate",
            "IpAddress",
            "IsDeleted",
            "ProjectId",
            1 as "FrameLineNumber",
            "DesignGroupNumber"
        FROM
          "BFM_FrameLines" WHERE "BuildingNumber" in
                        (
                                SELECT regexp_substr(BuildingNumber,'[^,]+', 1, level) from dual
                                connect by regexp_substr(BuildingNumber, '[^,]+', 1, level) is not null
                        )
                        AND ("IsDeleted" IS NULL  OR "IsDeleted" != 'Y') and rownum=1;
 end;   
end if;       

if CountEW2>=1 THEN 
begin
OPEN Rec_Data FOR
        SELECT
            "FrameLineId",
            "BuildingNumber",
            1 as "GroupNumber",
            "CreatedBy",
            "CreatedDate",
            "ModifiedBy",
            "ModifiedDate",
            "IpAddress",
            "IsDeleted",
            "ProjectId",
            "FrameLineNumber",
            "DesignGroupNumber"
        FROM
          "BFM_FrameLines" WHERE "BuildingNumber" in
                        (
                                SELECT regexp_substr(BuildingNumber,'[^,]+', 1, level) from dual
                                connect by regexp_substr(BuildingNumber, '[^,]+', 1, level) is not null
                        )
                        AND ("IsDeleted" IS NULL  OR "IsDeleted" != 'Y')
        union all
        SELECT
            "FrameLineId",
            "BuildingNumber",
            9 as "GroupNumber",
            "CreatedBy",
            "CreatedDate",
            "ModifiedBy",
            "ModifiedDate",
            "IpAddress",
            "IsDeleted",
            "ProjectId",
            7 as "FrameLineNumber",
            "DesignGroupNumber"
        FROM
          "BFM_FrameLines" WHERE "BuildingNumber" in
                        (
                                SELECT regexp_substr(BuildingNumber,'[^,]+', 1, level) from dual
                                connect by regexp_substr(BuildingNumber, '[^,]+', 1, level) is not null
                        )
                        AND ("IsDeleted" IS NULL  OR "IsDeleted" != 'Y') and rownum=1;
 end;   
end if;   
if CountEW1>=1 and CountEW2>=1 THEN
begin
OPEN Rec_Data FOR
        SELECT
            "FrameLineId",
            "BuildingNumber",
            1 as "GroupNumber",
            "CreatedBy",
            "CreatedDate",
            "ModifiedBy",
            "ModifiedDate",
            "IpAddress",
            "IsDeleted",
            "ProjectId",
            "FrameLineNumber",
            "DesignGroupNumber"
        FROM
          "BFM_FrameLines" WHERE "BuildingNumber" in
                        (
                                SELECT regexp_substr(BuildingNumber,'[^,]+', 1, level) from dual
                                connect by regexp_substr(BuildingNumber, '[^,]+', 1, level) is not null
                        )
                        AND ("IsDeleted" IS NULL  OR "IsDeleted" != 'Y')
        union all
        SELECT
            "FrameLineId",
            "BuildingNumber",
            8 as "GroupNumber",
            "CreatedBy",
            "CreatedDate",
            "ModifiedBy",
            "ModifiedDate",
            "IpAddress",
            "IsDeleted",
            "ProjectId",
            1 as "FrameLineNumber",
            "DesignGroupNumber"
        FROM
          "BFM_FrameLines" WHERE "BuildingNumber" in
                        (
                                SELECT regexp_substr(BuildingNumber,'[^,]+', 1, level) from dual
                                connect by regexp_substr(BuildingNumber, '[^,]+', 1, level) is not null
                        )
                        AND ("IsDeleted" IS NULL  OR "IsDeleted" != 'Y') and rownum=1
    union all
    SELECT
            "FrameLineId",
            "BuildingNumber",
            9 as "GroupNumber",
            "CreatedBy",
            "CreatedDate",
            "ModifiedBy",
            "ModifiedDate",
            "IpAddress",
            "IsDeleted",
            "ProjectId",
            7 as "FrameLineNumber",
            "DesignGroupNumber"
        FROM
          "BFM_FrameLines" WHERE "BuildingNumber" in
                        (
                                SELECT regexp_substr(BuildingNumber,'[^,]+', 1, level) from dual
                                connect by regexp_substr(BuildingNumber, '[^,]+', 1, level) is not null
                        )
                        AND ("IsDeleted" IS NULL  OR "IsDeleted" != 'Y') and rownum=1;
 end;   
end if;
END Sp_BFM_FRAMELINES;
/