USE [sandbox]
GO

/****** Object:  UserDefinedFunction [tools].[datetimerange]    Script Date: 3/6/2015 1:38:47 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [tools].[datetimerange]
(	
	@start datetime2,
	@interval varchar(8) = 'day',
	@increment int = 1
)
RETURNS TABLE 
AS
RETURN 
(
	WITH [start_times] AS (
		SELECT 
			CASE @interval
				WHEN 'year' THEN DATEADD(YEAR, @increment * ints.i, @start)
				WHEN 'month' THEN DATEADD(MONTH, @increment * ints.i, @start)
				WHEN 'day' THEN DATEADD(DAY, @increment * ints.i, @start)
				WHEN 'hour' THEN DATEADD(HOUR, @increment * ints.i, @start)
				WHEN 'minute' THEN DATEADD(MINUTE, @increment * ints.i, @start)
				WHEN 'second' THEN DATEADD(SECOND, @increment * ints.i, @start)
			END AS [start]
		FROM tools.intrange(0) as ints
	),
	[intervals] AS (
		SELECT
			[start],
			CASE @interval
				WHEN 'year' THEN DATEADD(YEAR, @increment, [start])
				WHEN 'month' THEN DATEADD(MONTH, @increment, [start])
				WHEN 'day' THEN DATEADD(DAY, @increment, [start])
				WHEN 'hour' THEN DATEADD(HOUR, @increment, [start])
				WHEN 'minute' THEN DATEADD(MINUTE, @increment, [start])
				WHEN 'second' THEN DATEADD(SECOND, @increment, [start])
			END AS [end]
		FROM [start_times]
	)
	SELECT
		[start],
		[end],
		DATEDIFF(SECOND, [start], [end]) AS [duration]
	FROM [intervals]
)

GO

