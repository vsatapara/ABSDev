CREATE OR REPLACE PROCEDURE abs_mdi."GEOREGION_CREATE" (
    Name         IN   VARCHAR2,
    IsActive     IN   CHAR,
    CreatedBy    IN   NUMBER,
    IpAddress    IN   VARCHAR2 DEFAULT NULL,
    KMLFileName  IN   VARCHAR2 DEFAULT NULL,
    KMLFilePath  IN   VARCHAR2 DEFAULT NULL,
    Region       IN   CLOB DEFAULT NULL,
    OutputId     OUT  NUMBER
) AS
    KMLFileId NUMBER;
BEGIN
    /* Attachment Insert start*/
         IF KMLFileName IS NOT NULL THEN
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
    END IF;
    INSERT INTO "GeoRegions" (
        "Name",
        "IsActive",
        "KMLFileId",
        "Region",
        "IpAddress",
        "IsDelete",
        "CreatedBy",
        "CreatedDate",
        "Region_New"
    ) VALUES (
        Name,
        IsActive,
        KMLFileId,
        Region,
        IpAddress,
        'N',
        CreatedBy,
        CURRENT_TIMESTAMP,
        SDO_UTIL.FROM_WKTGEOMETRY('POLYGON (('
                                  || Region
                                  || '))')
    ) RETURNING "GeoRegionId" INTO OutputId;
END GEOREGION_CREATE;
/