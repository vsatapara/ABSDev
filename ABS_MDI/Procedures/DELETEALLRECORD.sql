CREATE OR REPLACE PROCEDURE abs_mdi."DELETEALLRECORD" (
/*   Modified By   Shreya Dhodi    
     Modified Date 21-10-2021
     Description   SS011-16464 and refactoring
*/
    TableName      IN  VARCHAR2,
    UserId         IN  NUMBER,
    IpAddress      IN  VARCHAR2,
    AccessoryTpye  IN  VARCHAR2,
    ProjectId      IN  NUMBER
) IS
    str VARCHAR2(2000);
    flag BOOLEAN := FALSE;
BEGIN
    IF ( LOWER(AccessoryTpye) = 'roofltps' OR LOWER(AccessoryTpye) = 'allaccessories') THEN
       UPDATE "Accesories_RoofLTP"
        SET
            "IsDelete" = 'Y',
            "ModifiedBy" = UserId,
            "ModifiedDate" = CURRENT_TIMESTAMP,
            "IpAddress" = IpAddress
        WHERE
                "IsDelete" = 'N'
            AND "ProjectId" = ProjectId;
        flag := true;    
     END IF;     
     
    IF ( LOWER(AccessoryTpye) = 'purlinextensions' OR LOWER(AccessoryTpye) = 'allaccessories') THEN
        UPDATE "Accesories_PurlinExtensions"
        SET
            "IsDelete" = 'Y',
            "ModifiedBy" = UserId,
            "ModifiedDate" = CURRENT_TIMESTAMP,
            "IpAddress" = IpAddress
        WHERE
                "IsDelete" = 'N'
            AND "ProjectId" = ProjectId;
        flag := true;    
     END IF;  
     
    IF ( LOWER(AccessoryTpye) = 'canopy' OR LOWER(AccessoryTpye) = 'allaccessories') THEN
        UPDATE "Accessories_Canopy"
        SET
            "IsDelete" = 'Y',
            "ModifiedBy" = UserId,
            "ModifiedDate" = CURRENT_TIMESTAMP,
            "IpAddress" = IpAddress
        WHERE
                "IsDelete" = 'N'
            AND "ProjectId" = ProjectId;
        flag := true;    
     END IF;  
     
     IF ( LOWER(AccessoryTpye) = 'louvers' OR LOWER(AccessoryTpye) = 'allaccessories') THEN
       UPDATE "Accessories_Louvers"
        SET
            "IsDelete" = 'Y',
            "ModifiedBy" = UserId,
            "ModifiedDate" = CURRENT_TIMESTAMP,
            "IpAddress" = IpAddress
        WHERE
                "IsDelete" = 'N'
            AND "ProjectId" = ProjectId;
        flag := true;    
     END IF;  
     IF ( LOWER(AccessoryTpye) = 'wallpartitionltp' OR LOWER(AccessoryTpye) = 'allaccessories') THEN
       UPDATE "Accesories_WallLTP"
        SET
            "IsDelete" = 'Y',
            "ModifiedBy" = UserId,
            "ModifiedDate" = CURRENT_TIMESTAMP,
            "IpAddress" = IpAddress
        WHERE
                "IsDelete" = 'N'
            AND "ProjectId" = ProjectId;
        flag := true;    
     END IF;       
     IF ( LOWER(AccessoryTpye) = 'parapetwalls' OR LOWER(AccessoryTpye) = 'allaccessories') THEN
       UPDATE "Accessories_Parapet"
        SET
            "IsDelete" = 'Y',
            "ModifiedBy" = UserId,
            "ModifiedDate" = CURRENT_TIMESTAMP,
            "IpAddress" = IpAddress
        WHERE
                "IsDelete" = 'N'
            AND "ProjectId" = ProjectId;
        flag := true;    
     END IF;          
     
    IF ( LOWER(AccessoryTpye) = 'facade' OR LOWER(AccessoryTpye) = 'allaccessories') THEN
              UPDATE "Accessories_Facade"
        SET
            "IsDelete" = 'Y',
            "ModifiedBy" = UserId,
            "ModifiedDate" = CURRENT_TIMESTAMP,
            "IpAddress" = IpAddress
        WHERE
                "IsDelete" = 'N'
            AND "ProjectId" = ProjectId;
        flag := true;    
     END IF;    
     
    IF ( LOWER(AccessoryTpye) = 'fullheight' OR LOWER(AccessoryTpye) = 'partialheight' OR  LOWER(AccessoryTpye) = 'attachmentheight' OR LOWER(AccessoryTpye) = 'allaccessories') THEN
        UPDATE "OpenAreas"
        SET
            "IsDeleted" = 'Y',
            "ModifiedBy" = UserId,
            "ModifiedDate" = CURRENT_TIMESTAMP,
            "IpAddress" = IpAddress
        WHERE
                "IsDeleted" = 'N' AND "OpenEndwall" = 0 AND REPLACE (LOWER("OpeningType"), ' ', '') = LOWER(AccessoryTpye)
            AND "BuildingNumber" in (SELECT "BuildingInformationId" FROM "BuildingInformation" WHERE "ProjectId" = ProjectId);
        flag := true;    
     END IF;           
    IF ( LOWER(AccessoryTpye) = 'openareas' OR LOWER(AccessoryTpye) = 'allaccessories') THEN
        UPDATE "OpenAreas"
        SET
            "IsDeleted" = 'Y',
            "ModifiedBy" = UserId,
            "ModifiedDate" = CURRENT_TIMESTAMP,
            "IpAddress" = IpAddress
        WHERE
                "IsDeleted" = 'N' AND "OpenEndwall" = 0
            AND "BuildingNumber" in (SELECT "BuildingInformationId" FROM "BuildingInformation" WHERE "ProjectId" = ProjectId);
        UPDATE "SupportBeams"
        SET
            "IsDelete" = 'Y',
            "ModifiedBy" = UserId,
            "ModifiedDate" = CURRENT_TIMESTAMP,
            "IpAddress" = IpAddress
        WHERE
                "IsDelete" = 'N' 
            AND "BuildingNumber" in (SELECT "BuildingInformationId" FROM "BuildingInformation" WHERE "ProjectId" = ProjectId);
         flag := true;        
    END IF;     
    IF ( LOWER(AccessoryTpye) = 'supportbeams' OR LOWER(AccessoryTpye) = 'allaccessories') THEN
        UPDATE "SupportBeams"
        SET
            "IsDelete" = 'Y',
            "ModifiedBy" = UserId,
            "ModifiedDate" = CURRENT_TIMESTAMP,
            "IpAddress" = IpAddress
        WHERE
                "IsDelete" = 'N' 
            AND "BuildingNumber" in (SELECT "BuildingInformationId" FROM "BuildingInformation" WHERE "ProjectId" = ProjectId);
         flag := true;        
     END IF;           
    IF ( LOWER(AccessoryTpye) = 'dbcidoors' OR LOWER(AccessoryTpye) = 'allaccessories') THEN
        UPDATE "Accessories_DBCIDoor"
        SET
            "IsDelete" = 'Y',
            "ModifiedBy" = UserId,
            "ModifiedDate" = CURRENT_TIMESTAMP,
            "IpAddress" = IpAddress
        WHERE
                "IsDelete" = 'N'
            AND "BuildingId" in (SELECT "BuildingInformationId" FROM "BuildingInformation" WHERE "ProjectId" = ProjectId);
         flag := true;        
     END IF;   
    IF ( LOWER(AccessoryTpye) = 'windows' OR LOWER(AccessoryTpye) = 'allaccessories') THEN
        UPDATE "Accesories_Windows"
        SET
            "IsDelete" = 'Y',
            "ModifiedBy" = UserId,
            "ModifiedDate" = CURRENT_TIMESTAMP,
            "IpAddress" = IpAddress
        WHERE
                "IsDelete" = 'N'
            AND "BuildingNumber" in (SELECT "BuildingInformationId" FROM "BuildingInformation" WHERE "ProjectId" = ProjectId);
        flag := true;    
    END IF;            
     IF ( LOWER(AccessoryTpye) = 'walkdoors' OR LOWER(AccessoryTpye) = 'allaccessories') THEN
         UPDATE "Accessories_WalkDoors"
         SET
           "IsDelete" = 'Y',
           "ModifiedBy" = UserId,
           "ModifiedDate" = CURRENT_TIMESTAMP,
           "IpAddress" = IpAddress
         WHERE
               "IsDelete" = 'N'
            AND "BuildingId" in (SELECT "BuildingInformationId" FROM "BuildingInformation" WHERE "ProjectId" = ProjectId);
         flag := true;        
    END IF;            
	IF ( LOWER(AccessoryTpye) = 'topmountedslidedoors' OR LOWER(AccessoryTpye) = 'allaccessories') THEN
         UPDATE "Accesories_TopMountedSlideDoor"
         SET
           "IsDelete" = 'Y',
           "ModifiedBy" = UserId,
           "ModifiedDate" = CURRENT_TIMESTAMP,
           "IpAddress" = IpAddress
         WHERE
               "IsDelete" = 'N'
            AND "BuildingNumber" in (SELECT "BuildingInformationId" FROM "BuildingInformation" WHERE "ProjectId" = ProjectId);
         flag := true;        
    END IF;       
    IF ( LOWER(AccessoryTpye) = 'roofliner' OR LOWER(AccessoryTpye) = 'allaccessories') THEN
         UPDATE "Accessories_Liners"
         SET
           "IsDelete" = 'Y',
           "ModifiedBy" = UserId,
           "ModifiedDate" = CURRENT_TIMESTAMP,
           "IpAddress" = IpAddress
         WHERE
               "IsDelete" = 'N' and "Elevation" = 'R'
            AND "BuildingNumber" in (SELECT "BuildingInformationId" FROM "BuildingInformation" WHERE "ProjectId" = ProjectId);
          flag := true;       
    END IF;
    IF ( LOWER(AccessoryTpye) = 'wallpartitionliner' OR LOWER(AccessoryTpye) = 'allaccessories') THEN
         UPDATE "Accessories_Liners"
         SET
           "IsDelete" = 'Y',
           "ModifiedBy" = UserId,
           "ModifiedDate" = CURRENT_TIMESTAMP,
           "IpAddress" = IpAddress
         WHERE
               "IsDelete" = 'N' and ("Elevation" != 'R' or "Elevation" is null )
            AND "BuildingNumber" in (SELECT "BuildingInformationId" FROM "BuildingInformation" WHERE "ProjectId" = ProjectId);
          flag := true;       
   END IF;
   IF ( LOWER(AccessoryTpye) = 'liner' OR LOWER(AccessoryTpye) = 'allaccessories') THEN
         UPDATE "Accessories_Liners"
         SET
           "IsDelete" = 'Y',
           "ModifiedBy" = UserId,
           "ModifiedDate" = CURRENT_TIMESTAMP,
           "IpAddress" = IpAddress
         WHERE
               "IsDelete" = 'N' 
            AND "BuildingNumber" in (SELECT "BuildingInformationId" FROM "BuildingInformation" WHERE "ProjectId" = ProjectId);
         flag := true;        
    END IF;
    IF ( LOWER(AccessoryTpye) = 'partitions' OR LOWER(AccessoryTpye) = 'allaccessories') THEN
         UPDATE "Accesories_Partition"
         SET
           "IsDelete" = 'Y',
           "ModifiedBy" = UserId,
           "ModifiedDate" = CURRENT_TIMESTAMP,
           "IpAddress" = IpAddress
         WHERE
               "IsDelete" = 'N' 
            AND "BuildingNumber" in (SELECT "BuildingInformationId" FROM "BuildingInformation" WHERE "ProjectId" = ProjectId);
         flag := true;        
    END IF;
    IF ( LOWER(AccessoryTpye) = 'valleygutters' OR LOWER(AccessoryTpye) = 'allaccessories') THEN
         UPDATE "Accessories_Valleygutters"
         SET
           "IsDelete" = 'Y',
           "ModifiedBy" = UserId,
           "ModifiedDate" = CURRENT_TIMESTAMP,
           "IpAddress" = IpAddress
         WHERE
               "IsDelete" = 'N' 
            AND "BuildingInformationId" in (SELECT "BuildingInformationId" FROM "BuildingInformation" WHERE "ProjectId" = ProjectId);
         flag := true;        
    END IF;
    IF ( LOWER(AccessoryTpye) = 'rubberpipeflash' OR LOWER(AccessoryTpye) = 'allaccessories') THEN
         UPDATE "Accessories_RubberPipeFlash"
         SET
           "IsDelete" = 'Y',
           "ModifiedBy" = UserId,
           "ModifiedDate" = CURRENT_TIMESTAMP,
           "IpAddress" = IpAddress
         WHERE
               "IsDelete" = 'N' 
            AND "BuildingId" in (SELECT "BuildingInformationId" FROM "BuildingInformation" WHERE "ProjectId" = ProjectId);
         flag := true;        
    END IF;
    IF ( LOWER(AccessoryTpye) = 'framedopenings' OR LOWER(AccessoryTpye) = 'allaccessories') THEN
         UPDATE "Accessories_FramedOpening"
         SET
           "IsDelete" = 'Y',
           "ModifiedBy" = UserId,
           "ModifiedDate" = CURRENT_TIMESTAMP,
           "IpAddress" = IpAddress
         WHERE
               "IsDelete" = 'N' 
            AND "BuildingNumber" in (SELECT "BuildingInformationId" FROM "BuildingInformation" WHERE "ProjectId" = ProjectId);
         flag := true;        
    END IF;
    IF ( LOWER(AccessoryTpye) = 'framedopenings' OR LOWER(AccessoryTpye) = 'allaccessories') THEN
         UPDATE "Accessories_FramedOpening"
         SET
           "IsDelete" = 'Y',
           "ModifiedBy" = UserId,
           "ModifiedDate" = CURRENT_TIMESTAMP,
           "IpAddress" = IpAddress
         WHERE
               "IsDelete" = 'N' 
            AND "BuildingNumber" in (SELECT "BuildingInformationId" FROM "BuildingInformation" WHERE "ProjectId" = ProjectId);
         flag := true;        
    END IF;
    IF ( LOWER(AccessoryTpye) = 'vents' OR LOWER(AccessoryTpye) = 'allaccessories') THEN
         UPDATE "Accessories_Vents"
         SET
           "IsDelete" = 'Y',
           "ModifiedBy" = UserId,
           "ModifiedDate" = CURRENT_TIMESTAMP,
           "IpAddress" = IpAddress
         WHERE
               "IsDelete" = 'N' 
            AND "BuildingId" in (SELECT "BuildingInformationId" FROM "BuildingInformation" WHERE "ProjectId" = ProjectId);
         flag := true;        
    END IF;
    IF ( LOWER(AccessoryTpye) = 'wainscot' OR LOWER(AccessoryTpye) = 'allaccessories') THEN
         UPDATE "Accesories_Wainscot"
         SET
           "IsDelete" = 'Y',
           "ModifiedBy" = UserId,
           "ModifiedDate" = CURRENT_TIMESTAMP,
           "IpAddress" = IpAddress
         WHERE
               "IsDelete" = 'N' 
            AND "BuildingInformationId" in (SELECT "BuildingInformationId" FROM "BuildingInformation" WHERE "ProjectId" = ProjectId);
         flag := true;        
    END IF;
       IF ( LOWER(AccessoryTpye) = 'cranes' OR LOWER(AccessoryTpye) = 'allaccessories') THEN
         UPDATE "Accessories_Cranes"
         SET
           "IsDelete" = 'Y',
           "ModifiedBy" = UserId,
           "ModifiedDate" = CURRENT_TIMESTAMP,
           "IpAddress" = IpAddress
         WHERE
               "IsDelete" = 'N'
            AND "BuildingId" in (SELECT "BuildingInformationId" FROM "BuildingInformation" WHERE "ProjectId" = ProjectId);
         flag := true;        
    END IF;     
    IF ( LOWER(AccessoryTpye) = 'miscellaneousadds' OR LOWER(AccessoryTpye) = 'allaccessories') THEN
         UPDATE "Input_AddLines"
         SET
           "IsDelete" = 'Y',
           "ModifiedBy" = UserId,
           "ModifiedDate" = CURRENT_TIMESTAMP,
           "IpAddress" = IpAddress
         WHERE
                "IsDelete" = 'N'
            AND "ScreenType" = 'MiscellaneousAdds'
            AND "BuildingInformationId" in (SELECT "BuildingInformationId" FROM "BuildingInformation" WHERE "ProjectId" = ProjectId);
           
         flag := true;        
    END IF;    
    IF ( LOWER(AccessoryTpye) = 'mezzanines' OR LOWER(AccessoryTpye) = 'allaccessories') THEN
         UPDATE "EDSPrice_IO_Mezzanines"
         SET
           "IsDelete" = 'Y',
           "ModifiedBy" = UserId,
           "ModifiedDate" = CURRENT_TIMESTAMP,
           "IpAddress" = IpAddress
         WHERE
               "IsDelete" = 'N'
            AND "BuildingNumber" in (SELECT "BuildingInformationId" FROM "BuildingInformation" WHERE "ProjectId" = ProjectId);
         flag := true;        
    END IF;  
    
    IF (flag = false) THEN
        str := '
        UPDATE "'
               || TableName
               || '" 
        SET "IsDelete"=''Y'',
        "ModifiedBy"='
               || UserId
               || ',
        "ModifiedDate"=CURRENT_TIMESTAMP,
        "IpAddress"='''
               || IpAddress
               || ''' WHERE "ProjectId" = ' || ProjectId || '';
        --dbms_output.put_line(str);
                EXECUTE IMMEDIATE str ;
    END IF;
END DeleteAllRecord;
/