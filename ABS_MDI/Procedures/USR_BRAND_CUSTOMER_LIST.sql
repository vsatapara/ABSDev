CREATE OR REPLACE PROCEDURE abs_mdi."USR_BRAND_CUSTOMER_LIST" (
    CompanyId  IN   NUMBER,
    UserId     IN   VARCHAR2,
    CustomerNo IN   NUMBER default 0,
    Out_Data   OUT  SYS_REFCURSOR
) IS
    UserDetailId  NUMBER;
    TotalCount    NUMBER;
BEGIN
    SELECT
        COUNT(*)
    INTO TotalCount
    FROM
        "USR_UserDetail"
    WHERE
        "UserId" = UserId
        AND "IsDelete" = 'N';
    IF TotalCount != 0 THEN
        BEGIN
            SELECT
                "UserDetailId"
            INTO UserDetailId
            FROM
                "USR_UserDetail"
            WHERE
                    "UserId" = UserId
                AND ROWNUM = 1
                AND "IsDelete" = 'N';
        END;
    ELSE
        BEGIN
            UserDetailId := 0;
        END;
    END IF;
    OPEN Out_Data FOR SELECT
                 "CustomerID",
                 "CustomerNo",
                 "CustomerName",
                 (
                     SELECT
                         COUNT(*)
                     FROM
                         "USR_Brand_Customer"
                     WHERE
                             "BrandId" = CompanyId
                         AND "UserDetailId" = UserDetailId
                         AND "CustomerId" = C."CustomerID"
                 ) AS RecordCount
             FROM
                 "Customer" C
             WHERE
                     C."CompanyId" = CompanyId
                 AND C."IsDelete" = 'N'
                 AND (CustomerNo = 0 and 1=1) or (CustomerNo != 0 and C."CustomerNo" = CustomerNo)
             ORDER BY
                 "CustomerName";
END USR_BRAND_CUSTOMER_LIST;
/