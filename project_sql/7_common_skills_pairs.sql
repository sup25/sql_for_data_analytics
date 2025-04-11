/*
Question: Which skills commonly appear together in job postings?
-Identifies top co-occurring skill pairs for Data Analyst roles.
-Why? Reveals complementary skills to learn together, useful for course design or career planning.
*/



WITH skill_pairs AS (
    SELECT
        sj1.skill_id AS skill_id_1,
        sj2.skill_id AS skill_id_2,
        COUNT(DISTINCT sj1.job_id) AS pair_count
    FROM skills_job_dim sj1
    INNER JOIN skills_job_dim sj2 ON sj1.job_id = sj2.job_id
    AND sj1.skill_id < sj2.skill_id  -- To ensure each pair is counted only once
    WHERE sj1.job_id IN (
        SELECT job_id
        FROM job_postings_fact
        WHERE job_title_short = 'Data Analyst' AND job_location = 'Anywhere'
    )
    GROUP BY sj1.skill_id, sj2.skill_id
)

SELECT
    sd1.skills AS skill_1,
    sd2.skills AS skill_2,
    pair_count
FROM skill_pairs
INNER JOIN skills_dim sd1 ON skill_pairs.skill_id_1 = sd1.skill_id
INNER JOIN skills_dim sd2 ON skill_pairs.skill_id_2 = sd2.skill_id
ORDER BY pair_count DESC
LIMIT 10;

/* 
output:
"skill_1","skill_2","pair_count"
"sql","python","3532"
"sql","tableau","2991"
"sql","excel","2704"
"sql","power bi","1899"
"python","tableau","1867"
"python","r","1852"
"sql","r","1710"
"excel","tableau","1469"
"tableau","power bi","1377"
"python","excel","1260"

*/
