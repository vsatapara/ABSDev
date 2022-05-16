CREATE OR REPLACE PROCEDURE abs_mdi."INPUT_WALL_GETBYBUILDINGID" 
(
    BuildingId IN VARCHAR2,
    OUTPUT_WALL OUT  SYS_REFCURSOR
)
AS
BEGIN
        OPEN OUTPUT_WALL FOR SELECT
                            Wall."WallId",
                            Wall."BuildingInformationId",
                            PanelType."Type" "Type",
                            Gauge_."Value" "Gauge",
                            (CASE NVL(Thick_."Value",'0') WHEN '0' THEN Thick_."Value" ELSE CONCAT(cast(Thick_."Value" as varchar2(20)),'') END) "Thick",
                            BaseFraming_."Value" "BaseFraming",
                            BaseFlash_."Value" "BaseFlash",
                            BaseClosure_."Value" "BaseClosure",
                            Wall."SealedWall",
                            Wall."Washers",
                            Wall."Notch",
                            Wall."RakeClosure",
                            Wall."EaveClosureStrip",
                            FastenerType_."Value" "FastenerType",
                            FastenerHeadFinish_."Value" "FastenerHeadFinish",
                            FastenerLength_."Value" "FastenerLength",
                            Wall."Warranty",
                            FactoryAppliedSealant_."Value" "FactoryAppliedSealant",
                            Wall."ReverseRolled",
                            Wall."OutsideMetalClosure",
                            Wall."SidelapSealant",
                            Wall."FoamTape",
                            Wall."ColdStorageBuilding",
                            ExteriorSkinProfile_."Value" "ExteriorSkinProfile",
                            ExteriorSkinTexture_."Value" "ExteriorSkinTexture",
                            InteriorSkinProfile_."Value" "InteriorSkinProfile",
                            InteriorSkinTexture_."Value" "InteriorSkinTexture",
                            InteriorSkinGauge_."Value" "InteriorSkinGauge",
                            Width_."Value" "Width",
                            Wall."NotchWidth",
                            Wall."NotchDepth",
                            Wall."NotchType",
                            Wall."RValue",
                            Wall."UValue",
                            Trim."SW1TrimOption" as "sw_1_trim_option",
                            Trim."SW2TrimOption" as "sw_2_trim_option",
                            Trim."EW3TrimOption" as"ew_3_trim_option",
                            Trim."EW4TrimOption" as "ew_4_trim_option",
                            Trim."SW1Drops",
                            Trim."SW2Drops",
                            Trim."EW3Drops",
                            Trim."EW4Drops"
                        FROM
                                 "Input_Wall" Wall
                            --JOIN "BuildingInformation"        Info ON Wall."BuildingInformationId" = Info."BuildingInformationId"
                            --JOIN "Input_TrimColorSelections"  ColorSel ON Wall."BuildingInformationId" = ColorSel."BuildingNumber"
                            --JOIN "M_PanelType"                PanelType ON Wall."Type" = PanelType."Id"
                            --LEFT JOIN "M_Panel_Dropdown"      PanelDropdown ON Wall."BaseFraming" = PanelDropdown."Id"
                            --LEFT JOIN "M_Panel_Dropdown"      BaseFlashDropdown ON Wall."BaseFlash" = BaseFlashDropdown."Id"
                            --LEFT JOIN "M_Panel_Dropdown"      GaugeDropdown ON Wall."Gauge" = GaugeDropdown."Id"
                            JOIN "BuildingInformation"        Info ON Wall."BuildingInformationId" = Info."BuildingInformationId"
                            JOIN "M_PanelType"                PanelType ON Wall."Type" = PanelType."Id"
                            LEFT JOIN "M_Panel_Dropdown"      Gauge_ ON Wall."Gauge" = Gauge_."Id"
                            LEFT JOIN "M_Panel_Dropdown"      Thick_ ON Wall."Thick" = Thick_."Id"
                            LEFT JOIN "M_Panel_Dropdown"      BaseFraming_ ON Wall."BaseFraming" = BaseFraming_."Id"
                            LEFT JOIN "M_Panel_Dropdown"      BaseFlash_ ON Wall."BaseFlash" = BaseFlash_."Id"
                            LEFT JOIN "M_Panel_Dropdown"      BaseClosure_ ON Wall."BaseClosure" = BaseClosure_."Id"
                            LEFT JOIN "M_Panel_Dropdown"      FastenerType_ ON Wall."FastenerType" = FastenerType_."Id"
                            LEFT JOIN "M_Panel_Dropdown"      FastenerHeadFinish_ ON Wall."FastenerHeadFinish" = FastenerHeadFinish_."Id"
                            LEFT JOIN "M_Panel_Dropdown"      FastenerLength_ ON Wall."FastenerLength" = FastenerLength_."Id"
                            LEFT JOIN "M_Panel_Dropdown"      FactoryAppliedSealant_ ON Wall."FactoryAppliedSealant" = FactoryAppliedSealant_."Id"
                            LEFT JOIN "M_Panel_Dropdown"      ExteriorSkinProfile_ ON Wall."ExteriorSkinProfile" = ExteriorSkinProfile_."Id"
                            LEFT JOIN "M_Panel_Dropdown"      ExteriorSkinTexture_ ON Wall."ExteriorSkinTexture" = ExteriorSkinTexture_."Id"
                            LEFT JOIN "M_Panel_Dropdown"      InteriorSkinProfile_ ON Wall."InteriorSkinProfile" = InteriorSkinProfile_."Id"
                            LEFT JOIN "M_Panel_Dropdown"      InteriorSkinTexture_ ON Wall."InteriorSkinTexture" = InteriorSkinTexture_."Id"
                            LEFT JOIN "M_Panel_Dropdown"      InteriorSkinGauge_ ON Wall."InteriorSkinGauge" = InteriorSkinGauge_."Id"
                            LEFT JOIN "M_Panel_Dropdown"      Width_ ON Wall."Width" = Width_."Id"
                            LEFT JOIN "Input_Trim"            Trim  ON Wall."BuildingInformationId" = Trim."BuildingNumber"
                        WHERE
                                Wall."BuildingInformationId" in
                                (
                                    SELECT regexp_substr(BuildingId,'[^,]+', 1, level) from dual
                                    connect by regexp_substr(BuildingId, '[^,]+', 1, level) is not null
                                )
                              --AND Info."ProjectId" = ProjectId
                                AND (Wall."IsDelete" IS NULL  OR Wall."IsDelete" != 'Y');
END;
/