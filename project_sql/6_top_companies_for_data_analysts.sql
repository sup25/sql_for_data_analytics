/* 
Question: Which companies offer the best opportunities for Data Analysts?
-Identify companies hiring Data Analysts with high average salaries and multiple job postings.
-Focus on remote roles with specified salary information.
-Why? Helps target top employers offering both compensation and opportunity volume,
 enabling more strategic job applications.
*/
SELECT
    company_dim.name AS company_name,
    COUNT(job_postings_fact.job_id) AS job_posting_count,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst'
    AND job_location = 'Anywhere'
    AND salary_year_avg IS NOT NULL
GROUP BY
    company_dim.name
HAVING
    COUNT(job_postings_fact.job_id) > 2 -- This filters out companies with too few postings
ORDER BY
    avg_salary DESC,
    job_posting_count DESC
LIMIT 15

/* 
output:
"company_name","job_posting_count","avg_salary"
"Uber","5","140900"
"Edward Jones","5","122431"
"Robert Half","12","122167"
"ICF","4","119746"
"Kern Health Systems","3","115792"
"Jobot","3","110833"
"InvestM Technology LLC","5","109000"
"Motion Recruitment","8","107813"
"UnitedHealth Group","4","106800"
"Get It Recruit - Hospitality","3","105833"
"Get It Recruit - Real Estate","6","99167"
"General Dynamics Information Technology","4","95750"
"CyberCoders","6","94167"
"Get It Recruit - Technology","3","92489"
"CVS Health","7","91300"

 */

