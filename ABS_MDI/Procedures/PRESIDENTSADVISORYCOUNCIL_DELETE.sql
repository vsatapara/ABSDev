CREATE OR REPLACE PROCEDURE abs_mdi."PRESIDENTSADVISORYCOUNCIL_DELETE" 
(
PresidentsAdvisoryCouncilId IN NUMBER,
UserId IN NUMBER
)
AS 
BEGIN
      UPDATE "PresidentsAdvisoryCouncil" SET
        "IsDelete"='Y',
        "ModifiedBy"=UserId,
        "ModifiedDate"=CURRENT_TIMESTAMP
      WHERE "PresidentsAdvisoryCouncilId"=PresidentsAdvisoryCouncilId;
END PRESIDENTSADVISORYCOUNCIL_DELETE;
/