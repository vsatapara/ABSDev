CREATE OR REPLACE PROCEDURE abs_mdi."PARTITION_LIST" (
    ProjectId    IN   NUMBER,
    Output_Data  OUT  SYS_REFCURSOR
) AS
BEGIN
    OPEN Output_Data FOR 
    SELECT "PartitionId","BuildingNumber","ProjectId","Length" ,
     ROW_NUMBER() OVER(
        ORDER BY "PartitionId"
    ) row_num
    from "Accesories_Partition" where "ProjectId" = ProjectId order by "PartitionId";

    END "PARTITION_LIST";
/