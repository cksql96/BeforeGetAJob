package com.zerock.myapp;

import static org.junit.Assert.assertNotNull;

import javax.sql.DataSource;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;


@NoArgsConstructor
@Log4j

@RunWith(SpringRunner.class)
@ContextConfiguration(locations={
		"file:src/main/webapp/WEB-INF/spring/root-context.xml"
	})

public class TestHicariCpDataSource {
	
	@Setter(onMethod_= {@Autowired})
	private DataSource dataSource;
	
	
	@Before
	public void setup() {
		System.out.println();
		log.info("setup() invoked..");
		
		assertNotNull(dataSource);
		
		log.info(dataSource);		
	}	//setup
	
	
	@Test
	public void testHikariCP() {
		System.out.println();
		log.info("testHikariCP() invoked..");
		
	}	//testHikariCP
	
	
	@After
	public void tears() {
		System.out.println();
		log.info("tears() invoked..");
		
	}	//tears

}	//end class
