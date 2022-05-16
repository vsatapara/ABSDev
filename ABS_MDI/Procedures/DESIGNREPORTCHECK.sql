CREATE OR REPLACE PROCEDURE abs_mdi."DESIGNREPORTCHECK" 
 (
 ProjectId IN NUMBER,
 Output_DesignReport_Data OUT SYS_REFCURSOR
 )
AS 
BEGIN
    OPEN Output_DesignReport_Data FOR
    SELECT 
          (SELECT "ProjectStage" FROM "Project" Where "ProjectId"=ProjectId AND "IsDelete"='N') "ProjectStage",
          (SELECT Count(1) FROM "EDSPrice_IO_Mezzanines" Where "ProjectId"=ProjectId AND("IsDelete"='N' OR "IsDelete" IS NULL)) "Mezzanines",
          (SELECT Count(1) FROM "Accesories_Partition"  Where "ProjectId"=ProjectId AND ("IsDelete"='N' OR "IsDelete" IS NULL)) "Partition",
          (SELECT  Count(1) FROM "Accessories_Cranes" WHERE "ProjectId"=ProjectId AND "SeperateSupportCol"='Y' AND ("IsDelete"='N' OR "IsDelete" IS NULL)) "Cranes",
          (SELECT Count(1) FROM "Collaterals" Where "ProjectId"=ProjectId AND ("IsDeleted" ='N' OR "IsDeleted" IS NULL) AND "SeismicDesignCategory" in('E','F')) "SeismicDesignCategory"
     FROM DUAL;
END DesignReportCheck;
/