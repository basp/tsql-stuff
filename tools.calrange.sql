USE [sandbox]
GO

/****** Object:  UserDefinedFunction [tools].[calrange]    Script Date: 3/6/2015 1:04:52 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [tools].[calrange]
(	
	@start date = '1970-01-01'
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

