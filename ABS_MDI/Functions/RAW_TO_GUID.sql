CREATE OR REPLACE FUNCTION abs_mdi."RAW_TO_GUID" (raw_guid in RAW) RETURN NVARCHAR2
IS
    hex NVARCHAR2(32);
BEGIN
    hex := rawtohex(raw_guid);
    return substr(hex, 7, 2) 
      || substr(hex, 5, 2) 
      || substr(hex, 3, 2) 
      || substr(hex, 1, 2) 
      || '-'
      || substr(hex, 11, 2) 
      || substr(hex, 9, 2) 
      || '-'
      || substr(hex, 15, 2) 
      || substr(hex, 13, 2) 
      || '-'
      || substr(hex, 17, 4) 
      || '-'
      || substr(hex, 21, 12);
END raw_to_guid;
/