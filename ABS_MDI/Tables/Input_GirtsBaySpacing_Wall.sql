CREATE TABLE abs_mdi."Input_GirtsBaySpacing_Wall" (
  "WallBaySpaceId" NUMBER(10) NOT NULL,
  "GirtSpacingId" NUMBER(10),
  "Elevation" CHAR,
  "RoofBayNumber" NUMBER(10),
  "DistFromLeftColumn" NUMBER(10,3),
  "BaseRecess" NUMBER(10,4),
  "RoofBayWidth" NUMBER(10,2),
  "Sequence" NUMBER(10),
  "mFlangeWidth" NUMBER(10,2),
  "mFlangeThick" NUMBER(10,2),
  "mWebDepth" NUMBER(10,2),
  "mWebThick" NUMBER(10,2),
  "mBasePlateWidth" NUMBER(10,2),
  "mBasePlateLength" NUMBER(10,2),
  "mBasePlateThick" NUMBER(10,2),
  "mABOffset" NUMBER(10,2),
  "mABGauge" NUMBER(10,2),
  "mABSpace" NUMBER(10,2),
  "mABDia" NUMBER(10,2),
  "mEavePlateWidth" NUMBER(10,2),
  "mEavePlateLength" NUMBER(10,2),
  "mEavePlateThick" NUMBER(10,2),
  "mEaveGussetWidth" NUMBER(10,2),
  "mEaveGussetLength" NUMBER(10,2),
  "mEaveGussetThick" NUMBER(10,2),
  "mKnifePlateWidth" NUMBER(10,2),
  "mKnifePlateLength" NUMBER(10,2),
  "mKnifePlateThick" NUMBER(10,2),
  "mRodDia" NUMBER(10,2),
  "mClevisPlateWidth" NUMBER(10,2),
  "mClevisPlateLength" NUMBER(10,2),
  "mClevisPlateThick" NUMBER(10,2),
  CONSTRAINT "Input_GirtsBaySpacing_Wall_PK" PRIMARY KEY ("WallBaySpaceId")
);