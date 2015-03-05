USE [sandbox]
GO

/****** Object:  UserDefinedFunction [tools].[daterange]    Script Date: 3/6/2015 12:06:52 AM ******/
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
	SELECT DATEADD(DAY, ints.i, @start) as [date]
	FROM tools.intrange(0) as ints
)

GO

