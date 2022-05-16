CREATE OR REPLACE FUNCTION abs_mdi."FN_GEO_DISTANCE" 
(Lat1 IN NUMBER,
                                    Lon1 IN NUMBER,
                                    Lat2 IN NUMBER,
                                    Lon2 IN NUMBER,
                                    Radius IN NUMBER DEFAULT 3963) RETURN NUMBER AS 
-- Convert degrees to radians
   DegToRad NUMBER := 57.29577951;


   -- Lat/longs in radians
   Lat1Rad        NUMBER;
   Lon1Rad        NUMBER;
   Lat2Rad        NUMBER;
   Lon2Rad        NUMBER;

   ReturnValue    NUMBER;
   ACOS_Param     NUMBER;
BEGIN
   IF Lat1 IS NULL
   OR Lon1 IS NULL
   OR Lat2 IS NULL
   OR Lon2 IS NULL
   OR Radius IS NULL THEN
      -- We can't work out the distance if a parameter is missing. Return NULL
      ReturnValue := NULL;
   ELSE
      Lat1Rad := Lat1 / DegToRad;   -- Do these divisions once!
      Lon1Rad := Lon1 / DegToRad;
      Lat2Rad := Lat2 / DegToRad;
      Lon2Rad := Lon2 / DegToRad;

      ACOS_Param := (SIN(Lat1Rad) * SIN(Lat2Rad)) +
                    (COS(Lat1Rad) * COS(Lat2Rad) *  COS(Lon2Rad - Lon1Rad));

      -- Ensure ACOS_Param is between -1..+1
      ACOS_Param := GREATEST(LEAST(ACOS_Param,1),-1);

      ReturnValue := Radius * ACOS(ACOS_Param);
   END IF;
   RETURN ReturnValue;
END FN_GEO_DISTANCE;
/