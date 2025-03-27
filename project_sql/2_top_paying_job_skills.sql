/* What skills are required for the top_paying data analyst jobs? */

WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        salary_year_avg,
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
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON  top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC;

/* Here's a quick breakdown of the skill insights from those top-paying data analyst roles in 2023:

SQL is king – It showed up the most (8 times), which means it's basically a must-have for data analyst roles. Employers really want people who can work with databases and pull data efficiently.

Python is a close second – It appeared in 7 job listings. Python’s versatility in data cleaning, analysis, and visualization makes it super valuable.

Tableau is very popular – Mentioned in 6 listings, Tableau is a go-to for data visualization. Employers want analysts who can turn data into dashboards and stories.

R is still relevant – It came up 4 times. While Python is more popular overall, R is still in demand, especially for statistical analysis.*/
