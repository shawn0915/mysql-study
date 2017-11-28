USE student;

SELECT *
FROM student;

-- 1. 查询“001”课程比“002”课程成绩高的所有学生的学号；
SELECT a.SID
FROM (SELECT
        Sid,
        score
      FROM SC
      WHERE CID = '001') a, (SELECT
                               Sid,
                               score
                             FROM SC
                             WHERE CID = '002') b
WHERE a.score > b.score AND a.Sid = b.Sid;
