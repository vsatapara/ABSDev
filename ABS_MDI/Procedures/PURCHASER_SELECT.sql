CREATE OR REPLACE PROCEDURE abs_mdi."PURCHASER_SELECT" (
    ProjId     IN   NUMBER,
    Purchaser_Data  OUT  SYS_REFCURSOR
) AS BEGIN
OPEN Purchaser_Data FOR SELECT
                    P."PurchaserId",
                    P."ProjectId",
                    P."BuyerNumber",
                    P."BuyerName",
                    P."BuyerCareOf",
                    P."BuyerContactName",
                    P."BuyerEmail1",
                    P."ManagerName",
                    P."BuyerMobileNumber",
                    P."BuyerFaxNumber",
                    P."BuyerDayPhone",
                    P."BuyerNightPhone",
                    P."CreatedBy",
                    P."CreatedDate",
                    P."IpAddress",
                    P."IsDelete",
                    a."AddressId" AS "PhyAddressId",
                    a."Address1" AS "PhyAddress1",
                    a."Address2" AS "PhyAddress2",
                    a."Country" AS "PhyCountry",
                    a."State" AS "PhyState",
                    a."County" AS "PhyCounty",
                    a."City" AS "PhyCity",
                    a."ZipCode" AS "PhyZipCode",
                    a."Longitude" AS "PhyLongitude",
                    a."Latitude" AS "PhyLatitude",
                    a."AddressType" AS "PhyAddressType",
                    am."AddressId" AS "MailAddressId",
                    am."Address1" AS "MailAddress1",
                    am."Address2" AS "MailAddress2",
                    am."Country" AS "MailCountry",
                    am."State" AS "MailState",
                    am."County" AS "MailCounty",
                    am."City" AS "MailCity",
                    am."ZipCode" AS "MailZipCode",
                    am."Longitude" AS "MailLongitude",
                    am."Latitude" AS "MailLatitude",
                    am."AddressType" AS "MailAddressType"
                FROM "Purchaser" P
                LEFT OUTER JOIN "I_Address" a
                   ON P."ProjectId" = a."ProjectId"
                LEFT OUTER JOIN "I_Address" am
                   ON P."ProjectId" = am."ProjectId"
                WHERE a."AddressType" = 'BP'
                   AND am."AddressType" = 'BM'
                   AND P."ProjectId" = ProjId;
END Purchaser_Select;
/