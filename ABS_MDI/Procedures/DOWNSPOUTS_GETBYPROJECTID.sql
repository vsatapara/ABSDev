CREATE OR REPLACE PROCEDURE abs_mdi."DOWNSPOUTS_GETBYPROJECTID" 
(
    ProjectId IN NUMBER,
    OUTPUT_TABLE OUT  SYS_REFCURSOR
)
AS
BEGIN
OPEN OUTPUT_TABLE FOR SELECT
    "DownspoutsId" as "Id",
    "BuildingNumber",
    "Quantity",
    "Elevation",
    "BayNumber",
    "DistFromLeftCorner",
    "DistFromLeftCol",
    "Length",
    "Color",
    "Type",
    "Elbows",
    "Drainage",
    "IsBuyout",
    "Weight",
    "Price",
    "IsPriced",
    "ErrorCode",
    "Thimbles",
    "ProjectId"
FROM
    "EDSPrice_IO_Downspouts"
    WHERE "ProjectId"=ProjectId AND "IsDeleted" != 'Y';
END;
/