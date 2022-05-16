CREATE OR REPLACE FUNCTION abs_mdi."FN_GET_COLORNAME" (
    ColorName    IN  VARCHAR2,
    ValsparCode  IN  VARCHAR2,
    SpecialName  IN  VARCHAR2
) RETURN VARCHAR2 AS
BEGIN
    IF ColorName = NULL THEN
        RETURN 'N/A';
    ELSIF ( ColorName = 'Special' ) THEN
        RETURN(ColorName
               || ' / '
               || SpecialName
               || ' / '
               || ValsparCode);
    ELSE
        RETURN ColorName;
    END IF;
END FN_GET_COLORNAME;
/