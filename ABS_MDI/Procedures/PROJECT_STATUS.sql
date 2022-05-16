CREATE OR REPLACE PROCEDURE abs_mdi."PROJECT_STATUS" (
    ProjectId   IN  NUMBER,
    ColumnName  IN  VARCHAR2,
    Status      IN  VARCHAR2
) AS
BEGIN
    IF ColumnName = 'Archive' THEN
        BEGIN
            UPDATE "Project"
            SET
                "IsArchive" = 'Y'
            WHERE
                "ProjectId" = ProjectId;
        END;
    END IF;
    IF ColumnName = 'UnArchive' THEN
        BEGIN
            UPDATE "Project"
            SET
                "IsArchive" = 'N'
            WHERE
                "ProjectId" = ProjectId;
        END;
    END IF;
    IF ColumnName = 'ProjectStage' THEN
        BEGIN
            IF Status = 'ExportToOE' THEN
                BEGIN
                    UPDATE "Project"
                    SET
                        "ExportedToOEDate" = TO_DATE(CAST(sysdate AS DATE), 'DD-MM-YYYY')
                    WHERE
                        "ProjectId" = ProjectId;
                END;
            ELSE
                BEGIN
                    IF Status = 'In progress' then
                        UPDATE "Project"
                        SET
                            "ProjectStage" = Status,
                            "ExpiryDate" = null,
                            "Price" = null
                        WHERE
                            "ProjectId" = ProjectId;
                        /*UPDATE "Shipping"
                        SET
                            "RequestedDeliveryDate" = null
                        WHERE
                            "ProjectId" = ProjectId;*/                            
                    else
                        UPDATE "Project"
                        SET
                            "ProjectStage" = Status
                        WHERE
                            "ProjectId" = ProjectId;
                    end if;
                END;
            END IF;
        END;
    END IF;
END Project_Status;
/