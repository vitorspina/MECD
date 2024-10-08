


--[1] 
SELECT name,city FROM airport WHERE country = 'Portugal'

--[2] 
SELECT p.name FROM plane as p join model as m on p.modelcod = m.modelcod where m.version = 'DC-10'

--[3] 
select p.name as "plane_name",m.engines  from plane p join model m on p.modelcod = m.modelcod


--[4] 
select count(*) from flight where duration in (2,3)

--[5]
SELECT modelcod,version FROM model WHERE version ILIKE 'A3%'

--[6]
SELECT flightcod,duration FROM flight ORDER BY duration,flightcod

--[7]
/*
This was an trip
with cte as (SELECT f.flightcod, 
a.city as "FROM", 
a1.city as "TO",
a.country
FROM flight f 
join airport a on f.fromairportcod = a.airportcod
join airport a1 on f.toairportcod = a1.airportcod
where a.city = 'Porto'

UNION 

SELECT f.flightcod, 
a.city as "FROM", 
a1.city as "TO",
a.country
FROM flight f 
join airport a on f.fromairportcod = a.airportcod
join airport a1 on f.toairportcod = a1.airportcod
where a1.city = 'Londres')

Select * from cte where country = 'Portugal'
*/

select * from flight as f1, flight as f2 where f1.fromairportcod = 1 and f2.toairportcod = 12 and f1.toairportcod = f2.fromairportcod  --actual solution

--[8]
SELECT country, count(*) as number FROM airport group by country order by count(*) ASC
--[9]

SELECT f.flightcod as "flightcod", 
a.city as "origin", 
a1.city as "destination",
a.country
FROM flight f 
join airport a on f.fromairportcod = a.airportcod
join airport a1 on f.toairportcod = a1.airportcod

--[10]
SELECT f.flightcod as "flightcod"
FROM flight f 
join airport a on f.fromairportcod = a.airportcod
join airport a1 on f.toairportcod = a1.airportcod
where a.city = 'Porto' AND a1.city = 'Lisboa'

--[11]
SELECT country, count(*) as "number" from airport group by country
--[12]
SELECT country from airport group by country having count(*)  >= ALL(SELECT COUNT(*) FROM airport group by country)