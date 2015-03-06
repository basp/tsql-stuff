USE [sandbox]
GO

/****** Object:  UserDefinedFunction [tools].[daterange]    Script Date: 3/6/2015 1:04:59 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [tools].[daterange]
(	
	@start date
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT DATEADD(DAY, ints.i, @start) AS [date]
	FROM tools.intrange(0) AS ints
)

GO

