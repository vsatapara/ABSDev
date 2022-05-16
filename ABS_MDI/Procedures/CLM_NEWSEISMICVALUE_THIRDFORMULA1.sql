CREATE OR REPLACE PROCEDURE abs_mdi."CLM_NEWSEISMICVALUE_THIRDFORMULA1" (  
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
StateVal VARCHAR2(20);
Latitude float;
Longitude float;
BEGIN
 StateVal := 'NJ';
 Latitude := 36.7783;
 Longitude := -119.4179;
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
  ORDER BY "Longitude" DESC, "Latitude" ASC
  FETCH first 1 rows only;
  OPEN Seismic_SUH_Data_Upper_X1 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "S_SUH",
           "S_1UH"
  FROM     "CLM_SeismicSUH_AK"
  WHERE    "Latitude">latitude and "Longitude" < longitude
  ORDER BY "Longitude" DESC, "Latitude" ASC
  FETCH first 1 rows only;
  OPEN SeismicRisk_Data_Upper_X1 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "C_RS",
           "C_R1"
  FROM     "CLM_SeismicRisk_AK"
  WHERE    "Latitude">latitude and "Longitude" < longitude
  ORDER BY "Longitude" DESC, "Latitude" ASC
  FETCH first 1 rows only;
  OPEN Seismic_Data_Upper_X2 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "S_SD84th",
           "S_1D84th"
  FROM     "CLM_SeismicSD84th_AK"
  WHERE    "Latitude">latitude and "Longitude" > longitude
  ORDER BY "Longitude" ASC, "Latitude" ASC
  FETCH first 1 rows only;
  OPEN Seismic_SUH_Data_Upper_X2 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "S_SUH",
           "S_1UH"
  FROM     "CLM_SeismicSUH_AK"
  WHERE    "Latitude">latitude and "Longitude" > longitude
  ORDER BY "Longitude" ASC, "Latitude" ASC
  FETCH first 1 rows only;
  OPEN SeismicRisk_Data_Upper_X2 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "C_RS",
           "C_R1"
  FROM     "CLM_SeismicRisk_AK"
  WHERE    "Latitude">latitude and "Longitude" > longitude
  ORDER BY "Longitude" ASC, "Latitude" ASC
  FETCH first 1 rows only;
  OPEN Seismic_Data_Lower_X1 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "S_SD84th",
           "S_1D84th"
  FROM     "CLM_SeismicSD84th_AK"
  WHERE    "Latitude"<latitude AND "Longitude" < longitude
  ORDER BY "Longitude" DESC, "Latitude" DESC
  FETCH first 1 rows only;
  OPEN Seismic_SUH_Data_Lower_X1 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "S_SUH",
           "S_1UH"
  FROM     "CLM_SeismicSUH_AK"
  WHERE    "Latitude"<latitude AND "Longitude" < longitude
  ORDER BY "Longitude" DESC, "Latitude" DESC
  FETCH first 1 rows only;
  OPEN SeismicRisk_Data_Lower_X1 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "C_RS",
           "C_R1"
  FROM     "CLM_SeismicRisk_AK"
  WHERE    "Latitude"<latitude AND "Longitude" < longitude
  ORDER BY "Longitude" DESC, "Latitude" DESC
  FETCH first 1 rows only;
  OPEN Seismic_Data_Lower_X2 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "S_SD84th",
           "S_1D84th"
  FROM     "CLM_SeismicSD84th_AK"
  WHERE    "Latitude"<latitude AND "Longitude" > longitude
  ORDER BY "Longitude" ASC, "Latitude" DESC
  FETCH first 1 rows only;
  OPEN Seismic_SUH_Data_Lower_X2 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "S_SUH",
           "S_1UH"
  FROM     "CLM_SeismicSUH_AK"
  WHERE    "Latitude"<latitude AND "Longitude" > longitude
  ORDER BY "Longitude" ASC, "Latitude" DESC
  FETCH first 1 rows only;
  OPEN SeismicRisk_Data_Lower_X2 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "C_RS",
           "C_R1"
  FROM     "CLM_SeismicRisk_AK"
  WHERE    "Latitude"<latitude AND "Longitude" > longitude
  ORDER BY "Longitude" ASC, "Latitude" DESC
  FETCH first 1 rows only;
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
  ORDER BY "Longitude" DESC, "Latitude" ASC
  FETCH first 1 rows only;
  OPEN Seismic_SUH_Data_Upper_X1 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "S_SUH",
           "S_1UH"
  FROM     "CLM_SeismicSUH_HI"
  WHERE    "Latitude">latitude and "Longitude" < longitude
  ORDER BY "Longitude" DESC, "Latitude" ASC
  FETCH first 1 rows only;
  OPEN SeismicRisk_Data_Upper_X1 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "C_RS",
           "C_R1"
  FROM     "CLM_SeismicRisk_HI"
  WHERE    "Latitude">latitude and "Longitude" < longitude
  ORDER BY "Longitude" DESC, "Latitude" ASC
  FETCH first 1 rows only;
  OPEN Seismic_Data_Upper_X2 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "S_SD84th",
           "S_1D84th"
  FROM     "CLM_SeismicSD84th_HI"
  WHERE    "Latitude">latitude and "Longitude" > longitude
  ORDER BY "Longitude" ASC, "Latitude" ASC
  FETCH first 1 rows only;
  OPEN Seismic_SUH_Data_Upper_X2 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "S_SUH",
           "S_1UH"
  FROM     "CLM_SeismicSUH_HI"
  WHERE    "Latitude">latitude and "Longitude" > longitude
  ORDER BY "Longitude" ASC, "Latitude" ASC
  FETCH first 1 rows only;
  OPEN SeismicRisk_Data_Upper_X2 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "C_RS",
           "C_R1"
  FROM     "CLM_SeismicRisk_HI"
  WHERE    "Latitude">latitude and "Longitude" > longitude
  ORDER BY "Longitude" ASC, "Latitude" ASC
  FETCH first 1 rows only;
  OPEN Seismic_Data_Lower_X1 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "S_SD84th",
           "S_1D84th"
  FROM     "CLM_SeismicSD84th_HI"
  WHERE    "Latitude"<latitude AND "Longitude" < longitude
  ORDER BY "Longitude" DESC, "Latitude" DESC
  FETCH first 1 rows only;
  OPEN Seismic_SUH_Data_Lower_X1 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "S_SUH",
           "S_1UH"
  FROM     "CLM_SeismicSUH_HI"
  WHERE    "Latitude"<latitude AND "Longitude" < longitude
  ORDER BY "Longitude" DESC, "Latitude" DESC
  FETCH first 1 rows only;
  OPEN SeismicRisk_Data_Lower_X1 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "C_RS",
           "C_R1"
  FROM     "CLM_SeismicRisk_HI"
  WHERE    "Latitude"<latitude AND "Longitude" < longitude
  ORDER BY "Longitude" DESC, "Latitude" DESC
  FETCH first 1 rows only;
  OPEN Seismic_Data_Lower_X2 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "S_SD84th",
           "S_1D84th"
  FROM     "CLM_SeismicSD84th_HI"
  WHERE    "Latitude"<latitude AND "Longitude" > longitude
  ORDER BY "Longitude" ASC, "Latitude" DESC
  FETCH first 1 rows only;
  OPEN Seismic_SUH_Data_Lower_X2 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "S_SUH",
           "S_1UH"
  FROM     "CLM_SeismicSUH_HI"
  WHERE    "Latitude"<latitude AND "Longitude" > longitude
  ORDER BY "Longitude" ASC, "Latitude" DESC
  FETCH first 1 rows only;
  OPEN SeismicRisk_Data_Lower_X2 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "C_RS",
           "C_R1"
  FROM     "CLM_SeismicRisk_HI"
  WHERE    "Latitude"<latitude AND "Longitude" > longitude
  ORDER BY "Longitude" ASC, "Latitude" DESC
  FETCH first 1 rows only;
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
  ORDER BY "Longitude" DESC, "Latitude" ASC
  FETCH first 1 rows only;
  OPEN Seismic_SUH_Data_Upper_X1 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "S_SUH",
           "S_1UH"
  FROM     "CLM_SeismicSUH_48USA"
  WHERE    "Latitude">latitude and "Longitude" < longitude
  ORDER BY "Longitude" DESC, "Latitude" ASC
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
  ORDER BY "Longitude" ASC, "Latitude" ASC
  FETCH first 1 rows only;
  OPEN Seismic_SUH_Data_Upper_X2 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "S_SUH",
           "S_1UH"
  FROM     "CLM_SeismicSUH_48USA"
  WHERE    "Latitude">latitude and "Longitude" > longitude
  ORDER BY "Longitude" ASC, "Latitude" ASC
  FETCH first 1 rows only;
  OPEN SeismicRisk_Data_Upper_X2 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "C_RS",
           "C_R1"
  FROM     "CLM_SeismicRisk_48USA"
  WHERE    "Latitude">latitude and "Longitude" > longitude
  ORDER BY "Longitude" ASC, "Latitude" ASC
  FETCH first 1 rows only;
  OPEN Seismic_Data_Lower_X1 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "S_SD84th",
           "S_1D84th"
  FROM     "CLM_SeismicSD84th_48USA"
  WHERE    "Latitude"<latitude AND "Longitude" < longitude
  ORDER BY "Longitude" DESC, "Latitude" DESC
  FETCH first 1 rows only;
  OPEN Seismic_SUH_Data_Lower_X1 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "S_SUH",
           "S_1UH"
  FROM     "CLM_SeismicSUH_48USA"
  WHERE    "Latitude"<latitude AND "Longitude" < longitude
  ORDER BY "Longitude" DESC, "Latitude" DESC
  FETCH first 1 rows only;
  OPEN SeismicRisk_Data_Lower_X1 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "C_RS",
           "C_R1"
  FROM     "CLM_SeismicRisk_48USA"
  WHERE    "Latitude"<latitude AND "Longitude" < longitude
  ORDER BY "Longitude" DESC, "Latitude" DESC
  FETCH first 1 rows only;
  OPEN Seismic_Data_Lower_X2 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "S_SD84th",
           "S_1D84th"
  FROM     "CLM_SeismicSD84th_48USA"
  WHERE    "Latitude"<latitude AND "Longitude" > longitude
  ORDER BY "Longitude" ASC, "Latitude" DESC
  FETCH first 1 rows only;
  OPEN Seismic_SUH_Data_Lower_X2 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "S_SUH",
           "S_1UH"
  FROM     "CLM_SeismicSUH_48USA"
  WHERE    "Latitude"<latitude AND "Longitude" > longitude
  ORDER BY "Longitude" ASC, "Latitude" DESC
  FETCH first 1 rows only;
  OPEN SeismicRisk_Data_Lower_X2 for
  SELECT   "Id",
           "Latitude",
           "Longitude",
           "C_RS",
           "C_R1"
  FROM     "CLM_SeismicRisk_48USA"
  WHERE    "Latitude"<latitude AND "Longitude" > longitude
  ORDER BY "Longitude" ASC, "Latitude" DESC
  FETCH first 1 rows only;
  end;
  end if;
END CLM_NewSeismicValue_ThirdFormula1;
/