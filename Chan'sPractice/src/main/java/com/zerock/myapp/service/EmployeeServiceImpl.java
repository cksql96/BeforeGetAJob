package com.zerock.myapp.service;

import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zerock.myapp.domain.EmployeeDTO;
import com.zerock.myapp.domain.EmployeeVO;
import com.zerock.myapp.mapper.EmployeeMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Log4j
@AllArgsConstructor

@Service
public class EmployeeServiceImpl implements EmployeeService{
	
	@Setter(onMethod_={@Autowired})
	private EmployeeMapper employeeMapper;
	
	
	@Override
	public List<EmployeeVO> getList() {
		log.info("getList() invoked...");
		
		return employeeMapper.getAllList();
	}	//getList
	
	//*******
	//CRUD	*
	//*******
	@Override
	public void register(EmployeeDTO employee) {
		log.info("register(employee) invoked...");
		
		Objects.requireNonNull(employee);
		
		employeeMapper.insert(employee);
	}	//register

	@Override
	public EmployeeVO get(String empid) {
		log.info("get(empid) invoked...");
		
		return employeeMapper.read(empid);			//sql 실행	return BoardVO 값.
	}	//get

	@Override
	public boolean modify(EmployeeDTO employee) {
		log.info("modify(employee) invoked...");
		
		int result = employeeMapper.update(employee);	//sql 실행
		
		return (result == 1);					//만약 return 값이 1이면 true, 아니면 false
	}	//modify

	@Override
	public boolean remove(String empid) {
		log.info("remove(empid) invoked...");
		
		int result = employeeMapper.delete(empid);	//sql 실행

		return (result == 1);					//만약 return 값이 1이면 true, 아니면 false
	}	//remove
	

}	//end class
