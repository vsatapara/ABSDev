CREATE GLOBAL TEMPORARY TABLE abs_mdi.codeload_temp (
  ss FLOAT,
  s1 FLOAT,
  distance FLOAT
)
ON COMMIT DELETE ROWS;