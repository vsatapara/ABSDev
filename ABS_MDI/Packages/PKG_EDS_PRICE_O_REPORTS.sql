CREATE OR REPLACE PACKAGE abs_mdi."PKG_EDS_PRICE_O_REPORTS" AS

    
    procedure deletetbl (
        p_O_ReportsId in "EDS_Price_O_Reports"."O_ReportsId"%Type
    );
END pkg_EDS_Price_O_Reports;
/