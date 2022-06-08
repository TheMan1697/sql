-- 회원의 주소를 저장할 수 있다. 한 명의 회원 하나의 주소를 가진다.(1:1), 총 7개의 추가 필드를 소유한다.
-- 회원의 이메일을 저장할 수 있다. 유일한 값
-- 회원의 이메일이 본인 소유인 것을 인증한다.

SELECT * FROM TBL_MEMBER;
UPDATE TBL_MEMBER SET AUTH = 0;

SELECT 'private String ' || LOWER(COLUMN_NAME) || ';' FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TBL_MEMBER';

SELECT
    '<input type="hidden" name = "' ||
    LOWER(COLUMN_NAME) ||
    '" id="'||
    LOWER(COLUMN_NAME) ||
    '">'
FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TBL_MEMBER';

INSERT INTO TBL_MEMBER (
A,
B,
C,
D
) VALUES (
    1,
    2,
    3,
    4
);

SELECT
    LOWER(COLUMN_NAME) || ',',
    COLUMN_ID + 1
FROM USER_TAB_COLUMNS
WHERE TABLE_NAME = 'TBL_MEMBER'
ORDER BY COLUMN_ID;

SELECT A FROM (
    SELECT 'INSERT INTO TBL_MEMBER (' AS A, 1 FROM DUAL UNION
    SELECT ') VALUES (', 100 FROM DUAL UNION
    SELECT ');', 10000 FROM DUAL UNION
    SELECT * FROM (
        SELECT
            LOWER(COLUMN_NAME) || ',',
            COLUMN_ID + 1
        FROM USER_TAB_COLUMNS
        WHERE TABLE_NAME = 'TBL_MEMBER'
        ORDER BY COLUMN_ID) UNION
        SELECT * FROM (
        SELECT
            '?,',
            COLUMN_ID + 100
        FROM USER_TAB_COLUMNS
        WHERE TABLE_NAME = 'TBL_MEMBER'
        ORDER BY COLUMN_ID)
    ORDER BY 2
);

CREATE OR REPLACE PROCEDURE PROC_INSERT_MEMBER(
    V_ID TBL_MEMBER.ID%TYPE,
    V_PW TBL_MEMBER.PW%TYPE,
    V_NAME TBL_MEMBER.NAME%TYPE,
    V_SI TBL_MEMBER.SI%TYPE,
    V_SGG TBL_MEMBER.SGG%TYPE,
    V_EMD TBL_MEMBER.EMD%TYPE,
    V_ROADADDR TBL_MEMBER.ROADADDR%TYPE,
    V_ADDRDETAIL TBL_MEMBER.ADDRDETAIL%TYPE,
    V_ZIPNO TBL_MEMBER.ZIPNO%TYPE,
    V_ROADFULLADDR TBL_MEMBER.ROADFULLADDR%TYPE,
    V_JIBUNADDR TBL_MEMBER.JIBUNADDR%TYPE,
    V_EMAIL TBL_MEMBER.EMAIL%TYPE
) IS
BEGIN
    INSERT INTO TBL_MEMBER (ID, PW, NAME, SI, SGG, EMD, ROADADDR, ADDRDETAIL, ZIPNO, ROADFULLADDR, JIBUNADDR, EMAIL)
    VALUES (V_ID, V_PW, V_NAME, V_SI, V_SGG, V_EMD, V_ROADADDR, V_ADDRDETAIL, V_ZIPNO, V_ROADFULLADDR, V_JIBUNADDR, V_EMAIL);
    COMMIT;
END;
/

INSERT INTO TBL_MEMBER (ID, PW, NAME, SI, SGG, EMD, ROADADDR, ADDRDETAIL, ZIPNO, ROADFULLADDR, JIBUNADDR, EMAIL)
VALUES (V_PW, V_NAME, V_SI, V_SGG, V_EMD, V_ROADADDR, V_ADDRDETAIL, V_ZIPNO, V_ROADFULLADDR, V_JIBUNADDR, V_EMAIL);