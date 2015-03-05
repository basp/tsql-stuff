USE [sandbox]
GO

/****** Object:  UserDefinedFunction [tools].[calrange]    Script Date: 3/5/2015 11:34:30 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [tools].[calrange]
(	
	@start date
)
RETURNS TABLE 
AS
RETURN 
(
	WITH dates (d) AS (
		SELECT DATEADD(DAY, i, @start)
		FROM tools.intrange(0)
	)
	SELECT
		d AS [date],
		DATEPART(YEAR, d) AS [year],
		DATEPART(MONTH, d) AS [month],
		DATEPART(DAY, d) AS [day],
		DATEPART(WEEK, d) AS [week],
		DATEPART(ISO_WEEK, d) AS [iso_week],
		DATEPART(WEEKDAY, d) AS [weekday],
		DATEPART(DAYOFYEAR, d) AS [dayofyear],
		DATEPART(QUARTER, d) AS [quarter]
	FROM dates
)



GO

