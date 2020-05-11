package com.yi.cbt;

import java.sql.Connection;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
//Junit으로 테스트를 위해 싱글톤을 생성함
public class DataSourceTest {
	
	@Autowired//Spring container안에 DateSource type을 가진 싱글톤을 자동 주입시킴
	private DataSource ds;
	
	@Test
	public void testDs() {
		System.out.println("ds : "+ds);
	}
	@Test
	public void testConnection() {
		try (Connection con = ds.getConnection()){
			System.out.println("con : "+con);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
