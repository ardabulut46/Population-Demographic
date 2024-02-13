

-- Worlds total deaths each year compared to population

select pop.Country_name,
pop.Year,
pop.Population,
MAX(dea.Deaths) as TotalDeaths
from Population..Deaths dea
join Population..[Population ] pop
	on dea.Country_name = pop.Country_name 
	and dea.Year = pop.Year
	where pop.Country_name = 'World'
	group by pop.Country_name,pop.Year,pop.Population,dea.Deaths
	order by TotalDeaths desc;


		
-- Looking at net populations of countries year by year.



select pop.Country_name,
pop.Year,
(pop.Population - dea.Deaths) AS NetPopulation 
from Population..[Population ] pop
join Population..Deaths dea
	on pop.Country_name = dea.Country_name
	and pop.Year = dea.Year
	--where pop.Country_name = 'Turkey'
	--and pop.Year = 2021

	--select * from Population..[Population ]



-- Looking at death rates for each country, year by year.


select pop.Country_name,
	   pop.Year,
	   (dea.Deaths/pop.Population) * 1000 AS MortalityRate
from Population..[Population ] pop
join Population..Deaths dea
	on pop.Country_name = dea.Country_name
	and pop.Year = dea.Year
	

-- Looking at which year Turkey had the most Mortality Rate 

select pop.Country_name,
	   pop.Year,
	   (dea.Deaths/pop.Population) * 1000 AS MortalityRate
from Population..[Population ] pop
join Population..Deaths dea
	on pop.Country_name = dea.Country_name
	and pop.Year = dea.Year
	where pop.Country_name = 'Turkey'
	order by 3 desc;


--- Worlds most adult population by year.


select pop.Country_name,
pop.Year,
pop.Population_older_than_18_years
from  Population..[Population ] pop
where pop.Country_name = 'World'
order by 3 desc;

-- Worlds most child population


select pop.Country_name,
pop.Year,
(pop.Population - pop.Population_older_than_18_years) AS ChildPopulation
from Population..[Population ] pop
where pop.Country_name = 'World'
order by 3 desc;


-- Turkey's most child population with adult population by year.


select pop.Country_name,
pop.Year,
(pop.Population-pop.Population_older_than_18_years)  as ChildPopulation,
 pop.Population_older_than_18_years as AdultPopulation
from Population..[Population ] pop
where pop.Country_name = 'Turkey'
order by 3 desc

-- Looking at countries with the most population older than 100 years old.


select pop.Country_name,pop.Year,pop.Population_older_than_100_years
from Population..[Population ] pop
order by 3 desc;

-- Death ratios 15-19 years olds for each country.

select pop.Country_name,
	   pop.Year,
	   pop.Population_aged_15_to_19_years,
	   dea.Deaths_aged_15_to_19_years,
	   (dea.Deaths_aged_15_to_19_years/pop.Population_aged_15_to_19_years)*1000 AS DeathRatio15_19
from Population..[Population ] pop
join Population..Deaths dea
	on pop.Country_name = dea.Country_name
	and pop.Year = dea.Year
	where pop.Country_name = 'Turkey'
	order by 5 desc;


-- Looking at countries with highest death rate compared to population 


select pop.Country_name,
pop.Year,
pop.Population,
MAX(dea.Deaths) AS HighestDeathCount,
MAX((dea.Deaths/pop.Population))*100 as PercentPeopleDied
from Population..[Population ] pop
join Population..Deaths dea
	on pop.Country_name = dea.Country_name
	and pop.Year = dea.Year
--where pop.Country_name = 'Turkey'
group by pop.Country_name,pop.Population,pop.Year
order by PercentPeopleDied desc;                      

-- Percent of people who has lived 100 years or more 


select pop.Country_name,
pop.Year,
(pop.Population_older_than_100_years/pop.Population) as PercentPeopleOlder100
from Population..[Population ] pop
order by PercentPeopleOlder100 desc;

-- Death ratios of children under 1 year olds

select pop.Country_name,
pop.Year,
(dea.Deaths_of_children_under_the_age_of_1 / pop.Population_of_children_under_the_age_of_1) AS UnderAge1
from Population..[Population ] pop
join Population..Deaths dea
	on pop.Country_name = dea.Country_name
	and pop.Year = dea.Year
	where pop.Country_name = 'Turkey'
	order by 3 desc;



