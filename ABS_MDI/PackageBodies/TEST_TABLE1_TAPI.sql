CREATE OR REPLACE PACKAGE BODY abs_mdi."TEST_TABLE1_TAPI" 
is
-- insert
procedure ins (
 p_Firstname in "TEST_TABLE1"."Firstname"%type
,p_CompanyLogo in "TEST_TABLE1"."CompanyLogo"%type default null 
,p_Salary in "TEST_TABLE1"."Salary"%type default null 
,p_UserImage in "TEST_TABLE1"."UserImage"%type default null 
,p_UserId in "TEST_TABLE1"."UserId"%type
,p_Lastname in "TEST_TABLE1"."Lastname"%type default null 
,p_IpAddress in "TEST_TABLE1"."IpAddress"%type default null 
,p_Age in "TEST_TABLE1"."Age"%type default null
,OutputId OUT NUMBER
) is
begin 
insert into "TEST_TABLE1"(
"Firstname"
,"CompanyLogo"
,"Salary"
,"UserImage"
,"UserId"
,"Lastname"
,"IpAddress"
,"Age"
) values (
p_Firstname
,p_CompanyLogo
,p_Salary
,p_UserImage
,p_UserId
,p_Lastname
,p_IpAddress
,p_Age
)
RETURNING "UserId" into OutputId;
end;

-- update
procedure upd (
p_Firstname in "TEST_TABLE1"."Firstname"%type
,p_CompanyLogo in "TEST_TABLE1"."CompanyLogo"%type default null 
,p_Salary in "TEST_TABLE1"."Salary"%type default null 
,p_UserImage in "TEST_TABLE1"."UserImage"%type default null 
,p_UserId in "TEST_TABLE1"."UserId"%type
,p_Lastname in "TEST_TABLE1"."Lastname"%type default null 
,p_IpAddress in "TEST_TABLE1"."IpAddress"%type default null 
,p_Age in "TEST_TABLE1"."Age"%type default null 
) is
begin
update "TEST_TABLE1" set
"Firstname" = p_Firstname
,"CompanyLogo" = p_CompanyLogo
,"Salary" = p_Salary
,"UserImage" = p_UserImage
,"Lastname" = p_Lastname
,"IpAddress" = p_IpAddress
,"Age" = p_Age
where "UserId" = p_UserId;
end;
-- del
procedure del (
p_UserId in "TEST_TABLE1"."UserId"%type
) is
begin
delete from "TEST_TABLE1"
where "UserId" = p_UserId;
end;


-- ReadByid
procedure ReadByid (
p_UserId in "TEST_TABLE1"."UserId"%type,
output_empdata OUT  SYS_REFCURSOR
) is
begin
OPEN output_empdata FOR 
SELECT  *  FROM "TEST_TABLE1" WHERE "UserId" = p_UserId;
END ReadByid;

-- ReadAll
procedure ReadAll (
output_allempdata OUT  SYS_REFCURSOR
) is
begin
OPEN output_allempdata FOR 
SELECT  *  FROM "TEST_TABLE1"; 
END ReadAll;

end TEST_TABLE1_tapi;
/