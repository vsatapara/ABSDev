CREATE OR REPLACE PROCEDURE abs_mdi."OWNER_SELECT" (
    ProjectId     IN   NUMBER,
    Owner_Data  OUT  SYS_REFCURSOR
) AS BEGIN
OPEN Owner_Data FOR SELECT
                    ow."OwnerId",
                    ow."ProjectId",
                    ow."BuildingOwner",
                    ow."BusinessName",
                    ow."Attention" as "BusinessContact",
                    ow."EndUseOfBuilding",
                    ow."PhoneNumber",
                    ow."CreatedBy",
                    ow."CreatedDate",
                    ow."IpAddress",
                    ow."CopyFlag",
                    ow."IsDeleted",
                    a."AddressId",
                    a."Address1",
                    a."Address2",
                    a."Country",
                    a."State",
                    a."County",
                    a."City",
                    a."ZipCode",
                    a."Longitude",
                    a."Latitude",
                    a."AddressType"
                FROM "EDSPrice_I_Owner" ow
                LEFT OUTER JOIN "I_Address" a
                   ON ow."ProjectId" = a."ProjectId"
                WHERE ow."ProjectId" = ProjectId 
                  AND a."AddressType" = 'OL';
END Owner_Select;
/