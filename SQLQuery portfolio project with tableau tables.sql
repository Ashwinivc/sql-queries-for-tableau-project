select *
From [Portfolio Project]..['covid deaths#xls$']
order by 3,4

Select Location,date,total_cases, new_cases, total_deaths,population
From [Portfolio Project]..['covid deaths#xls$']
order by 1,2

--Global Numbers

select sum(new_cases) as total_cases ,sum(cast(new_deaths as int )) as totaldeaths,sum(cast(new_deaths as int ))/sum(new_cases)*100 as deathpercentage
from [Portfolio Project]..['covid deaths#xls$']
where continent is not null
order by 1,2

--Death count by Continent

select location,SUM(cast(new_deaths as int)) as totaldeathcount
from [Portfolio Project]..['covid deaths#xls$']
where continent is null and
location not in ('World', 'European Union', 'International')
group by location 
order by totaldeathcount desc

--population infected

select location,population,MAX(total_cases) as highestinfectionrate,MAX((total_cases/population))*100 as percentpopulationinfected
from [Portfolio Project]..['covid deaths#xls$']
group by population, location
order by percentpopulationinfected desc

--percent population infected


select location,population, date,MAX(total_cases) as highestinfectionrate,MAX((total_cases/population))*100 as percentpopulationinfected
from [Portfolio Project]..['covid deaths#xls$']
group by population, location, date
order by percentpopulationinfected desc




