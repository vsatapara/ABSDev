CREATE OR REPLACE PROCEDURE abs_mdi."XX_ARCHIVE_NEW" 
(
---xxid IN NUMBER,
--l_sql     VARCHAR2(32767),
Output_Data OUT SYS_REFCURSOR
)
AS
---sqlStr     VARCHAR2(32767);
BEGIN
---OPEN l_cursor FOR
OPEN Output_Data FOR 
--sqlStr :=
WITH archivePaths ("Path",
                      "CustomerArchiveFolderGuid",
                      "Name",
                      "ParentCustomerArchiveFolderGuid",
                      "CustomerId",
                      "SortOrder")
        AS
            (SELECT LOWER (RAW_TO_GUID (caf."CustomerArchiveFolderGuid")),
                    caf."CustomerArchiveFolderGuid",
                    caf."Name",
                    caf."ParentCustomerArchiveFolderGuid",
                    caf."CustomerId",
                    caf."SortOrder"
               FROM "CustomerArchiveFolders" caf
              WHERE caf."ParentCustomerArchiveFolderGuid" IS NULL
             UNION ALL
             SELECT    cr."Path"
                    || '/'
                    || LOWER (RAW_TO_GUID (caf."CustomerArchiveFolderGuid")),
                    caf."CustomerArchiveFolderGuid",
                    caf."Name",
                    caf."ParentCustomerArchiveFolderGuid",
                    caf."CustomerId",
                    caf."SortOrder"
               FROM "CustomerArchiveFolders"  caf
                    INNER JOIN archivePaths cr
                        ON cr."CustomerArchiveFolderGuid" =
                           caf."ParentCustomerArchiveFolderGuid")
    SELECT '/' || c."Path"            AS "Path",
           c."Name",
           c."SortOrder",
           CAST (1 AS NUMBER (1))     AS "IsFolder",
           c."CustomerArchiveFolderGuid",
           c."ParentCustomerArchiveFolderGuid",
           c."CustomerId",
           NULL                       AS "Year",
           NULL                       AS "Type",
           NULL                       AS "Key",
           NULL                       AS "Status",
           NULL                       AS "Description",
           NULL                       AS "ReceivedDate",
           NULL                       AS "ArchivedDate",
           NULL                       AS "OrderArchiveFolderGuid",
           NULL                       AS "PurchaseReferenceNumber",
           NULL                       AS "Id"
      FROM archivePaths c
    UNION
    SELECT    '/'
           || c."Path"
           || '/'
           || LOWER (RAW_TO_GUID (oaf."OrdrArchvFldrGuid")),
              oaf."Year"
           || '-'
           || CAST (oaf."Type" AS NVARCHAR2 (1))
           || '-'
           || oaf."Key",
           NULL,
           CAST (0 AS NUMBER (1)),
           NULL,
           oaf."CstmrArchvFldrGuid",
           c."CustomerId",
           oaf."Year",
           oaf."Type",
           oaf."Key",
           oaf."Status",
           oaf."Description",
           oaf."ReceivedDate",
           oaf."Date"
               AS "ArchivedDate",
           "OrdrArchvFldrGuid"
               AS "OrderArchiveFolderGuid",
           oaf."PurchaseRefNo"
               AS "PurchaseReferenceNumber",
           oaf."Id"
               AS "Id"
      FROM archivePaths  c
           INNER JOIN "LatestArchivedOrders"@OE oaf
               ON oaf."CstmrArchvFldrGuid" = c."CustomerArchiveFolderGuid"
    UNION
    SELECT '/' || LOWER (RAW_TO_GUID (oaf."OrdrArchvFldrGuid")),
              oaf."Year"
           || '-'
           || CAST (oaf."Type" AS NVARCHAR2 (1))
           || '-'
           || oaf."Key",
           NULL,
           CAST (0 AS NUMBER (1)),
           NULL,
           NULL,
           c."CustomerID",
           oaf."Year",
           oaf."Type",
           oaf."Key",
           oaf."Status",
           oaf."Description",
           oaf."ReceivedDate",
           oaf."Date"
               AS "ArchivedDate",
           "OrdrArchvFldrGuid"
               AS "OrderArchiveFolderGuid",
           oaf."PurchaseRefNo"
               AS "PurchaseReferenceNumber",
           oaf."Id"
               AS "Id"
      FROM "LatestArchivedOrders"@OE  oaf
           INNER JOIN "Customer" c
               ON c."CustomerID" = to_number(oaf."CustomerId", 9999999) AND c."IsDelete" = 'N'
     WHERE oaf."CstmrArchvFldrGuid" IS NULL;
---execute immediate sqlStr;
  END XX_ARCHIVE_NEW;
/