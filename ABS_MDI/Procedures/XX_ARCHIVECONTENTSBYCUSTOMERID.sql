CREATE OR REPLACE PROCEDURE abs_mdi."XX_ARCHIVECONTENTSBYCUSTOMERID" 
(
--customerId IN NUMBER
xxid IN NUMBER,
Output_Data OUT SYS_REFCURSOR
)AS 
BEGIN
OPEN Output_Data FOR 
WITH archivePaths 
                ("Path", 
                "CustomerArchiveFolderGuid", 
                "Name", 
                "ParentCustomerArchiveFolderGuid", 
                "CustomerID", 
                "SortOrder")
            AS
            (SELECT LOWER (RAW_TO_GUID (caf."CustomerArchiveFolderGuid")),
                    caf."CustomerArchiveFolderGuid",
                    caf."Name",
                    caf."ParentCustomerArchiveFolderGuid",
                    caf."CustomerId",
                    caf."SortOrder"
            FROM "CustomerArchiveFolders" caf
            INNER JOIN "Customer" c 
            ON caf."CustomerId" = c."CustomerID" AND c."IsDelete" = 'N'
            --ON c."CustomerID" = to_number(oaf."CustomerId", 9999999) AND c."IsDelete" = 'N'
            WHERE caf."ParentCustomerArchiveFolderGuid" IS NULL AND c."CustomerID" = xxid 
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
            INNER JOIN "Customer" c 
            ON caf."CustomerId" = c."CustomerID" AND c."IsDelete" = 'N'
            --ON c."CustomerID" = to_number(oaf."CustomerId", 9999999) AND c."IsDelete" = 'N'
            INNER JOIN archivePaths cr ON cr."CustomerArchiveFolderGuid" = caf."ParentCustomerArchiveFolderGuid"
            WHERE 
            --c."Number" = xxid
            c."CustomerID" = xxid
            )
       SELECT '/' || c."Path" AS "Path",
           c."Name",
           c."SortOrder",
           CAST (1 AS NUMBER (1)) AS "IsFolder",
           c."CustomerArchiveFolderGuid",
           c."ParentCustomerArchiveFolderGuid",
           c."CustomerID",
           NULL                       AS "Id",
           NULL                       AS "Year",
           NULL                       AS "Type",
           NULL                       AS "Key",
           NULL                       AS "Status",
           NULL                       AS "Description",
           NULL                       AS "ReceivedDate",
           NULL                       AS "ArchivedDate",
           NULL                       AS "OrderArchiveFolderGuid",
           NULL                       AS "PurchaseReferenceNumber"
      FROM archivePaths c
    UNION
    SELECT '/' || c."Path" || '/' || LOWER (RAW_TO_GUID (oaf."OrdrArchvFldrGuid")),
           oaf."Year" || '-' || CAST (oaf."Type" AS NVARCHAR2 (1)) || '-' || oaf."Key",
           NULL,
           CAST (0 AS NUMBER (1)),
           NULL,
           oaf."CstmrArchvFldrGuid",
           c."CustomerID",
           oaf."Id",
           oaf."Year",
           oaf."Type",
           oaf."Key",
           oaf."Status",
           oaf."Description",
           oaf."ReceivedDate",
           oaf."Date",
           oaf."OrdrArchvFldrGuid",
           oaf."PurchaseRefNo"
      FROM archivePaths  c
      INNER JOIN 
        (SELECT /*+ DRIVING_SITE(oaf) */  "CstmrArchvFldrGuid",
           "Id",
           "Year",
           "Type",
           "Key",
           "Status",
           "Description",
           "ReceivedDate",
           "Date",
           "OrdrArchvFldrGuid",
           "PurchaseRefNo"
        FROM "LatestArchivedOrders"@OE oaf
        WHERE "CustomerId" = xxid) oaf ON oaf."CstmrArchvFldrGuid" = c."CustomerArchiveFolderGuid"      
    UNION
    SELECT '/' || LOWER (RAW_TO_GUID (oaf."OrdrArchvFldrGuid")),
           oaf."Year" || '-' || CAST (oaf."Type" AS NVARCHAR2 (1)) || '-' || oaf."Key",
           NULL,
           CAST (0 AS NUMBER (1)),
           NULL,
           NULL,
           c."CustomerID",
           oaf."Id",
           oaf."Year",
           oaf."Type",
           oaf."Key",
           oaf."Status",
           oaf."Description",
           oaf."ReceivedDate",
           oaf."Date" AS "ArchivedDate",
           "OrdrArchvFldrGuid" AS "OrderArchiveFolderGuid",
           oaf."PurchaseRefNo" AS "PurchaseReferenceNumber"
    FROM "LatestArchivedOrders"@OE oaf
    INNER JOIN "Customer" c 
    --ON c."Number" = oaf."CustomerId" AND c."IsDelete" = 'N'
    ON c."CustomerID" = to_number(oaf."CustomerId", 9999999) AND c."IsDelete" = 'N'
    WHERE oaf."CstmrArchvFldrGuid" IS NULL AND oaf."CustomerId" = xxid;
END XX_ARCHIVECONTENTSBYCUSTOMERID;
/