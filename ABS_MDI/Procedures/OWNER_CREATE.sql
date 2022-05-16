CREATE OR REPLACE PROCEDURE abs_mdi."OWNER_CREATE" (
    ProjectId         IN   NUMBER,
    BuildingOwner     IN   VARCHAR2,
    BusinessName      IN   VARCHAR2,
    BusinessContact   IN   VARCHAR2,
    PhoneNumber       IN   VARCHAR2,
    EndUseOfBuilding  VARCHAR2,
    Address1          IN   VARCHAR2,
    Address2          IN   VARCHAR2,
    Country           IN   VARCHAR2,
    State             IN   VARCHAR2,
    County            IN   VARCHAR2,
    City              IN   VARCHAR2,
    Zipcode           IN   VARCHAR2,
    Longitude         IN   VARCHAR2,
    Latitude          IN   VARCHAR2,
    UserId            IN   VARCHAR2,
    IpAddress         IN   VARCHAR2,
    CopyFlag IN CHAR DEFAULT 'N',
    OutputId          OUT  NUMBER
) IS
    rowCount        NUMBER := 0;
    ownerAddressId  NUMBER := 0;
BEGIN
    SELECT
        COUNT(1)
    INTO rowCount
    FROM
        "EDSPrice_I_Owner"
    WHERE
        "ProjectId" = ProjectId;
    IF rowCount = 0 THEN
        INSERT INTO "EDSPrice_I_Owner" (
            "ProjectId",
            "BuildingOwner",
            "BusinessName",
            "EndUseOfBuilding",
            "PhoneNumber",
            "CreatedBy",
            "CreatedDate",
            "ModifiedBy",
            "IpAddress",
            "CopyFlag",
            "IsDeleted",
            "Attention"
        ) VALUES (
            ProjectId,
            BuildingOwner,
            BusinessName,
            EndUseOfBuilding,
            PhoneNumber,
            UserId,
            CURRENT_TIMESTAMP,
            0,
            IpAddress,
            CopyFlag,
            'N',
            BusinessContact
        ) RETURNING "OwnerId" INTO OutputId;
        Address_Create(ProjectId => ProjectId, Address1 => Address1, Address2 => Address2, Country => Country,
                      State => State,
                      County => County,
                      City => City,
                      Zipcode => Zipcode,
                      Longitude => Longitude,
                      Latitude => Latitude,
                      CreatedBy => UserId,
                      IpAddress => IpAddress,
                      Addresstype => 'OL',
                      OutputId => ownerAddressId);
    ELSE
        SELECT
            "OwnerId"
        INTO OutputId
        FROM
            "EDSPrice_I_Owner"
        WHERE
            "ProjectId" = ProjectId;
        SELECT
            COUNT(1)
        INTO rowCount
        FROM
            "I_Address"
        WHERE
                "ProjectId" = ProjectId
            AND "AddressType" = 'OL';
        IF rowcount > 0 THEN
            SELECT
                "AddressId"
            INTO ownerAddressId
            FROM
                "I_Address"
            WHERE
                    "ProjectId" = ProjectId
                AND "AddressType" = 'OL';
        END IF;
        Owner_Update(OwnerId => OutputId, ProjectId => ProjectId, BuildingOwner => BuildingOwner, BusinessName => BusinessName,
                    BusinessContact => BusinessContact,
                    PhoneNumber => PhoneNumber,
                    EndUseOfBuilding => EndUseOfBuilding,
                    AddressId => ownerAddressId,
                    Address1 => Address1,
                    Address2 => Address2,
                    Country => Country,
                    State => State,
                    County => County,
                    City => City,
                    Zipcode => Zipcode,
                    Longitude => Longitude,
                    Latitude => Latitude,
                    UserId => UserId,
                    IpAddress => IpAddress,
                    CopyFlag =>CopyFlag);
    END IF;
END Owner_Create;
/