-- 시험문제
DROP SCHEMA IF EXISTS cbt_project;

-- 시험문제
CREATE SCHEMA cbt_project;

-- 시험
CREATE TABLE cbt_project.test (
	t_no    INT         NOT NULL COMMENT '시험번호', -- 시험번호
	t_name  VARCHAR(20) NOT NULL COMMENT '시험명', -- 시험명
	t_year  INT         NOT NULL COMMENT '년도', -- 년도
	t_order INT         NOT NULL COMMENT '차수', -- 차수
	t_time  INT         NULL     COMMENT '제한시간' -- 제한시간
)
COMMENT '시험';

-- 시험
ALTER TABLE cbt_project.test
	ADD CONSTRAINT PK_test -- 시험 기본키
		PRIMARY KEY (
			t_no -- 시험번호
		);

-- 과목
CREATE TABLE cbt_project.subject (
	t_no   INT         NOT NULL COMMENT '시험번호', -- 시험번호
	s_no   INT         NOT NULL COMMENT '과목번호', -- 과목번호
	s_name VARCHAR(20) NOT NULL COMMENT '과목명' -- 과목명
)
COMMENT '과목';

-- 과목
ALTER TABLE cbt_project.subject
	ADD CONSTRAINT PK_subject -- 과목 기본키
		PRIMARY KEY (
			t_no, -- 시험번호
			s_no  -- 과목번호
		);

-- 문제
CREATE TABLE cbt_project.exam (
	t_no          INT  NOT NULL COMMENT '시험번호', -- 시험번호
	s_no          INT  NOT NULL COMMENT '과목번호', -- 과목번호
	e_no          INT  NOT NULL COMMENT '문제번호', -- 문제번호
	e_name        TEXT NOT NULL COMMENT '문제명', -- 문제명
	e_description iNT  NULL     COMMENT '지문', -- 지문
	e_content     TEXT NULL     COMMENT '보기1', -- 보기1
	e_content2    TEXT NULL     COMMENT '보기4', -- 보기4
	e_content3    TEXT NULL     COMMENT '보기2', -- 보기2
	e_content4    TEXT NULL     COMMENT '보기3', -- 보기3
	e_answer      INT  NOT NULL COMMENT '답', -- 답
	e_solving     TEXT NULL     COMMENT '해설', -- 해설
	e_answer_rate INT  NULL     COMMENT '정답률' -- 정답률
)
COMMENT '문제';

-- 문제
ALTER TABLE cbt_project.exam
	ADD CONSTRAINT PK_exam -- 문제 기본키
		PRIMARY KEY (
			t_no, -- 시험번호
			s_no, -- 과목번호
			e_no  -- 문제번호
		);

-- 시험결과현황
CREATE TABLE cbt_project.test_result (
	r_no     INT         NOT NULL COMMENT '결과번호', -- 결과번호
	m_id     VARCHAR(15) NULL     COMMENT '회원아이디', -- 회원아이디
	t_no     INT         NULL     COMMENT '시험번호', -- 시험번호
	r_date   DATE        NOT NULL COMMENT '응시날짜', -- 응시날짜
	r_pass   TINYINT     NULL     COMMENT '합격여부', -- 합격여부
	r_score  INT         NOT NULL COMMENT '점수', -- 점수
	r_ex_cnt INT         NOT NULL COMMENT '갯수', -- 갯수
	r_time   INT         NULL     COMMENT '시험시간' -- 시험시간
)
COMMENT '시험결과현황';

-- 시험결과현황
ALTER TABLE cbt_project.test_result
	ADD CONSTRAINT PK_test_result -- 시험결과현황 기본키
		PRIMARY KEY (
			r_no -- 결과번호
		);

ALTER TABLE cbt_project.test_result
	MODIFY COLUMN r_no INT NOT NULL AUTO_INCREMENT COMMENT '결과번호';

-- 회원
CREATE TABLE cbt_project.member (
	m_id       VARCHAR(15) NOT NULL COMMENT '회원아이디', -- 회원아이디
	m_password VARCHAR(20) NOT NULL COMMENT '회원비밀번호', -- 회원비밀번호
	m_name     VARCHAR(20) NOT NULL COMMENT '회원이름', -- 회원이름
	m_email    VARCHAR(50) NOT NULL COMMENT '회원이메일', -- 회원이메일
	m_admin    TINYINT     NOT NULL DEFAULT 0 COMMENT '관리자유무' -- 관리자유무
)
COMMENT '회원';

-- 회원
ALTER TABLE cbt_project.member
	ADD CONSTRAINT PK_member -- 회원 기본키
		PRIMARY KEY (
			m_id -- 회원아이디
		);

-- 회원 유니크 인덱스
CREATE UNIQUE INDEX UIX_member
	ON cbt_project.member ( -- 회원
		m_email ASC -- 회원이메일
	);

-- 오답
CREATE TABLE cbt_project.incorrect (
	i_no        INT  NOT NULL COMMENT '번호', -- 번호
	r_no        INT  NOT NULL COMMENT '결과번호', -- 결과번호
	e_no        INT  NOT NULL COMMENT '문제번호', -- 문제번호
	e_incorrect INT  NOT NULL COMMENT '체크값', -- 체크값
	e_solving   TEXT NULL     COMMENT '해석' -- 해석
)
COMMENT '오답';

-- 오답
ALTER TABLE cbt_project.incorrect
	ADD CONSTRAINT PK_incorrect -- 오답 기본키
		PRIMARY KEY (
			i_no -- 번호
		);

ALTER TABLE cbt_project.incorrect
	MODIFY COLUMN i_no INT NOT NULL AUTO_INCREMENT COMMENT '번호';

-- 게시판
CREATE TABLE cbt_project.board (
	b_no      INT          NOT NULL COMMENT '게시판번호', -- 게시판번호
	m_id      VARCHAR(15)  NOT NULL COMMENT '회원아이디', -- 회원아이디
	b_title   VARCHAR(100) NOT NULL COMMENT '게시판제목', -- 게시판제목
	b_content TEXT         NOT NULL COMMENT '게시판내용', -- 게시판내용
	b_date    TIMESTAMP    NOT NULL DEFAULT now() COMMENT '작성시간', -- 작성시간
	view_cnt  INT          NULL     COMMENT '조회수', -- 조회수
	reply_cnt INT          NULL     COMMENT '댓글수' -- 댓글수
)
COMMENT '게시판';

-- 게시판
ALTER TABLE cbt_project.board
	ADD CONSTRAINT PK_board -- 게시판 기본키
		PRIMARY KEY (
			b_no -- 게시판번호
		);

ALTER TABLE cbt_project.board
	MODIFY COLUMN b_no INT NOT NULL AUTO_INCREMENT COMMENT '게시판번호';

-- 댓글
CREATE TABLE cbt_project.reply (
	r_no      INT         NOT NULL COMMENT '댓글번호', -- 댓글번호
	m_id      VARCHAR(15) NOT NULL COMMENT '회원아이디', -- 회원아이디
	b_no      INT         NOT NULL COMMENT '게시판번호', -- 게시판번호
	r_content TEXT        NOT NULL COMMENT '댓글내용', -- 댓글내용
	r_date    TIMESTAMP   NOT NULL DEFAULT now() COMMENT '작성시간' -- 작성시간
)
COMMENT '댓글';

-- 댓글
ALTER TABLE cbt_project.reply
	ADD CONSTRAINT PK_reply -- 댓글 기본키
		PRIMARY KEY (
			r_no, -- 댓글번호
			m_id, -- 회원아이디
			b_no  -- 게시판번호
		);

ALTER TABLE cbt_project.reply
	MODIFY COLUMN r_no INT NOT NULL AUTO_INCREMENT COMMENT '댓글번호';

-- 이미지
CREATE TABLE cbt_project.image (
	i_name    VARCHAR(150) NOT NULL COMMENT '이미지이름', -- 이미지이름
	b_no      INT          NOT NULL COMMENT '게시판번호', -- 게시판번호
	i_regdate TIMESTAMP    NULL     DEFAULT now() COMMENT '등록날짜' -- 등록날짜
)
COMMENT '이미지';

-- 이미지
ALTER TABLE cbt_project.image
	ADD CONSTRAINT PK_image -- 이미지 기본키
		PRIMARY KEY (
			i_name -- 이미지이름
		);

-- 과목
ALTER TABLE cbt_project.subject
	ADD CONSTRAINT FK_test_TO_subject -- 시험 -> 과목
		FOREIGN KEY (
			t_no -- 시험번호
		)
		REFERENCES cbt_project.test ( -- 시험
			t_no -- 시험번호
		);

-- 문제
ALTER TABLE cbt_project.exam
	ADD CONSTRAINT FK_subject_TO_exam -- 과목 -> 문제
		FOREIGN KEY (
			t_no, -- 시험번호
			s_no  -- 과목번호
		)
		REFERENCES cbt_project.subject ( -- 과목
			t_no, -- 시험번호
			s_no  -- 과목번호
		);

-- 시험결과현황
ALTER TABLE cbt_project.test_result
	ADD CONSTRAINT FK_member_TO_test_result -- 회원 -> 시험결과현황
		FOREIGN KEY (
			m_id -- 회원아이디
		)
		REFERENCES cbt_project.member ( -- 회원
			m_id -- 회원아이디
		);

-- 시험결과현황
ALTER TABLE cbt_project.test_result
	ADD CONSTRAINT FK_test_TO_test_result -- 시험 -> 시험결과현황
		FOREIGN KEY (
			t_no -- 시험번호
		)
		REFERENCES cbt_project.test ( -- 시험
			t_no -- 시험번호
		);

-- 오답
ALTER TABLE cbt_project.incorrect
	ADD CONSTRAINT FK_test_result_TO_incorrect2 -- 시험결과현황 -> 오답2
		FOREIGN KEY (
			r_no -- 결과번호
		)
		REFERENCES cbt_project.test_result ( -- 시험결과현황
			r_no -- 결과번호
		);

-- 게시판
ALTER TABLE cbt_project.board
	ADD CONSTRAINT FK_member_TO_board -- 회원 -> 게시판
		FOREIGN KEY (
			m_id -- 회원아이디
		)
		REFERENCES cbt_project.member ( -- 회원
			m_id -- 회원아이디
		);

-- 댓글
ALTER TABLE cbt_project.reply
	ADD CONSTRAINT FK_board_TO_reply -- 게시판 -> 댓글
		FOREIGN KEY (
			b_no -- 게시판번호
		)
		REFERENCES cbt_project.board ( -- 게시판
			b_no -- 게시판번호
		);

-- 댓글
ALTER TABLE cbt_project.reply
	ADD CONSTRAINT FK_member_TO_reply -- 회원 -> 댓글
		FOREIGN KEY (
			m_id -- 회원아이디
		)
		REFERENCES cbt_project.member ( -- 회원
			m_id -- 회원아이디
		);
	
-- 사용자 추가
drop user if exists 'user_cbt_project'@'localhost';
grant all privileges on cbt_project.* to 'user_cbt_project'@'localhost' identified by 'rootroot';
flush privileges;