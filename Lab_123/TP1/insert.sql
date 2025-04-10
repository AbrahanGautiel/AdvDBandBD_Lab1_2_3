INSERT INTO DEPT VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT VALUES (20, 'RESEARCH',   'DALLAS');
INSERT INTO DEPT VALUES (30, 'SALES',      'CHICAGO');
INSERT INTO DEPT VALUES (40, 'OPERATIONS', 'BOSTON');

INSERT INTO EMP VALUES
        (7369, 'SMITH', 'JOHN', 'CLERK',     7902,
        TO_DATE('17-12-1980', 'DD-MM-YYYY'),  800, NULL,'0149545243', 20);
INSERT INTO EMP VALUES
        (7499, 'ALLEN', 'BOB', 'SALESMAN',  7698,
        TO_DATE('20-02-1981', 'DD-MM-YYYY'), 1600,  300, '0149547243',30);
INSERT INTO EMP VALUES
        (7521, 'WARD',  'PETER', 'SALESMAN',  7698,
        TO_DATE('22-02-1981', 'DD-MM-YYYY'), 1250,  500, '0149545247',30);
INSERT INTO EMP VALUES
        (7566, 'JONES', 'JOHN', 'MANAGER',   7839,
        TO_DATE('2-04-1981', 'DD-MM-YYYY'),  2975, NULL, '0149545456',20);
INSERT INTO EMP VALUES
        (7654, 'MARTIN', 'JOE','SALESMAN',  7698,
        TO_DATE('28-09-1981', 'DD-MM-YYYY'), 1250, 1400, '0149545784',30);
INSERT INTO EMP VALUES
        (7698, 'BLAKE', 'BOB', 'MANAGER',   7839,
        TO_DATE('1-05-1981', 'DD-MM-YYYY'),  2850, NULL,'0149545254', 30);
INSERT INTO EMP VALUES
        (7782, 'CLARK', 'JOHN', 'MANAGER',   7839,
        TO_DATE('9-06-1981', 'DD-MM-YYYY'),  2450, NULL, '0149545245',10);
INSERT INTO EMP VALUES
        (7788, 'SCOTT', 'GUY', 'ANALYST',   7566,
        TO_DATE('09-12-1982', 'DD-MM-YYYY'), 3000, NULL,'0149545249', 20);
INSERT INTO EMP VALUES
        (7839, 'KING', 'GUY',  'PRESIDENT', 7839,
        TO_DATE('17-11-1981', 'DD-MM-YYYY'), 5000, NULL, '0149545241',10);
INSERT INTO EMP VALUES
        (7844, 'TURNER','PETER', 'SALESMAN',  7698,
        TO_DATE('8-09-1981', 'DD-MM-YYYY'),  1500,    0, '0149548243',30);
INSERT INTO EMP VALUES
        (7876, 'ADAMS', 'JOSEPH', 'CLERK',     7788,
        TO_DATE('12-01-1983', 'DD-MM-YYYY'), 1100, NULL,'0149565243', 20);
INSERT INTO EMP VALUES
        (7900, 'JAMES', 'ALAN', 'CLERK',     7698,
        TO_DATE('3-12-1981', 'DD-MM-YYYY'),   950, NULL, '0149545564',30);
INSERT INTO EMP VALUES
        (7902, 'FORD',  'MARIA', 'ANALYST',   7566,
        TO_DATE('3-12-1981', 'DD-MM-YYYY'),  3000, NULL,'0149785243', 20);
INSERT INTO EMP VALUES
        (7934, 'MILLER', 'ALICE','CLERK',     7782,
        TO_DATE('23-01-1982', 'DD-MM-YYYY'), 1300, NULL, '0199545243',10); 

INSERT INTO SALGRADE VALUES (1,  700, 1200);
INSERT INTO SALGRADE VALUES (2, 1201, 1400);
INSERT INTO SALGRADE VALUES (3, 1401, 2000);
INSERT INTO SALGRADE VALUES (4, 2001, 3000);
INSERT INTO SALGRADE VALUES (5, 3001, 9999);