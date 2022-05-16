CREATE OR REPLACE PROCEDURE abs_mdi."PAYMENT_SELECT" (
    ProjectId     IN   NUMBER,
    Payment_Data  OUT  SYS_REFCURSOR
) AS
BEGIN
    OPEN Payment_Data FOR SELECT
                              P."PaymentId",
                              P."OrderedBy",
                              P."BuilderPO",
                              P."CreditTerms",
                              P."TaxExemptStatus",
                              P."TaxExemptNumber",
                              P."ClarificationDayPhone",
                              P."GCName",
                              P."ErectorName",
                              P."LenderName",
                              P."LenderPhone",
                              P."CreatedBy",
                              P."CreatedDate",
                              P."IpAddress",
                              P."ProjectId",
                              GC."AddressId"    AS "GCAddressId",
                              GC."Address1"     AS "GCAddress1",
                              GC."Address2"     AS "GCAddress2",
                              GC."Country"      AS "GCCountry",
                              GC."State"        AS "GCState",
                              GC."County"       AS "GCCounty",
                              GC."City"         AS "GCCity",
                              GC."ZipCode"      AS "GCZipcode",
                              GC."Longitude"    AS "GCLongitude",
                              GC."Latitude"     AS "GCLatitude",
                              ER."AddressId"    AS "ErectorAddressId",
                              ER."Address1"     AS "ErectorAddress1",
                              ER."Address2"     AS "ErectorAddress2",
                              ER."Country"      AS "ErectorCountry",
                              ER."State"        AS "ErectorState",
                              ER."County"       AS "ErectorCounty",
                              ER."City"         AS "ErectorCity",
                              ER."ZipCode"      AS "ErectorZipcode",
                              ER."Longitude"    AS "ErectorLongitude",
                              ER."Latitude"     AS "ErectorLatitude",
                              LE."AddressId"    AS "LenderAddressId",
                              LE."Address1"     AS "LenderAddress1",
                              LE."Address2"     AS "LenderAddress2",
                              LE."Country"      AS "LenderCountry",
                              LE."State"        AS "LenderState",
                              LE."County"       AS "LenderCounty",
                              LE."City"         AS "LenderCity",
                              LE."ZipCode"      AS "LenderZipcode",
                              LE."Longitude"    AS "LenderLongitude",
                              LE."Latitude"     AS "LenderLatitude"
                          FROM
                              "EDSPrice_I_Payment"  P
                              LEFT JOIN "I_Address"           GC ON GC."ProjectId" = P."ProjectId"
                                                          AND GC."AddressType" = 'GC'
                              LEFT JOIN "I_Address"           ER ON ER."ProjectId" = P."ProjectId"
                                                          AND ER."AddressType" = 'ER'
                              LEFT JOIN "I_Address"           LE ON LE."ProjectId" = P."ProjectId"
                                                          AND LE."AddressType" = 'LE'
                          WHERE
                                  P."ProjectId" = ProjectId
                              AND ROWNUM = 1;
END Payment_Select;
/