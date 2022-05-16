CREATE OR REPLACE PROCEDURE abs_mdi."OCCUPANCY_THERMALFACTOR_SELECT" 
(
    BuildingCode                    IN   VARCHAR2,
    JobsiteState                    IN   VARCHAR2,
    JobsiteCity                     IN   VARCHAR2,
    OUTPUT_OCCUPANCY                OUT  SYS_REFCURSOR,
    OUTPUT_THERMALFACTOR            OUT  SYS_REFCURSOR,
    OUTPUT_CANADA                   OUT  SYS_REFCURSOR
)
AS
BEGIN
     OPEN OUTPUT_OCCUPANCY FOR SELECT
                                        O."OccupancyId",
                                        O."OccupancyValue",
                                        O."SortOrder"
                                    FROM
                                        "CL_Occupancy" O
                                    WHERE
                                        O."OccupancyId" = (SELECT "OccupancyList" 
                                                            FROM "CL_Settings" 
                                                            WHERE "BuildingCode" = BuildingCode 
                                                            AND "Occupancy" = 1) 
                                    AND O."IsActive" = 'Y';
     OPEN OUTPUT_THERMALFACTOR FOR SELECT
                                        T."ThermalFactorId",
                                        T."ThermalFactorValue",
                                        T."SortOrder"
                                    FROM
                                        "CL_ThermalFactor" T
                                    WHERE
                                        T."ThermalFactorId" = (SELECT "ThermalFactorList" 
                                                                FROM "CL_Settings" 
                                                                WHERE "BuildingCode" = BuildingCode 
                                                                AND "ThermalFactor" = 1)
                                    AND T."IsActive" = 'Y';
  
     OPEN OUTPUT_CANADA FOR SELECT 
                                            C."BuildingCode",
                                            C."JobsiteProvince",
                                            C."JobsiteCity"
                                    FROM "CL_MinimumsCanada" C
                                    WHERE 
                                        C."BuildingCode" = BuildingCode
                                    AND C."JobsiteProvince" = JobsiteState
                                    AND C."JobsiteCity" = JobsiteCity; 
       
  
END OCCUPANCY_THERMALFACTOR_SELECT;
/