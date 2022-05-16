CREATE OR REPLACE PROCEDURE abs_mdi."IOERECTIONDATA_UPDATE" 
(
    ErectionDataId IN NUMBER,
    ProjectId IN NUMBER,
    ProjectNumber IN NUMBER,
    LaborDivision1PayScale IN NUMBER,
    LaborDivision2PayScale IN NUMBER,
    LaborDivision3PayScale IN NUMBER,
    LaborDivision4PayScale IN NUMBER,
    LaborDivision5PayScale IN NUMBER,
    LaborDivision1Hours IN NUMBER,
    LaborDivision2Hours IN NUMBER,
    LaborDivision3Hours IN NUMBER,
    LaborDivision4Hours IN NUMBER,
    LaborDivision5Hours IN NUMBER,
    LaborDivision1Total IN NUMBER,
    LaborDivision2Total IN NUMBER,
    LaborDivision3Total IN NUMBER,
    LaborDivision4Total IN NUMBER,
    LaborDivision5Total IN NUMBER,
    TravelExpenses IN NUMBER,
    Subsistence IN NUMBER,
    EquipmentRental IN NUMBER,
    OtherExpenses IN NUMBER,
    TotalManHours IN NUMBER,
    TotalExpense IN NUMBER,
    UserId IN NUMBER DEFAULT NULL,
    IpAddress IN VARCHAR2
)
AS 
BEGIN
     UPDATE "EDSPrice_IO_ErectionData"
	  SET
        "ProjectId" = ProjectId,
        "ProjectNumber" = ProjectNumber,
        "LaborDivision1PayScale" = LaborDivision1PayScale,
        "LaborDivision2PayScale" = LaborDivision2PayScale,
        "LaborDivision3PayScale" = LaborDivision3PayScale,
        "LaborDivision4PayScale" = LaborDivision4PayScale,
        "LaborDivision5PayScale" = LaborDivision5PayScale,
        "LaborDivision1Hours" = LaborDivision1Hours,
        "LaborDivision2Hours" = LaborDivision2Hours,
        "LaborDivision3Hours" = LaborDivision3Hours,
        "LaborDivision4Hours" = LaborDivision4Hours,
        "LaborDivision5Hours" = LaborDivision5Hours,
        "LaborDivision1Total" = LaborDivision1Total,
        "LaborDivision2Total" = LaborDivision2Total,
        "LaborDivision3Total" = LaborDivision3Total,
        "LaborDivision4Total" = LaborDivision4Total,
        "LaborDivision5Total" = LaborDivision5Total,
        "TravelExpenses" = TravelExpenses,
        "Subsistence" = Subsistence,
        "EquipmentRental" = EquipmentRental,
        "OtherExpenses" = OtherExpenses,
        "TotalManHours" = TotalManHours,
        "TotalExpense" = TotalExpense,
        "ModifiedBy" = UserId,
        "ModifiedDate" = CURRENT_TIMESTAMP,
        "IpAddress" = IpAddress
     WHERE
        "ErectionDataId" = ErectionDataId;

END IOErectionData_Update;
/