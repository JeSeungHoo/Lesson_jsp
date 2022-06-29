-- 이름, 비밀번호, 메시지
CREATE TABLE IF NOT EXISTS test_guestbook (
	id INT PRIMARY KEY AUTO_INCREMENT, -- 방명록 번호
	guestName VARCHAR(20) NOT NULL, -- 방명록 작성자
	password VARCHAR(30) NOT NULL, -- 방명록 비밀번호
	message TEXT -- 방명록 내용
);

SHOW TABLES;

DESC test_guestbook;

COMMIT;

SELECT * FROM test_guestBOOK ORDER BY id DESC;

INSERT INTO test_guestbook VALUES (NULL, '아무개', '123', '더미');
INSERT INTO test_guestbook (guestName, password, message) SELECT guestName, password, message FROM test_guestbook;
COMMIT;

SELECT * FROM test_guestbook ORDER BY id DESC LIMIT 0, 10; -- 0번째 인덱스부터 10개
SELECT count(id) FROM test_guestbook;
DELETE FROM test_guestbook;