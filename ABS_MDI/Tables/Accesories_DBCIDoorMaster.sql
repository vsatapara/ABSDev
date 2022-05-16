CREATE TABLE abs_mdi."Accesories_DBCIDoorMaster" (
  "DbciDoorId" NUMBER NOT NULL,
  "Series" VARCHAR2(100 BYTE),
  "Size" NUMBER,
  "Seal" VARCHAR2(100 BYTE),
  "OperatorType" VARCHAR2(100 BYTE),
  "Hood" CHAR,
  "LockType" VARCHAR2(100 BYTE),
  PRIMARY KEY ("DbciDoorId")
);