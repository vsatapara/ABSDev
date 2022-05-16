CREATE OR REPLACE TYPE abs_mdi."BUILDERACCESSBRAND"                                          AS OBJECT
(
    BuilderAccessBrandId	NUMBER(10,0),
    BuilderAccessPermissionId	NUMBER(10,0),
    CompanyId	NUMBER(10,0),
    IpAddress	VARCHAR2(20 BYTE),
    CreatedBy	VARCHAR2(20 BYTE),
    CreatedDate	TIMESTAMP(6),
    ModifiedBy	VARCHAR2(20 BYTE),
    ModifiedDate	TIMESTAMP(6),
    IsDelete	CHAR(1 BYTE)
);
/