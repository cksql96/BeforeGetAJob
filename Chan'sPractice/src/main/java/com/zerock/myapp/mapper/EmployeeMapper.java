package com.zerock.myapp.mapper;

import java.util.List;

import com.zerock.myapp.domain.EmployeeDTO;
import com.zerock.myapp.domain.EmployeeVO;


public interface EmployeeMapper {
	
	
	public abstract void insert(EmployeeDTO employee);				//직원 정보 등록
	
	public abstract List<EmployeeVO> getAllList();					//직원 리스트 출력
	
	public abstract EmployeeVO read(String empid);					//직원 검색
	
	public abstract int update(EmployeeDTO employee);				//직원 정보 수정
	
	public abstract int delete(String empid);						//직원 정보 삭제	
	
	
}	//end interface
