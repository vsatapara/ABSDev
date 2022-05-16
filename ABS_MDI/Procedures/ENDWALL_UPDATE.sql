CREATE OR REPLACE PROCEDURE abs_mdi."ENDWALL_UPDATE" 
(
ElevationType IN VARCHAR,
EndWallNo IN Number,
FrameType IN VARCHAR,
ColumnSpacingType IN VARCHAR,
NonStandardSetback IN VARCHAR,
DesignedSetback IN NUMBER,
SpecifiedSetback IN VARCHAR,
InsulationTrim IN VARCHAR,
GableFlash IN NUMBER,
UserId IN NUMBER,
IpAddress IN VARCHAR,
EndWallID IN NUMBER,
BayCount IN NUMBER
)
AS 
 ParentBuildingId number(5);
 BuildingNumber number(10);
BEGIN
    UPDATE "Input_Endwall" SET 
    "ElevationType" = ElevationType,
     "EndWallNo" = EndWallNo,
     "FrameType" = FrameType,
     "ModifiedBy" = UserId,
     "ModifiedDate" = CURRENT_TIMESTAMP,
     "IpAddress" = IpAddress,
     "ColumnSpacingType"=ColumnSpacingType,
     "NonStandardSetback"=NonStandardSetback,
     "DesignedSetback"=DesignedSetback,
     "SpecifiedSetback"=SpecifiedSetback,
     "GableFlash" = GableFlash,
     "InsulationTrim"=InsulationTrim,
     "BayCount" = BayCount,
     "IsDeleted" = 'N'     
    WHERE "EndWallID" = EndWallID;
    
    begin
    select "BuildingNo" into BuildingNumber from "Input_Endwall" where "EndWallID" =EndWallID;
    select "ParentBuildingId" into ParentBuildingId from "BuildingInformation" 
        where "BuildingInformationId" = BuildingNumber
            and "IsDelete" = 'N' and "FrameType" = 'Lean-to';
    exception
        WHEN NO_DATA_FOUND THEN
        ParentBuildingId:=0;
    end;
    if ParentBuildingId !=0 then
        update "Input_Endwall" 
            set "NonStandardSetback" = NonStandardSetback,"SpecifiedSetback"=SpecifiedSetback
            where "BuildingNo" = (select "BuildingInformationId" from "BuildingInformation" where "ParentBuildingId" = BuildingNumber and "IsDelete" = 'N' and rownum =1) and "EndWallNo" = EndWallNo and "IsDeleted" = 'N';
    end if;
END ENDWALL_UPDATE;
/