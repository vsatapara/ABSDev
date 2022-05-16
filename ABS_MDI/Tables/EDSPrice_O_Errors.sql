CREATE TABLE abs_mdi."EDSPrice_O_Errors" (
  "ErrorsId" NUMBER(10),
  "BuildingNumber" NUMBER(10) NOT NULL,
  "RoofStructErrorCode" NUMBER(10),
  "RoofStructIsPriced" VARCHAR2(1 BYTE),
  "RoofCoveringErrorCode" NUMBER(10),
  "RoofCoveringIsPriced" VARCHAR2(1 BYTE),
  "EWStructErrorCode" NUMBER(10),
  "EWStructIsPriced" VARCHAR2(1 BYTE),
  "EWCoveringErrorCode" NUMBER(10),
  "EWCoveringIsPriced" VARCHAR2(1 BYTE),
  "EWFramesErrorCode" NUMBER(10),
  "EWFramesIsPriced" VARCHAR2(1 BYTE),
  "EWColErrorCode" NUMBER(10),
  "EWColIsPriced" VARCHAR2(1 BYTE),
  "SWStructErrorCode" NUMBER(10),
  "SWStructIsPriced" VARCHAR2(1 BYTE),
  "SWCoveringErrorCode" NUMBER(10),
  "SWCoveringIsPriced" VARCHAR2(1 BYTE),
  "FramesErrorCode" NUMBER(10),
  "FramesIsPriced" VARCHAR2(1 BYTE),
  "PortalFramesErrorCode" NUMBER(10),
  "PortalFramesIsPriced" VARCHAR2(1 BYTE),
  "SpecialFramesErrorCode" NUMBER(10),
  "SpecialFramesIsPriced" VARCHAR2(1 BYTE),
  "BracingErrorCode" NUMBER(10),
  "BracingIsPriced" VARCHAR2(1 BYTE),
  "CraneBracingErrorCode" NUMBER(10),
  "CraneBracingIsPriced" VARCHAR2(1 BYTE),
  "CraneBracketsErrorCode" NUMBER(10),
  "CraneBracketsIsPriced" VARCHAR2(1 BYTE),
  "CraneBeamsErrorCode" NUMBER(10),
  "CraneBeamsIsPriced" VARCHAR2(1 BYTE),
  "CraneStopsErrorCode" NUMBER(10),
  "CraneStopsIsPriced" VARCHAR2(1 BYTE),
  "CraneRailsErrorCode" NUMBER(10),
  "CraneRailsIsPriced" VARCHAR2(1 BYTE),
  "EaveTrimErrorCode" NUMBER(10),
  "EaveTrimIsPriced" VARCHAR2(1 BYTE),
  "CanopyRaftersErrorCode" NUMBER(10),
  "CanopyRaftersIsPriced" VARCHAR2(1 BYTE),
  "MiscellaneousErrorCode" NUMBER(10),
  "MiscellaneousIsPriced" VARCHAR2(1 BYTE),
  "DrawingsErrorCode" NUMBER(10),
  "DrawingsIsPriced" VARCHAR2(1 BYTE),
  "ABoltsErrorCode" NUMBER(10),
  "ABoltsIsPriced" VARCHAR2(1 BYTE),
  "TieInAdjustmentsErrorCode" NUMBER(10),
  "TieInAdjustmentsIsPriced" VARCHAR2(1 BYTE),
  "AddForZErrorCode" NUMBER(10),
  "AddForZIsPriced" VARCHAR2(1 BYTE),
  "PlazaEndwallsErrorCode" NUMBER(10),
  "PlazaEndwallsIsPriced" VARCHAR2(1 BYTE),
  "SWStructErrorMessageCode" NUMBER(10),
  "SealedWeldMessageCode" NUMBER(10),
  "FBBCFramesErrorCode" NUMBER(10),
  "FBBCFramesIsPriced" VARCHAR2(1 BYTE),
  "SoldierColumnsErrorCode" NUMBER(10),
  "CreatedBy" NUMBER(10),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  "IsDeleted" VARCHAR2(1 BYTE),
  "ProjectId" NUMBER(10),
  CONSTRAINT "Pk_EDSPrice_O_Errors_ProjectId" PRIMARY KEY ("BuildingNumber"),
  CONSTRAINT eds_price_o_errors_fk FOREIGN KEY ("BuildingNumber") REFERENCES abs_mdi."BuildingInformation" ("BuildingInformationId")
);