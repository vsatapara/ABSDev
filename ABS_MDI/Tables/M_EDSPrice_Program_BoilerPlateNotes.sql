CREATE TABLE abs_mdi."M_EDSPrice_Program_BoilerPlateNotes" (
  "ID" NUMBER DEFAULT 0 NOT NULL,
  lkf NUMBER DEFAULT 0,
  mtc NUMBER DEFAULT 0,
  elz NUMBER DEFAULT 0,
  brd NUMBER DEFAULT 0,
  cbs NUMBER DEFAULT 0,
  mpl NUMBER DEFAULT 0,
  rkm NUMBER DEFAULT 0,
  nci NUMBER DEFAULT 0,
  "Note" CLOB,
  PRIMARY KEY ("ID")
);
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_BoilerPlateNotes"."ID" IS 'Unique ID';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_BoilerPlateNotes".lkf IS 'Flag for LKF plant (Star)';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_BoilerPlateNotes".mtc IS 'Flag for MTC plant (Star)';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_BoilerPlateNotes".elz IS 'Flag for ELZ plant (Star)';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_BoilerPlateNotes".brd IS 'Flag for BRD plant (Robertson)';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_BoilerPlateNotes".cbs IS 'Flag for CBS plant (Ceco)';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_BoilerPlateNotes".mpl IS 'Flag for MPL plant (Ceco)';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_BoilerPlateNotes".rkm IS 'Flag for RKM plant (Ceco)';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_BoilerPlateNotes".nci IS 'Flag for NCI Company (NBS, NBC, NBA)';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_BoilerPlateNotes"."Note" IS 'Text content of note.';