-- Lab 11 SQL Script
-- Author: Raghusan1502
-- Date: 2024-11-17

-- Step 3: Basic Queries
-- Retrieve all courses
SELECT * FROM courses;

-- Retrieve the first 10 rows from the assignments table
SELECT * FROM assignments
LIMIT 10;

-- Count the total number of courses
SELECT count(*) FROM courses;

-- Find the earliest due date in the assignments table
SELECT min(due_date) FROM assignments;

-- Retrieve courses with names starting with "Intro"
SELECT *
FROM courses
WHERE course_name LIKE 'Intro%';

-- Retrieve assignments that are not completed, ordered by due date
SELECT *
FROM assignments
WHERE status != 'Completed'
ORDER BY due_date;

-- Retrieve assignments for COMM courses with specific conditions
SELECT course_id, title, status, due_date
FROM assignments
WHERE status != 'Completed'	
  AND course_id LIKE 'COMM%'
  AND due_date < '2024-12-31'
ORDER BY due_date;

-- Step 4: Exercise Questions
-- 1. Assignments for a Specific Course
-- Display the title and due_date of assignments for the course COMP1234
SELECT title, due_date
FROM assignments
WHERE course_id = 'COMP1234';

-- 2. Earliest Assignment Due Date
-- Find the earliest assignment due date
SELECT min(due_date) AS earliest_due_date
FROM assignments;

-- 3. Latest Assignment Due Date
-- Find the latest assignment due date
SELECT max(due_date) AS latest_due_date
FROM assignments;

-- 4. Assignments Due on a Specific Date
-- Find the title and course_id of assignments due on 2024-10-08
SELECT title, course_id
FROM assignments
WHERE due_date = '2024-10-08';

-- 5. Assignments Due in October
-- Display the title and due_date of assignments due in October 2024
SELECT title, due_date
FROM assignments
WHERE due_date LIKE '2024-10%';

-- 6. Most Recent Completed Assignment
-- Find the most recent completed assignment
SELECT max(due_date) AS most_recent_completed
FROM assignments
WHERE status = 'Completed';

-- Optional Tasks
-- 7. Count of "Not Started" Assignments
-- Find the total number of assignments with a status of "Not Started"
SELECT count(*) AS not_started_assignments
FROM assignments
WHERE status = 'Not Started';

-- 8. Courses with Labs on Tuesday
-- Find the course_id and course_name of courses with labs on Tuesday
SELECT course_id, course_name
FROM courses
WHERE lab_schedule LIKE 'Tue%';

-- Step 5: Join Query Example
-- Retrieve all assignments along with their corresponding course details
SELECT c.course_id, c.course_name, a.title, a.due_date, a.status
FROM courses c
JOIN assignments a
  ON c.course_id = a.course_id
ORDER BY a.due_date;
