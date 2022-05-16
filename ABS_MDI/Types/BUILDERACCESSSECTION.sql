CREATE OR REPLACE TYPE abs_mdi."BUILDERACCESSSECTION"                                          AS OBJECT
(
    BuilderAccessSectionId	NUMBER(10,0),
    BuilderAccessPermissionId	NUMBER(10,0),
    SectionId	NUMBER(10,0),
    IsAvailable	CHAR(1 BYTE),
    MinValue	NUMBER(5,0),
    MaxValue	NUMBER(5,0),
    SelectiveTab	VARCHAR2(50 BYTE),
    CreatedBy	NUMBER(5,0),
    CreatedDate	TIMESTAMP(6),
    ModifiedBy	VARCHAR2(50 BYTE),
    ModifiedDate	TIMESTAMP(6),
    IpAddress	VARCHAR2(20 BYTE),
    IsFeetInchFormat	CHAR(1 BYTE)
);
/