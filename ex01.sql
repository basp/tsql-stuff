DECLARE @start DATE
DECLARE @end DATE

SET @start = '2013-01-01'
SET @end = '2015-02-15';

WITH [tuesdays] AS (
	SELECT 
		ROW_NUMBER() OVER(
			PARTITION BY [year], [month] 
			ORDER BY [day]
		) AS [num],
		d.*
	FROM tools.calrange(@start) AS d
	WHERE d.[weekday] = 3
	AND d.[date] < @end
),
[every4thtuesday] AS (
	SELECT * 
	FROM [tuesdays]
	WHERE [num] = 4
)
SELECT * 
FROM [every4thtuesday]
ORDER BY [date]
