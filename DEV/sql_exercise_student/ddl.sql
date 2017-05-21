-- CREATE DATABASE student;
USE student;

/*
Student(SID, Sname, Sage, Ssex) 学生表
	Course(CID, Cname, TID) 课程表
	SC(SID, CID, score) 成绩表
	Teacher(TID, Tname) 教师表
 */

DROP TABLE IF EXISTS student;
CREATE TABLE student(
  sid INT AUTO_INCREMENT PRIMARY KEY ,
  sname VARCHAR(20),
  sage INT,
  ssex INT
);

DROP TABLE IF EXISTS course;
CREATE TABLE course(
  cid INT AUTO_INCREMENT PRIMARY KEY ,
  cname VARCHAR(20),
  tid INT
);

DROP TABLE IF EXISTS sc;
CREATE TABLE sc(
  sid INT,
  cid INT,
  score INT
);

DROP TABLE IF EXISTS teacher;
CREATE TABLE teacher(
  tid INT AUTO_INCREMENT PRIMARY KEY ,
  tname VARCHAR(20)
);


