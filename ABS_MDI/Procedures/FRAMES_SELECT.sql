CREATE OR REPLACE PROCEDURE abs_mdi."FRAMES_SELECT" 
(
    ProjectId IN NUMBER,
    BuildingNo IN NUMBER,
    OutFrameGroups_Data OUT SYS_REFCURSOR,
    OutFrameLines_Data OUT SYS_REFCURSOR,
    OutFrameModule_Data OUT SYS_REFCURSOR,
    OutFrameInteriorColumns_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
     OPEN OutFrameGroups_Data FOR 
        SELECT
            C1."ProjectId", C1."BuildingNumber", C1."GroupNumber", C1."ColType1", C1."ColType2", C1."WebDepth1", C1."WebDepth2", 
            C1."RafterDepth1", C1."RafterDepth2", C1."ExtColRecession1", C1."ExtColRecession2",
            C1."Clearspan",C1."IsElevation1", C1."IsElevation2", C1."Elevation1", C1."Elevation2", C1."HighStrengthWashers", C1."IsAdvanceColumn"
        FROM "BFM_Groups" C1
        WHERE C1."ProjectId" = Projectid and C1."BuildingNumber" = Buildingno; 
        
    OPEN OutFrameLines_Data FOR 
        SELECT
            C1."ProjectId", C1."BuildingNumber", C1."FrameLineNumber", C1."GroupNumber"
        FROM "BFM_FrameLines" C1
        WHERE C1."ProjectId" = Projectid and C1."BuildingNumber" = Buildingno;
    OPEN OutFrameModule_Data FOR 
        SELECT
            C1."ProjectId", C1."BuildingNumber", C1."GroupNumber", C1."ModuleNumber", C1."Width"
        FROM "BFM_Modules" C1
        WHERE C1."ProjectId" = Projectid and C1."BuildingNumber" = Buildingno;
    OPEN OutFrameInteriorColumns_Data FOR 
        SELECT
            C1."ProjectId", C1."BuildingNumber", C1."GroupNumber", C1."ColumnNumber", C1."IntColType", C1."IntColBaseType", C1."IntColRecess", 
            C1."IntColHeaderType", C1."IntColMaxWebDepth"
        FROM "BFM_Columns" C1
        WHERE C1."ProjectId" = Projectid and C1."BuildingNumber" = Buildingno;
    
END FRAMES_SELECT;
/