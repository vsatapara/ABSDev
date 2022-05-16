CREATE OR REPLACE PROCEDURE abs_mdi."ACCESORIES_PARTITIONMODULESPACING_DELETE" 
(
PartitionId IN NUMBER
)
AS 
BEGIN
   DELETE
    FROM "Accesories_PartitionModuleSpacing"  
   WHERE
       "PartitionId" = PartitionId;
     
   DELETE
    FROM "Accesories_PartitionGirtSpacing" 
   WHERE
       "PartitionId" = PartitionId;
END ACCESORIES_PARTITIONMODULESPACING_DELETE;
/