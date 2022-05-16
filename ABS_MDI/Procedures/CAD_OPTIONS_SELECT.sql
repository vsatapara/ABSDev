CREATE OR REPLACE PROCEDURE abs_mdi."CAD_OPTIONS_SELECT" (
    ProjectId   IN NUMBER,
    Output_Data OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN Output_Data FOR SELECT
             CO."Id" AS "CadOptionsId",
             CO."ProjectId",
             CO."OptionsDimScaleAdd",
             CO."OptionsIsMasonryHighDetail",
             CO."OptionsIsPanelHighDetail",
             CO."OptionsIsSteelHighDetail",
             CO."OptionsWantMasonry",
             CO."OptionsWantPanel",
             CO."OptionsWantSteel",
             CO."OptionsWantLandscape",
             CO."OptionsWantAccessories",
             CO."Options3dDetail",
             CO."OptionsTitleBlockType",
             CO."OptionsTitleBlockSize",
             CO."Options3dViewHeight",
             CO."Options3dViewOrientation",
             CO."OptionsCadProgram",
             CO."OptionsDimScheme",
             CO."OptionsDimType",
             CO."OptionsCustomPaperHeight",
             CO."OptionsCustomPaperWidth",
             CO."OptionsCustomBorderHeight",
             CO."OptionsCustomBorderWidth",
             CO."OptionsCustomTitleBlockLocation",
             CO."OptoinsCustomBackGroundLocation",
             CO."OptionsDrawingsScaleFactor",
             CO."OptionsDWGSaveDirectory",
             CTB."Id" AS "CadTitleBlockId",
             CTB."DrawingName",
             CTB."BuilderNumber",
             CTB."BuilderName",
             CTB."BuilderContact",
             CTB."BuilderAddress1",
             CTB."BuilderAddress2",
             CTB."BuilderCity",
             CTB."BuilderState",
             CTB."BuilderZip",
             CTB."BuilderCounty",
             CTB."BuilderCountry",
             CTB."BuilderEmail",
             CTB."BuilderWebSite",
             CTB."OwnerName",
             CTB."OwnerAddress1",
             CTB."OwnerAddress2",
             CTB."OwnerCity",
             CTB."OwnerState",
             CTB."OwnerZip",
             CTB."OwnerCounty",
             CTB."OwnerCountry",
             CTB."JobName",
             CTB."JobDateOfEstimate",
             CTB."JobEstimator",
             CTB."JobID",
             CTB."DrawingRevisionNumber",
             CTB."DrawingDate",
             CTB."Plant"
      FROM   "CAD_Options" CO
             inner join "CAD_TitleBlock" CTB
             on CTB."ProjectId" = CO."ProjectId"
      WHERE  CO."ProjectId" = ProjectId;
END CAD_OPTIONS_SELECT;
/