CREATE OR REPLACE PROCEDURE abs_mdi."CUSTOMERARCHIVEFOLDER_ARCHIVECONTENTSBYCUSTOMERID_TEST" 
(
--customerId IN NUMBER
Par_CustomerID IN VARCHAR2,
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
            ON caf."CustomerId" = c."CustomerID" AND c."IsDelete" = 'N' AND caf."ISDELETE" = 'N'
            --ON c."CustomerID" = to_number(oaf."CustomerId", 9999999) AND c."IsDelete" = 'N'
            WHERE caf."ParentCustomerArchiveFolderGuid" IS NULL AND c."CustomerNo" IN (SELECT regexp_substr(Par_CustomerID, '[^,]+', 1, level) pid FROM dual CONNECT BY regexp_substr(Par_CustomerID, '[^,]+', 1, level) IS NOT NULL) 
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
            ON caf."CustomerId" = c."CustomerID" AND c."IsDelete" = 'N' AND caf."ISDELETE" = 'N'
            INNER JOIN archivePaths cr ON cr."CustomerArchiveFolderGuid" = caf."ParentCustomerArchiveFolderGuid"
            WHERE  c."CustomerNo" IN (SELECT regexp_substr(Par_CustomerID, '[^,]+', 1, level) pid FROM dual CONNECT BY regexp_substr(Par_CustomerID, '[^,]+', 1, level) IS NOT NULL)
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
        --(SELECT /*+ DRIVING_SITE(oaf) */  "CstmrArchvFldrGuid",
         --  "Id",
          -- "Year",
          -- "Type",
          -- "Key",
          -- "Status",
          -- "Description",
          -- "ReceivedDate",
          -- "Date",
          -- "OrdrArchvFldrGuid",
          -- "PurchaseRefNo"
        --FROM "LatestArchivedOrders"@OE oaf
        "LatestArchivedOrders"@OE oaf ON oaf."CstmrArchvFldrGuid" = c."CustomerArchiveFolderGuid" WHERE "CustomerId" IN (SELECT regexp_substr(Par_CustomerID, '[^,]+', 1, level) pid FROM dual CONNECT BY regexp_substr(Par_CustomerID, '[^,]+', 1, level) IS NOT NULL)
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
    ON c."CustomerNo" = oaf."CustomerId" AND c."IsDelete" = 'N'
    WHERE oaf."CstmrArchvFldrGuid" IS NULL AND oaf."CustomerId" IN (SELECT regexp_substr(Par_CustomerID, '[^,]+', 1, level) pid FROM dual CONNECT BY regexp_substr(Par_CustomerID, '[^,]+', 1, level) IS NOT NULL) ORDER BY 3;
END CUSTOMERARCHIVEFOLDER_ARCHIVECONTENTSBYCUSTOMERID_TEST;
/