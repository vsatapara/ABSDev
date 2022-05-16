CREATE OR REPLACE PROCEDURE abs_mdi."NETADDLINEHEADERLIST" (
    NetAddLineHeader_Data OUT  SYS_REFCURSOR
)AS
BEGIN
    OPEN NetAddLineHeader_Data FOR SELECT
                                    "Id",
                                    "Name",
                                    "Enum"
                                FROM
                                    "M_NetAddlineHeader"
                                ORDER BY "Id";
END NetAddLineHeaderList;
/