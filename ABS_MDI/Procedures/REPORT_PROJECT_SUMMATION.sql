CREATE OR REPLACE PROCEDURE abs_mdi."REPORT_PROJECT_SUMMATION" 
(
    CompanyId IN Number,
    ProjectId IN NUMBER,   
    CountryName IN VARCHAR2,
    Output_Project_Summation OUT  SYS_REFCURSOR,
    Output_Project_Summation_Total OUT  SYS_REFCURSOR
)
AS 
CountryCount_COUNT   NUMBER(5);
IsForBuilding_Count NUMBER(3);
IsForSignatureOrders_Count NUMBER(3);
BEGIN
  
  SELECT COUNT(1) INTO CountryCount_COUNT  FROM "TableOfTables" WHERE  dbms_lob.compare("ItemText", CountryName) = 0 AND ROWNUM = 1;
  IF ( CountryCount_COUNT > 0 ) 
  THEN
        
        SELECT COUNT(*) INTO IsForBuilding_Count  FROM "PricingSummaries" WHERE  "ShippingToCountryId"  in(SELECT "Id" FROM "TableOfTables" WHERE  dbms_lob.compare("ItemText", CountryName) = 0)
                            AND "CompanyId"=CompanyId
                            AND "IsForComponents" ='N'                           
                            AND NVL("IsDelete",'N') != 'Y'; 
        
        SELECT COUNT(*) INTO IsForSignatureOrders_Count FROM  "PricingSummaries"
                            where "ShippingToCountryId"  in(SELECT "Id" FROM "TableOfTables" WHERE  dbms_lob.compare("ItemText", CountryName) = 0)
                            AND "CompanyId"=CompanyId
                            AND "IsForSignatureOrders"='Y'
                            AND NVL("IsDelete",'N') != 'Y';  
        If(IsForBuilding_Count >0)
        THEN
            If(IsForSignatureOrders_Count >0 )
            THEN
            OPEN Output_Project_Summation FOR SELECT "LoadContent" FROM  "PricingSummaries"
                                where "ShippingToCountryId"  in(SELECT "Id" FROM "TableOfTables" WHERE  dbms_lob.compare("ItemText", CountryName) = 0)
                                AND "CompanyId"=CompanyId
                                AND "IsForComponents" ='N'
                                AND "IsForSignatureOrders"='Y'
                                AND NVL("IsDelete",'N') != 'Y' 
                                  order by "ModifiedDate" DESC; 
            ELSE
              OPEN Output_Project_Summation FOR SELECT "LoadContent" FROM  "PricingSummaries"
                                where "ShippingToCountryId"  in(SELECT "Id" FROM "TableOfTables" WHERE  dbms_lob.compare("ItemText", CountryName) = 0)
                                AND "CompanyId"=CompanyId
                                AND "IsForComponents" ='N'
                                AND "IsForSignatureOrders"='N'
                                AND NVL("IsDelete",'N') != 'Y' 
                               order by "ModifiedDate" DESC;
            END IF; 
             ELSE
                 OPEN Output_Project_Summation FOR SELECT null "LoadContent" FROM DUAL;
        END IF;    
  ELSE
    OPEN Output_Project_Summation FOR SELECT null "LoadContent" FROM DUAL;
   
 END IF;
 
 
  OPEN Output_Project_Summation_Total FOR
     SELECT S."ProjectId",
       S."TruckTarps",
       SP."PriceMultiplier",
       SP."MaximumWeightPerTruck",
       SP."MinimumFreightFee",
       SP."FreightSurcharge",
       SP."MinimumWeight",
       SP."FreightRate",
       SP."AdditionalPerTruckFee",
       SP."TruckTarpFee"
    FROM "Shipping" S
    left join "ShippingPlants"  SP on   S."ShippingPointId"= SP."ShippingPlantId"
    Where S."ProjectId"=ProjectId 
    AND  NVL("IsDeleted",'N') != 'Y'
    AND ROWNUM = 1; 
     
END REPORT_PROJECT_SUMMATION;
/