package com.zerock.myapp.service;

import java.util.List;

import com.zerock.myapp.domain.EmployeeDTO;
import com.zerock.myapp.domain.EmployeeVO;

public interface EmployeeService {
	
	
	public abstract List<EmployeeVO> getList();			
	
	public abstract void register(EmployeeDTO employee);		//등록	Create
	
	public abstract EmployeeVO get(String empid);				//보기	Read
	
	public abstract boolean modify(EmployeeDTO employee);		//수정	Update
	
	public abstract boolean remove(String empid);				//삭제	Delete

}	//end interface
