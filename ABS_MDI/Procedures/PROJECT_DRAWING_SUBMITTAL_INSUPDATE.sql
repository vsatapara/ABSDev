CREATE OR REPLACE PROCEDURE abs_mdi."PROJECT_DRAWING_SUBMITTAL_INSUPDATE" 
(
    ProjectId                   IN  NUMBER,
    DrawingSubmittaleId         IN  NUMBER,
    DescriptionDtl              IN  VARCHAR2,  
    Quantity                    IN  NUMBER,
    UserId                      IN  NUMBER
) 
IS
TotalCount number;
BEGIN
    select count(*) into TotalCount from "Drawing_SubmittalPackage" where "ProjectId"=ProjectId and "Description" = DescriptionDtl and "IsDelete"='N';
    if TotalCount != 0 then
    begin
        update "Drawing_SubmittalPackage" set "Quantity"=Quantity where  "ProjectId"=ProjectId and  "Description" = DescriptionDtl and "IsDelete"='N';
    end;
    else
    begin
        INSERT INTO "Drawing_SubmittalPackage"
        (
        "Description",
        "Quantity",   
        "ProjectId",
        "CreatedDate",
        "CreatedBy",
        "IsDelete"
        )
        values
        (
        DescriptionDtl,
        Quantity,
        ProjectId,
        CURRENT_TIMESTAMP,
        UserId,
        'N'
        );
    end;
    end if;
END PROJECT_DRAWING_Submittal_INSUPDATE;
/