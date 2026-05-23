create database HR_analytics;

select * from hr_analytics;

# Total Employees
select count(EmployeeCount) as `total employees` from hr_analytics;

# Hourly rate
select avg(HourlyRate) as Hourly from hr_analytics; 

# Job Satisfaction
select avg(JobSatisfaction) as `Job Satisfaction` from hr_analytics;

# Worklife Balance
select avg(WorkLifeBalance) as `work life Balance` from hr_analytics;

# Attrition Rate
select 
   round((sum(case when Attrition = "Yes" then 1 else 0 end)*100)
   / count(*), 
   2
   ) as Attrition_Rate
from hr_analytics;

# Attrition Rate by Department & Job Role
SELECT Department,jobRole,
    round((SUM(CASE 
            WHEN Attrition="Yes" THEN 1 
            ELSE 0 
        END)*100)/ count(*), 2) AS Attrition_Rate
FROM hr_analytics
GROUP BY Department, jobRole
ORDER BY Attrition_Rate DESC;


# Attrition Rate by Age groups
select AgeGroup,
 round((sum(case
               WHEN Attrition="Yes" THEN 1 
            ELSE 0 
        END)*100)/ count(*), 2) AS Attrition_Rate
FROM hr_analytics
group by AgeGroup
order by AgeGroup;


# Attrition Rate vs Worklife balance
select WorkLifeBalance,
 round((sum(case
               WHEN Attrition="Yes" THEN 1 
            ELSE 0 
        END)*100)/ count(*), 2) AS Attrition_Rate
FROM hr_analytics
group by WorkLifeBalance
order by WorkLifeBalance desc;


# Attrition Rate vs JobSatisfaction
select JobSatisfaction,
 round((sum(case
               WHEN Attrition="Yes" THEN 1 
            ELSE 0 
        END)*100)/ count(*), 2) AS Attrition_Rate
FROM hr_analytics
group by JobSatisfaction
order by JobSatisfaction desc;

