# Finding Candidates for Data Science Job

## Problem Statement
Given a table of **candidates** and their **skills**, you need to find the candidates who are best suited for an open **Data Science job**. Specifically, the candidates must possess all of the following required skills:
- **Python**
- **Tableau**
- **PostgreSQL**

Write a SQL query to list the **candidate IDs** who possess all of the required skills for the job. The output should be sorted by **candidate ID** in ascending order.

## Assumptions
- There are **no duplicate records** in the `candidates` table.

## Table Structure
### `candidates` Table
| Column Name    | Type    |
|---------------|---------|
| candidate_id  | integer |
| skill         | varchar |

## Example Input
### `candidates` Table
| candidate_id | skill      |
|-------------|-----------|
| 123         | Python    |
| 123         | Tableau   |
| 123         | PostgreSQL|
| 234         | R         |
| 234         | PowerBI   |
| 234         | SQL Server|
| 345         | Python    |
| 345         | Tableau   |

## Expected Output
| candidate_id |
|-------------|
| 123         |

## Explanation
- **Candidate 123** is displayed because they have **Python, Tableau, and PostgreSQL** skills.
- **Candidate 345** is **not included** in the output because they are missing one of the required skills (**PostgreSQL**).

## SQL Query
```sql
SELECT candidate_id 
FROM candidates 
WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')
GROUP BY candidate_id 
HAVING COUNT(DISTINCT skill) = 3
ORDER BY candidate_id;
```

## How the Query Works
1. **Filters** the candidates who have at least one of the required skills (`WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')`).
2. **Groups** the results by `candidate_id`.
3. **Counts distinct skills** per candidate (`HAVING COUNT(DISTINCT skill) = 3` ensures they have all three skills).
4. **Orders** the results by `candidate_id` in ascending order.

## Applications
- **Automated hiring filters** for job recruitment platforms.
- **Data-driven decision-making** for HR analytics.
- **Matching candidates** to specific job roles based on skill sets.
