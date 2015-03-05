USE [sandbox]
GO

/****** Object:  UserDefinedFunction [tools].[smalldaterange]    Script Date: 3/6/2015 12:07:01 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [tools].[smalldaterange] 
(	
	@from date,
	@to date
)
RETURNS TABLE 
AS
RETURN 
(
	WITH [dates] AS (
		SELECT @from AS [date]
		UNION ALL
		SELECT DATEADD(DAY, 1, t.[date]) AS [date]
		FROM [dates] AS t
		WHERE DATEADD(DAY, 1, t.[date]) < @to
	)
	SELECT * FROM [dates]
)

GO

