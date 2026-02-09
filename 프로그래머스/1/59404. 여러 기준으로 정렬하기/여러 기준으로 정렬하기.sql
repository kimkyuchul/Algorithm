-- 코드를 입력하세요
SELECT ANIMAL_ID, NAME, DATETIME
FROM ANIMAL_INS
ORDER BY NAME ASC, DATETIME DESC

/*
먼저 NAME 기준으로 오름차순 정렬
NAME이 같은 경우에만 DATETIME 기준으로 내림차순 정렬

즉, 첫 번째 조건이 우선이고, 동일한 값이 있을 때 두 번째 조건이 적용되는 방식
*/