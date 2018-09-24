-- 查询“001”课程比“002”课程成绩高的所有学生的学号；
SELECT a.S_ID FROM ( SELECT s_id, c_id, score FROM STU_SCORE ) a INNER JOIN ( SELECT s_id, c_id, score FROM stu_score ) b ON a.s_id = b.s_id WHERE a.c_id = 1 AND b.c_id = 2 AND a.score > b.score;

-- 查询平均成绩大于60分的同学的学号和平均成绩；
select s_id,avg(score) from stu_score group by s_id having avg(score)>50;

-- 查询所有同学的学号、姓名、选课数、总成绩；
select a.s_id,a.s_name,count(c_id),sum(score)from student a left join stu_score b on a.s_id=b.s_id group by a.s_id,a.s_name;

-- 查询姓“j”的老师的个数；
select count(*) from course where T_name like 'j%';

-- 学过j老师课程的学生
select s_name from student where s_id in (select s_id from stu_score a join course on a.c_id in(select c_id from course where t_name='j老师' group by c_id) group by s_id);

-- 查询没学过j老师课的同学的学号、姓名
select s_id,s_name from student where s_id not in (select s_id from stu_score a join course on a.c_id in(select c_id from course where t_name='j老师' group by c_id) group by s_id);

-- 查询学过“c语言”并且也学过“java”课程的同学的学号、姓名
select a.s_id,a.s_name from student a left join stu_score b on a.s_id =b.s_id where b.c_id in(select c_id from course where c_name in ('c语言','java')) group by a.s_id;
-- select a.S_ID,a.S_name from Student a, STU_SCORE b  where a.S_ID=b.S_ID and b.C_ID= 1 and exists(Select * from  STU_SCORE as c  where c.S_ID=b.S_ID and c.C_ID= 2 );

-- 查询学过“叶平”老师所教的所有课的同学的学号、姓名；
select S_ID,S_name from Student where S_ID in (select S_ID from  STU_SCORE ,Course ,Teacher  where STU_SCORE.C_ID=Course.C_ID and Teacher.T_NAME=Course.T_NAME and Teacher.Tname='叶平' group by S_ID having count(STU_SCORE.C_ID)=(select count(C_ID) from Course,Teacher   where Teacher.T_NAME=Course.T_NAME and Tname='叶平'));

-- 查询课程编号“002”的成绩比课程编号“001”课程低的所有同学的学号、姓名；
select s_id,s_name from student where s_id in (select b.s_id from stu_score b inner join stu_score c on c.s_id=b.s_id where b.c_id=2 and c.c_id=1 and b.score<c.score) ;

-- 查询'所有课程'成绩都小于60分的同学的学号、姓名；
select s_id,s_name from student where s_id not in (select s_id from stu_score where score > 60 group by s_id);


