USE [sandbox]
GO

/****** Object:  UserDefinedFunction [tools].[strsplit]    Script Date: 3/5/2015 11:30:24 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [tools].[strsplit]
(
	@s nvarchar(max),
	@sep nchar(1)
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT SUBSTRING(
		@sep + @s + @sep, 
		i + 1,
		CHARINDEX(@sep, @sep + @s + @sep, i + 1) - i - 1) as tok
	FROM tools.intrange(1)
	WHERE i < LEN(@s) - 1
	AND SUBSTRING(@sep + @s + @sep, i, 1) = @sep
)

GO

