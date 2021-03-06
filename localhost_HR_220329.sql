SET SERVEROUTPUT ON;

-- 구구단 3단 출력
DECLARE
    A INTEGER := 3;
    B INTEGER := 1;
BEGIN
    DBMS_OUTPUT.PUT_LINE(A || '*' || B || '=' || A*B);
    B := B+1;
    DBMS_OUTPUT.PUT_LINE(A || '*' || B || '=' || A*B);
    B := B+1;
    DBMS_OUTPUT.PUT_LINE(A || '*' || B || '=' || A*B);
    B := B+1;
    DBMS_OUTPUT.PUT_LINE(A || '*' || B || '=' || A*B);
    B := B+1;
    DBMS_OUTPUT.PUT_LINE(A || '*' || B || '=' || A*B);
    B := B+1;
    DBMS_OUTPUT.PUT_LINE(A || '*' || B || '=' || A*B);
    B := B+1;
    DBMS_OUTPUT.PUT_LINE(A || '*' || B || '=' || A*B);
    B := B+1;
    DBMS_OUTPUT.PUT_LINE(A || '*' || B || '=' || A*B);
    B := B+1;
    DBMS_OUTPUT.PUT_LINE(A || '*' || B || '=' || A*B);
    B := B+1;
END;
/

-- 201 사원의 이름과 이메일 주소를 출력하는 익명 블록
DECLARE
    V_FIRST_NAME EMPLOYEES.FIRST_NAME%TYPE;
    V_LAST_NAME EMPLOYEES.LAST_NAME%TYPE;
    V_EMAIL EMPLOYEES.EMAIL%TYPE;
BEGIN
    SELECT FIRST_NAME, LAST_NAME, EMAIL
    INTO V_FIRST_NAME, V_LAST_NAME, V_EMAIL
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = 201;
    DBMS_OUTPUT.PUT_LINE('이름 : ' || V_FIRST_NAME || ' ' || V_LAST_NAME || ' 이메일 : ' || V_EMAIL);
END;
/

-- 사원 테이블에서 사원번호가 제일 큰 사원을 찾아낸 뒤, 이 번호+1번으로 아래의 사원 테이블에 신규 입력하는 익명 블록
SELECT * FROM EMPLOYEES;

DECLARE
    V_EMPID EMPLOYEES.EMPLOYEE_ID%TYPE;
BEGIN
    SELECT MAX(EMPLOYEE_ID) + 1 INTO V_EMPID FROM EMPLOYEES;
    DBMS_OUTPUT.PUT_LINE(V_EMPID);
    
    INSERT INTO EMPLOYEES(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL,HIRE_DATE, JOB_ID, DEPARTMENT_ID)
    VALUES (V_EMPID, 'Harrison', 'Ford', 'HARRIS', SYSDATE, 'ST_MAN', 50);
    
    COMMIT;
END;
/

DECLARE
    VN_NUM1 NUMBER := 1;
    VN_NUM2 NUMBER := 3;
BEGIN
    IF VN_NUM1 >= VN_NUM2 THEN
        DBMS_OUTPUT.PUT_LINE(VN_NUM1 || '이 큰수');
    ELSE
        DBMS_OUTPUT.PUT_LINE(VN_NUM2 || '이 큰수');
    END IF;
END;
/

DECLARE
    VN_SALARY NUMBER := 0;
    VN_DEPARTMENT_ID NUMBER := 0;
BEGIN
    VN_DEPARTMENT_ID := ROUND(DBMS_RANDOM.VALUE(10, 120), -1);
    DBMS_OUTPUT.PUT_LINE(VN_DEPARTMENT_ID);
    
    SELECT SALARY
    INTO VN_SALARY
    FROM EMPLOYEES
    WHERE DEPARTMENT_ID = VN_DEPARTMENT_ID
    AND ROWNUM = 1;
    
    DBMS_OUTPUT.PUT_LINE(VN_SALARY);
    
    IF VN_SALARY BETWEEN 1 AND 3000
        THEN DBMS_OUTPUT.PUT_LINE('낮음');
    ELSIF VN_SALARY BETWEEN 3001 AND 6000
        THEN DBMS_OUTPUT.PUT_LINE('중간');
    ELSIF VN_SALARY BETWEEN 6001 AND 10000
        THEN DBMS_OUTPUT.PUT_LINE('높음');
    ELSE
        DBMS_OUTPUT.PUT_LINE('최상위');
    END IF;
END;
/

CREATE OR REPLACE PROCEDURE PROC_TEST(V_EMAIL EMPLOYEES.EMAIL%TYPE) IS
    V_EMPID EMPLOYEES.EMPLOYEE_ID%TYPE;
BEGIN
    SELECT MAX(EMPLOYEE_ID) + 1 INTO V_EMPID FROM EMPLOYEES;
    DBMS_OUTPUT.PUT_LINE(V_EMPID);
    
    INSERT INTO EMPLOYEES(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, HIRE_DATE, JOB_ID, DEPARTMENT_ID)
    VALUES(V_EMPID, 'Harrison', 'Ford', V_EMAIL, SYSDATE, 'ST_MAN', 50);
    
    COMMIT;
END;
/

EXEC PROC_TEST('HARI5');

SELECT * FROM EMPLOYEES ORDER BY 1 DESC;                            