CREATE OR REPLACE PROCEDURE abs_mdi."CLM_NEWSEISMICVALUE_LIST" (
    StateVal              IN   VARCHAR2,
    Longitude             IN   FLOAT,
 --   LongitudeLower        IN   FLOAT,
 --   LongitudeUpper        IN   FLOAT,    
    Latitude              IN   FLOAT,
 --   LatitudeLower         IN   FLOAT,
 --   LatitudeUpper         IN   FLOAT,    
    Seismic_Data          OUT  SYS_REFCURSOR,
    Seismic_SUH_Data      OUT  SYS_REFCURSOR,
    SeismicRisk_Data      OUT  SYS_REFCURSOR
) AS
TotalCount       NUMBER;
LatCount         NUMBER;
LongCount        NUMBER;
LongitudeLower   FLOAT;
LongitudeUpper   FLOAT;
LatitudeLower    FLOAT;
LatitudeUpper    FLOAT;
BEGIN
IF StateVal = 'AK' then
 begin
    select count(*) into TotalCount from "CLM_SeismicSD84th_AK" where "Latitude"=Latitude and "Longitude"=Longitude;
    select count(*) into LatCount from "CLM_SeismicSD84th_AK" where "Latitude"=Latitude;
    select count(*) into LongCount from "CLM_SeismicRisk_AK" where "Longitude"=Longitude;       
    
    if TotalCount <> 0 then
    begin
            open Seismic_Data for
            SELECT
                "Id",
                "Latitude",
                "Longitude",
                "S_SD84th",
                "S_1D84th",
                1 as "Formula"
            FROM
                "CLM_SeismicSD84th_AK" where "Latitude"=Latitude and "Longitude"=Longitude;
            open Seismic_SUH_Data for
            SELECT
                "Id",
                "Latitude",
                "Longitude",
                "S_SUH",
                "S_1UH"
            FROM
                "CLM_SeismicSUH_AK" where "Latitude"=Latitude and "Longitude"=Longitude;
                
            open SeismicRisk_Data for
            SELECT
                "Id",
                "Latitude",
                "Longitude",
                "C_RS",
                "C_R1"
            FROM
                "CLM_SeismicRisk_AK" where "Latitude"=Latitude and "Longitude"=Longitude;
    end;
    ELSIF LatCount <> 0 or LongCount <> 0 then
    begin
        if LatCount <> 0 then
         begin
            SELECT   "Longitude" into longitudeupper
            FROM     "CLM_SeismicSD84th_AK"
            WHERE    "Latitude" = Latitude and "Longitude" < Longitude
            ORDER BY "Longitude" DESC
            FETCH first 1 rows only;  
      
            SELECT   "Longitude" into longitudelower
            FROM     "CLM_SeismicSD84th_AK"
            WHERE    "Latitude" = Latitude and "Longitude" > Longitude
            ORDER BY "Longitude" ASC
            FETCH first 1 rows only;          
         
            open Seismic_Data for
            SELECT
                "Id",
                "Latitude",
                "Longitude",
                "S_SD84th",
                "S_1D84th",
                2 as "Formula"
            FROM
                "CLM_SeismicSD84th_AK" where "Latitude"=Latitude and "Longitude"=LongitudeLower
            union
             SELECT
                "Id",
                "Latitude",
                "Longitude",
                "S_SD84th",
                "S_1D84th",
                2 as "Formula"
            FROM
                "CLM_SeismicSD84th_AK" where "Latitude"=Latitude and "Longitude"=LongitudeUpper; 
                
            open Seismic_SUH_Data for
            SELECT
                "Id",
                "Latitude",
                "Longitude",
                "S_SUH",
                "S_1UH"
            FROM
                "CLM_SeismicSUH_AK" where "Latitude"=Latitude and "Longitude"=LongitudeLower
            union
             SELECT
                "Id",
                "Latitude",
                "Longitude",
                "S_SUH",
                "S_1UH"
            FROM
                "CLM_SeismicSUH_AK" where "Latitude"=Latitude and "Longitude"=LongitudeUpper; 
                
            open SeismicRisk_Data for
            SELECT
                "Id",
                "Latitude",
                "Longitude",
                "C_RS",
                "C_R1"
            FROM
                "CLM_SeismicRisk_AK" where "Latitude"=Latitude and "Longitude"=LongitudeLower
            union
             SELECT
                "Id",
                "Latitude",
                "Longitude",
                "C_RS",
                "C_R1"
            FROM
                "CLM_SeismicRisk_AK" where "Latitude"=Latitude and "Longitude"=LongitudeUpper;
         end;
         else
         begin
              SELECT   "Latitude" into LatitudeUpper
              FROM     "CLM_SeismicSD84th_AK"
              WHERE    "Latitude" > Latitude and "Longitude" = Longitude
              ORDER BY "Latitude" ASC
              FETCH first 1 rows only;    
                  
              SELECT   "Latitude" into latitudelower
              FROM     "CLM_SeismicSD84th_AK"
              WHERE    "Latitude" < Latitude AND "Longitude" = Longitude
              ORDER BY  "Latitude" DESC
              FETCH first 1 rows only;
              
            open Seismic_Data for
            SELECT
                "Id",
                "Latitude",
                "Longitude",
                "S_SD84th",
                "S_1D84th",
                2 as "Formula"
            FROM
                "CLM_SeismicSD84th_AK" where "Latitude"=LatitudeLower and "Longitude"=Longitude
            union
             SELECT
                "Id",
                "Latitude",
                "Longitude",
                "S_SD84th",
                "S_1D84th",
                2 as "Formula"
            FROM
                "CLM_SeismicSD84th_AK" where "Latitude"=LatitudeUpper and "Longitude"=Longitude;
            open Seismic_SUH_Data for
            SELECT
                "Id",
                "Latitude",
                "Longitude",
                "S_SUH",
                "S_1UH"
            FROM
                "CLM_SeismicSUH_AK" where "Latitude"=LatitudeLower and "Longitude"=Longitude
            union
             SELECT
                "Id",
                "Latitude",
                "Longitude",
                "S_SUH",
                "S_1UH"
            FROM
                "CLM_SeismicSUH_AK" where "Latitude"=LatitudeUpper and "Longitude"=Longitude; 
                
            open SeismicRisk_Data for
            SELECT
                "Id",
                "Latitude",
                "Longitude",
                "C_RS",
                "C_R1"
            FROM
                "CLM_SeismicRisk_AK" where "Latitude"=LatitudeLower and "Longitude"=Longitude
            union
             SELECT
                "Id",
                "Latitude",
                "Longitude",
                "C_RS",
                "C_R1"
            FROM
                "CLM_SeismicRisk_AK" where "Latitude"=LatitudeUpper and "Longitude"=Longitude;            
         end;
        end if;  
    end;    
    end if;     
 end;
 ELSIF StateVal = 'HI' then
 begin
    select count(*) into TotalCount from "CLM_SeismicSD84th_HI" where "Latitude"=Latitude and "Longitude"=Longitude;
    select count(*) into LatCount from "CLM_SeismicSD84th_HI" where "Latitude"=Latitude;
    select count(*) into LongCount from "CLM_SeismicRisk_HI" where "Longitude"=Longitude;       
    
    if TotalCount <> 0 then
    begin
            open Seismic_Data for
            SELECT
                "Id",
                "Latitude",
                "Longitude",
                "S_SD84th",
                "S_1D84th",
                1 as "Formula"
            FROM
                "CLM_SeismicSD84th_HI" where "Latitude"=Latitude and "Longitude"=Longitude;
            open Seismic_SUH_Data for
            SELECT
                "Id",
                "Latitude",
                "Longitude",
                "S_SUH",
                "S_1UH"
            FROM
                "CLM_SeismicSUH_HI" where "Latitude"=Latitude and "Longitude"=Longitude;
                
            open SeismicRisk_Data for
            SELECT
                "Id",
                "Latitude",
                "Longitude",
                "C_RS",
                "C_R1"
            FROM
                "CLM_SeismicRisk_HI" where "Latitude"=Latitude and "Longitude"=Longitude;
    end;
    ELSIF LatCount <> 0 or LongCount <> 0 then
    begin
        if LatCount <> 0 then
         begin
            SELECT   "Longitude" into longitudeupper
            FROM     "CLM_SeismicSD84th_HI"
            WHERE    "Latitude" = Latitude and "Longitude" < Longitude
            ORDER BY "Longitude" DESC
            FETCH first 1 rows only;  
      
            SELECT   "Longitude" into longitudelower
            FROM     "CLM_SeismicSD84th_HI"
            WHERE    "Latitude" = Latitude and "Longitude" > Longitude
            ORDER BY "Longitude" ASC
            FETCH first 1 rows only;          
         
            open Seismic_Data for
            SELECT
                "Id",
                "Latitude",
                "Longitude",
                "S_SD84th",
                "S_1D84th",
                2 as "Formula"
            FROM
                "CLM_SeismicSD84th_HI" where "Latitude"=Latitude and "Longitude"=LongitudeLower
            union
             SELECT
                "Id",
                "Latitude",
                "Longitude",
                "S_SD84th",
                "S_1D84th",
                2 as "Formula"
            FROM
                "CLM_SeismicSD84th_HI" where "Latitude"=Latitude and "Longitude"=LongitudeUpper; 
                
            open Seismic_SUH_Data for
            SELECT
                "Id",
                "Latitude",
                "Longitude",
                "S_SUH",
                "S_1UH"
            FROM
                "CLM_SeismicSUH_HI" where "Latitude"=Latitude and "Longitude"=LongitudeLower
            union
             SELECT
                "Id",
                "Latitude",
                "Longitude",
                "S_SUH",
                "S_1UH"
            FROM
                "CLM_SeismicSUH_HI" where "Latitude"=Latitude and "Longitude"=LongitudeUpper; 
                
            open SeismicRisk_Data for
            SELECT
                "Id",
                "Latitude",
                "Longitude",
                "C_RS",
                "C_R1"
            FROM
                "CLM_SeismicRisk_HI" where "Latitude"=Latitude and "Longitude"=LongitudeLower
            union
             SELECT
                "Id",
                "Latitude",
                "Longitude",
                "C_RS",
                "C_R1"
            FROM
                "CLM_SeismicRisk_HI" where "Latitude"=Latitude and "Longitude"=LongitudeUpper;
         end;
         else
         begin
              SELECT   "Latitude" into LatitudeUpper
              FROM     "CLM_SeismicSD84th_HI"
              WHERE    "Latitude" > Latitude and "Longitude" = Longitude
              ORDER BY "Latitude" ASC
              FETCH first 1 rows only;    
                  
              SELECT   "Latitude" into latitudelower
              FROM     "CLM_SeismicSD84th_HI"
              WHERE    "Latitude" < Latitude AND "Longitude" = Longitude
              ORDER BY  "Latitude" DESC
              FETCH first 1 rows only;
              
            open Seismic_Data for
            SELECT
                "Id",
                "Latitude",
                "Longitude",
                "S_SD84th",
                "S_1D84th",
                2 as "Formula"
            FROM
                "CLM_SeismicSD84th_HI" where "Latitude"=LatitudeLower and "Longitude"=Longitude
            union
             SELECT
                "Id",
                "Latitude",
                "Longitude",
                "S_SD84th",
                "S_1D84th",
                2 as "Formula"
            FROM
                "CLM_SeismicSD84th_HI" where "Latitude"=LatitudeUpper and "Longitude"=Longitude;
            open Seismic_SUH_Data for
            SELECT
                "Id",
                "Latitude",
                "Longitude",
                "S_SUH",
                "S_1UH"
            FROM
                "CLM_SeismicSUH_HI" where "Latitude"=LatitudeLower and "Longitude"=Longitude
            union
             SELECT
                "Id",
                "Latitude",
                "Longitude",
                "S_SUH",
                "S_1UH"
            FROM
                "CLM_SeismicSUH_HI" where "Latitude"=LatitudeUpper and "Longitude"=Longitude; 
                
            open SeismicRisk_Data for
            SELECT
                "Id",
                "Latitude",
                "Longitude",
                "C_RS",
                "C_R1"
            FROM
                "CLM_SeismicRisk_HI" where "Latitude"=LatitudeLower and "Longitude"=Longitude
            union
             SELECT
                "Id",
                "Latitude",
                "Longitude",
                "C_RS",
                "C_R1"
            FROM
                "CLM_SeismicRisk_HI" where "Latitude"=LatitudeUpper and "Longitude"=Longitude;            
         end;
        end if;  
    end;    
    end if;     
 end;
 ELSE
 begin
     select count(*) into TotalCount from "CLM_SeismicSD84th_48USA" where "Latitude"=Latitude and "Longitude"=Longitude;
    select count(*) into LatCount from "CLM_SeismicSD84th_48USA" where "Latitude"=Latitude;
    select count(*) into LongCount from "CLM_SeismicRisk_48USA" where "Longitude"=Longitude;
    
    if TotalCount <> 0 then
    begin
            open Seismic_Data for
            SELECT
                "Id",
                "Latitude",
                "Longitude",
                "S_SD84th",
                "S_1D84th",
                1 as "Formula"
            FROM
                "CLM_SeismicSD84th_48USA" where "Latitude"=Latitude and "Longitude"=Longitude;
            open Seismic_SUH_Data for
            SELECT
                "Id",
                "Latitude",
                "Longitude",
                "S_SUH",
                "S_1UH"
            FROM
                "CLM_SeismicSUH_48USA" where "Latitude"=Latitude and "Longitude"=Longitude;
                
            open SeismicRisk_Data for
            SELECT
                "Id",
                "Latitude",
                "Longitude",
                "C_RS",
                "C_R1"
            FROM
                "CLM_SeismicRisk_48USA" where "Latitude"=Latitude and "Longitude"=Longitude;
    end;
    ELSIF LatCount <> 0 or LongCount <> 0 then
    begin
        if LatCount <> 0 then
         begin
            SELECT   "Longitude" into longitudeupper
            FROM     "CLM_SeismicSD84th_48USA"
            WHERE    "Latitude" = Latitude and "Longitude" < Longitude
            ORDER BY "Longitude" DESC
            FETCH first 1 rows only;  
      
            SELECT   "Longitude" into longitudelower
            FROM     "CLM_SeismicSD84th_48USA"
            WHERE    "Latitude" = Latitude and "Longitude" > Longitude
            ORDER BY "Longitude" ASC
            FETCH first 1 rows only;           
         
            open Seismic_Data for
            SELECT
                "Id",
                "Latitude",
                "Longitude",
                "S_SD84th",
                "S_1D84th",
                2 as "Formula"
            FROM
                "CLM_SeismicSD84th_48USA" where "Latitude"=Latitude and "Longitude"=LongitudeLower
            union
             SELECT
                "Id",
                "Latitude",
                "Longitude",
                "S_SD84th",
                "S_1D84th",
                2 as "Formula"
            FROM
                "CLM_SeismicSD84th_48USA" where "Latitude"=Latitude and "Longitude"=LongitudeUpper; 
                
            open Seismic_SUH_Data for
            SELECT
                "Id",
                "Latitude",
                "Longitude",
                "S_SUH",
                "S_1UH"
            FROM
                "CLM_SeismicSUH_48USA" where "Latitude"=Latitude and "Longitude"=LongitudeLower
            union
             SELECT
                "Id",
                "Latitude",
                "Longitude",
                "S_SUH",
                "S_1UH"
            FROM
                "CLM_SeismicSUH_48USA" where "Latitude"=Latitude and "Longitude"=LongitudeUpper; 
                
            open SeismicRisk_Data for
            SELECT
                "Id",
                "Latitude",
                "Longitude",
                "C_RS",
                "C_R1"
            FROM
                "CLM_SeismicRisk_48USA" where "Latitude"=Latitude and "Longitude"=LongitudeLower
            union
             SELECT
                "Id",
                "Latitude",
                "Longitude",
                "C_RS",
                "C_R1"
            FROM
                "CLM_SeismicRisk_48USA" where "Latitude"=Latitude and "Longitude"=LongitudeUpper;
         end;
         else
         begin
              SELECT   "Latitude" into LatitudeUpper
              FROM     "CLM_SeismicSD84th_48USA"
              WHERE    "Latitude" > Latitude and "Longitude" = Longitude
              ORDER BY "Latitude" ASC
              FETCH first 1 rows only;    
                  
              SELECT   "Latitude" into latitudelower
              FROM     "CLM_SeismicSD84th_48USA"
              WHERE    "Latitude" < Latitude AND "Longitude" = Longitude
              ORDER BY  "Latitude" DESC
              FETCH first 1 rows only;        
         
            open Seismic_Data for
            SELECT
                "Id",
                "Latitude",
                "Longitude",
                "S_SD84th",
                "S_1D84th",
                2 as "Formula"
            FROM
                "CLM_SeismicSD84th_48USA" where "Latitude"=LatitudeLower and "Longitude"=Longitude
            union
             SELECT
                "Id",
                "Latitude",
                "Longitude",
                "S_SD84th",
                "S_1D84th",
                2 as "Formula"
            FROM
                "CLM_SeismicSD84th_48USA" where "Latitude"=LatitudeUpper and "Longitude"=Longitude;
            open Seismic_SUH_Data for
            SELECT
                "Id",
                "Latitude",
                "Longitude",
                "S_SUH",
                "S_1UH"
            FROM
                "CLM_SeismicSUH_48USA" where "Latitude"=LatitudeLower and "Longitude"=Longitude
            union
             SELECT
                "Id",
                "Latitude",
                "Longitude",
                "S_SUH",
                "S_1UH"
            FROM
                "CLM_SeismicSUH_48USA" where "Latitude"=LatitudeUpper and "Longitude"=Longitude; 
                
            open SeismicRisk_Data for
            SELECT
                "Id",
                "Latitude",
                "Longitude",
                "C_RS",
                "C_R1"
            FROM
                "CLM_SeismicRisk_48USA" where "Latitude"=LatitudeLower and "Longitude"=Longitude
            union
             SELECT
                "Id",
                "Latitude",
                "Longitude",
                "C_RS",
                "C_R1"
            FROM
                "CLM_SeismicRisk_48USA" where "Latitude"=LatitudeUpper and "Longitude"=Longitude;            
         end;
        end if;  
    end;    
    end if;  
 end;
 end if;  
END CLM_NewSeismicValue_List;
/