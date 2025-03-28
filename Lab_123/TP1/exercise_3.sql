/*Question 1*/
CREATE TABLE IF NOT EXISTS PROJECT (
	PROJNO integer constraint pk_project primary key,
	PNAME varchar(20),
	STARTDATE DATE,
	BUDGET integer
);

/*Question 2*/
CREATE TABLE IF NOT EXISTS PROJECT_EMP (
	EMPNO integer,
	PROJNO integer,
	constraint pk_project_emp primary key (EMPNO, PROJNO),
	constraint fk_emp foreign key (EMPNO) references EMP (EMPNO),
	constraint fk_project foreign key (PROJNO) references PROJECT (PROJNO)
);
/*
INSERT INTO PROJECT VALUES (1, 'INNOVATION', TO_DATE('15-01-2023', 'DD-MM-YYYY'), 50000);
INSERT INTO PROJECT VALUES (2, 'RESEARCH', TO_DATE('12-07-2023	', 'DD-MM-YYYY'), 80000);
INSERT INTO PROJECT VALUES (3, 'MARKETINGCAMPAIGNS', TO_DATE('04-01-2024', 'DD-MM-YYYY'), 75000);
INSERT INTO PROJECT VALUES (4, 'FINANTIALAUDITS', TO_DATE('15-03-2024', 'DD-MM-YYYY'), 25000);

INSERT INTO PROJECT_EMP VALUES (7566, 1);
INSERT INTO PROJECT_EMP VALUES (7566, 2);
INSERT INTO PROJECT_EMP VALUES (7566, 3);
INSERT INTO PROJECT_EMP VALUES (7566, 4);
INSERT INTO PROJECT_EMP VALUES (7902, 4);
INSERT INTO PROJECT_EMP VALUES (7499, 1);
INSERT INTO PROJECT_EMP VALUES (7369, 2);
INSERT INTO PROJECT_EMP VALUES (7521, 3);
INSERT INTO PROJECT_EMP VALUES (7934, 4);
INSERT INTO PROJECT_EMP VALUES (7839, 2);
INSERT INTO PROJECT_EMP VALUES (7839, 1);
INSERT INTO PROJECT_EMP VALUES (7788, 1);
INSERT INTO PROJECT_EMP VALUES (7902, 1);
INSERT INTO PROJECT_EMP VALUES (7782, 2);
INSERT INTO PROJECT_EMP VALUES (7844, 2);
INSERT INTO PROJECT_EMP VALUES (7654, 3);
INSERT INTO PROJECT_EMP VALUES (7900, 3);
INSERT INTO PROJECT_EMP VALUES (7698, 4);
INSERT INTO PROJECT_EMP VALUES (7782, 4);
INSERT INTO PROJECT_EMP VALUES (7876, 4);
*/
/*Question 3*/
SELECT empno FROM PROJECT_EMP
GROUP BY empno
HAVING COUNT(projno) = (SELECT COUNT(*) FROM PROJECT);

/*Question 4:
	The view represents information (empno, ename and deptno) from employees who work at sales
	department (deptno = 10). WITH CHECK OPTION ensures that any addition to this view should meet
	the condition of the view, in this case, deptno should be 10.

CREATE VIEW sales_staff AS
SELECT empno, ename, deptno
    FROM emp
    WHERE deptno = 10 WITH CHECK OPTION;
*/
/*Question 5 
	It is expected that since Williams is at department 30 trows an error which says something about the
	condition, but it seems it's trying to add those two employees to the EMP table. Since there are just
	3 data from those 2 employees and we remember at least mgr should'n be null with our configuration.

INSERT INTO sales_staff VALUES (7584, 'OSTER', 10);
INSERT INTO sales_staff VALUES (7591, 'WILLIAMS', 30);
*/

/*Question 6
SELECT empno, COUNT(projno) FROM PROJECT_EMP
GROUP BY empno
HAVING COUNT(projno) >= 2;
*/
/*Question 7
SELECT empno FROM PROJECT_EMP
WHERE projno = 1
INTERSECT
SELECT empno FROM PROJECT_EMP
WHERE projno = 2;

SELECT empno FROM PROJECT_EMP
WHERE projno = 3
EXCEPT
SELECT empno FROM PROJECT_EMP
WHERE projno = 4;
*/

/*Question 8
SELECT empno, projno, sal
FROM (
  SELECT empno, projno, sal
  FROM PROJECT_EMP pe1 NATURAL JOIN EMP e1
  WHERE (
    SELECT COUNT(*)
    FROM PROJECT_EMP pe2 NATURAL JOIN EMP e2
    WHERE pe2.projno = pe1.projno AND e2.sal > e1.sal
  ) < 3
) AS TopEmployees
ORDER BY projno, sal DESC;
*/

/*Question 9.1
SELECT empno, 
	ROUND(COUNT(projno) * 100/(SELECT COUNT(*) 
	FROM PROJECT), 2) AS percentage FROM PROJECT_EMP
GROUP BY empno
*/
/*Question 9.2
SELECT empno, percentage,
       CASE 
           WHEN percentage = 0 THEN 'Empty'
           WHEN percentage BETWEEN 10 AND 49 THEN 'Small'
           WHEN percentage BETWEEN 50 AND 79 THEN 'Medium'
           WHEN percentage BETWEEN 80 AND 99 THEN 'Large'
           WHEN percentage = 100 THEN 'Total'
       END AS scope_size
FROM (
    SELECT empno,
           ROUND(COUNT(projno) * 100.0 / (SELECT COUNT(*)
		   FROM PROJECT), 2) AS percentage
    FROM PROJECT_EMP
    GROUP BY empno
);
*/