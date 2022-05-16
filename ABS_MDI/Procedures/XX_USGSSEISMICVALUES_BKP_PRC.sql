CREATE OR REPLACE PROCEDURE abs_mdi."XX_USGSSEISMICVALUES_BKP_PRC" 
(xx_GUID IN Varchar2,
xx_DesignCodeID IN number,
xx_GeoPoint IN sdo_geometry,
xx_Lat IN number,
xx_lon IN number,
xx_Ss IN number,
xx_S1 IN number,
xx_PGa IN number)
as
begin
INSERT INTO xx_usgsseismicvalues_bkp (GUID, DesignCodeID, GeoPoint, Lat, lon,Ss,S1,PGa) 
VALUES(xx_GUID,xx_DesignCodeID,xx_GeoPoint,xx_Lat,xx_lon,xx_Ss,xx_S1,xx_PGa);
commit;
end;
/