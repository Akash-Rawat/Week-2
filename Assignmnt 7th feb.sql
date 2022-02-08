SELECT * from emp;
select empno, ename,deptno,sal from emp;

--row no function
SELECT empno, ename, deptno, sal, ROW_NUMBER() OVER(ORDER BY sal)
FROM emp
ORDER BY deptno, sal DESC;

SELECT empno, ename, deptno, sal, ROW_NUMBER() OVER(PARTITION BY deptno ORDER BY deptno,sal)
FROM emp
ORDER BY sal;

--rank the salary in emp table
SELECT empno, ename, deptno, sal, RANK() OVER(ORDER BY sal)
FROM emp
ORDER BY  sal;

--find the rank of 2975 OVER oder by sal
SELECT RANK(2975) WITHIN GROUP (ORDER BY sal)
from emp
ORDER BY Sal;

SELECT RANK(select sal from emp where sal =2975) from emp;

--frind the rank of martin order by sal
SELECT RANK('MARTIN') WITHIN GROUP (ORDER BY ename)
from emp
ORDER BY ename;

--DENSE_RANK
SELECT empno, ename, deptno, sal, DENSE_RANK() OVER(ORDER BY sal)
FROM emp
ORDER BY  sal;

--MIN MAX
SELECT deptno,
MIN(sal), MAX(sal)
FROM emp
ORDER by deptno;

--if employee has minimum comm then consider his sal as min
--if employee has max comm, then his sal is maximum
--if employee dont have comm or comm is null, then check his salary. If that salary is low he has minimum salary.
--if employee dont have comm or comm is null, then check his salary. If that salary is high he has maximum salary.
--if employee has a comm which is min however min(Sal) has more smaller value we will cosider that as a low salary
--if employee has a comm which is max however min(Sal) has more smaller value we will cosider that as a max salary
SELECT  deptno,
    min(sal) keep(DENSE_RANK FIRST ORDER BY comm), --30 DEPT min sal is 950, when min(comm) is 0 sal is 1500
    max(sal) keep(DENSE_RANK LAST ORDER BY comm) ----30 DEPT max sal is 3000, when max(comm) is 1400 sal is 1250
FROM emp
GROUP BY deptno
ORDER BY deptno;
UPDATE emp set comm=NULL where empno=7900; 

SELECT empno, ename, deptno, sal,comm, DENSE_RANK() OVER(PARTITION BY deptno ORDER BY comm)
FROM emp
ORDER BY  deptno,sal,comm;



--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
select empno,deptno,ename,sal from emp;
SELECT empno, deptno, ename, sal
FROM emp
ORDER BY deptno, sal;
--Salary of employee in descending order
SELECT empno, deptno, ename, sal
FROM emp
ORDER BY deptno, sal DESC;

--row function
SELECT empno, ename, deptno, sal, ROW_NUMBER() OVER(ORDER BY deptno,sal) AS My_Row_number
FROM emp
ORDER BY deptno, sal DESC;

--deptwise partition of rownumber with order by salary
SELECT empno, ename, deptno, sal, ROW_NUMBER() OVER (PARTITION BY deptno ORDER BY deptno, sal) AS my_Row_number
FROM emp
ORDER BY deptno, sal;

--rank function
-- ranking as per salary in emp table
SELECT empno, ename, deptno, sal, RANK() OVER (ORDER BY SAL) AS My_Rank
FROM emp
ORDER BY deptno,sal;

SELECT empno, ename, deptno, sal, RANK() OVER (ORDER BY SAL) AS My_Rank
FROM emp
ORDER BY my_rank;
--dept wise salary ranking
SELECT empno, ename, deptno, sal, RANK() OVER (PARTITION BY deptno ORDER BY SAL) AS My_Rank
FROM emp
ORDER BY deptno,sal;

--find the rank of 2975 over order by sal
SELECT RANK(2975) WITHIN GROUP(ORDER BY sal)
FROM emp
ORDER BY sal;

--find the rank of MARTIN order by ename
SELECT rank('MARTIN') WITHIN GROUP (ORDER BY ename)
FROM emp;

--DENSE RANK
SELECT empno, ename, deptno, sal, DENSE_RANK() OVER (ORDER BY SAL) AS My_Rank
FROM emp
ORDER BY deptno,sal;

SELECT empno, ename, deptno, sal, DENSE_RANK() OVER (PARTITION BY deptno ORDER BY SAL) AS My_Rank
FROM emp
ORDER BY deptno,sal;

--min and max salary but dept wise
SELECT deptno, MIN(sal), MAX(sal)
FROM emp
GROUP BY deptno
ORDER BY deptno;

SELECT empno, deptno, sal, comm
FROM emp
ORDER BY deptno, sal, comm;

SELECT deptno,
    MIN(sal) KEEP(DENSE_RANK FIRST ORDER BY comm) AS min_Sal,
    MAX(SAL) KEEP(DENSE_RANK LAST ORDER BY comm) AS max_Sal
FROM
    emp
GROUP BY
    deptno
ORDER BY
    deptno;
    
--7thfeb sql queries

SELECT
    empno,ename,dname
FROM    
    emp JOIN dept ON emp.deptno=dept.deptno;

SELECT empno, ename, dname
FROM emp JOIN dept
ON emp.deptno=dept.deptno;

--Get the branchname( branch) for every department (deptno,dname)
-- branch == branchno == dept
SELECT deptno, dname, branchname
FROM dept JOIN branch
ON dept.branchno=branch.branchno;

--###### outer query #####################################################    
--Get the deptname (dept(dname) for every employee(empno,ename)
--including employees not working in any department
-- emp == deptno == dept
--###########################################################
SELECT e.empno, e.ename, d.dname
FROM emp e RIGHT OUTER JOIN dept d
ON e.deptno=d.deptno;

SELECT e.empno, e.ename, d.dname
FROM emp e RIGHT OUTER JOIN dept d
ON e.deptno=d.deptno;

SELECT e.empno, e.ename, d.dname
FROM emp e FULL OUTER JOIN dept d
ON e.deptno=d.deptno;

--###########################################################
--Get the manager names of every employee
-- manager name== employee name
-- emp(mgr)==empno == emp 
-- emp join emp ==> self join
--empno,ename managename

SELECT e.empno, e.ename, m.ename as mname
FROM emp e JOIN emp m
ON e.mgr=m.empno;

SELECT e.empno, e.ename, m.ename as mname
FROM emp e JOIN emp m
ON e.mgr=m.empno;

SELECT
    empno,ename,dname
FROM    
     emp,dept WHERE emp.deptno=dept.deptno;
SELECT empno, ename, dname
FROM emp, dept WHERE emp.deptno=dept.deptno;
SELECT
    empno,ename,dname
FROM    
     emp,dept 
ORDER BY empno;
SELECT
    empno,ename,dname
FROM    
     emp cross join dept ;

    
    
























