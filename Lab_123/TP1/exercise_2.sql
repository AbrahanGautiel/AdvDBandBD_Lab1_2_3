/*Question 1
SELECT
    t.table_name,
    array_agg(c.column_name::text) AS COLUMNS
FROM
    information_schema.tables t
INNER JOIN information_schema.columns c ON
    t.table_name = c.table_name
WHERE
    t.table_schema = 'public'
    AND t.table_type= 'BASE TABLE'
    AND c.table_schema = 'public'
GROUP BY t.table_name;
*/
/*Question 2
SELECT * FROM EMP
WHERE comm > sal;
*/
/*Question 3
SELECT * FROM EMP
WHERE (comm + sal) BETWEEN 1200 AND 2400;
*/
/*Question 4
SELECT * FROM EMP
WHERE job = 'CLERK' OR job = 'ANALYST';
*/
/*Question 5
SELECT * FROM EMP
WHERE ename LIKE 'M%';
*/
/*Question 6
SELECT * FROM EMP
WHERE ename LIKE '_L%';
*/
/*Question 7
SELECT * FROM EMP
WHERE (job = 'MANAGER' OR job = 'CLERK')
AND deptno = 10
AND sal > 1500;
*/
/*Question 8
SELECT * FROM EMP
WHERE comm IS NULL;
*/
/*Question 9
SELECT * FROM EMP
ORDER BY hiredate ASC;
*/
/*Question 10
SELECT * FROM EMP
ORDER BY job, sal DESC;
*/
/*Question 11
SELECT * FROM DEPT
WHERE deptno NOT IN (
	SELECT deptno FROM EMP
);
*/
/*Question 12
SELECT e1.empno, e1.ename, e1.efirst, e1.job, e1.mgr, e2.ename AS mgr_name,
		e1.hiredate, e1.sal, e1.comm, e1.tel, e1.deptno, e1.mobtel
FROM EMP e1
LEFT JOIN EMP e2 ON e1.mgr = e2.empno;
*/
/*Question 13
SELECT * FROM EMP
WHERE (sal + 
	CASE WHEN comm IS NULL THEN 0 ELSE comm END) >
	(SELECT sal FROM EMP WHERE ename = 'JONES');
*/
/*Question 14
SELECT empno, ename, efirst, job, mgr, hiredate, 
	(sal, CASE WHEN comm IS NULL THEN 0 ELSE comm END) AS earning,
	tel, deptno, mobtel FROM EMP
*/
/*Question 15
SELECT deptno FROM DEPT
WHERE deptno IN (SELECT deptno FROM EMP);
*/
/*Question 16
SELECT e.empno, e.ename, e.efirst, e.job, e.mgr, e.hiredate, e.sal,
		e.comm, e.tel, e.deptno, e.mobtel
FROM EMP e JOIN DEPT d on e.deptno = d.deptno
WHERE d.loc = 'CHICAGO'
AND e.job = (
	SELECT job FROM EMP
	WHERE ename = 'JONES'
);
*/
/*Question 17
SELECT e1.empno, e1.ename, e1.efirst, e1.job, e1.mgr, e1.hiredate,
		e1.sal, e1.comm, e1.tel, e1.deptno, e1.mobtel
FROM EMP e1 JOIN EMP e2 ON e1.mgr = e2.empno
WHERE e1.deptno != e2.deptno;
*/
/*Question 18
SELECT * FROM EMP
WHERE deptno IN (
	SELECT deptno FROM EMP
	WHERE job = 'CLERK'
);
*/
/*Question 19
SELECT * FROM EMP
WHERE deptno = 10 AND job IN (
	SELECT job FROM EMP
	WHERE deptno IN (
		SELECT deptno FROM DEPT
		WHERE dname = 'SALES'
	)
);
*/
/*Question 20*/
SELECT * FROM EMP
WHERE job IN (
	SELECT job FROM EMP
	WHERE ename = 'JONES'
)
UNION
SELECT * FROM EMP
WHERE sal > (
	SELECT sal FROM EMP
	WHERE ename = 'FORD'
);

/*Question 21
SELECT * FROM EMP
WHERE sal > ALL (
	SELECT sal FROM EMP
	WHERE deptno = 20
)
*/