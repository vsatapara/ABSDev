CREATE OR REPLACE PROCEDURE abs_mdi."CLM_NEWSEISMICVALUE_THIRDFORMULA" ( 
StateVal              IN   VARCHAR2,
Latitude 					IN NUMBER, 
Longitude 					IN NUMBER, 
Seismic_Data_Upper_X1 		out sys_refcursor, 
Seismic_SUH_Data_Upper_X1	out sys_refcursor, 
SeismicRisk_Data_Upper_X1 	out sys_refcursor, 
Seismic_Data_Upper_X2 		out sys_refcursor, 
Seismic_SUH_Data_Upper_X2 	out sys_refcursor, 
SeismicRisk_Data_Upper_X2 	out sys_refcursor, 
Seismic_Data_Lower_X1 		out sys_refcursor, 
Seismic_SUH_Data_Lower_X1 	out sys_refcursor, 
SeismicRisk_Data_Lower_X1 	out sys_refcursor, 
Seismic_Data_Lower_X2 		out sys_refcursor, 
Seismic_SUH_Data_Lower_X2 	out sys_refcursor, 
SeismicRisk_Data_Lower_X2 	out sys_refcursor 
)  AS 
TotalCount number;
LatOrLongCount number;
BEGIN
DBMS_OUTPUT.PUT_LINE('Time Started: ' || TO_CHAR(SYSDATE, 'DD-MON-YYYY HH24:MI:SS'));
IF StateVal = 'AK' then
BEGIN
  OPEN Seismic_Data_Upper_X1 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "S_SD84th",
           "S_1D84th"
  FROM     "CLM_SeismicSD84th_AK"
  WHERE    "Latitude">latitude and "Longitude" < longitude
  ORDER BY "Latitude" ASC, "Longitude" DESC
  FETCH first 1 rows only;
  
  OPEN Seismic_SUH_Data_Upper_X1 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "S_SUH",
           "S_1UH"
  FROM     "CLM_SeismicSUH_AK"
  WHERE    "Latitude">latitude and "Longitude" < longitude
  ORDER BY "Latitude" ASC, "Longitude" DESC
  FETCH first 1 rows only;
  
  OPEN SeismicRisk_Data_Upper_X1 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "C_RS",
           "C_R1"
  FROM     "CLM_SeismicRisk_AK"
  WHERE    "Latitude">latitude and "Longitude" < longitude
  ORDER BY "Latitude" ASC, "Longitude" DESC
  FETCH first 1 rows only;
  
  OPEN Seismic_Data_Upper_X2 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "S_SD84th",
           "S_1D84th"
  FROM     "CLM_SeismicSD84th_AK"
  WHERE    "Latitude">latitude and "Longitude" > longitude
  ORDER BY "Latitude" ASC, "Longitude" ASC
  FETCH first 1 rows only;
  
  OPEN Seismic_SUH_Data_Upper_X2 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "S_SUH",
           "S_1UH"
  FROM     "CLM_SeismicSUH_AK"
  WHERE    "Latitude">latitude and "Longitude" > longitude
  ORDER BY "Latitude" ASC, "Longitude" ASC
  FETCH first 1 rows only;
  
  OPEN SeismicRisk_Data_Upper_X2 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "C_RS",
           "C_R1"
  FROM     "CLM_SeismicRisk_AK"
  WHERE    "Latitude">latitude and "Longitude" > longitude
  ORDER BY "Latitude" ASC, "Longitude" ASC
  FETCH first 1 rows only;
  
  OPEN Seismic_Data_Lower_X1 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "S_SD84th",
           "S_1D84th"
  FROM     "CLM_SeismicSD84th_AK"
  WHERE    "Latitude"<latitude AND "Longitude" < longitude
  ORDER BY "Latitude" DESC, "Longitude" DESC
  FETCH first 1 rows only;
  
  OPEN Seismic_SUH_Data_Lower_X1 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "S_SUH",
           "S_1UH"
  FROM     "CLM_SeismicSUH_AK"
  WHERE    "Latitude"<latitude AND "Longitude" < longitude
  ORDER BY "Latitude" DESC, "Longitude" DESC
  FETCH first 1 rows only;
  
  OPEN SeismicRisk_Data_Lower_X1 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "C_RS",
           "C_R1"
  FROM     "CLM_SeismicRisk_AK"
  WHERE    "Latitude"<latitude AND "Longitude" < longitude
  ORDER BY "Latitude" DESC, "Longitude" DESC
  FETCH first 1 rows only;
  
  OPEN Seismic_Data_Lower_X2 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "S_SD84th",
           "S_1D84th"
  FROM     "CLM_SeismicSD84th_AK"
  WHERE    "Latitude"<latitude AND "Longitude" > longitude
  ORDER BY "Latitude" DESC, "Longitude" ASC
  FETCH first 1 rows only;
  
  OPEN Seismic_SUH_Data_Lower_X2 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "S_SUH",
           "S_1UH"
  FROM     "CLM_SeismicSUH_AK"
  WHERE    "Latitude"<latitude AND "Longitude" > longitude
  ORDER BY "Latitude" DESC, "Longitude" ASC
  FETCH first 1 rows only;
  
  OPEN SeismicRisk_Data_Lower_X2 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "C_RS",
           "C_R1"
  FROM     "CLM_SeismicRisk_AK"
  WHERE    "Latitude"<latitude AND "Longitude" > longitude
  ORDER BY "Latitude" DESC, "Longitude" ASC
  FETCH first 1 rows only;
  
  
  DBMS_OUTPUT.PUT_LINE('Time Ended: ' || TO_CHAR(SYSDATE, 'DD-MON-YYYY HH24:MI:SS'));
  end;
  ELSIF StateVal = 'HI' then
  BEGIN
  OPEN Seismic_Data_Upper_X1 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "S_SD84th",
           "S_1D84th"
  FROM     "CLM_SeismicSD84th_HI"
  WHERE    "Latitude">latitude and "Longitude" < longitude
  ORDER BY "Latitude" ASC, "Longitude" DESC
  FETCH first 1 rows only;
  
  OPEN Seismic_SUH_Data_Upper_X1 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "S_SUH",
           "S_1UH"
  FROM     "CLM_SeismicSUH_HI"
  WHERE    "Latitude">latitude and "Longitude" < longitude
  ORDER BY "Latitude" ASC, "Longitude" DESC
  FETCH first 1 rows only;
  
  OPEN SeismicRisk_Data_Upper_X1 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "C_RS",
           "C_R1"
  FROM     "CLM_SeismicRisk_HI"
  WHERE    "Latitude">latitude and "Longitude" < longitude
  ORDER BY "Latitude" ASC, "Longitude" DESC
  FETCH first 1 rows only;
  
  OPEN Seismic_Data_Upper_X2 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "S_SD84th",
           "S_1D84th"
  FROM     "CLM_SeismicSD84th_HI"
  WHERE    "Latitude">latitude and "Longitude" > longitude
  ORDER BY "Latitude" ASC, "Longitude" ASC
  FETCH first 1 rows only;
  
  OPEN Seismic_SUH_Data_Upper_X2 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "S_SUH",
           "S_1UH"
  FROM     "CLM_SeismicSUH_HI"
  WHERE    "Latitude">latitude and "Longitude" > longitude
  ORDER BY "Latitude" ASC, "Longitude" ASC
  FETCH first 1 rows only;
  
  OPEN SeismicRisk_Data_Upper_X2 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "C_RS",
           "C_R1"
  FROM     "CLM_SeismicRisk_HI"
  WHERE    "Latitude">latitude and "Longitude" > longitude
  ORDER BY "Latitude" ASC, "Longitude" ASC
  FETCH first 1 rows only;
  
  OPEN Seismic_Data_Lower_X1 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "S_SD84th",
           "S_1D84th"
  FROM     "CLM_SeismicSD84th_HI"
  WHERE    "Latitude"<latitude AND "Longitude" < longitude
  ORDER BY "Latitude" DESC, "Longitude" DESC
  FETCH first 1 rows only;
  
  OPEN Seismic_SUH_Data_Lower_X1 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "S_SUH",
           "S_1UH"
  FROM     "CLM_SeismicSUH_HI"
  WHERE    "Latitude"<latitude AND "Longitude" < longitude
  ORDER BY "Latitude" DESC, "Longitude" DESC
  FETCH first 1 rows only;
  
  OPEN SeismicRisk_Data_Lower_X1 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "C_RS",
           "C_R1"
  FROM     "CLM_SeismicRisk_HI"
  WHERE    "Latitude"<latitude AND "Longitude" < longitude
  ORDER BY "Latitude" DESC, "Longitude" DESC
  FETCH first 1 rows only;
  
  OPEN Seismic_Data_Lower_X2 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "S_SD84th",
           "S_1D84th"
  FROM     "CLM_SeismicSD84th_HI"
  WHERE    "Latitude"<latitude AND "Longitude" > longitude
  ORDER BY "Latitude" DESC, "Longitude" ASC
  FETCH first 1 rows only;
  
  OPEN Seismic_SUH_Data_Lower_X2 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "S_SUH",
           "S_1UH"
  FROM     "CLM_SeismicSUH_HI"
  WHERE    "Latitude"<latitude AND "Longitude" > longitude
  ORDER BY "Latitude" DESC, "Longitude" ASC
  FETCH first 1 rows only;
  
  OPEN SeismicRisk_Data_Lower_X2 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "C_RS",
           "C_R1"
  FROM     "CLM_SeismicRisk_HI"
  WHERE    "Latitude"<latitude AND "Longitude" > longitude
  ORDER BY "Latitude" DESC, "Longitude" ASC
  FETCH first 1 rows only;
  
  
    DBMS_OUTPUT.PUT_LINE('Time Ended HI: ' || TO_CHAR(SYSDATE, 'DD-MON-YYYY HH24:MI:SS'));
  end;
  ELSE
  BEGIN
  OPEN Seismic_Data_Upper_X1 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "S_SD84th",
           "S_1D84th"
  FROM     "CLM_SeismicSD84th_48USA"
  WHERE    "Latitude">latitude and "Longitude" < longitude
  ORDER BY "Latitude" ASC, "Longitude" DESC
  FETCH first 1 rows only;
  
  OPEN Seismic_SUH_Data_Upper_X1 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "S_SUH",
           "S_1UH"
  FROM     "CLM_SeismicSUH_48USA"
  WHERE    "Latitude">latitude and "Longitude" < longitude
  ORDER BY "Latitude" ASC, "Longitude" DESC
  FETCH first 1 rows only;
  
  OPEN SeismicRisk_Data_Upper_X1 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "C_RS",
           "C_R1"
  FROM     "CLM_SeismicRisk_48USA"
  WHERE    "Latitude">latitude and "Longitude" < longitude
  ORDER BY "Longitude" DESC, "Latitude" ASC
  FETCH first 1 rows only;
  
  OPEN Seismic_Data_Upper_X2 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "S_SD84th",
           "S_1D84th"
  FROM     "CLM_SeismicSD84th_48USA"
  WHERE    "Latitude">latitude and "Longitude" > longitude
  ORDER BY "Latitude" ASC, "Longitude" ASC
  FETCH first 1 rows only;
  
  OPEN Seismic_SUH_Data_Upper_X2 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "S_SUH",
           "S_1UH"
  FROM     "CLM_SeismicSUH_48USA"
  WHERE    "Latitude">latitude and "Longitude" > longitude
  ORDER BY "Latitude" ASC, "Longitude" ASC
  FETCH first 1 rows only;
  
  OPEN SeismicRisk_Data_Upper_X2 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "C_RS",
           "C_R1"
  FROM     "CLM_SeismicRisk_48USA"
  WHERE    "Latitude">latitude and "Longitude" > longitude
  ORDER BY "Latitude" ASC, "Longitude" ASC
  FETCH first 1 rows only;
  
  OPEN Seismic_Data_Lower_X1 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "S_SD84th",
           "S_1D84th"
  FROM     "CLM_SeismicSD84th_48USA"
  WHERE    "Latitude"<latitude AND "Longitude" < longitude
  ORDER BY "Latitude" DESC, "Longitude" DESC
  FETCH first 1 rows only;
  
  OPEN Seismic_SUH_Data_Lower_X1 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "S_SUH",
           "S_1UH"
  FROM     "CLM_SeismicSUH_48USA"
  WHERE    "Latitude"<latitude AND "Longitude" < longitude
  ORDER BY "Latitude" DESC, "Longitude" DESC
  FETCH first 1 rows only;
  
  OPEN SeismicRisk_Data_Lower_X1 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "C_RS",
           "C_R1"
  FROM     "CLM_SeismicRisk_48USA"
  WHERE    "Latitude"<latitude AND "Longitude" < longitude
  ORDER BY "Latitude" DESC, "Longitude" DESC
  FETCH first 1 rows only;
  
  OPEN Seismic_Data_Lower_X2 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "S_SD84th",
           "S_1D84th"
  FROM     "CLM_SeismicSD84th_48USA"
  WHERE    "Latitude"<latitude AND "Longitude" > longitude
  ORDER BY "Latitude" DESC, "Longitude" ASC
  FETCH first 1 rows only;
  
  OPEN Seismic_SUH_Data_Lower_X2 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "S_SUH",
           "S_1UH"
  FROM     "CLM_SeismicSUH_48USA"
  WHERE    "Latitude"<latitude AND "Longitude" > longitude
  ORDER BY "Latitude" DESC, "Longitude" ASC
  FETCH first 1 rows only;
  
  OPEN SeismicRisk_Data_Lower_X2 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "C_RS",
           "C_R1"
  FROM     "CLM_SeismicRisk_48USA"
  WHERE    "Latitude"<latitude AND "Longitude" > longitude
  ORDER BY "Latitude" DESC, "Longitude" ASC
  FETCH first 1 rows only;
  
    DBMS_OUTPUT.PUT_LINE('Time Ended US: ' || TO_CHAR(SYSDATE, 'DD-MON-YYYY HH24:MI:SS'));
  end;
  
  end if;

END CLM_NewSeismicValue_ThirdFormula;
/