SET SERVEROUTPUT ON;
SET TIMING ON;

DECLARE
    vi_num NUMBER;
BEGIN
    vi_num := 100;
    DBMS_OUTPUT.PUT_LINE(vi_num);
END;
/

DECLARE
    A INTEGER := 2**2*3**2;
BEGIN
    DBMS_OUTPUT.PUT_LINE('A = ' || A);
END;
/

DECLARE
    -- V_NAME VARCHAR2(100);
    V_NAME STUDENT.NAME%TYPE;
    -- V_DEPTNO NUMBER;
    V_DEPTNO STUDENT.DEPTNO%TYPE;
BEGIN
    SELECT NAME, DEPTNO
    INTO V_NAME, V_DEPTNO
    FROM STUDENT
    WHERE STUDNO = 10101;
    DBMS_OUTPUT.PUT_LINE(V_NAME || '-' || V_DEPTNO);
END;
/
