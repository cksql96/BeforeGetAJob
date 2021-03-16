package com.zerock.myapp.mapper;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.zerock.myapp.domain.EmployeeDTO;
import com.zerock.myapp.domain.EmployeeVO;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;


@NoArgsConstructor
@Log4j

@RunWith(SpringRunner.class)
@ContextConfiguration(locations= {
		"file:src/main/webapp/WEB-INF/spring/root-context.xml"
})
public class TestEmployeeMapper {
	
	@Setter(onMethod_ = {@Autowired})
	private EmployeeMapper employeeMapper;
	
	private List<EmployeeVO> employeeList;
	
	@Before
	public void setup() {
		log.info("============================================");
		log.info("setup() invoked...");
		
		assertNotNull(employeeMapper);
//		Objects.requireNonNull(boardMapper);
		
		log.info(">>>Type: " + employeeMapper.getClass().getName());
		log.info(">>>boardMapper: " + employeeMapper);
	}	//setup
	//==============================================================//
	
	
	//등록	
	@Test(timeout=3000)
	public void testInsert() {
		log.info("--------------------------------------------");
		log.info("testInsert() invoked...");
			
		EmployeeDTO emp = new EmployeeDTO();
		
		emp.setPosition("부회장");
		emp.setName("데데헷");
		emp.setPhone("010-1111-2222");
		emp.setEmail("bbb@bbb.com");
		
		employeeMapper.insert(emp);
		
		log.info(">>>board: " + emp);
	}	//testInsert
	
	//전체보기
	@Test(timeout=3000)
	public void testGetAllList() {
		log.info("--------------------------------------------");
		log.info("testGetAllList() invoked...");
			
		employeeList = employeeMapper.getAllList();
		
		//3rd method: 메소드 참조
		employeeList.forEach(log::info);
		
		employeeList.clear();
	}	//testGetAllList

	//찾아서 보기
	@Test(timeout=3000)
	public void testRead() {
		log.info("--------------------------------------------");
		log.info("testRead() invoked...");
		
		log.info(">>>read: " + employeeMapper.read("1") );
	}	//testRead
	
	//삭제
	@Test(timeout=3000)
	public void testDelete() {
		log.info("--------------------------------------------");
		log.info("testDelete() invoked...");
		
		int result = employeeMapper.delete("1");
		
		log.info("삭제된 행의 개수: " + result);
		
	}	//testDelete
	//--------------------------------------------------------------//
	
	//업데이트
	@Test(timeout=3000)
	public void testUpdate() {
		log.info("--------------------------------------------");
		log.info("testUpdate() invoked...");		

		EmployeeDTO emp = new EmployeeDTO();
		
		emp.setPosition("수정 회장");
		emp.setName("수정 이름");
		emp.setPhone("수정 번호");
		emp.setEmail("수정 이메일");
		
		emp.setEmpid("1");
		
		int result = employeeMapper.update(emp);
		
		log.info(">>>업데이트 된 행의 개수: " + result + "개");		
		
	}	//testUpdate
	
	
	//==============================================================//
	
	@After
	public void tears() {
		log.info("--------------------------------------------");
		log.info("tears() invoked...\n");
		
		if(employeeList != null) {
			employeeList.clear();
		}	//if
		
	}	//tears
	
}	//end class
