CREATE TABLE IF NOT EXISTS board_test (
	board_num INT PRIMARY KEY auto_increment, -- 게시물 번호
	board_title VARCHAR(50) NOT NULL, -- 게시물 제목
	board_auth VARCHAR(50) NOT NULL, -- 작성자
	board_content TEXT,			      -- 게시물 내용
	board_date TIMESTAMP DEFAULT now() -- 작성 시간
);

DESC board_test;

INSERT INTO board_test VALUES (null, '인사드립니다. 냉무', '최기근', '내용없음', CURRENT_TIMESTAMP);

INSERT INTO board_test (board_title, board_auth, board_content) VALUES ('제곧내 맛있는 거 추천 좀', '하옥형', '제곧내');

SELECT * FROM board_test;

COMMIT;

SELECT * FROM board_test ORDER BY board_num DESC;

-- MySQL 5.x version에서 ROWNUM 구하는 질의문
SELECT @ROWNUM := @ROWNUM +1 AS rnum, A.* FROM (SELECT * FROM board_test WHERE (@ROWNUM := 0) = 0 ORDER BY board_num ASC) AS A ORDER BY rnum DESC;

-- MySQL 8.x 버전에서 추가된 ROW_NUMBER()
SELECT ROW_NUMBER() OVER(ORDER BY board_num) AS rnum, board_test.* FROM board_test ORDER BY board_num DESC;