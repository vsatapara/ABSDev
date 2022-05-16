CREATE OR REPLACE PROCEDURE abs_mdi."COMPONENTS_GETBYPROJECTID" 
(
    ProjectId     IN   NUMBER,
    OUTPUT_TABLE  OUT  SYS_REFCURSOR
) 
AS
BEGIN
    OPEN OUTPUT_TABLE FOR SELECT
                              "ComponentsId" AS Id,
                              "ProjectId",
                              "ProductID",
                              "BasePart",
                              "Quantity",
                              "UnitOfMeasure",
                              "Description",
                              "Length",
                              "Width1",
                              "Width2",
                              "Gauge",
                              "ColorCode",
                              "PunchCode",
                              "BevelCode",
                              "Handed",
                              "RoofSlope",
                              "PartCategory",
                              "ItemCategory",
                              "RawMaterialCode",
                              "TotalWeight",
                              "TotalListPrice",
                              "TotalNetPrice",
                              "AnidType",
                              "Slope",
                              "Buyout",
                              "HideWeightPrice"
                          FROM
                              "EDSPrice_IO_Components"
                          WHERE
                                  "ProjectId" = ProjectId
                              AND "IsDeleted" != 'Y';
END;
/