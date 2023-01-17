
DECLARE @startDate date = '2014-01-01'
SELECT @startDate = DATEADD(day, 1, @startDate) as 

Use [K2AFLEET]



DECLARE @startDate date = '2014-01-01'
DECLARE @endDate date = '2023-01-16'
DECLARE @startDate date = '2014-01-01'

select @startDate as ActualDate
Declare @startDate Date = '2014-01-01'
select Year(@startDate) as ActualYEAR

Declare @startDate Date = '2014-01-01'
select Month(@startDate) as ActualMonth

Declare @startDate Date = '2014-01-01'
select wek(@startDate) as Actualweek

Declare @startDate Date = '2014-01-01'
select DateName(month,'2015-02-25') as ActualMonthName



DECLARE @startDate date = '2014-01-01'
DECLARE @endDate date = '2023-01-16'
SELECT  CONVERT(int, CONVERT(nvarchar(8), @startDate, 112)) as DateSK, 
	                @startDate as ActualDate,
			        YEAR(@startDate) as ActualYear, 
					MONTH(@startDate) as ActualMonth, 
					DAY(@startDate) as ActualDay,
			        DATENAME(month, @startDate) as ActualMonthName, 
					DATENAME(DW, @startDate) as ActualDayName,
			        DATEPART(Weekday,@startDate) as ActualWeekDay,
					Datepart(Week,@startDate) as ActualWeekNo


select DateName(DW,'2015-02-26') as ActualMonthName
Select Datepart(WEEKDAY,'2012-04-26') as ActualName
Select Datepart(DD,'2012-04-26') as ActualWeekNo
select * from Date
CREATE TABLE Date
(
	DateSK			int,
	ActualDate		date,
	ActualYear		int,
	ActualMonth		int,
	ActualDay		int,
	ActualMonthName nvarchar(20),
	ActualDayName	nvarchar(20),
	ActualWeekday   int,
    ActualWeekNo    int,
	CONSTRAINT OmnicorpDW_DimDate_DateSK PRIMARY KEY(DateSK)
)

CREATE  PROCEDURE DateGenerator
AS
BEGIN
SET NOCOUNT ON

DECLARE @startDate date = '2011-02-01'
DECLARE @endDate date = '2022-12-31'

 BEGIN
	while @startDate <= @endDate
	 BEGIN
	  Insert into  Date (DateSK, ActualDate, ActualYear, ActualMonth, ActualDay,
	                ActualMonthName, ActualDayName,ActualWeekday,ActualWeekNo)
			SELECT  CONVERT(int, CONVERT(nvarchar(8), @startDate, 112)) as DateSK, 
	                @startDate as ActualDate,
			        YEAR(@startDate) as ActualYear, 
					MONTH(@startDate) as ActualMonth, 
					DAY(@startDate) as ActualDay,
			        DATENAME(month, @startDate) as ActualMonthName, 
					DATENAME(DW, @startDate) as ActualDayName,
			        DATEPART(Weekday,@startDate) as ActualWeekDay,
					Datepart(Week,@startDate) as ActualWeekNo
			
	       SELECT @startDate = DATEADD(day, 1, @startDate)

	END
  END
END
GO 
Exec DateGenerator