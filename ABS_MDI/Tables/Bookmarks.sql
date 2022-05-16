CREATE TABLE abs_mdi."Bookmarks" (
  "BookmarkId" NUMBER NOT NULL,
  "UserGuid" RAW(16),
  "Type" NUMBER(9),
  "EntityId" NVARCHAR2(128),
  "BookmarkDate" TIMESTAMP WITH TIME ZONE,
  "DisplayData" NVARCHAR2(256),
  createdby NUMBER(5),
  createddate TIMESTAMP,
  modifiedby NUMBER(5),
  modifieddate TIMESTAMP,
  ipaddress VARCHAR2(20 BYTE),
  isdelete CHAR DEFAULT 'N',
  CONSTRAINT "Bookmarks_PK" PRIMARY KEY ("BookmarkId")
);