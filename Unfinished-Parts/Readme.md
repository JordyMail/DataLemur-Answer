# Unfinished Parts - Tesla SQL Interview Question

## Question
Tesla is investigating production bottlenecks and they need your help to extract the relevant data. Write a query to determine which parts have begun the assembly process but are not yet finished.

## Assumptions
- The `parts_assembly` table contains all parts currently in production, each at varying stages of the assembly process.
- An unfinished part is one that lacks a `finish_date`.
- This question is straightforward, so let's approach it with simplicity in both thinking and solution.
- Effective April 11th, 2023, the problem statement and assumptions were updated to enhance clarity.

## Table: parts_assembly
| Column Name    | Type     |
|---------------|---------|
| part          | string  |
| finish_date   | datetime |
| assembly_step | integer |

### Example Input
| part    | finish_date          | assembly_step |
|---------|----------------------|---------------|
| battery | 01/22/2022 00:00:00  | 1             |
| battery | 02/22/2022 00:00:00  | 2             |
| battery | 03/22/2022 00:00:00  | 3             |
| bumper  | 01/22/2022 00:00:00  | 1             |
| bumper  | 02/22/2022 00:00:00  | 2             |
| bumper  |                      | 3             |
| bumper  |                      | 4             |

### Expected Output
| part    | assembly_step |
|---------|---------------|
| bumper  | 3             |
| bumper  | 4             |

### Explanation
The bumpers in step 3 and step 4 are the only items that remain unfinished as they lack a recorded `finish_date`.

## Solution
```sql
SELECT part, assembly_step FROM parts_assembly
WHERE finish_date IS NULL;
```

## Discussion
This query efficiently retrieves all parts that have started assembly but do not have a recorded `finish_date`, indicating that they are still in progress. By filtering with `WHERE finish_date IS NULL`, we focus solely on unfinished parts, ensuring accuracy and efficiency in production analysis.

