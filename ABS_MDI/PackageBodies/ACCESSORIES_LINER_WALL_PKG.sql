CREATE OR REPLACE PACKAGE BODY abs_mdi."ACCESSORIES_LINER_WALL_PKG" 
is
-- InsertRecordert
procedure InsertRecord (
ColumnTieTrimColorSpecialName in "Accessories_Liner_Wall"."ColumnTieTrimColorSpecialName"%type default null 
,WallLinerId in "Accessories_Liner_Wall"."WallLinerId"%type
,FastenerHeadFinish in "Accessories_Liner_Wall"."FastenerHeadFinish"%type default null 
,PanelColorSpecialName in "Accessories_Liner_Wall"."PanelColorSpecialName"%type default null 
,ColumnTieTrimColor in "Accessories_Liner_Wall"."ColumnTieTrimColor"%type default null 
,ReverseRoll in "Accessories_Liner_Wall"."ReverseRoll"%type default null 
,PurlinTrimColorValsparCode in "Accessories_Liner_Wall"."PurlinTrimColorValsparCode"%type default null 
,Elevation in "Accessories_Liner_Wall"."Elevation"%type default null 
,Height in "Accessories_Liner_Wall"."Height"%type default null 
,CapTrimColor in "Accessories_Liner_Wall"."CapTrimColor"%type default null 
,PurlinTrimColor in "Accessories_Liner_Wall"."PurlinTrimColor"%type default null 
,InsideCornerTrimColor in "Accessories_Liner_Wall"."InsideCornerTrimColor"%type default null 
,PurlinTrimColorSpecialName in "Accessories_Liner_Wall"."PurlinTrimColorSpecialName"%type default null 
,CreatedBy in "Accessories_Liner_Wall"."CreatedBy"%type default null 
,DistFromLeftCol in "Accessories_Liner_Wall"."DistFromLeftCol"%type default null 
,BayNumber in "Accessories_Liner_Wall"."BayNumber"%type default null 
,ProjectId in "Accessories_Liner_Wall"."ProjectId"%type
,PanelType in "Accessories_Liner_Wall"."PanelType"%type default null 
,PanelGauge in "Accessories_Liner_Wall"."PanelGauge"%type default null 
,DistFromLeftCorner in "Accessories_Liner_Wall"."DistFromLeftCorner"%type default null 
,FullHeight in "Accessories_Liner_Wall"."FullHeight"%type default null 
,PanelColorValsparCode in "Accessories_Liner_Wall"."PanelColorValsparCode"%type default null 
,FastenerLength in "Accessories_Liner_Wall"."FastenerLength"%type default null 
,InsideCornerTrimColorValsparCode in "Accessories_Liner_Wall"."InsideCornerTrimColorValsparCode"%type default null 
,BaseType in "Accessories_Liner_Wall"."BaseType"%type default null 
,Length in "Accessories_Liner_Wall"."Length"%type default null 
,BuildingNumber in "Accessories_Liner_Wall"."BuildingNumber"%type
,PanelColor in "Accessories_Liner_Wall"."PanelColor"%type default null 
,IsDelete in "Accessories_Liner_Wall"."IsDelete"%type default null 
,IpAddress in "Accessories_Liner_Wall"."IpAddress"%type default null 
,CapTrimColorValsparCode in "Accessories_Liner_Wall"."CapTrimColorValsparCode"%type default null 
,CapTrimColorSpecialName in "Accessories_Liner_Wall"."CapTrimColorSpecialName"%type default null 
,InsideCornerTrimColorSpecialName in "Accessories_Liner_Wall"."InsideCornerTrimColorSpecialName"%type default null 
,ColumnTieTrimColorValsparCode in "Accessories_Liner_Wall"."ColumnTieTrimColorValsparCode"%type default null 
) is
begin
Insert into "Accessories_Liner_Wall"(
"ColumnTieTrimColorSpecialName"
,"WallLinerId"
,"FastenerHeadFinish"
,"PanelColorSpecialName"
,"ColumnTieTrimColor"
,"ReverseRoll"
,"PurlinTrimColorValsparCode"
,"Elevation"
,"Height"
,"CapTrimColor"
,"PurlinTrimColor"
,"InsideCornerTrimColor"
,"PurlinTrimColorSpecialName"
,"CreatedBy"
,"DistFromLeftCol"
,"BayNumber"
,"ProjectId"
,"PanelType"
,"PanelGauge"
,"DistFromLeftCorner"
,"FullHeight"
,"PanelColorValsparCode"
,"FastenerLength"
,"InsideCornerTrimColorValsparCode"
,"BaseType"
,"Length"
,"BuildingNumber"
,"PanelColor"
,"CreatedDate"
,"IsDelete"
,"IpAddress"
,"CapTrimColorValsparCode"
,"CapTrimColorSpecialName"
,"InsideCornerTrimColorSpecialName"
,"ColumnTieTrimColorValsparCode"

) values (
ColumnTieTrimColorSpecialName
,WallLinerId
,FastenerHeadFinish
,PanelColorSpecialName
,ColumnTieTrimColor
,ReverseRoll
,PurlinTrimColorValsparCode
,Elevation
,Height
,CapTrimColor
,PurlinTrimColor
,InsideCornerTrimColor
,PurlinTrimColorSpecialName
,CreatedBy
,DistFromLeftCol
,BayNumber
,ProjectId
,PanelType
,PanelGauge
,DistFromLeftCorner
,FullHeight
,PanelColorValsparCode
,FastenerLength
,InsideCornerTrimColorValsparCode
,BaseType
,Length
,BuildingNumber
,PanelColor
,CURRENT_TIMESTAMP
,IsDelete
,IpAddress
,CapTrimColorValsparCode
,CapTrimColorSpecialName
,InsideCornerTrimColorSpecialName
,ColumnTieTrimColorValsparCode
);end;
-- UpdateRecord
procedure UpdateRecord (
ColumnTieTrimColorSpecialName in "Accessories_Liner_Wall"."ColumnTieTrimColorSpecialName"%type default null 
,WallLinerId in "Accessories_Liner_Wall"."WallLinerId"%type
,FastenerHeadFinish in "Accessories_Liner_Wall"."FastenerHeadFinish"%type default null 
,PanelColorSpecialName in "Accessories_Liner_Wall"."PanelColorSpecialName"%type default null 
,ColumnTieTrimColor in "Accessories_Liner_Wall"."ColumnTieTrimColor"%type default null 
,ReverseRoll in "Accessories_Liner_Wall"."ReverseRoll"%type default null 
,ModifiedBy in "Accessories_Liner_Wall"."ModifiedBy"%type default null 
,PurlinTrimColorValsparCode in "Accessories_Liner_Wall"."PurlinTrimColorValsparCode"%type default null 
,Elevation in "Accessories_Liner_Wall"."Elevation"%type default null 
,Height in "Accessories_Liner_Wall"."Height"%type default null 
,CapTrimColor in "Accessories_Liner_Wall"."CapTrimColor"%type default null 
,PurlinTrimColor in "Accessories_Liner_Wall"."PurlinTrimColor"%type default null 
,InsideCornerTrimColor in "Accessories_Liner_Wall"."InsideCornerTrimColor"%type default null 
,PurlinTrimColorSpecialName in "Accessories_Liner_Wall"."PurlinTrimColorSpecialName"%type default null 
,DistFromLeftCol in "Accessories_Liner_Wall"."DistFromLeftCol"%type default null 
,BayNumber in "Accessories_Liner_Wall"."BayNumber"%type default null 
,ProjectId in "Accessories_Liner_Wall"."ProjectId"%type
,PanelType in "Accessories_Liner_Wall"."PanelType"%type default null 
,PanelGauge in "Accessories_Liner_Wall"."PanelGauge"%type default null 
,DistFromLeftCorner in "Accessories_Liner_Wall"."DistFromLeftCorner"%type default null 
,FullHeight in "Accessories_Liner_Wall"."FullHeight"%type default null 
,PanelColorValsparCode in "Accessories_Liner_Wall"."PanelColorValsparCode"%type default null 
,FastenerLength in "Accessories_Liner_Wall"."FastenerLength"%type default null 
,InsideCornerTrimColorValsparCode in "Accessories_Liner_Wall"."InsideCornerTrimColorValsparCode"%type default null 
,BaseType in "Accessories_Liner_Wall"."BaseType"%type default null 
,Length in "Accessories_Liner_Wall"."Length"%type default null 
,BuildingNumber in "Accessories_Liner_Wall"."BuildingNumber"%type
,PanelColor in "Accessories_Liner_Wall"."PanelColor"%type default null 
,IsDelete in "Accessories_Liner_Wall"."IsDelete"%type default null 
,IpAddress in "Accessories_Liner_Wall"."IpAddress"%type default null 
,CapTrimColorValsparCode in "Accessories_Liner_Wall"."CapTrimColorValsparCode"%type default null 
,CapTrimColorSpecialName in "Accessories_Liner_Wall"."CapTrimColorSpecialName"%type default null 
,InsideCornerTrimColorSpecialName in "Accessories_Liner_Wall"."InsideCornerTrimColorSpecialName"%type default null 
,ColumnTieTrimColorValsparCode in "Accessories_Liner_Wall"."ColumnTieTrimColorValsparCode"%type default null 
) is
begin
Update "Accessories_Liner_Wall" set
"ColumnTieTrimColorSpecialName"=ColumnTieTrimColorSpecialName
,"WallLinerId"=WallLinerId
,"FastenerHeadFinish"=FastenerHeadFinish
,"PanelColorSpecialName"=PanelColorSpecialName
,"ColumnTieTrimColor"=ColumnTieTrimColor
,"ReverseRoll"=ReverseRoll
,"ModifiedBy"=ModifiedBy
,"ModifiedDate"=CURRENT_TIMESTAMP
,"PurlinTrimColorValsparCode"=PurlinTrimColorValsparCode
,"Elevation"=Elevation
,"Height"=Height
,"CapTrimColor"=CapTrimColor
,"PurlinTrimColor"=PurlinTrimColor
,"InsideCornerTrimColor"=InsideCornerTrimColor
,"PurlinTrimColorSpecialName"=PurlinTrimColorSpecialName
,"DistFromLeftCol"=DistFromLeftCol
,"BayNumber"=BayNumber
,"ProjectId"=ProjectId
,"PanelType"=PanelType
,"PanelGauge"=PanelGauge
,"DistFromLeftCorner"=DistFromLeftCorner
,"FullHeight"=FullHeight
,"PanelColorValsparCode"=PanelColorValsparCode
,"FastenerLength"=FastenerLength
,"InsideCornerTrimColorValsparCode"=InsideCornerTrimColorValsparCode
,"BaseType"=BaseType
,"Length"=Length
,"BuildingNumber"=BuildingNumber
,"PanelColor"=PanelColor
,"IsDelete"=IsDelete
,"IpAddress"=IpAddress
,"CapTrimColorValsparCode"=CapTrimColorValsparCode
,"CapTrimColorSpecialName"=CapTrimColorSpecialName
,"InsideCornerTrimColorSpecialName"=InsideCornerTrimColorSpecialName
,"ColumnTieTrimColorValsparCode"=ColumnTieTrimColorValsparCode

where "WallLinerId" = WallLinerId;
end;
-- DeleteById
procedure DeleteById (
WallLinerId in "Accessories_Liner_Wall"."WallLinerId"%type
) is
begin
Delete from "Accessories_Liner_Wall"
where "WallLinerId" = WallLinerId;
end;
-- GetRecordById
procedure GetRecordById (
WallLinerId in "Accessories_Liner_Wall"."WallLinerId"%type,
output_data OUT  SYS_REFCURSOR
) is
begin
OPEN output_data FOR 
SELECT  *  FROM "Accessories_Liner_Wall" WHERE "WallLinerId" = WallLinerId;
END GetRecordById;

-- GetAllRecord
procedure GetAllRecord (
output_data OUT  SYS_REFCURSOR
) is 
begin
OPEN output_data FOR 
SELECT  *  FROM "Accessories_Liner_Wall"; 
END GetAllRecord;
end Accessories_Liner_Wall_PKG;
/