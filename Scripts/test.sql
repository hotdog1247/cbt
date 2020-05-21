select * from exam e ;
select * from exam where t_no = 1 ;
select * from subject where t_no=1 and s_no=1;
select * from subject s left join test t on s.t_no = t.t_no where t.t_no=1 and s.s_no=1;
select * from subject s left join test t on s.t_no = t.t_no where t.t_no=1 and s.s_no=2;
select * from subject s left join test t on s.t_no = t.t_no where t.t_no=1 and s.s_no=3;
select * from subject s left join test t on s.t_no = t.t_no where t.t_no=1;
select * from subject s left join test t on s.t_no = t.t_no;

select * from test t;
select * from subject s ;
select * from subject where t_no=1 and s_no=1;
select * from exam;
select * from exam e left join test t on e.t_no = t.t_no left join subject s on e.s_no=s.s_no where t.t_no=1 order by e_no limit 1, 10;
select * from exam e left join test t on e.t_no = t.t_no where t.t_no=1 order by e_no limit 0, 10;

select *
	from exam;

select * from test;
select * from test where t_name='정보처리기사';
	

select * from exam e left join test t on e.t_no = t.t_no left join subject s on e.s_no=s.s_no where e.t_no=1;
select * from exam e left join test t on e.t_no = t.t_no where t.t_no=1;
select * from exam e left join test t on e.t_no = t.t_no where t.t_no=2;

select * from member;
delete from member where m_id = 'hotdog';

select * from test_result tr;

select last_insert_id() from test_result tr;
select last_insert_id();
select LAST_INSERT_ID();
select r_no from test_result order by r_no desc;
select r_no from test_result order by r_no desc limit 0, 1;

select * from incorrect i ;
select * from incorrect i left join test_result tr on i.r_no = tr.r_no;
select i.i_no from incorrect i left join test_result tr on i.r_no = tr.r_no left join test t on tr.t_no = t.t_no left join member m on tr.m_id = m.m_id;
select * from incorrect i left join test_result tr on i.r_no = tr.r_no left join test t on tr.t_no = t.t_no left join member m on tr.m_id = m.m_id where t.t_no =2;
select * from exam e left join test t on e.t_no = t.t_no left join subject s on e.s_no = s.s_no where t.t_no =1 and s.s_no =1 and e.s_no =1 and e.t_no =1;
select * from exam e left join test t on e.t_no = t.t_no left join subject s on e.s_no = s.s_no where e.s_no =1 and e.t_no =1;
select * from exam e left join subject s on e.s_no = s.s_no left join test t on e.t_no = t.t_no=s.t_no where t.t_no =2 and s.s_no =1;
select * from exam e left join subject s on e.s_no = s.s_no left join test t on e.t_no = t.t_no=s.t_no;
select * from exam e left join subject s on e.s_no = s.s_no;
select * from exam e;
select * from test t;
select * from subject s;
select * from exam where t_no =1 and s_no =1;
select * from exam e join test t on e.t_no = t.t_no join subject s on e.s_no=s.s_no and e.t_no = s.t_no where e.t_no=1 and e.s_no=1;
desc exam;
desc test;
desc subject;
select * from exam e join test t on e.t_no = t.t_no join subject s on e.s_no=s.s_no and e.t_no = s.t_no;
select * from incorrect i left join test_result tr on i.r_no = tr.r_no left join test t on tr.t_no = t.t_no left join member m on tr.m_id = m.m_id;
select * from incorrect i left join test_result tr on i.r_no = tr.r_no left join test t on tr.t_no = t.t_no left join member m on tr.m_id = m.m_id left join subject s on s.t_no = t.t_no and s.t_no = tr.t_no where tr.r_no=2;
select * from incorrect i left join test_result tr on i.r_no = tr.r_no left join test t on tr.t_no = t.t_no left join member m on tr.m_id = m.m_id where tr.r_no=2;
select * from incorrect i left join test_result tr on i.r_no = tr.r_no left join subject s on s.t_no = tr.t_no where tr.r_no=2 and s.s_no =1;

select * from incorrect i left join test_result tr on i.r_no = tr.r_no left join test t on tr.t_no = t.t_no left join member m on tr.m_id = m.m_id where tr.r_no=1;

select * from exam e where t_no =1;
select * from incorrect i ;
select * from test_result tr ;
select * from subject s left join test t on s.t_no=t.t_no where t.t_no=1;
select * from exam e left join subject s on e.s_no = s.s_no left join test t on e.t_no = t.t_no and s.t_no = t.t_no and e.t_no =s.t_no where t.t_no =1 and s.s_no =1;
select i.e_no, e.e_no, i.e_incorrect, e.e_answer from incorrect i left join exam e on i.e_no =e.e_no where i.e_incorrect != e.e_answer;
select count(*) from incorrect i left join exam e on i.e_no =e.e_no left join subject s on e.s_no = s.s_no where i.e_incorrect = e.e_answer group by s.s_no ;
select avg(i.e_incorrect = e.e_answer) from incorrect i join exam e on i.e_no =e.e_no left join subject s on e.s_no = s.s_no group by s.s_no;
select sum(e.e_no) from incorrect i join exam e on i.e_no =e.e_no left join subject s on e.s_no = s.s_no group by s.s_no;
select * from incorrect i join exam e on i.e_no =e.e_no left join subject s on e.s_no = s.s_no;
select * from incorrect i left join exam e on i.e_no =e.e_no left join subject s on e.s_no = s.s_no where i.e_incorrect != e.e_answer group by s.s_no ;
select * from exam e left join subject s on e.s_no = s.s_no group by s.s_no ;

select * from exam e join test t on e.t_no = t.t_no join subject s on e.s_no=s.s_no and e.t_no = s.t_no where e.e_no=1 and e.t_no=1 and e.s_no=1;
select * from exam e join test t on e.t_no = t.t_no join subject s on e.s_no=s.s_no and e.t_no = s.t_no where e.e_no=2 and e.t_no=1 and e.s_no=1;
select * from exam e join test t on e.t_no = t.t_no join subject s on e.s_no=s.s_no and e.t_no = s.t_no where e.t_no=1;
select * from exam e left join test t on e.t_no = t.t_no left join subject s on e.s_no=s.s_no where t.t_no=1;

select * from board b;