CREATE OR REPLACE PROCEDURE abs_mdi."INFORMATIONPAGEADMINISTRATION_SELECT" (
    InformationPageId  IN   NUMBER,
    Output_Data        OUT  SYS_REFCURSOR
) AS
BEGIN
    OPEN Output_Data FOR SELECT
                             "InformationPageId",
                             "Title",
                             "Content",
                             AT."AttachmentName"    AS FeaturedImageName,
                             AT."AttachmentPath"    AS FeaturedImagePath
                         FROM
                             "InformationPageAdministrations"  I
                             LEFT OUTER JOIN "Attachment"                      AT ON I."FeaturedId" = AT."AttachmentId"
                         WHERE
                                 "CompanyId" = InformationPageId
                             AND ROWNUM = 1;
END INFORMATIONPAGEADMINISTRATION_SELECT;
/