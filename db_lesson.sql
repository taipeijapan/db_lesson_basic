.-- Q1
CREATE TABLE departments
(
  `department_id` int unsigned not null primary key auto_increment,
  `name` varchar(20) not null,
  `created_at` timestamp default current_timestamp,
  `updated_at` timestamp default current_timestamp on update current_timestamp
);

-- Q2
ALTER TABLE
  people
ADD 
  `department_id` INT unsigned NOT NULL
after email;

-- Q3
INSERT INTO
  departments(department_id, name)
VALUES
  (1, '営業'),
  (2, '開発'),
  (3, '経理'),
  (4, '人事'),
  (5, '情報システム');

INSERT INTO 
  people(name, email, department_id, gender, age)
VALUES
  ('営業1', 'eigyo1@gizumo-inc.jp', 1, 1, 20),
  ('営業2', 'eigyo2@gizumo-inc.jp', 1, 2 , 30),
  ('営業3', 'eigyo3@gizumo-inc.jp', 1, 1, 40),
  ('開発1', 'dev1@gizumo-inc.jp', 2, 2, 50),
  ('開発2', 'dev2@gizumo-inc.jp', 2, 1, 60),
  ('開発3', 'dev3@gizumo-inc.jp', 2, 2, 70),
  ('開発5', 'dev4@gizumo-inc.jp', 2, 1, 80),
  ('経理1', 'fin@gizumo-inc.jp', 3, 2, 90),
  ('人事1', 'hr@gizumo-inc.jp', 4, 1, 100),
  ('情報システム1', 'sys@gizumo-inc.jp', 5, 2, 110);

-- Q4
UPDATE
  people
SET
  department_id = 1
WHERE
  department_id = 0;

-- Q5
SELECT
  *
FROM
  people
WHERE
  department_id = 1
ORDER BY
  age
DESC;

-- Q6
-- peopleテーブルより、department_idカラムが1であるレコードのname, email, ageカラムを、
-- created_atカラムの昇順に取得する。

-- Q7
SELECT 
  `name`
FROM
  people
WHERE
  19 < age 
AND
  age < 30 
AND  
  gender = 2
OR  
  39 < age 
AND  
  age < 50
AND  
  gender = 1;

-- Q8
SELECT
  *
FROM
  people
WHERE
  department_id = 1
ORDER BY
  age
ASC;

-- Q9
SELECT
  avg(age)
AS
  average_age
FROM
  people
WHERE
  department_id = 1
AND  
  gender = 2;

-- Q10
SELECT
  p.name,
  d.name AS department_name,
  r.content AS report_content
FROM
  people p
INNER JOIN
  departments d
USING
  (department_id)
RIGHT OUTER JOIN
  reports r
USING
  (person_id);

-- Q11
SELECT
  p.name
FROM
  people p
LEFT OUTER JOIN
  reports r
USING
  (person_id)
GROUP BY
  p.person_id
HAVING
  count(r.content) = 0;