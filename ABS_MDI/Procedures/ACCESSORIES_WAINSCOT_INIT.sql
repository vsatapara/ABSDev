CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORIES_WAINSCOT_INIT" 
(
OUTPUT_DATA  OUT  SYS_REFCURSOR
)AS
BEGIN
 OPEN OUTPUT_DATA FOR 
 SELECT
                                 CM."ColorText",
                                 CM."ColorName",
                                 NVL(CC."ColorCode", ' ')        "ColorCode",
                                 NVL(CC."Wall", ' ')             "ColorHashCode"
                             FROM
                                      "ColorMaster" CM
                                 JOIN "ColorCodes"  CC ON CC."ColorText" = CM."ColorText"
                                 JOIN "ColorPanel"  CP ON CP."CategotyId" = CM."CategoryId"
                             WHERE
                                     CP."Type" = 'PBR'
                                 AND CP."Gauge" = 26
                                 AND CP."IsWall" = 'Y'
                                 AND CC."CompanyId" = 1;
END ACCESSORIES_WAINSCOT_INIT;
/