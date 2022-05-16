CREATE OR REPLACE PROCEDURE abs_mdi."PAYMENT_GETBYPROJECTID" 
(
    ProjectId IN NUMBER,
    OUTPUT_TABLE OUT  SYS_REFCURSOR
)
AS
BEGIN
OPEN OUTPUT_TABLE FOR SELECT
    "PaymentId",
    "AuthorizedSignature",
    "OrderedBy",
    "BuilderPO",
    "CreditTerms",
    "Bank",
    "Teller",
    "TaxExemptStatus",
    "TaxExemptNumber",
    "TaxIncluded",
    "Multiplier",
    "ProjectNumber",
    "IMPOverage",
    "ClarificationDayPhone",
    "MultiplierAuthorization",
    "GCName",
    "GCState",
    "GCCity",
    "ErectorName",
    "ErectorState",
    "ErectorCity",
    "LenderName",
    "LenderState",
    "LenderCity",
    "LenderAddress",
    "LenderZipcode",
    "LenderPhone",
    "LenderAddress2",
    "IMPFreightPerBuilding",
    "ValidUntil",
    "DateAuthorized",
    "MultiplierBWXGenerated",
    "MultiplierStart",
    "MultiplierTarget",
    "MultiplierFloor",
    "MultiplierRequested",
    "MultiplierSuggested",
    "ProjectGuid",
    "ProjectFile",
    "ProjectId"
FROM
    "EDSPrice_I_Payment"
WHERE
                "ProjectId"=ProjectId
             AND ("IsDeleted" IS NULL OR "IsDeleted" != 'Y');
END;
/