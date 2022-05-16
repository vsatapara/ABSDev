CREATE OR REPLACE PROCEDURE abs_mdi."ACCESORIES_ROOFLTP_DRP" (
    BuildingInformationId  IN   NUMBER,
    RoofType               OUT  SYS_REFCURSOR,
    Length_Data            OUT  SYS_REFCURSOR
) IS
    RType     VARCHAR2(50) := '';
    ULRating  CHAR(1) := '';
    CNT NUMBER(5):=0;
BEGIN
    select count(*) 
    into CNT  
    from "Input_Roof"  
    WHERE "BuildingInformationId" = BuildingInformationId;
    IF (CNT>0)
    THEN
        SELECT
            "Type",
            "ULRating"
        INTO
            RType,
            ULRating
        FROM
            "Input_Roof"
        WHERE
            "BuildingInformationId" = BuildingInformationId;
    END IF;
    OPEN RoofType FOR SELECT
                         RType     AS "Type",
                         ULRating  AS "ULRating"
                     FROM
                         dual;
    OPEN Length_Data FOR SELECT
                            rc."LengthId",
                            rl."Value" AS "Length",
                            rc."IsLocationEnable",
                            rc."DefaultLocation",
                            rc."Size"
                        FROM
                                 "Accesories_RoofLTP_Common" rc
                            JOIN "Accesories_RoofLTP_Length" rl ON rl."Id" = rc."LengthId"
                        WHERE
                            rc."Type" = RType;
END ACCESORIES_ROOFLTP_DRP;
/