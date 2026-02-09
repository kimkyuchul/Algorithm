-- 코드를 입력하세요
SELECT COUNT(*) AS USERS
FROM USER_INFO
WHERE AGE IS NULL;

/*
COUNT(*) → 조건에 맞는 모든 행 수 (NULL 포함)
COUNT(USER_ID) → USER_ID가 NULL이 아닌 행만 카운트

COUNT(컬럼명)은 해당 컬럼이 NULL인 행을 제외
COUNT(컬럼명)은 해당 컬럼이 NULL인 행을 제외
*/