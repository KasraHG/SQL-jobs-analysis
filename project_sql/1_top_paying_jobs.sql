/* question: what are the top_paying data analyst jobs? */
-- Which companies are offering the most competitive salaries for remote Data Analyst roles?
-- Which job schedule types are most commonly associated with top-paying remote Data Analyst positions?
-- What are the top paying Data Analyst jobs currently available for remote work? and name the company.

SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND 
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL

ORDER BY 
    salary_year_avg DESC
LIMIT 10;