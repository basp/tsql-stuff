USE [sandbox]
GO

/****** Object:  UserDefinedFunction [tools].[timerange]    Script Date: 3/6/2015 1:06:19 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [tools].[timerange]
(	
	@start datetime2,
	@interval varchar(8) = 'minute',
	@scale tinyint = 1
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT 
		CASE @interval
			WHEN 'hour' THEN DATEADD(HOUR, ints.i * @scale, @start)
			WHEN 'minute' THEN DATEADD(MINUTE, ints.i * @scale, @start)
			WHEN 'second' THEN DATEADD(SECOND, ints.i * @scale, @start) 
		END AS [start_time]
	FROM tools.intrange(0) AS ints
)


GO

