CREATE OR REPLACE PROCEDURE abs_mdi."TESTTABLE_UPDATE" 
(
    UserId IN NUMBER, 
    Firstname IN VARCHAR2,
    Lastname IN VARCHAR2, 
    Age IN NUMBER, 
    Salary IN NUMBER,
    CompanyLogoName IN NVARCHAR2 DEFAULT NULL,
    CompanyLogoPath IN NVARCHAR2 DEFAULT NULL,
    UserImageName IN NVARCHAR2 DEFAULT NULL,
    UserImagePath IN NVARCHAR2 DEFAULT NULL
)
AS
CompanyLogoId NUMBER;
UserImageId NUMBER;
BEGIN
    IF CompanyLogoName IS NOT NULL THEN
         SELECT "CompanyLogo" 
         INTO CompanyLogoId 
         FROM "Test_Table" 
         WHERE "UserId"=UserId;
        
        IF CompanyLogoId IS NOT NULL THEN
            UPDATE "Attachment" SET
                "IsDelete"='Y',
                "AttachedDate"=CURRENT_TIMESTAMP
            WHERE "AttachmentId"=CompanyLogoId;
        END IF;
        
        INSERT INTO "Attachment"("AttachmentType","AttachmentName","AttachmentPath","IsDelete","AttachedDate")
        VALUES('Image',CompanyLogoName,CompanyLogoPath,'N',CURRENT_TIMESTAMP)
        RETURNING "AttachmentId" into CompanyLogoId;
    END IF;
    IF UserImageName IS NOT NULL THEN
         SELECT "UserImage" 
         INTO UserImageId 
         FROM "Test_Table" 
         WHERE "UserId"=UserId;
        
        IF UserImageId IS NOT NULL THEN
            UPDATE "Attachment" SET
                "IsDelete"='Y',
                "AttachedDate"=CURRENT_TIMESTAMP
            WHERE "AttachmentId"=UserImageId;
        END IF;
            
        INSERT INTO "Attachment"("AttachmentType","AttachmentName","AttachmentPath","IsDelete","AttachedDate")
        VALUES('Image',UserImageName,UserImagePath,'N',CURRENT_TIMESTAMP)
        RETURNING "AttachmentId" into UserImageId;
    END IF;
    
   UPDATE "Test_Table" 
   SET
    "Firstname"=Firstname,
    "Lastname"=Lastname,
    "Age"=Age,
    "Salary"=Salary,
    "CompanyLogo" = CompanyLogoId,
    "UserImage" = UserImageId
   WHERE "UserId"=UserId ;
END TestTable_Update;
/