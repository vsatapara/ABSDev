CREATE OR REPLACE PROCEDURE abs_mdi."GEOREGION_UPDATE" (
    Name         IN  VARCHAR2,
    IsActive     IN  CHAR,
    KMLFileName  IN  VARCHAR2 DEFAULT NULL,
    KMLFilePath  IN  VARCHAR2 DEFAULT NULL,
    IpAddress    IN  VARCHAR2 DEFAULT NULL,
    Region       IN  CLOB DEFAULT NULL,
    GeoRegionId  IN  NUMBER,
    ModifiedBy   IN  NUMBER
) AS
    KMLFileId NUMBER;
BEGIN
    IF KMLFileName IS NOT NULL THEN
        SELECT
            "KMLFileId"
        INTO KMLFileId
        FROM
            "GeoRegions"
        WHERE
            "GeoRegionId" = GeoRegionId;
        UPDATE "Attachment"
        SET
            "IsDelete" = 'Y',
            "AttachedDate" = CURRENT_TIMESTAMP
        WHERE
            "AttachmentId" = KMLFileId;
        INSERT INTO "Attachment" (
            "AttachmentType",
            "AttachmentName",
            "AttachmentPath",
            "IsDelete",
            "AttachedDate"
        ) VALUES (
            'KmlFile',
            KMLFileName,
            KMLFilePath,
            'N',
            CURRENT_TIMESTAMP
        ) RETURNING "AttachmentId" INTO KMLFileId;
        UPDATE "GeoRegions"
        SET
            "KMLFileId" = KMLFileId,
            "Region" = Region,
            "Region_New" = SDO_UTIL.FROM_WKTGEOMETRY('POLYGON (('
                                                     || Region
                                                     || '))')
        WHERE
            "GeoRegionId" = GeoRegionId;
    END IF;
    UPDATE "GeoRegions"
    SET
        "Name" = Name,
        "IsActive" = IsActive,
        --"KMLFileId" = KMLFileId,
        --"Region" = Region,
                "IpAddress" = IpAddress,
        "ModifiedBy" = ModifiedBy,
        "ModifiedDate" = CURRENT_TIMESTAMP
    WHERE
        "GeoRegionId" = GeoRegionId;
END GEOREGION_UPDATE;
/