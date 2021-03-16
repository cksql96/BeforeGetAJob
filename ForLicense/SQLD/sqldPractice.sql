CREATE TABLE A (
    가 VARCHAR(5) PRIMARY KEY,
    나 VARCHAR(5) NOT NULL,
    다 INT NOT NULL
);

drop table 지역별매출;
drop table tab2;


insert into tab1(col1) values('1');
insert into tab1 values('2','''''');

INSERT INTO A VALUES('001', 'A001', 100);
INSERT INTO A VALUES('002', 'A001', 200);
INSERT INTO A VALUES('003', 'A002', 100);
INSERT INTO A VALUES('004', 'A002', 200);
INSERT INTO A VALUES('005', 'A002', 200);
INSERT INTO A VALUES('006', 'A003', 100);
INSERT INTO A VALUES('007', 'A003', 200);
INSERT INTO A VALUES('008', 'A003', 100);
INSERT INTO A VALUES('009', 'A003', 200);
INSERT INTO A VALUES('010', 'A004', 200);

SELECT *
FROM
    A;


SELECT 
    MAX(가) AS "가",
    나,
    SUM(다) AS "다",
    COUNT(*)
FROM
    A
GROUP BY
    나
HAVING
    COUNT(*) >= 1
ORDER BY
    다 DESC;


SELECT COUNT(*)
FROM(
    SELECT A.col1, B.col3
    FROM tab1 A INNER JOIN tab2 B
        ON (A.col1 = B.col1)                --결과값 5개
    UNION
    SELECT A.col1, B.col3
    FROM tab1 A LEFT OUTER JOIN tab2 B
        ON (A.col1 = B.col1)                --통합 실행시 결과값 5, 따로 실행시 결과값 5
    UNION
    SELECT col1, col3
    FROM tab1 NATURAL INNER JOIN tab2       --통합 실행시 결과값 5, 따로 실행시 결과값 5
);

SELECT 
    TO_CHAR( TO_DATE('2015.01.10 10', 'YYYY.MM.DD HH24')   + 1/24/(60/10), 'YYYY.MM.DD HH24:MI:SS' ) 
FROM dual;


CREATE TABLE 지역별매출(
    지역 VARCHAR2(10),
    매출금액 VARCHAR2(10),
    년 VARCHAR2(4)
);

DROP TABLE 지역별매출;

INSERT INTO 지역별매출 VALUES('서울', '1000', '2020');
INSERT INTO 지역별매출 VALUES('경기', '2000', '2020');
INSERT INTO 지역별매출 VALUES('전라', '3000', '2019');
INSERT INTO 지역별매출 VALUES('강원', '4000', '2019');
INSERT INTO 지역별매출 VALUES('경상', '5000', '2019');

SELECT 지역, SUM(매출금액) AS "매출금액"
FROM 지역별매출
GROUP BY 지역
ORDER BY 매출금액 DESC;

SELECT 지역, 매출금액
FROM 지역별매출
ORDER BY 년 ASC;

SELECT 지역, SUM(매출금액) AS 매출금액
FROM 지역별매출
GROUP BY 지역
ORDER BY 년 ASC;

SELECT 지역, SUM(매출금액) AS "매출금액"
FROM 지역별매출
GROUP BY 지역
HAVING SUM(매출금액) > 100
ORDER BY COUNT(*) ASC;


-- 1. FROM
-- 2. WHERE
-- 3. GROUP BY
-- 4. HAVING
-- 5. SELECT
-- 6. ORDER BY

CREATE TABLE 팀별성적(
    팀명 VARCHAR2(10),
    승리건수 NUMBER(4),
    패배건수 NUMBER(4)
);

INSERT INTO 팀별성적 VALUES('A팀', '120', '80');
INSERT INTO 팀별성적 VALUES('B팀', '20', '180');
INSERT INTO 팀별성적 VALUES('C팀', '10', '190');
INSERT INTO 팀별성적 VALUES('D팀', '100', '100');
INSERT INTO 팀별성적 VALUES('E팀', '110', '90');
INSERT INTO 팀별성적 VALUES('F팀', '100', '100');
INSERT INTO 팀별성적 VALUES('G팀', '70', '130');

SELECT TOP(3) WITH TIES 팀명, 승리건수
FROM 팀별성적;

-- SELECT 
--     T.팀명, 
--     T.승리건수
-- FROM 
--     (
--         SELECT *
--         FROM
--             팀별성적
--         ORDER BY 승리건수 DESC
--     ) T
-- WHERE ROWNUM <= (CASE WHEN
--                             (
--                                 SELECT 
--                                     B.승리건수
--                                 FROM(
--                                         SELECT 팀명, 승리건수, 패배건수, RANK() OVER(ORDER BY 승리건수 DESC, 팀명 ASC) RK
--                                         FROM
--                                             팀별성적
--                                         ORDER BY 승리건수 DESC
--                                     ) B
--                                 WHERE B.RK = 3
--                             )
--                             =
--                             (
--                                 SELECT 
--                                     B.승리건수
--                                 FROM(
--                                         SELECT 팀명, 승리건수, 패배건수, RANK() OVER(ORDER BY 승리건수 DESC, 팀명 ASC) RK
--                                         FROM
--                                             팀별성적
--                                         ORDER BY 승리건수 DESC
--                                     ) B
--                                 WHERE B.RK = 4
--                             ) 
--                 THEN 4 ELSE 3 END);

SELECT 
    T.팀명,
    T.승리건수
FROM 
    (
        SELECT 팀명, 승리건수, 패배건수, RANK() OVER(ORDER BY 승리건수 DESC) RK
        FROM
            팀별성적
        ORDER BY 승리건수 DESC
    ) T
WHERE T.RK <= 3;




UPDATE 팀별성적 SET 승리건수 = '100' WHERE 팀명 = 'F팀';

SELECT * FROM 팀별성적;



SELECT 
    팀명, 
    승리건수
FROM 
    팀별성적
WHERE ROWNUM <= 3
ORDER BY  승리건수 DESC;

SELECT 팀명, 승리건수, RANK() OVER(ORDER BY 승리건수 DESC) FROM 팀별성적;