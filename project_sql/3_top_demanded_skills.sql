/* 
Question: What are the most in-demand skills for data analyst?
-JOin job postings to inner join table similar to query 2
-Identify the top 5 in-demand skills for a data analyst.
-Focous on all job postings 
-Why? Retreives the top 5 skills with the highest demand in the job market
 */

SELECT
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere'
  
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5

/* 
Output:
"skills","demand_count"
"sql","7291"
"excel","4611"
"python","4330"
"tableau","3745"
"power bi","2609"
 */