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
    The data provided good opportunities to segment the data across the different tables.
    Analysis:
        1. 
    Challenges:
        1.

### Analysis of Outcomes Based on Query Results
    Outcomes:

### Analysis of Outcomes Based on Goals

### Challenges and Difficulties Encountered
    The challenge I ran into while working through the problem was when the counts didn't add up at one of the last checks for the total number of positions by title. As a result, I took a step back with the queries and changed my approach so I could check to make sure the joins weren't excluding records and be able to check against the values expected and original number of records in the employee table. I did this by using a case when to create a flag made the process easier to visually check the data is processing correctly and easily incorporate the flag into a WHERE clause.

## Results

