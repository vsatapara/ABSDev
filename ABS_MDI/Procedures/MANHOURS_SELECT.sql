CREATE OR REPLACE PROCEDURE abs_mdi."MANHOURS_SELECT" 
(
    ProjectId IN  NUMBER,
    ManHours_Data OUT  SYS_REFCURSOR
)
AS
TotalCount number;
BEGIN
    select count(*) into TotalCount from "Project_Hours" where "ProjectId"=ProjectId;
     
    if TotalCount != 0 then
    begin
       /* OPEN ManHours_Data FOR 
        SELECT
            "Index","Process","Labor","Range1","Range2","Range3","Range4","Range5",
            "Range6","Range7","Range8","Unit","Hours1","Hours2","Hours3","Hours4",
            "Hours5","Hours6","Hours7","Hours8","LinkWith"   
            FROM "M_EDSPrice_Hours"
        UNION
         SELECT
           "Index","Process","Labor","Range1","Range2","Range3","Range4","Range5",
            "Range6","Range7","Range8","Unit","Hours1","Hours2","Hours3","Hours4",
            "Hours5","Hours6","Hours7","Hours8","LinkWith"
            FROM "Project_Hours"
            where "ProjectId" = ProjectId;*/
            
        OPEN ManHours_Data FOR    
        SELECT
        "Index","Process","Labor","Range1","Range2","Range3","Range4","Range5",
        "Range6","Range7","Range8","Unit","Hours1","Hours2","Hours3","Hours4",
        "Hours5","Hours6","Hours7","Hours8","LinkWith"
        FROM "Project_Hours"
        where "ProjectId" = ProjectId
        union
        SELECT
        "Index","Process","Labor","Range1","Range2","Range3","Range4","Range5",
        "Range6","Range7","Range8","Unit","Hours1","Hours2","Hours3","Hours4",
        "Hours5","Hours6","Hours7","Hours8","LinkWith"
        FROM "M_EDSPrice_Hours"
        WHERE "Process" NOT IN(SELECT "Process" FROM "Project_Hours" where "ProjectId" = ProjectId);            
            
    end;
    else
    begin
        OPEN ManHours_Data FOR 
        SELECT
            "Index","Process","Labor","Range1","Range2","Range3","Range4","Range5",
            "Range6","Range7","Range8","Unit","Hours1","Hours2","Hours3","Hours4",
            "Hours5","Hours6","Hours7","Hours8","LinkWith"   
            FROM "M_EDSPrice_Hours";
    end;
    end if;
END ManHours_Select;
/