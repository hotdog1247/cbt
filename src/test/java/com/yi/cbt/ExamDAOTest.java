package com.yi.cbt;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yi.domain.ExamVO;
import com.yi.domain.SubjectVO;
import com.yi.domain.TestVO;
import com.yi.persistence.ExamDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
public class ExamDAOTest {
	
	@Autowired
	private ExamDAO dao;
		
	@Test
	public void testInsert() throws Exception {
		TestVO testVO = new TestVO();
		testVO.settNo(1);
		SubjectVO subjectVO = new SubjectVO();
		subjectVO.setsNo(1);
		ExamVO examVO = new ExamVO();
		examVO.settNo(testVO);
		examVO.setsNo(subjectVO);
		examVO.seteNo(21);
		examVO.seteName("테스트 문제 이름");
		examVO.seteContent("테스트 문항1");
		examVO.seteContent2("테스트 문항2");
		examVO.seteContent3("테스트 문항3");
		examVO.seteContent4("테스트 문항4");
		examVO.seteAnswer(2);
		dao.insert(examVO);
	}
	
	@Test
	public void testReadByNo() throws Exception {
		TestVO tNo = new TestVO();
		tNo.settNo(1);
		SubjectVO sNo = new SubjectVO();
		sNo.setsNo(1);
		int eNo = 21;	
		dao.readByNo(tNo, sNo, eNo);
	}
	
	@Test
	public void testList() throws Exception {
		dao.list();
	}
	
	@Test
	public void testUpdate() throws Exception {
		TestVO testVO = new TestVO();
		testVO.settNo(1);
		SubjectVO subjectVO = new SubjectVO();
		subjectVO.setsNo(1);
		ExamVO vo = new ExamVO();
		vo.settNo(testVO);
		vo.setsNo(subjectVO);
		vo.seteNo(21);
		vo.seteAnswerRate(50);
		dao.update(vo);
	}
	
	@Test
	public void testDelete() throws Exception {
		TestVO testVO = new TestVO();
		testVO.settNo(1);
		SubjectVO subjectVO = new SubjectVO();
		subjectVO.setsNo(1);
		ExamVO vo = dao.readByNo(testVO, subjectVO, 21);
		dao.delete(vo);
	}
}
