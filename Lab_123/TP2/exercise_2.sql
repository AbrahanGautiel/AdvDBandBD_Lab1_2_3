/*
------------------------------------------
------------ Create Employee Table -------
------------------------------------------
CREATE TABLE EMP_MEDIUM_TABLE
       (EMPNO INTEGER,
        MANAGER_ID INTEGER,
        DEPT_ID VARCHAR(10),
        GENDER VARCHAR(2) not null,
        NAME VARCHAR(1000));

INSERT INTO EMP_MEDIUM_TABLE
SELECT     
    S AS empno,
    ROUND(random()*100) AS manager_id,
    ROUND(random()*10) AS dept_id,
    (ARRAY['M','F'])[round(random())+1] AS gender,
    gen_random_uuid() AS name_hashed
FROM generate_series(1,5000) as S;


------------------------------------------
------------ Create Project Table --------
------------------------------------------

CREATE TABLE PROJECT_MEDIUM_TABLE
       (PROJECTNO integer,
        NAME_hashed VARCHAR(100));

INSERT INTO PROJECT_MEDIUM_TABLE
SELECT     S                                                       PROJECTNO,
           gen_random_uuid() AS NAME_hashed
FROM generate_series(1,5000) as S;


------------------------------------------
---- Create Join table: Project-Employee -
------------------------------------------

CREATE TABLE PROJECT_EMP_MEDIUM_TABLE
       (PROJECTNO integer,
        EMPNO integer);

INSERT INTO PROJECT_EMP_MEDIUM_TABLE
SELECT     ROUND(random()*100) AS                                PROJECTNO,
           ROUND(random()*100) AS                                EMPNO
FROM generate_series(1,5000) as S;
*/

/*Question 2
SELECT gender, count(*) from EMP_MEDIUM_TABLE where MANAGER_ID = 7 group by gender;
*/
/*Question 3
EXPLAIN SELECT gender, count(*) from EMP_MEDIUM_TABLE where MANAGER_ID = 7 group by gender;
*/

SHOW data_directory;