CREATE OR REPLACE PROCEDURE abs_mdi."XX_BIG_PRC" 
(xx_id IN Varchar2,
xx_shape IN SDO_GEOMETRY,
xx_dec IN Varchar2,
xx_come IN Varchar2,
xx_asid IN Varchar2 )
as
begin
INSERT INTO XX_BIG (GEOREGIONGUID, Shape, Description, Comments, AnsiId) 
VALUES(xx_id,xx_shape,xx_dec,xx_come,xx_asid);
end;
/