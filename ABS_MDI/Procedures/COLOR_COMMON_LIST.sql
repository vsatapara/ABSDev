CREATE OR REPLACE PROCEDURE abs_mdi."COLOR_COMMON_LIST" (
    CompanyId    IN   NUMBER,
    ColorMaster  OUT  SYS_REFCURSOR,
    ColorPanel   OUT  SYS_REFCURSOR
) AS
BEGIN
    OPEN ColorMaster FOR SELECT
                             CM."CategoryId",
                             CM."ColorText",
                             CM."ColorName",
                             CC."ColorCode",
                             CC."OpenArea",
                             CC."Roof",
                             CC."Wall",
                             CC."Trim"
                         FROM
                                  "ColorMaster" CM
                             JOIN "ColorCodes" CC ON CM."ColorText" = CC."ColorText"
                         WHERE
                             CC."CompanyId" = CompanyId;
    OPEN ColorPanel FOR SELECT
                           "ColorPanelId",
                           "Type",
                           "Gauge",
                           "CategotyId" AS "CategoryId"
                       FROM
                           "ColorPanel";
END COLOR_COMMON_LIST;
/