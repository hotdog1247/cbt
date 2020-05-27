insert into test values
(1, '정보처리기사', 2019, 3, 9000),
(2, '리눅스마스터 2급', 2019, 3, 6000),
(3, '정보처리기사', 2018, 2, 9000);
insert into subject values
(1, 1, '데이터베이스'),
(1, 2, '전자 계산기 구조'),
(1, 3, '운영체제'),
(1, 4, '소프트웨어 공학'),
(1, 5, '데이터 통신'),
(2, 1, '리눅스 운영 및 관리'),
(2, 2, '리눅스 활용'),
(3, 1, '데이터베이스'),
(3, 2, '전자 계산기 구조'),
(3, 3, '운영체제'),
(3, 4, '소프트웨어 공학'),
(3, 5, '데이터 통신');

insert into member values
('hotdog', 'dlarlqor@100%', '이상원', 'ku0788@naver.com', 3);

-- exam 문제 테이블을 csv file에서 데이터 불러옴
desc exam;
load data local infile 'C:/Users/lenovo/Desktop/cbt/exam_data.csv'
into table cbt_project.exam
character set 'utf8'
fields terminated by '\t'
ignore 1 lines;












	
