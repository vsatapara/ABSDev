CREATE OR REPLACE PROCEDURE abs_mdi."BUILDERNEWS_SELECT" 
(
    BuilderNewsId IN Number,
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
    OPEN Output_Data FOR 
    select 
        BN."BuilderNewsId",
        BN."Title",
        BN."FilterTag",
        to_char(BN."PublishDate",'MM/DD/YYYY') "PublishDate",
        to_char(BN."UnpublishDate",'MM/DD/YYYY') "UnpublishDate",
        BN."IsActive",
        BN."Content",
        AT."AttachmentName" "BuilderNewImageName",
        AT."AttachmentPath" "BuilderNewImagePath"
    from 
    "BuilderNews" BN 
    LEFT OUTER JOIN "Attachment" AT
        ON BN."BuilderNewsImageId" = AT."AttachmentId"
    where "BuilderNewsId"=BuilderNewsId;
END BuilderNews_Select;
/