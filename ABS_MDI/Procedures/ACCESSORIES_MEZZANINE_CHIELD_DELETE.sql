CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORIES_MEZZANINE_CHIELD_DELETE" 
(
        MezzaninesId IN NUMBER,
        ProjectId IN NUMBER,
        IsDeleteAll IN VARCHAR,
        UserId IN NUMBER,
        IpAddress IN VARCHAR
)
AS 
BEGIN
    IF (IsDeleteAll = 'N') THEN
    
        UPDATE "EDSPrice_IO_MezzanineSpacing" 
            SET
                "IsDelete" = 'Y',
                "ModifiedBy" = UserId,
                "ModifiedDate" = CURRENT_TIMESTAMP,
                "IpAddress" =  IpAddress
            WHERE "MezzaninesId" = MezzaninesId;
                    
        UPDATE "EDSPrice_IO_MezzanineOpening" 
            SET
                "IsDelete" = 'Y',
                "ModifiedBy" = UserId,
                "ModifiedDate" = CURRENT_TIMESTAMP,
                "IpAddress" =  IpAddress
            WHERE "MezzaninesId" = MezzaninesId;
    ELSE
    
        UPDATE "EDSPrice_IO_MezzanineSpacing" 
            SET
                "IsDelete" = 'Y',
                "ModifiedBy" = UserId,
                "ModifiedDate" = CURRENT_TIMESTAMP,
                "IpAddress" =  IpAddress
            WHERE "ProjectId" = ProjectId;
            
        UPDATE "EDSPrice_IO_MezzanineOpening" 
            SET
                "IsDelete" = 'Y',
                "ModifiedBy" = UserId,
                "ModifiedDate" = CURRENT_TIMESTAMP,
                "IpAddress" =  IpAddress
            WHERE "ProjectId" = ProjectId;
    END IF;
END ACCESSORIES_MEZZANINE_CHIELD_DELETE;
/