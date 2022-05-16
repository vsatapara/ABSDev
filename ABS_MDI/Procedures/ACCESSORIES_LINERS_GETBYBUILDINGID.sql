CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORIES_LINERS_GETBYBUILDINGID" 
(
     BuildingNumber IN VARCHAR2,
     Output_Data  OUT  SYS_REFCURSOR
) AS 
BEGIN
   OPEN Output_Data FOR SELECT
    "LinerId", 
	"BuildingNumber", 
	"ProjectId", 
	"Elevation",
	"BayNumber",
	"DistFromLeftCorner", 
    "DistFromLeftCol",
	"FullHeight",
	"Height",
	"Length",
	PanelType_."Type" "PanelType",
	"PanelGauge",
	"PanelColor",
	"JambTrim",
	"FramedOpeningTrim",
	"CapTrim",
	"ColTrim",
	"BaseAngle",
	"SheetAngle",
	"BaseChannel",
	"Weight",
	"Price", 
	"IsPriced", 
	"ErrorCode", 
	"FlashColor", 
	"OptionalLinerFlash", 
	"BaseType", 
	"CapTrimColor", 
	"PurlinTrimColor", 
	"InsideCornerTrimColor", 
	"ColumnTieTrimColor", 
	"RidgeTrimGauge", 
	"RidgeTrimFinish", 
	"RidgeTrimColor", 
	"RafterTieTrimGauge", 
	"RafterTieTrimFinish", 
	"RafterTieTrimColor", 
	"EaveToWallTrimGauge", 
	"EaveToWallTrimFinish", 
	"EaveToWallTrimColor", 
	"PanelFinish", 
	AF."Width", 
	"LinerCoverage", 
	"StartColumn", 
	"StopColumn", 
	"XFrom", 
	"XTo", 
	"YFrom", 
	"YTo", 
	"ReverseRoll", 
	"WeightMBCI", 
	"PriceMBCI", 
	"TopTermination", 
	"PartitionNumber", 
	"FullLength", 
	"GirtNote", 
	FastenerHeadFinish_."Value" "FastenerHeadFinish", 
	FastenerLength_."Value" "FastenerLength", 
	"PanelColorValsparCode", 
	"PanelColorSpecialName", 
	"FlashColorValsparCode", 
	"FlashColorSpecialName", 
	"CapTrimColorValsparCode", 
	"CapTrimColorSpecialName", 
	"PurlinTrimColorValsparCode", 
	"PurlinTrimColorSpecialName", 
	"InsideCornerTrimColorValsparCode", 
	"InsideCornerTrimColorSpecialName", 
	"ColumnTieTrimColorValsparCode", 
	"ColumnTieTrimColorSpecialName", 
	"RidgeTrimColorValsparCode", 
	"RidgeTrimColorSpecialName", 
	"RafterTieTrimColorValsparCode", 
	"RafterTieTrimColorSpecialName", 
	"EaveToWallTrimColorValsparCode", 
	"EaveToWallTrimColorSpecialName"
     FROM
          "Accessories_Liners" AF
     JOIN "M_PanelType" PanelType_ ON AF."PanelType" = PanelType_."Id"
     LEFT JOIN "M_Panel_Dropdown" FastenerHeadFinish_ ON AF."FastenerHeadFinish" = FastenerHeadFinish_."Id"
     LEFT JOIN "M_Panel_Dropdown" FastenerLength_ ON AF."FastenerLength" = FastenerLength_."Id"
     
                         Where  "BuildingNumber" in( 
                        SELECT regexp_substr(BuildingNumber,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNumber, '[^,]+', 1, level) is not null
                        )
             AND ("IsDelete" IS NULL OR "IsDelete" != 'Y');     
END ACCESSORIES_LINERS_GETBYBUILDINGID;
/