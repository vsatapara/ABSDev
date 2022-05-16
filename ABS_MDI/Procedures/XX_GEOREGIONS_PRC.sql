CREATE OR REPLACE PROCEDURE abs_mdi."XX_GEOREGIONS_PRC" 
(xx_id IN Varchar2,
xx_shape IN sdo_geometry,
xx_dec IN Varchar2,
xx_come IN Varchar2,
xx_asid IN Varchar2)
as
begin
INSERT INTO XX_GeoRegions_BKP (GEOREGIONGUID, Shape, Description, Comments, AnsiId) 
VALUES(xx_id,xx_shape,xx_dec,xx_come,xx_asid);
commit;
end;
/