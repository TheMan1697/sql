SELECT
    SYSDATE,
    TO_CHAR(SYSDATE, 'MM/DD') MD,
    TO_CHAR(NULL, 'MM/DD') NV,
    TO_CHAR(SYSDATE, NULL) NV2
FROM DUAL;

SELECT AVG(MYVAL)
FROM (
    SELECT 1000 MYVAL FROM DUAL
    UNION ALL
    SELECT NULL FROM DUAL
    UNION ALL
    SELECT NULL MYVAL FROM DUAL
    UNION ALL
    SELECT 2000 MYVAL FROM DUAL
);
    
SELECT (1000+ NULL + NULL + NULL + 2000) / 5 FROM DUAL;

-- 교수 테이블에서 이름, 직급, 보직수당을 출력하여라.
SELECT * FROM PROFESSOR;

SELECT NAME, POSITION, COMM
FROM PROFESSOR;

-- 교수 테이블에서 보직수당을 받는 교수의 이름, 직급, 보직수당을 출력하여라.
SELECT NAME, POSITION, COMM
FROM PROFESSOR
WHERE COMM IS NOT NULL;

-- 교수 테이블에서 급여에 보직수당을 더한 값을 sal_com이라는 별명으로 출력하여라.
SELECT NAME, SAL, COMM, SAL+COMM sal_com
FROM professor;

-- 102번 학과의 학생 중에서 1학년 또는 4학년 학생의 이름, 학번, 학과번호를 출력하여라.
SELECT NAME, GRADE, DEPTNO
FROM STUDENT
WHERE
    DEPTNO = 102
    AND (GRADE = '1' OR GRADE = '4');
    
-- 1학년이면서 몸무게가 70kg 이상인 학생의 집합(stud_heavy)과
-- 1학년이면서 101번 학과에 소속된 학생(stud_101)으로 구성된 두 개의 테이블 생성

CREATE TABLE STUD_HEAVY AS
SELECT *
FROM STUDENT
WHERE GRADE = 1 AND WEIGHT >= 70;

CREATE TABLE STUD_101 AS
SELECT *
FROM STUDENT
WHERE GRADE = 1 AND DEPTNO = 101;

SELECT * FROM STUD_HEAVY;
SELECT * FROM STUD_101;

SELECT STUDNO, NAME, DEPTNO, WEIGHT
FROM STUD_HEAVY
UNION
SELECT STUDNO, NAME, DEPTNO, WEIGHT
FROM STUD_101;

SELECT STUDNO, NAME, DEPTNO, WEIGHT
FROM STUD_HEAVY
UNION ALL
SELECT STUDNO, NAME, DEPTNO, WEIGHT
FROM STUD_101;

SELECT STUDNO, NAME, DEPTNO, WEIGHT
FROM STUD_HEAVY
INTERSECT
SELECT STUDNO, NAME, DEPTNO, WEIGHT
FROM STUD_101;

SELECT STUDNO, NAME, DEPTNO, WEIGHT
FROM STUD_HEAVY
MINUS
SELECT STUDNO, NAME, DEPTNO, WEIGHT
FROM STUD_101;

/*
1 2 3
4 5 6
7 8 9
*/
SELECT '1 2 3' FROM DUAL
UNION
SELECT '4 5 6' FROM DUAL
UNION
SELECT '7 8 9' FROM DUAL;

SELECT (ROWNUM-1)*3+1 N1, (ROWNUM-1)*3+2 N2, (ROWNUM-1)*3+3 N3
FROM STUDENT
WHERE ROWNUM <= 3;

-- 학생 테이블에서 이름을 가나다 순으로 정렬하여 이름, 학년, 전화번호를 출력하여라.
SELECT NAME, GRADE, TEL
FROM STUDENT
ORDER BY 1;

-- 학생 테이블에서 학년을 내림차순으로 정렬하여 이름, 학년, 전화번호를 출력하여라.
SELECT NAME, GRADE, TEL
FROM STUDENT
ORDER BY 2 DESC;

-- 학생 테이블에서 학년을 내림차순, 이름 내림차순으로 정렬하여 이름, 학년, 전화번호를 출력하여라.
SELECT NAME, GRADE, TEL
FROM STUDENT
ORDER BY 2 DESC, 1 DESC;

-- 학생 테이블에서 학번, 이름, 탄생년도를 조회
SELECT * FROM STUDENT;
SELECT STUDNO, NAME, TO_CHAR(BIRTHDATE, 'YYYY') BIRTH_YEAR
FROM STUDENT;

-- 학생 테이블에서 평균키, 평균 몸무게를 조회
SELECT AVG(HEIGHT), AVG(WEIGHT)
FROM STUDENT;

-- 학생테이블에서 "김영균" 학생의 이름, 사용자 아이디를 출력하여라. 그리고 사용자 아이디의 첫문자를 대문자로 변환하여 출력하여라.
SELECT NAME, INITCAP(USERID), LOWER(INITCAP(USERID)), UPPER(INITCAP(USERID))
FROM STUDENT
WHERE NAME = '김영균';

-- 부서 테이블에서 부서이름의 길이를 문자수와 바이트 수로 각각 출력하여라.
SELECT DNAME, LENGTH(DNAME), LENGTHB(DNAME)
FROM DEPARTMENT;

-- 학생 테이블에서 1학년 학생의 주민등록번호에서
-- 생년월일과 태어난 달을 추출하여 이름, 주민번호, 생년월일, 태어난 달을 출력하여라.
SELECT NAME, IDNUM, SUBSTR(IDNUM, 0, 6) BIRTHNUM, SUBSTR(IDNUM, 3, 2) || '월' BIRTHMONTH
FROM STUDENT
WHERE GRADE = 1;

SELECT 1, '12345678901234567890' FROM DUAL
UNION
SELECT 2, 'CORPORATE FLOOR' FROM DUAL
UNION
SELECT 3, TO_CHAR(INSTR('CORPORATE FLOOR', 'OR')) FROM DUAL
UNION
SELECT 4, TO_CHAR(INSTR('CORPORATE FLOOR', 'OR', 3)) FROM DUAL
UNION
SELECT 5, TO_CHAR(INSTR('CORPORATE FLOOR', 'OR', 3, 2)) FROM DUAL
UNION
SELECT 6, TO_CHAR(INSTR('CORPORATE FLOOR', 'OR', -3)) FROM DUAL
UNION
SELECT 7, TO_CHAR(INSTR('CORPORATE FLOOR', 'OR', -3, 2)) FROM DUAL;