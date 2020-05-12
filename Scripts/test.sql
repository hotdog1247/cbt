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
	

select * from exam e left join test t on e.t_no = t.t_no left join subject s on e.s_no=s.s_no where e.t_no=1;
select * from exam e left join test t on e.t_no = t.t_no where t.t_no=1;
select * from exam e left join test t on e.t_no = t.t_no where t.t_no=2;

select * from member;
delete from member where m_id = 'hotdog';