CREATE OR REPLACE PROCEDURE abs_mdi."RESET_ENDWALL_RECESSES" 
(
    BuildingNumber IN number
)
AS 
 ExtColRec1 number(10,5);
 ExtColRec2 number(10,5);
 ExtColRec3 number(10,5);
 ExtColRec4 number(10,5);
 Counts number;
 EndWallID1 number(10);
 EndWallID2 number(10);
 IsBothFrameTypeSame char(1);
 EW1FrameType varchar(50);
 EW2FrameType varchar(50);
 FirstGroupNumber NUMBER(10);
 LastGroupNumber NUMBER(10);
BEGIN
 begin
    select count(*) into Counts from "BFM_Groups" where  "BuildingNumber" = BuildingNumber;
   
                select min("EndWallID") into EndWallID1 from "Input_Endwalls_Recesses" 
                where "BuildingNo" = BuildingNumber and "IsDeleted" = 'N' and "EndWallID" != 0;
                select max("EndWallID") into EndWallID2 from "Input_Endwalls_Recesses" 
                where "BuildingNo" = BuildingNumber and "IsDeleted" = 'N' and "EndWallID" != 0;
                select "FrameType" into EW1FrameType from "Input_Endwall" where "BuildingNo" = BuildingNumber and "EndWallNo" =1;
                select "FrameType" into EW2FrameType from "Input_Endwall" where "BuildingNo" = BuildingNumber and "EndWallNo" =2;
            if EW1FrameType like '%Expandable%' then
                    select "GroupNumber" into FirstGroupNumber from "BFM_FrameLines" where  "BuildingNumber" = BuildingNumber and "FrameLineNumber" =1 and rownum =1;
            end if;
            if EW2FrameType like '%Expandable%' then
                    select "GroupNumber" into LastGroupNumber from "BFM_FrameLines" 
                    where  "BuildingNumber" = BuildingNumber and 
                    "FrameLineNumber" =(select max("FrameLineNumber") from "BFM_FrameLines" where  "BuildingNumber" = BuildingNumber );
            end if; 
            dbms_output.put_line(' Count: ' || Counts ||' EndWallID1: ' || EndWallID1||' EndWallID2: ' || EndWallID2 
                 || ' EW1FrameType: ' || EW1FrameType || ' EW2FrameType: ' || EW2FrameType
                 || ' FirstGroupNumber: ' || FirstGroupNumber || ' LastGroupNumber: ' || LastGroupNumber);
     exception
    when NO_DATA_FOUND THEN
    Counts := 0;
 end;
   
            if Counts != 0 then
                if Counts = 1 then
                    dbms_output.put_line(' when Count is one ' || Counts);
                    select "ExtColRecession1","ExtColRecession2" into ExtColRec1,ExtColRec2 from "BFM_Groups" where  "BuildingNumber" = BuildingNumber and rownum =1;
                    dbms_output.put_line(' ExtColRec1 ' || ExtColRec1 ||' ExtColRec2: ' || ExtColRec2);
                    
                    --for ew1
                     UPDATE "Input_Endwalls_Recesses" SET 
                        "Recesses" = to_char(ExtColRec2) where "BuildingNo" = BuildingNumber and "IsFrameColumn" = 1 and "EndWallID" = EndWallID1 and "RecessNo" = 1;
                     UPDATE "Input_Endwalls_Recesses" SET 
                        "Recesses" = to_char(ExtColRec1) where "BuildingNo" = BuildingNumber and "IsFrameColumn" = 1 and "EndWallID" = EndWallID1 and "RecessNo" != 1;
                     commit;
                     --for ew2
                     UPDATE "Input_Endwalls_Recesses" SET 
                        "Recesses" = to_char(ExtColRec1) where "BuildingNo" = BuildingNumber and "IsFrameColumn" = 1 and "EndWallID" = EndWallID2 and "RecessNo" = 1;
                     UPDATE "Input_Endwalls_Recesses" SET 
                        "Recesses" = to_char(ExtColRec2) where "BuildingNo" = BuildingNumber and "IsFrameColumn" = 1 and "EndWallID" = EndWallID2 and "RecessNo" != 1;
                     commit;
                else
                    dbms_output.put_line(' when Count is grater than 1 -- Count is now' || Counts);
                    if FirstGroupNumber is not null and  LastGroupNumber is not null then
                        dbms_output.put_line(' Both group are not null ' || ' FirstGroupNumber: ' || FirstGroupNumber || ' LastGroupNumber: ' || LastGroupNumber);
                        
                        if FirstGroupNumber = LastGroupNumber then
                            dbms_output.put_line(' Both group are equal ' || ' FirstGroupNumber: ' || FirstGroupNumber || ' LastGroupNumber: ' || LastGroupNumber);
                        select "ExtColRecession1","ExtColRecession2" into ExtColRec1,ExtColRec2 from "BFM_Groups" where  "BuildingNumber" = BuildingNumber and "GroupNumber" = FirstGroupNumber;
                             --for ew1
                             UPDATE "Input_Endwalls_Recesses" SET 
                                "Recesses" = to_char(ExtColRec2) where "BuildingNo" = BuildingNumber and "IsFrameColumn" = 1 and "EndWallID" = EndWallID1 and "RecessNo" = 1;
                             UPDATE "Input_Endwalls_Recesses" SET 
                                "Recesses" = to_char(ExtColRec1) where "BuildingNo" = BuildingNumber and "IsFrameColumn" = 1 and "EndWallID" = EndWallID1 and "RecessNo" != 1;
                             commit;
                             --for ew2
                             UPDATE "Input_Endwalls_Recesses" SET 
                                "Recesses" = to_char(ExtColRec1) where "BuildingNo" = BuildingNumber and "IsFrameColumn" = 1 and "EndWallID" = EndWallID2 and "RecessNo" = 1;
                             UPDATE "Input_Endwalls_Recesses" SET 
                                "Recesses" = to_char(ExtColRec2) where "BuildingNo" = BuildingNumber and "IsFrameColumn" = 1 and "EndWallID" = EndWallID2 and "RecessNo" != 1;
                             commit;
                        else
                            dbms_output.put_line(' Both group are not equal ' || ' FirstGroupNumber: ' || FirstGroupNumber || ' LastGroupNumber: ' || LastGroupNumber);
                            select "ExtColRecession1","ExtColRecession2" into ExtColRec1,ExtColRec2 from "BFM_Groups" where  "BuildingNumber" = BuildingNumber and "GroupNumber" = FirstGroupNumber; 
                            dbms_output.put_line(' For First Group Value ' || ' ExtColRec1: ' || ExtColRec1 || ' ExtColRec2: ' || ExtColRec2);
                            select "ExtColRecession1","ExtColRecession2" into ExtColRec3,ExtColRec4 from "BFM_Groups" where  "BuildingNumber" = BuildingNumber and "GroupNumber" = LastGroupNumber;
                            dbms_output.put_line(' For Last Group Value ' || ' ExtColRec3: ' || ExtColRec3 || ' ExtColRec4: ' || ExtColRec4);
                        
                             --for ew1
                             UPDATE "Input_Endwalls_Recesses" SET 
                                "Recesses" = to_char(ExtColRec2) where "BuildingNo" = BuildingNumber and "IsFrameColumn" = 1 and "EndWallID" = EndWallID1 and "RecessNo" = 1;
                             UPDATE "Input_Endwalls_Recesses" SET 
                                "Recesses" = to_char(ExtColRec1) where "BuildingNo" = BuildingNumber and "IsFrameColumn" = 1 and "EndWallID" = EndWallID1 and "RecessNo" != 1;
                            commit;
                             --for ew2
                             UPDATE "Input_Endwalls_Recesses" SET 
                                "Recesses" = to_char(ExtColRec3) where "BuildingNo" = BuildingNumber and "IsFrameColumn" = 1 and "EndWallID" = EndWallID2 and "RecessNo" = 1;
                             UPDATE "Input_Endwalls_Recesses" SET 
                                "Recesses" = to_char(ExtColRec4) where "BuildingNo" = BuildingNumber and "IsFrameColumn" = 1 and "EndWallID" = EndWallID2 and "RecessNo" != 1;
                             commit;
                       end if;
                    end if;
                    
                    if FirstGroupNumber is not null and LastGroupNumber is null then
                        select "ExtColRecession1","ExtColRecession2" into ExtColRec1,ExtColRec2 from "BFM_Groups" where  "BuildingNumber" = BuildingNumber and "GroupNumber" = FirstGroupNumber; 
                        dbms_output.put_line(' FirstGroupNumber is not null and LastGroupNumber is null ' || ' FirstGroupNumber: ' || FirstGroupNumber || ' LastGroupNumber: ' || LastGroupNumber
                        || ' ExtColRec1: ' || ExtColRec1 || ' ExtColRec2: ' || ExtColRec2
                        );  
                            --for ew1
                             UPDATE "Input_Endwalls_Recesses" SET 
                                "Recesses" = to_char(ExtColRec2) where "BuildingNo" = BuildingNumber and "IsFrameColumn" = 1 and "EndWallID" = EndWallID1 and "RecessNo" = 1;
                             UPDATE "Input_Endwalls_Recesses" SET 
                                "Recesses" = to_char(ExtColRec1) where "BuildingNo" = BuildingNumber and "IsFrameColumn" = 1 and "EndWallID" = EndWallID1 and "RecessNo" != 1;
                            commit;                 
                    end if;
                    
                    if LastGroupNumber is not null and FirstGroupNumber is null then
                    select "ExtColRecession1","ExtColRecession2" into ExtColRec3,ExtColRec4 from "BFM_Groups" where  "BuildingNumber" = BuildingNumber and "GroupNumber" = LastGroupNumber;
                    dbms_output.put_line(' LastGroupNumber is not null and FirstGroupNumber is null ' || ' FirstGroupNumber: ' || FirstGroupNumber || ' LastGroupNumber: ' || LastGroupNumber
                        || ' ExtColRec3: ' || ExtColRec3 || ' ExtColRec4: ' || ExtColRec4
                        ); 
                     --for ew2
                     UPDATE "Input_Endwalls_Recesses" SET 
                        "Recesses" = to_char(ExtColRec3) where "BuildingNo" = BuildingNumber and "IsFrameColumn" = 1 and "EndWallID" = EndWallID2 and "RecessNo" = 1;
                     UPDATE "Input_Endwalls_Recesses" SET 
                        "Recesses" = to_char(ExtColRec4) where "BuildingNo" = BuildingNumber and "IsFrameColumn" = 1 and "EndWallID" = EndWallID2 and "RecessNo" != 1;
                     commit;
                    end if;
                
                
                end if;
               
            end if;
END Reset_Endwall_Recesses;
/