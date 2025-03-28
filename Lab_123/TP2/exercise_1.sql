/*Question 1
SELECT *
FROM (
	SELECT empno, ename, efirst, deptno, hiredate, 
	RANK() OVER (PARTITION BY deptno ORDER BY hiredate DESC) AS rank
	FROM EMP
) where rank < 3;
*/
/*Question 2*/
SELECT empno, ename, sal,
       SUM(sal) OVER (
           ORDER BY empno
           ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING
       ) AS cumulative_sal
FROM EMP;
