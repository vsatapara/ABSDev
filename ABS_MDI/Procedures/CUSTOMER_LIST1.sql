CREATE OR REPLACE PROCEDURE abs_mdi."CUSTOMER_LIST1" 
(
    CompanyId IN  NUMBER,
    SortingCol IN VARCHAR2,
    SortingOrder IN VARCHAR2,
    StartRow IN NUMBER,
    LastRow IN NUMBER,    
    Out_Data OUT SYS_REFCURSOR
)
IS 
str  VARCHAR2(2000);
strOrder  VARCHAR2(200);
v_count NUMBER(30);
BEGIN
    execute immediate 'SELECT count(*) FROM "Customer" C  where C."IsDelete" = ''N'' and C."CompanyId" = ' || CompanyId
    into v_count;
    IF SortingCol = 'Text' THEN
      strOrder:='dbms_lob.substr("Text",4000)';
    ELSE
        strOrder:='"'||SortingCol || '"' ;
    END IF;
    str :='SELECT * FROM 
    (
        SELECT '||v_count||' "count",ROWNUM RNO,tbl.* FROM
        (
            SELECT 
                "CustomerID",
                "CustomerNo",
                "CustomerName",
                "IsDefault" as "IsDefaultCustomer",
                C."IsActive",
                "IsPrivateLabelBuilder",
                "EnforceSignatureRule",
                (select "UserDetailId" from "USR_UserDetail" where "CustomerNo" = cast(C."CustomerNo" as number) and "IsCustomerAdmin"=''Y'' and rownum=1 and "IsDelete"=''N'') as "UserDetailId"
            FROM "Customer" C
            WHERE  C."IsDelete" = ''N'' and C."CompanyId" = '|| CompanyId ||'
            ORDER BY ' || strOrder || ' ' || SortingOrder || '
        )tbl
    )WHERE RNO BETWEEN '|| StartRow || ' AND ' || LastRow ;
    dbms_output.put_line(str);
    --dbms_output.put_line(v_count);
    OPEN Out_Data FOR str;   
END Customer_List1;
/