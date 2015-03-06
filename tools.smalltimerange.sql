USE [sandbox]
GO

/****** Object:  UserDefinedFunction [tools].[smalltimerange]    Script Date: 3/6/2015 1:05:40 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [tools].[smalltimerange]
(	
	@from datetime2,
	@to datetime2
)
RETURNS TABLE 
AS
RETURN 
(
	WITH [periods] AS (
		SELECT @from AS [start_time]
		UNION ALL
		SELECT DATEADD(MINUTE, 1, [start_time]) AS [start_time]
		FROM [periods]
		WHERE DATEADD(MINUTE, 1, [start_time]) < @to
	)
	SELECT * FROM [periods]
)

GO

