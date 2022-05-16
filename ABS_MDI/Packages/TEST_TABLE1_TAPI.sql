CREATE OR REPLACE PACKAGE abs_mdi."TEST_TABLE1_TAPI" 
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
);
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
);
-- delete
procedure del (
p_UserId in "TEST_TABLE1"."UserId"%type

);

-- read by ID
procedure ReadByid (
p_UserId in "TEST_TABLE1"."UserId"%type,
output_empdata         OUT  SYS_REFCURSOR
);

-- read All
procedure ReadAll (
output_allempdata   OUT  SYS_REFCURSOR
);

end TEST_TABLE1_tapi;
/