-- 숫자형 함수

SELECT ABS(2), ABS(-2);

SELECT 234%10, MOD(234,10);

SELECT FLOOR(1.23), FLOOR(-1.23);
-- 1.23 실수보다 바로 밑에 있는 정수값

SELECT CEILING(1.23), CEILING(-1.23);
-- 바로 위에 있는 정수값

SELECT ROUND(1.49), ROUND(-1.58), ROUND(1.58);
-- 가장 근접한 정수값

SELECT POW(2,2),POWER(2,-2);
-- x의 y제곱 승 반환

SELECT SIGN(-2.67), SIGN(0), SIGN(2000000);
-- 음수:-1, 양수:1 출력

SELECT GREATEST(10,20,30),GREATEST('C1','C','CA'), LEAST('C1','C','CA');
-- 가장 큰 값 반환, 가장 작은 값 반환

