CREATE FUNCTION [dbo].[BreakStringIntoRows] (@CommadelimitedString   varchar(1000))
RETURNS   @Result TABLE (Column1   VARCHAR(100))
AS
BEGIN
        DECLARE @IntLocation INT
        WHILE (CHARINDEX(',',    @CommadelimitedString, 0) > 0)
        BEGIN
              SET @IntLocation =   CHARINDEX(',',    @CommadelimitedString, 0)      
              INSERT INTO   @Result (Column1)
              --LTRIM and RTRIM to ensure blank spaces are   removed
              SELECT RTRIM(LTRIM(SUBSTRING(@CommadelimitedString,   0, @IntLocation)))   
              SET @CommadelimitedString = STUFF(@CommadelimitedString,   1, @IntLocation,   '') 
        END
        INSERT INTO   @Result (Column1)
        SELECT RTRIM(LTRIM(@CommadelimitedString))--LTRIM and RTRIM to ensure blank spaces are removed
        RETURN 
END
GO


