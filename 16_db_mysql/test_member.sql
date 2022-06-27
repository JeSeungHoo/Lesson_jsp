SHOW TABLES;

CREATE TABLE IF NOT EXISTS member(
	num INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50),
	addr VARCHAR(300)
);

DESC member;

INSERT INTO member (name, addr) VALUES ('박주신', '평양');

SELECT * FROM member;