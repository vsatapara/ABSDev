CREATE OR REPLACE PROCEDURE abs_mdi."IMAGE_UPLOAD" 
(
    ImageName IN VARCHAR2, 
    StoreName IN VARCHAR2,
    ImageId OUT NUMBER
) AS 
BEGIN
  INSERT INTO "Images"
    (
        "ImageName",
        "StoreName"
    )
    VALUES
    (
        ImageName,
        StoreName
    )
    RETURNING "ImageId" into ImageId;
END Image_Upload;
/