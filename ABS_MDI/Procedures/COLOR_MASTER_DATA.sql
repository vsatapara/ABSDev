CREATE OR REPLACE PROCEDURE abs_mdi."COLOR_MASTER_DATA" (
    CompanyId    IN   NUMBER,
    Module       IN   VARCHAR2,
    CategotyId   IN   NUMBER,
    ModuleType   IN   VARCHAR2,
    Gauge        IN   NUMBER,
    ColorName    IN   VARCHAR2,
    OUTPUT_DATA  OUT  SYS_REFCURSOR
) AS
BEGIN
   
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
                                 AND CM."ColorName" = ColorName
                                 AND CC."CompanyId" = CompanyId;
END COLOR_MASTER_DATA;
/