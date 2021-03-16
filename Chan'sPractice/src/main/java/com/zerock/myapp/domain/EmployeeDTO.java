package com.zerock.myapp.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class EmployeeDTO {
	private String empid;
	private String position;
	private String name;
	private String phone;
	private String email;
	
}	//end class
