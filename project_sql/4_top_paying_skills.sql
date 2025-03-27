/* 
What are the top skills based on salary? */

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 2) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON  job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25;




--  PySpark and ML tools like DataRobot and Watson lead in salary, reflecting high demand for big data and AI expertise in analyst roles.

--  DevOps-integrated skills (e.g., GitLab, Bitbucket, Jenkins) significantly boost earnings, showing value in hybrid data-engineering capabilities.

--  Cloud and Python-based ecosystems (GCP, Pandas, Databricks) dominate, confirming that cloud-native and Python-centric skill sets are core to top-paying data analyst jobs.