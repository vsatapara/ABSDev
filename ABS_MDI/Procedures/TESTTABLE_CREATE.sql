CREATE OR REPLACE PROCEDURE abs_mdi."TESTTABLE_CREATE" 
(
    Firstname IN VARCHAR2,
    Lastname IN VARCHAR2, 
    Age IN NUMBER, 
    Salary IN NUMBER,
    CompanyLogoName IN NVARCHAR2 DEFAULT NULL,
    CompanyLogoPath IN NCLOB DEFAULT NULL,
    UserImageName IN NVARCHAR2 DEFAULT NULL,
    UserImagePath IN NCLOB DEFAULT NULL
) AS
CompanyLogoId NUMBER;
UserImageId NUMBER;
BEGIN
    IF CompanyLogoName IS NOT NULL THEN
        INSERT INTO "Attachment"("AttachmentType","AttachmentName","AttachmentPath","IsDelete","AttachedDate")
        VALUES('Image',CompanyLogoName,CompanyLogoPath,'N',CURRENT_TIMESTAMP)
        RETURNING "AttachmentId" into CompanyLogoId;
    END IF;
    IF UserImageName IS NOT NULL THEN
       INSERT INTO "Attachment"("AttachmentType","AttachmentName","AttachmentPath","IsDelete","AttachedDate")
        VALUES('Image',UserImageName,UserImagePath,'N',CURRENT_TIMESTAMP)
        RETURNING "AttachmentId" into UserImageId;
    END IF;
   
    
    INSERT INTO "Test_Table"
    (
        "Firstname",
        "Lastname",
        "Age",
        "Salary",
        "CompanyLogo",
        "UserImage"
    )
    VALUES
    (
        Firstname,
        Lastname,
        Age,
        Salary,
        CompanyLogoId,
        UserImageId
    );
END TestTable_Create;
/