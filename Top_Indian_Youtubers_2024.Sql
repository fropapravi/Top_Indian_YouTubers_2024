/*  STEP - 1

	Data Cleaning Steps

--> Remove unnecessery Columns by only selecting the one we need
--> Extract the youtube channel names from the first columns
--> Rename the column names

*/

--> condition - 1

SELECT
	NAME,
	FOLLOWERS,
	POTENTIAL_REACH
FROM 
	YOUTUBER
	
--> condition - 2


SELECT 
	CAST(SUBSTRING(NAME, 1, POSITION('@' IN NAME) -1) AS varchar(100)) as CHANNEL_NAME,
	 CAST(CAST(SUBSTRING (FOLLOWERS, 1, POSITION('M' IN FOLLOWERS) -1) AS FLOAT) AS INT) AS SUBSCRIBERS,
	 CAST(CAST(SUBSTRING (POTENTIAL_REACH, 1, POSITION('M' IN POTENTIAL_REACH) -1) AS FLOAT) AS INT) AS VIEWS
 FROM
	 
	 YOUTUBER

/*  STEP - 2

	Creating View 

*/

CREATE VIEW VIEW_YOUTUBERS AS (

SELECT 
	CAST(SUBSTRING(NAME, 1, POSITION('@' IN NAME) -1) AS varchar(100)) as CHANNEL_NAME,
	 CAST(CAST(SUBSTRING (FOLLOWERS, 1, POSITION('M' IN FOLLOWERS) -1) AS FLOAT) AS INT) AS SUBSCRIBERS,
	 CAST(CAST(SUBSTRING (POTENTIAL_REACH, 1, POSITION('M' IN POTENTIAL_REACH) -1) AS FLOAT) AS INT) AS VIEWS
 FROM
	 
	 YOUTUBER
)


/*  STEP - 3

	Data qulity tests

--> data needs to be 100 ecorders of youtube channel [row count test]
--> data needs 3 fileds [column count test]
--> the channel name column must be in string format and other columns must be numberical data types [ data type check]
--> each record must be unique in the dataset [ duplicate count check]


condition 1. Row count = 100
condition 2. column count = 4
condition 3. data types 
				-- chaneel_name = varchar
				-- Total subscribers = integer
				-- total-views = integer
condition 4. duplicate count = 0

*/

-- condition 1

select count(*) as count_row 
from view_youtuber

-- condition 2

select 
	count(*) as column_count
from
	information_schema.columns
where
	table_name = 'view_youtuber'


-- condition 3

select 
	column_name,
	data_type
from
	information_schema.columns
where
	table_name = 'view_youtuber'

-- condition 4

select channel_name, 
count(*) as duplicate_channel
from view_youtuber
group by channel_name
having count(*) > 1

--> Now the Type is to create dashboard in Power BI
