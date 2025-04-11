/* 
Question: What are the most optimal skills to learn (high demand, high salary)?
-Identify skills in high demand and associated with high average salaries for Data Analyst roles.
-Concentrates on remote positions with specified salaries.
-Why? Tartets skills that offer job security (high demand) and financial benfits (high salaries), 
 offering strategic insights for carrer development in data analysis.
 */

 WITH skills_demand AS (
    SELECT
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count,
        ROUND(AVG(salary_year_avg), 0) AS avg_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst'
        AND job_location = 'Anywhere'
        AND salary_year_avg IS NOT NULL
    GROUP BY
        skills_dim.skill_id, skills_dim.skills
)

SELECT 
    skill_id,
    skills,
    demand_count,
    avg_salary
FROM 
    skills_demand
WHERE 
    demand_count > 10
ORDER BY 
    avg_salary DESC,
    demand_count DESC
LIMIT 25;


/* 
output:
"skill_id","skills","demand_count","avg_salary"
8,"go","27","115320"
234,"confluence","11","114210"
97,"hadoop","22","113193"
80,"snowflake","37","112948"
74,"azure","34","111225"
77,"bigquery","13","109654"
76,"aws","32","108317"
4,"java","17","106906"
194,"ssis","12","106683"
233,"jira","20","104918"
79,"oracle","37","104534"
185,"looker","49","103795"
2,"nosql","13","101414"
1,"python","236","101397"
5,"r","148","100499"
78,"redshift","16","99936"
187,"qlik","13","99631"
182,"tableau","230","99288"
197,"ssrs","14","99171"
92,"spark","13","99077"
13,"c++","11","98958"
186,"sas","63","98902"
7,"sas","63","98902"
61,"sql server","35","97786"
9,"javascript","20","97587"

 */