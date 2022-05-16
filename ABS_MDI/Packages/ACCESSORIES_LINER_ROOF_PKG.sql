CREATE OR REPLACE PACKAGE abs_mdi."ACCESSORIES_LINER_ROOF_PKG" 
is 

-- InsertRecord
procedure InsertRecord (
EaveToWallTrimColor in "Accessories_Liner_Roof"."EaveToWallTrimColor"%type default null 
,RafterTieTrimColor in "Accessories_Liner_Roof"."RafterTieTrimColor"%type default null 
,FastenerHeadFinish in "Accessories_Liner_Roof"."FastenerHeadFinish"%type default null 
,OptionalLinerFlash in "Accessories_Liner_Roof"."OptionalLinerFlash"%type default null 
,JambTrim in "Accessories_Liner_Roof"."JambTrim"%type default null 
,PanelFinish in "Accessories_Liner_Roof"."PanelFinish"%type default null 
,EaveToWallTrimColorSpecialName in "Accessories_Liner_Roof"."EaveToWallTrimColorSpecialName"%type default null 
,FlashColorSpecialName in "Accessories_Liner_Roof"."FlashColorSpecialName"%type default null 
,RidgeTrimColorSpecialName in "Accessories_Liner_Roof"."RidgeTrimColorSpecialName"%type default null 
,Qty in "Accessories_Liner_Roof"."Qty"%type default null 
,FramedOpeningTrim in "Accessories_Liner_Roof"."FramedOpeningTrim"%type default null 
,RidgeTrimColor in "Accessories_Liner_Roof"."RidgeTrimColor"%type default null 
,WeightMBCI in "Accessories_Liner_Roof"."WeightMBCI"%type default null 
,CreatedBy in "Accessories_Liner_Roof"."CreatedBy"%type default null 
,GirtNote in "Accessories_Liner_Roof"."GirtNote"%type default null 
,YFrom in "Accessories_Liner_Roof"."YFrom"%type default null 
,PanelType in "Accessories_Liner_Roof"."PanelType"%type default null 
,PanelGauge in "Accessories_Liner_Roof"."PanelGauge"%type default null 
,Weight in "Accessories_Liner_Roof"."Weight"%type default null 
,StartColumn in "Accessories_Liner_Roof"."StartColumn"%type default null 
,PanelColorValsparCode in "Accessories_Liner_Roof"."PanelColorValsparCode"%type default null 
,Price in "Accessories_Liner_Roof"."Price"%type default null 
,RafterTieTrimFinish in "Accessories_Liner_Roof"."RafterTieTrimFinish"%type default null 
,YTo in "Accessories_Liner_Roof"."YTo"%type default null 
,IsPriced in "Accessories_Liner_Roof"."IsPriced"%type default null 
,LinerCoverage in "Accessories_Liner_Roof"."LinerCoverage"%type default null 
,RidgeTrimFinish in "Accessories_Liner_Roof"."RidgeTrimFinish"%type default null 
,PanelColorSpecialName in "Accessories_Liner_Roof"."PanelColorSpecialName"%type default null 
,RidgeTrimGauge in "Accessories_Liner_Roof"."RidgeTrimGauge"%type default null 
,EaveToWallTrimColorValsparCode in "Accessories_Liner_Roof"."EaveToWallTrimColorValsparCode"%type default null 
,ReverseRoll in "Accessories_Liner_Roof"."ReverseRoll"%type default null 
,StopColumn in "Accessories_Liner_Roof"."StopColumn"%type default null 
,TopTermination in "Accessories_Liner_Roof"."TopTermination"%type default null 
,EaveToWallRrimFinish in "Accessories_Liner_Roof"."EaveToWallRrimFinish"%type default null 
,PartitionNumber in "Accessories_Liner_Roof"."PartitionNumber"%type default null 
,SheetAngle in "Accessories_Liner_Roof"."SheetAngle"%type default null 
,XFrom in "Accessories_Liner_Roof"."XFrom"%type default null 
,Width in "Accessories_Liner_Roof"."Width"%type default null 
,FlashColorValsparCode in "Accessories_Liner_Roof"."FlashColorValsparCode"%type default null 
,PriceMBCI in "Accessories_Liner_Roof"."PriceMBCI"%type default null 
,RidgeTrimColorValsparCode in "Accessories_Liner_Roof"."RidgeTrimColorValsparCode"%type default null 
,RoofLinerId in "Accessories_Liner_Roof"."RoofLinerId"%type
,EaveToWallTrimGauge in "Accessories_Liner_Roof"."EaveToWallTrimGauge"%type default null 
,BaseAngle in "Accessories_Liner_Roof"."BaseAngle"%type default null 
,ColTrim in "Accessories_Liner_Roof"."ColTrim"%type default null 
,ProjectId in "Accessories_Liner_Roof"."ProjectId"%type
,RafterTieTrimColorSpecialName in "Accessories_Liner_Roof"."RafterTieTrimColorSpecialName"%type default null 
,CapTrim in "Accessories_Liner_Roof"."CapTrim"%type default null 
,RafterTieTrimColorValsparCode in "Accessories_Liner_Roof"."RafterTieTrimColorValsparCode"%type default null 
,BaseChannel in "Accessories_Liner_Roof"."BaseChannel"%type default null 
,XTo in "Accessories_Liner_Roof"."XTo"%type default null 
,FastenerLength in "Accessories_Liner_Roof"."FastenerLength"%type default null 
,BuildingNumber in "Accessories_Liner_Roof"."BuildingNumber"%type
,PanelColor in "Accessories_Liner_Roof"."PanelColor"%type default null 
,IsDelete in "Accessories_Liner_Roof"."IsDelete"%type default null 
,IpAddress in "Accessories_Liner_Roof"."IpAddress"%type default null 
,ErrorCode in "Accessories_Liner_Roof"."ErrorCode"%type default null 
,FlashColor in "Accessories_Liner_Roof"."FlashColor"%type default null 
,RafterTieTrimGauge in "Accessories_Liner_Roof"."RafterTieTrimGauge"%type default null 
);
-- UpdateRecordate
procedure UpdateRecord (
EaveToWallTrimColor in "Accessories_Liner_Roof"."EaveToWallTrimColor"%type default null 
,RafterTieTrimColor in "Accessories_Liner_Roof"."RafterTieTrimColor"%type default null 
,FastenerHeadFinish in "Accessories_Liner_Roof"."FastenerHeadFinish"%type default null 
,OptionalLinerFlash in "Accessories_Liner_Roof"."OptionalLinerFlash"%type default null 
,ModifiedBy in "Accessories_Liner_Roof"."ModifiedBy"%type default null 
,JambTrim in "Accessories_Liner_Roof"."JambTrim"%type default null 
,PanelFinish in "Accessories_Liner_Roof"."PanelFinish"%type default null 
,EaveToWallTrimColorSpecialName in "Accessories_Liner_Roof"."EaveToWallTrimColorSpecialName"%type default null 
,FlashColorSpecialName in "Accessories_Liner_Roof"."FlashColorSpecialName"%type default null 
,RidgeTrimColorSpecialName in "Accessories_Liner_Roof"."RidgeTrimColorSpecialName"%type default null 
,Qty in "Accessories_Liner_Roof"."Qty"%type default null 
,FramedOpeningTrim in "Accessories_Liner_Roof"."FramedOpeningTrim"%type default null 
,RidgeTrimColor in "Accessories_Liner_Roof"."RidgeTrimColor"%type default null 
,WeightMBCI in "Accessories_Liner_Roof"."WeightMBCI"%type default null 
,GirtNote in "Accessories_Liner_Roof"."GirtNote"%type default null 
,YFrom in "Accessories_Liner_Roof"."YFrom"%type default null 
,PanelType in "Accessories_Liner_Roof"."PanelType"%type default null 
,PanelGauge in "Accessories_Liner_Roof"."PanelGauge"%type default null 
,Weight in "Accessories_Liner_Roof"."Weight"%type default null 
,StartColumn in "Accessories_Liner_Roof"."StartColumn"%type default null 
,PanelColorValsparCode in "Accessories_Liner_Roof"."PanelColorValsparCode"%type default null 
,Price in "Accessories_Liner_Roof"."Price"%type default null 
,RafterTieTrimFinish in "Accessories_Liner_Roof"."RafterTieTrimFinish"%type default null 
,YTo in "Accessories_Liner_Roof"."YTo"%type default null 
,IsPriced in "Accessories_Liner_Roof"."IsPriced"%type default null 
,LinerCoverage in "Accessories_Liner_Roof"."LinerCoverage"%type default null 
,RidgeTrimFinish in "Accessories_Liner_Roof"."RidgeTrimFinish"%type default null 
,PanelColorSpecialName in "Accessories_Liner_Roof"."PanelColorSpecialName"%type default null 
,RidgeTrimGauge in "Accessories_Liner_Roof"."RidgeTrimGauge"%type default null 
,EaveToWallTrimColorValsparCode in "Accessories_Liner_Roof"."EaveToWallTrimColorValsparCode"%type default null 
,ReverseRoll in "Accessories_Liner_Roof"."ReverseRoll"%type default null 
,StopColumn in "Accessories_Liner_Roof"."StopColumn"%type default null 
,TopTermination in "Accessories_Liner_Roof"."TopTermination"%type default null 
,EaveToWallRrimFinish in "Accessories_Liner_Roof"."EaveToWallRrimFinish"%type default null 
,PartitionNumber in "Accessories_Liner_Roof"."PartitionNumber"%type default null 
,SheetAngle in "Accessories_Liner_Roof"."SheetAngle"%type default null 
,XFrom in "Accessories_Liner_Roof"."XFrom"%type default null 
,Width in "Accessories_Liner_Roof"."Width"%type default null 
,FlashColorValsparCode in "Accessories_Liner_Roof"."FlashColorValsparCode"%type default null 
,PriceMBCI in "Accessories_Liner_Roof"."PriceMBCI"%type default null 
,RidgeTrimColorValsparCode in "Accessories_Liner_Roof"."RidgeTrimColorValsparCode"%type default null 
,RoofLinerId in "Accessories_Liner_Roof"."RoofLinerId"%type
,EaveToWallTrimGauge in "Accessories_Liner_Roof"."EaveToWallTrimGauge"%type default null 
,BaseAngle in "Accessories_Liner_Roof"."BaseAngle"%type default null 
,ColTrim in "Accessories_Liner_Roof"."ColTrim"%type default null 
,ProjectId in "Accessories_Liner_Roof"."ProjectId"%type
,RafterTieTrimColorSpecialName in "Accessories_Liner_Roof"."RafterTieTrimColorSpecialName"%type default null 
,CapTrim in "Accessories_Liner_Roof"."CapTrim"%type default null 
,RafterTieTrimColorValsparCode in "Accessories_Liner_Roof"."RafterTieTrimColorValsparCode"%type default null 
,BaseChannel in "Accessories_Liner_Roof"."BaseChannel"%type default null 
,XTo in "Accessories_Liner_Roof"."XTo"%type default null 
,FastenerLength in "Accessories_Liner_Roof"."FastenerLength"%type default null 
,BuildingNumber in "Accessories_Liner_Roof"."BuildingNumber"%type
,PanelColor in "Accessories_Liner_Roof"."PanelColor"%type default null 
,IsDelete in "Accessories_Liner_Roof"."IsDelete"%type default null 
,IpAddress in "Accessories_Liner_Roof"."IpAddress"%type default null 
,ErrorCode in "Accessories_Liner_Roof"."ErrorCode"%type default null 
,FlashColor in "Accessories_Liner_Roof"."FlashColor"%type default null 
,RafterTieTrimGauge in "Accessories_Liner_Roof"."RafterTieTrimGauge"%type default null 
);
-- DeleteByIdete
procedure DeleteById (
RoofLinerId in "Accessories_Liner_Roof"."RoofLinerId"%type
);
-- GetRecordById
procedure GetRecordById (
RoofLinerId in "Accessories_Liner_Roof"."RoofLinerId"%type,
output_data         OUT  SYS_REFCURSOR
);

-- GetAllRecord
procedure GetAllRecord (
output_data   OUT  SYS_REFCURSOR
);

end Accessories_Liner_Roof_PKG;
/