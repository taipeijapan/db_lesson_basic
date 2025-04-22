.-- Q1
create table `departments`
(
  `department_id` int unsigned not null primary key auto_increment,
  `name` varchar(20) not null,
  `created_at` timestamp default current_timestamp,
  `updated_at` timestamp default current_timestamp on update current_timestamp
);

-- Q2
alter table people add 
`department_id` int unsigned not null
after email;

-- Q3
insert into departments(department_id, name)
values (1, '営業'), (2, '開発'), (3, '経理'), (4, '人事'), (5, '情報システム');

insert into people(name, email, department_id, gender, age)
values ('営業1', 'eigyo1@gizumo-inc.jp', 1, 1, 20),
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
update people set department_id = 1 where department_id = 0;

-- Q5
select * from people where department_id = 1 order by age desc;

-- Q6
-- peopleテーブルより、department_idカラムが1であるレコードのname, email, ageカラムを、
-- created_atカラムの昇順に取得する。

-- Q7
select name from people
where 19 < age && age < 30 && gender = 2 || 39 < age && age < 50 && gender = 1;

-- Q8
select * from people where department_id = 1 order by age asc;

-- Q9
select avg(age) as average_age from people where department_id = 1 && gender = 2;

-- Q10
select
p.name,
d.name as department_name,
r.content as report_content
from people p
inner join
departments d
using
(department_id)
right outer join
reports r
using
(person_id);

-- Q11
select
p.name
from
people p
left outer join
reports r
using
(person_id)
group by
p.person_id
having
count(r.content) = 0;