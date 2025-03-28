/*Question 3 Commented because it already exists, same for the rest.
ALTER TABLE EMP
ADD CONSTRAINT EFIRST_ENAME_TEL_unique UNIQUE (EFIRST, ENAME, TEL);
*/
/*Question 4
ALTER TABLE EMP
ADD COLUMN MOBTEL char(10);

ALTER TABLE EMP
ADD CONSTRAINT MOBTEL_check CHECK (MOBTEL LIKE '06%');
*/
/*Question 5
ALTER TABLE EMP
DROP CONSTRAINT fk_emp_dept;
ALTER TABLE EMP
ADD CONSTRAINT fk_emp_dept FOREIGN KEY (DEPTNO) REFERENCES DEPT (DEPTNO) ON DELETE CASCADE;
*/
/*Question 6
	ERROR FIXED:
	1. Row with first name "KING" has mgr collumn null, which breaks the  constraint NOT NULL
		To fix it I will put a random value to make it meet the constraint.
*/

/*Question 7*/
CREATE SEQUENCE DNO_seq
START WITH 8000
INCREMENT BY 1
MINVALUE 8000
NO CYCLE;

/*Question 8*/
INSERT INTO DEPENDENTS VALUES (nextval('DNO_seq'), 'JOHNSON', 'MARY', 7369);
INSERT INTO DEPENDENTS VALUES (nextval('DNO_seq'), 'BROWN', 'JAMES', 7876);
INSERT INTO DEPENDENTS VALUES (nextval('DNO_seq'), 'WILLIAMS', 'PATRICIA', 7900);
INSERT INTO DEPENDENTS VALUES (nextval('DNO_seq'), 'JONES', 'MICHAEL', 7934);
INSERT INTO DEPENDENTS VALUES (nextval('DNO_seq'), 'JOHNSON', 'ALICE', 7369);
INSERT INTO DEPENDENTS VALUES (nextval('DNO_seq'), 'WILSON', 'ROBERT', 7900);
INSERT INTO DEPENDENTS VALUES (nextval('DNO_seq'), 'DAVIS', 'EMILY', 7698);
INSERT INTO DEPENDENTS VALUES (nextval('DNO_seq'), 'BROWN', 'MICHAEL', 7876);
INSERT INTO DEPENDENTS VALUES (nextval('DNO_seq'), 'MILLER', 'SARAH', 7788);

/*Question 9
	Following the documentation given at the question, serial is a type which is added instead of "INT"
	for example and you can do auto-increment with it, but it has some weird behaviours that makes some
	things a bit cumbersome, so maybe is not the best option and it's already out of the standard.

	Identity, is simpler and is in the standard. It's added at creating table too but instead of a type
	it is an option added as PRIMARY KEY or NOT NULL, etc "GENERATED AS IDENTITY".

	Sequence is the one used in exercse 7. It's a separated object which increments its value and it can
	be used when generating data, in the collumn needed with "nextval(seq_name)".

	On my opinion, between identity and sequence, it is better to use identity since it's the standard
	but also it's simpler, when generating data identity generates the value but with sequence you need
	to put nextval. Maybe if you need more control with what value you want to be there, sequence could
	be better since you can use setval to change the sequence value between more options.
*/