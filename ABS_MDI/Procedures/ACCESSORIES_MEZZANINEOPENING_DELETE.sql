CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORIES_MEZZANINEOPENING_DELETE" AS
(
        MezzaninesId IN NUMBER,
        MezzanineOpeningId IN NUMBER,
        IsDeleteAll IN VARCHAR,
        UserId IN NUMBER,
        IpAddress IN VARCHAR
)
AS 
BEGIN
    IF IsDeleteAll = 'N' THEN
        UPDATE "EDSPrice_IO_MezzanineOpening" 
            SET
                "IsDelete" = 'Y',
                "ModifiedBy" = UserId,
                "ModifiedDate" = CURRENT_TIMESTAMP,
                "IpAddress" =  IpAddress
            WHERE
                    "MezzanineOpeningId" = MezzanineOpeningId;
    ELSE
        UPDATE "EDSPrice_IO_MezzanineOpening" 
            SET
                "IsDelete" = 'Y',
                "ModifiedBy" = UserId,
                "ModifiedDate" = CURRENT_TIMESTAMP,
                "IpAddress" =  IpAddress
            WHERE
                    "MezzaninesId" = MezzaninesId;
    END IF;
END ACCESSORIES_MEZZANINEOPENING_DELETE;
/