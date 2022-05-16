CREATE OR REPLACE PROCEDURE abs_mdi."GETPROJECTSBYUSERID" (
    UserId       IN   VARCHAR2,
    Output_Data  OUT  SYS_REFCURSOR
) AS
BEGIN
    OPEN Output_Data FOR SELECT
                             "ProjectId",
                             "ProjectName",
                             "CompanyName",
                             "UserId",
                             p."IsDelete"
                         FROM
                                  "Project" p
                             INNER JOIN "Company" c ON c."CompanyId" = p."CompanyId"
                         WHERE
                             "UserId" IN (
                                 SELECT
                                     regexp_substr(UserId, '[^,]+', 1, level)
                                 FROM
                                     dual
                                 CONNECT BY
                                     regexp_substr(UserId, '[^,]+', 1, level) IS NOT NULL
                             )
                         ORDER BY
                             P."CompanyId",
                             "UserId";
END GetProjectsByUserId;
/