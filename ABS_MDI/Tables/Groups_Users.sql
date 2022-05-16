CREATE TABLE abs_mdi."Groups_Users" (
  "GroupUserId" NUMBER(10) DEFAULT abs_mdi."Groups_Users_SEQ"."NEXTVAL" NOT NULL,
  "GroupId" NVARCHAR2(50) NOT NULL,
  "UserDetailId" NUMBER(10) NOT NULL,
  "IsEnable" CHAR,
  CONSTRAINT "Groups_Users_PK" PRIMARY KEY ("GroupUserId")
);