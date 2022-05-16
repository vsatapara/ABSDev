CREATE OR REPLACE PROCEDURE abs_mdi."COUNTRY_LIST" 
(
    Output_Data OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN Output_Data FOR 
    select 
        "CountryId",
        "Name"
    from 
    "Countries";
END COUNTRY_LIST;
/