CREATE OR REPLACE PROCEDURE abs_mdi."COLOR_MASTER_LIST" (
    CompanyId    IN   NUMBER,
    Module       IN   VARCHAR2,
    CategotyId   IN   NUMBER,
    ModuleType   IN   VARCHAR2,
    Gauge        IN   NUMBER,
    OUTPUT_DATA  OUT  SYS_REFCURSOR
) AS
BEGIN
    IF ( Module = 'Roof' ) THEN
        OPEN OUTPUT_DATA FOR SELECT
                                 CM."ColorText",
                                 CM."ColorName",
                                 NVL(CC."ColorCode", ' ')        "ColorCode",
                                 NVL(CC."Roof", ' ')             "ColorHashCode"
                             FROM
                                      "ColorMaster" CM
                                 JOIN "ColorCodes"  CC ON CC."ColorText" = CM."ColorText"
                                 JOIN "ColorPanel"  CP ON CP."CategotyId" = CM."CategoryId"
                             WHERE
                                     CP."Type" = ModuleType
                                 AND CP."Gauge" = Gauge
                                 AND CP."IsRoof" = 'Y'
                                 AND CC."CompanyId" = CompanyId;
    ELSIF ( Module = 'Wall' ) THEN
        OPEN OUTPUT_DATA FOR SELECT
                                 CM."ColorText",
                                 CM."ColorName",
                                 NVL(CC."ColorCode", ' ')        "ColorCode",
                                 NVL(CC."Wall", ' ')             "ColorHashCode"
                             FROM
                                      "ColorMaster" CM
                                 JOIN "ColorCodes"  CC ON CC."ColorText" = CM."ColorText"
                                 JOIN "ColorPanel"  CP ON CP."CategotyId" = CM."CategoryId"
                             WHERE
                                     CP."Type" = ModuleType
                                 AND CP."Gauge" = Gauge
                                 AND ( CP."IsWall" = 'Y'
                                       OR ( CP."IsWall" = 'N'
                                            AND CP."IsRoof" = 'N' ) )
                                 AND CC."CompanyId" = CompanyId;
    ELSIF ( Module = 'OpenArea' ) THEN
        OPEN OUTPUT_DATA FOR SELECT
                                 CM."ColorText",
                                 CM."ColorName",
                                 NVL(CC."ColorCode", ' ')        "ColorCode",
                                 NVL(CC."OpenArea", ' ')         "ColorHashCode"
                             FROM
                                      "ColorMaster" CM
                                 JOIN "ColorCodes" CC ON CC."ColorText" = CM."ColorText"
                             WHERE
                                     CM."CategoryId" = CategotyId
                                 AND CC."CompanyId" = CompanyId;
    ELSIF (
        Module != 'Downspouts'
        AND Module != 'Gutters'
        AND ( ModuleType = 'Tuff-Cast' OR ModuleType = 'Tuff Wall' )
    ) THEN
        OPEN OUTPUT_DATA FOR SELECT
                                 CM."ColorText",
                                 CM."ColorName",
                                 NVL(CC."ColorCode", ' ')        "ColorCode",
                                 NVL(CC."Trim", ' ')             "ColorHashCode"
                             FROM
                                      "ColorMaster" CM
                                 JOIN "ColorCodes"  CC ON CC."ColorText" = CM."ColorText"
                                 JOIN "ColorPanel"  CP ON CP."CategotyId" = CM."CategoryId"
                             WHERE
                                 ( CP."Type" = ModuleType
                                   AND CP."Gauge" = 24
                                   AND CM."ColorText" != 'COLOR_SPECIAL_KEY'
                                   AND CM."ColorText" != 'FINISH_GALVALUME_PLUS' )
                                 OR ( CP."Type" = 'Trim'
                                      AND CP."Gauge" = 26 )
                                 AND CC."CompanyId" = CompanyId
                             ORDER BY
                                 CM."CategoryId" DESC,
                                 CM."ColorId";
    ELSIF ( Module = 'Trim' ) THEN
        OPEN OUTPUT_DATA FOR SELECT
                                 CM."ColorText",
                                 CM."ColorName",
                                 NVL(CC."ColorCode", ' ')        "ColorCode",
                                 NVL(CC."Trim", ' ')             "ColorHashCode"
                             FROM
                                      "ColorMaster" CM
                                 JOIN "ColorCodes"  CC ON CC."ColorText" = CM."ColorText"
                                 JOIN "ColorPanel"  CP ON CP."CategotyId" = CM."CategoryId"
                             WHERE
                                     CP."Type" = 'Trim'
                                 AND CP."Gauge" = 26
                                 AND CC."CompanyId" = CompanyId;
                                 
    ELSIF ( Module = 'DBCI Doors' ) THEN
        OPEN OUTPUT_DATA FOR SELECT
                                 CM."ColorText",
                                 CM."ColorName",
                                 NVL(CC."ColorCode", ' ')        "ColorCode",
                                 NVL(CC."Trim", ' ')             "ColorHashCode"
                             FROM
                                      "ColorMaster"   CM
                                 JOIN "ColorCodes"    CC  ON CC."ColorText"   = CM."ColorText"
                                 JOIN "ColorCategory" CCG ON CCG."CategotyId" = CM."CategoryId"
                             WHERE
                                      CC."CompanyId" = CompanyId
                                  AND CCG."CategoryName" = 'DBCI Doors';
                                 
    ELSE
        OPEN OUTPUT_DATA FOR SELECT
                                 CM."ColorText",
                                 CM."ColorName",
                                 NVL(CC."ColorCode", ' ')        "ColorCode",
                                 NVL(CC."Trim", ' ')             "ColorHashCode"
                             FROM
                                      "ColorMaster" CM
                                 JOIN "ColorCodes"  CC ON CC."ColorText" = CM."ColorText"
                                 JOIN "ColorPanel"  CP ON CP."CategotyId" = CM."CategoryId"
                             WHERE
                                     CP."Type" = ModuleType
                                 AND CP."Gauge" = Gauge
                                 AND CC."CompanyId" = CompanyId;
    END IF;
END COLOR_MASTER_LIST;
/