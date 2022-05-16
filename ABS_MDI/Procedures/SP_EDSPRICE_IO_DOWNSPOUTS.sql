CREATE OR REPLACE PROCEDURE abs_mdi."SP_EDSPRICE_IO_DOWNSPOUTS" 
(
     BuildingNumber varchar,
     Rec_Data  OUT  SYS_REFCURSOR
)is 
-- THIS SP IS USING IN SP_EDSPRICE_IO_DOWNSPOUTS_PKG 
begin
delete from "EDSPrice_IO_Downspouts" where "BuildingNumber" 
in
                (
                        SELECT regexp_substr(BuildingNumber,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNumber, '[^,]+', 1, level) is not null
                )
                AND ("IsDeleted" IS NULL  OR "IsDeleted" != 'Y');
            Insert into "EDSPrice_IO_Downspouts"(
                    "BuildingNumber",
                    "Quantity",
                    "Elevation",
                    "BayNumber",
                    "DistFromLeftCorner",
                    "DistFromLeftCol",
                    "Length",
                    "Elbows",
                    "Color"
            )  (SELECT
                    IT."BuildingNumber",
                    IT."SW1Drops" as "Quantity",
                    'A' as "Elevation",
                    '0' as "BayNumber",
                    '0' as "DistFromLeftCorner",
                    '0' as "DistFromLeftCol",
                    IT."SW1DropHeight" as "Length",
                    IT."SW1IncludeElbows" as "Elbows",
                    ITC."Downspouts" as "Color"
                    FROM "Input_Trim" IT
                    LEFT JOIN "BuildingInformation" BInfo ON IT."BuildingNumber" = BInfo."BuildingInformationId" AND BInfo."Elevation" = 'S'
                    LEFT JOIN "GeometryInformation" Info ON IT."BuildingNumber" = Info."BuildingInformationId"
                    LEFT JOIN "Input_TrimColorSelections" ITC ON IT."BuildingNumber" = ITC."BuildingNumber"
                    Where IT."BuildingNumber" in
                                    (
                                            SELECT regexp_substr(BuildingNumber,'[^,]+', 1, level) from dual
                                            connect by regexp_substr(BuildingNumber, '[^,]+', 1, level) is not null
                                    ) and IT."IsDelete"='N' AND IT."SW1TrimOption" = 'Gutters and Downspouts'
UNION ALL
                    SELECT
                    IT."BuildingNumber",
                    IT."SW1Drops" as "Quantity",
                    'C' as "Elevation",
                    '0' as "BayNumber",
                    '0' as "DistFromLeftCorner",
                    '0' as "DistFromLeftCol",
                    IT."SW2DropHeight" as "Length",
                    IT."SW2IncludeElbows" as "Elbows",
                    ITC."Downspouts" as "Color"
                    FROM "Input_Trim" IT
                    LEFT JOIN "BuildingInformation" BInfo ON IT."BuildingNumber" = BInfo."BuildingInformationId" AND BInfo."Elevation" = 'S'
                    LEFT JOIN "GeometryInformation" Info ON IT."BuildingNumber" = Info."BuildingInformationId"
                    LEFT JOIN "Input_TrimColorSelections" ITC ON IT."BuildingNumber" = ITC."BuildingNumber"
                    Where IT."BuildingNumber" in
                                    (
                                            SELECT regexp_substr(BuildingNumber,'[^,]+', 1, level) from dual
                                            connect by regexp_substr(BuildingNumber, '[^,]+', 1, level) is not null
                                    ) and IT."IsDelete"='N' AND IT."SW2TrimOption" = 'Gutters and Downspouts');
END Sp_EDSPrice_IO_Downspouts;
/