/* 
Question: What skills are required for the top-paying data analyst job?
-Use the top 10 highest-paying Data Analyst jobs from first query.
-Add the specific skills required for these roles.
-Why? It provides a detailed look at which high-paying jobs demand certain skills, 
  helping job seekers understand which skills to develop that align with top salaries
 */

WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,   
        salary_year_avg,
        job_posted_date,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN
        company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short='Data Analyst' AND
        job_location='Anywhere' AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT
    top_paying_jobs.*,
    skills

FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC


/* 
output:
"job_id","job_title","salary_year_avg","job_posted_date","company_name","skills"
552322,"Associate Director- Data Insights","255829.5","2023-06-18 16:03:12","AT&T","sql"
552322,"Associate Director- Data Insights","255829.5","2023-06-18 16:03:12","AT&T","python"
552322,"Associate Director- Data Insights","255829.5","2023-06-18 16:03:12","AT&T","r"
552322,"Associate Director- Data Insights","255829.5","2023-06-18 16:03:12","AT&T","azure"
552322,"Associate Director- Data Insights","255829.5","2023-06-18 16:03:12","AT&T","databricks"
552322,"Associate Director- Data Insights","255829.5","2023-06-18 16:03:12","AT&T","aws"
552322,"Associate Director- Data Insights","255829.5","2023-06-18 16:03:12","AT&T","pandas"
552322,"Associate Director- Data Insights","255829.5","2023-06-18 16:03:12","AT&T","pyspark"
552322,"Associate Director- Data Insights","255829.5","2023-06-18 16:03:12","AT&T","jupyter"
552322,"Associate Director- Data Insights","255829.5","2023-06-18 16:03:12","AT&T","excel"
552322,"Associate Director- Data Insights","255829.5","2023-06-18 16:03:12","AT&T","tableau"
552322,"Associate Director- Data Insights","255829.5","2023-06-18 16:03:12","AT&T","power bi"
552322,"Associate Director- Data Insights","255829.5","2023-06-18 16:03:12","AT&T","powerpoint"
99305,"Data Analyst, Marketing","232423.0","2023-12-05 20:00:40","Pinterest Job Advertisements","sql"
99305,"Data Analyst, Marketing","232423.0","2023-12-05 20:00:40","Pinterest Job Advertisements","python"
99305,"Data Analyst, Marketing","232423.0","2023-12-05 20:00:40","Pinterest Job Advertisements","r"
99305,"Data Analyst, Marketing","232423.0","2023-12-05 20:00:40","Pinterest Job Advertisements","hadoop"
99305,"Data Analyst, Marketing","232423.0","2023-12-05 20:00:40","Pinterest Job Advertisements","tableau"
1021647,"Data Analyst (Hybrid/Remote)","217000.0","2023-01-17 00:17:23","Uclahealthcareers","sql"
1021647,"Data Analyst (Hybrid/Remote)","217000.0","2023-01-17 00:17:23","Uclahealthcareers","crystal"
1021647,"Data Analyst (Hybrid/Remote)","217000.0","2023-01-17 00:17:23","Uclahealthcareers","oracle"
1021647,"Data Analyst (Hybrid/Remote)","217000.0","2023-01-17 00:17:23","Uclahealthcareers","tableau"
1021647,"Data Analyst (Hybrid/Remote)","217000.0","2023-01-17 00:17:23","Uclahealthcareers","flow"
168310,"Principal Data Analyst (Remote)","205000.0","2023-08-09 11:00:01","SmartAsset","sql"
168310,"Principal Data Analyst (Remote)","205000.0","2023-08-09 11:00:01","SmartAsset","python"
168310,"Principal Data Analyst (Remote)","205000.0","2023-08-09 11:00:01","SmartAsset","go"
168310,"Principal Data Analyst (Remote)","205000.0","2023-08-09 11:00:01","SmartAsset","snowflake"
168310,"Principal Data Analyst (Remote)","205000.0","2023-08-09 11:00:01","SmartAsset","pandas"
168310,"Principal Data Analyst (Remote)","205000.0","2023-08-09 11:00:01","SmartAsset","numpy"
168310,"Principal Data Analyst (Remote)","205000.0","2023-08-09 11:00:01","SmartAsset","excel"
168310,"Principal Data Analyst (Remote)","205000.0","2023-08-09 11:00:01","SmartAsset","tableau"
168310,"Principal Data Analyst (Remote)","205000.0","2023-08-09 11:00:01","SmartAsset","gitlab"
731368,"Director, Data Analyst - HYBRID","189309.0","2023-12-07 15:00:13","Inclusively","sql"
731368,"Director, Data Analyst - HYBRID","189309.0","2023-12-07 15:00:13","Inclusively","python"
731368,"Director, Data Analyst - HYBRID","189309.0","2023-12-07 15:00:13","Inclusively","azure"
731368,"Director, Data Analyst - HYBRID","189309.0","2023-12-07 15:00:13","Inclusively","aws"
731368,"Director, Data Analyst - HYBRID","189309.0","2023-12-07 15:00:13","Inclusively","oracle"
731368,"Director, Data Analyst - HYBRID","189309.0","2023-12-07 15:00:13","Inclusively","snowflake"
731368,"Director, Data Analyst - HYBRID","189309.0","2023-12-07 15:00:13","Inclusively","tableau"
731368,"Director, Data Analyst - HYBRID","189309.0","2023-12-07 15:00:13","Inclusively","power bi"
731368,"Director, Data Analyst - HYBRID","189309.0","2023-12-07 15:00:13","Inclusively","sap"
731368,"Director, Data Analyst - HYBRID","189309.0","2023-12-07 15:00:13","Inclusively","jenkins"
731368,"Director, Data Analyst - HYBRID","189309.0","2023-12-07 15:00:13","Inclusively","bitbucket"
731368,"Director, Data Analyst - HYBRID","189309.0","2023-12-07 15:00:13","Inclusively","atlassian"
731368,"Director, Data Analyst - HYBRID","189309.0","2023-12-07 15:00:13","Inclusively","jira"
731368,"Director, Data Analyst - HYBRID","189309.0","2023-12-07 15:00:13","Inclusively","confluence"
310660,"Principal Data Analyst, AV Performance Analysis","189000.0","2023-01-05 00:00:25","Motional","sql"
310660,"Principal Data Analyst, AV Performance Analysis","189000.0","2023-01-05 00:00:25","Motional","python"
310660,"Principal Data Analyst, AV Performance Analysis","189000.0","2023-01-05 00:00:25","Motional","r"
310660,"Principal Data Analyst, AV Performance Analysis","189000.0","2023-01-05 00:00:25","Motional","git"
310660,"Principal Data Analyst, AV Performance Analysis","189000.0","2023-01-05 00:00:25","Motional","bitbucket"
310660,"Principal Data Analyst, AV Performance Analysis","189000.0","2023-01-05 00:00:25","Motional","atlassian"
310660,"Principal Data Analyst, AV Performance Analysis","189000.0","2023-01-05 00:00:25","Motional","jira"
310660,"Principal Data Analyst, AV Performance Analysis","189000.0","2023-01-05 00:00:25","Motional","confluence"
1749593,"Principal Data Analyst","186000.0","2023-07-11 16:00:05","SmartAsset","sql"
1749593,"Principal Data Analyst","186000.0","2023-07-11 16:00:05","SmartAsset","python"
1749593,"Principal Data Analyst","186000.0","2023-07-11 16:00:05","SmartAsset","go"
1749593,"Principal Data Analyst","186000.0","2023-07-11 16:00:05","SmartAsset","snowflake"
1749593,"Principal Data Analyst","186000.0","2023-07-11 16:00:05","SmartAsset","pandas"
1749593,"Principal Data Analyst","186000.0","2023-07-11 16:00:05","SmartAsset","numpy"
1749593,"Principal Data Analyst","186000.0","2023-07-11 16:00:05","SmartAsset","excel"
1749593,"Principal Data Analyst","186000.0","2023-07-11 16:00:05","SmartAsset","tableau"
1749593,"Principal Data Analyst","186000.0","2023-07-11 16:00:05","SmartAsset","gitlab"
387860,"ERM Data Analyst","184000.0","2023-06-09 08:01:04","Get It Recruit - Information Technology","sql"
387860,"ERM Data Analyst","184000.0","2023-06-09 08:01:04","Get It Recruit - Information Technology","python"
387860,"ERM Data Analyst","184000.0","2023-06-09 08:01:04","Get It Recruit - Information Technology","r"

 */