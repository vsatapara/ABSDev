CREATE OR REPLACE PROCEDURE abs_mdi."PROJECTREASSIGNMENT_LIST" 
(
CompanyId IN number,
Output_Data OUT SYS_REFCURSOR 
)
AS
BEGIN
  OPEN Output_Data FOR
    SELECT
          P."ProjectId",
          P."UserId" as "FromUserId",
          P."ProjectName",
          (
             SELECT
                 COUNT(*)
             FROM
                 "BuildingInformation" bt
             WHERE
                     bt."ProjectId" = P."ProjectId"
                 AND bt."IsDelete" = 'N'
          )    AS "BuildingsCount",
          P."Address1",
          T."ItemText" as "ProjectStatusId",
          to_char(P."ExpiryDate",'MM/DD/YYYY') "ExpiryDate",
          P."Price"
      FROM "Project" P
      left outer join  "TableOfTables" T on T."Id" =  p."ProjectStatusId" and "Category"='ProjectStatus'
      where P."IsActive" = 'Y' and p."IsDelete"='N' and p."CompanyId"=CompanyId;
END PROJECTREASSIGNMENT_LIST;
/