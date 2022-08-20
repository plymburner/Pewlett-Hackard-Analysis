# Pewlett-Hackard-Analysis
SQL Analysis of Employees

## Overview of Project
    The project is to evaluate the employees who will be retiring in the future, which roles will be affected by those retirements, and the potential employees who could be mentored to fill those positions in the future. 

### Purpose
    The purpose of the project is to analyze the employees based on:
        1. Understand the table layout using an entity relationship diagram of the employee related tables
        2. Evaluate retiring employees based upon their birth date 
        3. Join the employees table to the title table and find the most recent title for the employee
        4. Join the employees table to the departments table and find the most recent department for the employee
        5. Evaluate group of employees for mentorship based upon their birth date
        6. Export the various tables to track the progress and result sets

## Analysis and Challenges
    The data provided good opportunities to pull together the data across tables to perform an analysis of the data.
    Analysis:
        1. Using the distinct on function worked well to reduce the number of rows in the title table since it holds the employment history of the employee. However when using the where clause to look for the end data of '9999-01-01', it elimintated all the previous titles and only left the current employees' current title.
    Challenges:
        1. I found at one point where the counts weren't adding up and resorted to using flags to be able to visually verify the data, i.e. employee in the retiring birth date range, and run counts to ensure the values were consistent from one step to another.

### Analysis of Outcomes Based on Query Results
    Outcomes:
        1. The retirement_titles table contained 133,776 rows of data for employees within the retiring date range for their current and former roles with the company
            https://github.com/plymburner/Pewlett-Hackard-Analysis/blob/main/Data/retirement_titles.csv
        2. The unique_titles table contains the names and current roles of the 72,458 employees that were born in the retirement birth date range
            https://github.com/plymburner/Pewlett-Hackard-Analysis/blob/main/Data/unique_titles.csv
        3. The retiring_titles table took the unique titles table and grouped the counts by title.
            https://github.com/plymburner/Pewlett-Hackard-Analysis/blob/main/Data/retiring_titles.csv
        4. The mentorship_eligibility table is the result of earlier steps for the retirement analysis, just with a different birth date range to identify the employees.
            https://github.com/plymburner/Pewlett-Hackard-Analysis/blob/main/Data/mentorship_eligibilty.csv

### Analysis of Outcomes Based on Goals
    Outcomes:
        1. Created an entity relationship diagram (ERD) for the HR database tables being used in this analysis.
            https://github.com/plymburner/Pewlett-Hackard-Analysis/blob/main/Resources/EmployeeDB.png
        2. Created a repositiory file of SQL scripts used for the analysis.
            https://github.com/plymburner/Pewlett-Hackard-Analysis/blob/main/Employee_Database_challenge.sql


### Challenges and Difficulties Encountered
    The challenge I ran into while working through the problem was when the counts didn't add up at one of the last checks for the total number of positions by title. As a result, I took a step back with the queries and changed my approach so I could check to make sure the joins weren't excluding records and be able to check against the values expected and original number of records in the employee table. I did this by using a case when to create a flag made the process easier to visually check the data is processing correctly and easily incorporate the flag into a WHERE clause.

## Results
    1. There are 72,458 potentially retiring employees in the firm. Engineering roles represented slightly more than half of retiring titles (36,291), which represents a longer term technical debt.
    2. The projected losses at Technique Leaders further the losses in the technical space.
    3. Using the date based approach to mentorship, presented limited results to offset the potential reitirement risks, since there were only 1,549 employees suggested as eligible based on the query results, which will be insufficient to cover future losses.