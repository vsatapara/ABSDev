CREATE TABLE abs_mdi."SkinningTypographyDetail" (
  "ID" NUMBER(10) NOT NULL,
  "SkinningTypographyHeaderID" NUMBER NOT NULL,
  "FontId" NUMBER(10),
  "FontSizeId" NUMBER(10,2),
  "Color" VARCHAR2(20 BYTE),
  "SkinningID" NUMBER(10) NOT NULL,
  PRIMARY KEY ("ID"),
  FOREIGN KEY ("SkinningID") REFERENCES abs_mdi."Skinning" ("SkinningID")
);