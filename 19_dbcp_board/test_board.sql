DROP TABLE IF EXISTS tblBoard;

CREATE TABLE IF NOT EXISTS tblBoard(
	boardNum int PRIMARY KEY auto_increment,
	boardTitle VARCHAR(50),
	boardAuth VARCHAR(50),
	boardContent VARCHAR(300),
	boardReadCount INT(8) DEFAULT 0,
	boardDate TIMESTAMP DEFAULT now()
);

DESC tblBoard;

SELECT * FROM tblBoard;    
    
INSERT INTO tblBoard (boardTitle, boardAuth, boardContent) VALUES ('제목1', '작성자1', '내용1');   

INSERT INTO tblBoard VALUES (NULL, '제목2', '작성자2', '내용2', 0, now());

ROLLBACK;

COMMIT;

INSERT INTO tblBoard (boardTitle, boardAuth, boardContent) SELECT boardTitle, boardAuth, boardContent FROM tblBoard;
SELECT * FROM tblBoard ORDER BY boardNum DESC LIMIT 0, 15;