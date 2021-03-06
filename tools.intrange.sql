USE [sandbox]
GO

/****** Object:  UserDefinedFunction [tools].[intrange]    Script Date: 3/6/2015 1:05:14 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [tools].[intrange]
(	
	@from int
)
RETURNS TABLE 
AS
RETURN 
(
	WITH digits AS (
		SELECT i
		FROM (
			VALUES (0), (1), (2), (3), (4), (5), (6), (7), (8), (9)
		) AS digits (i)
	),
	integers (i) AS (
		SELECT @from + (
			d1.i + 
			(10 * d2.i) + 
			(100 * d3.i) + 
			(1000 * d4.i) +
			(10000 * d5.i)
		)
		FROM digits AS d1
		CROSS JOIN digits AS d2
		CROSS JOIN digits AS d3
		CROSS JOIN digits AS d4
		CROSS JOIN digits AS d5
	)
	SELECT i
	FROM integers
)

GO

