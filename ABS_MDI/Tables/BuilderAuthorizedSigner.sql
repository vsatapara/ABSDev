CREATE TABLE abs_mdi."BuilderAuthorizedSigner" (
  "AuthorizedSignerId" NUMBER(10) NOT NULL,
  "UserId" VARCHAR2(50 BYTE),
  "BuilderId" NUMBER(10) NOT NULL,
  "Type" VARCHAR2(1 BYTE),
  "UserName" VARCHAR2(200 BYTE),
  CONSTRAINT "BuilderAuthorizedSigner_PK" PRIMARY KEY ("AuthorizedSignerId"),
  CONSTRAINT "BuilderAuthorizedSigner_FK" FOREIGN KEY ("BuilderId") REFERENCES abs_mdi."BuilderInformation" ("BuilderID")
);