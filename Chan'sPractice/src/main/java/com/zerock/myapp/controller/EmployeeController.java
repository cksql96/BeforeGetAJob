package com.zerock.myapp.controller;

import java.util.Objects;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.zerock.myapp.domain.EmployeeDTO;
import com.zerock.myapp.service.EmployeeService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@AllArgsConstructor
@Log4j

@RequestMapping(
		name="baseRequestMapping",
		value={ "/employee/*" }
)
@Controller
public class EmployeeController implements InitializingBean {
	
	private EmployeeService employeeService;
	

	@GetMapping(
			name = "list",
			value = "list"
	)
	public void list(Model model) {		
		log.info("list(model) invoked...");
		
		Objects.requireNonNull(model);
		
		log.info(">>>model type: " + model.getClass().getName());		
		log.info(">>>model: " + model);
			
		model.addAttribute("list", employeeService.getList());
	}	//list
	
	//***************************************
	//CRUD	- Create, Read, Update, Delete	*
	//***************************************
	
	//register.jsp파일로 들어가기 위한 GetMapping방식 구현
	@GetMapping("register")
	public void register() {
		log.info("register() invoked...");		
	}	//register
	
	@PostMapping("register")
	public String register(EmployeeDTO employee, RedirectAttributes rttrs) {
		log.info("register(employee, rttrs) invoked...");
		
		Objects.requireNonNull(employee);
		
		employeeService.register(employee);		//sql문장 실행
		
		rttrs.addFlashAttribute("result", employee.getEmpid());
		
		return "redirect:/employee/list";		//게시판 목록으로 이동
	}	//register	
	
	
	@GetMapping({"get", "update"})
	public void get(String empid, Model model) {
		log.info("get(empid, model) invoked...");
		
		Objects.requireNonNull(empid);
		
		model.addAttribute("employee", employeeService.get(empid));
	}	//get

	
	@PostMapping("modify")
	public String modify(EmployeeDTO employee, RedirectAttributes rttrs) {
		log.info("modify(employee, rttrs) invoked...");
		
		Objects.requireNonNull(employee);
		
		if(employeeService.modify(employee)) {	//sql을 실행.
			rttrs.addFlashAttribute("result", "success");
			log.info("***수정에 성공하였습니다.");
			log.info(">>>employee: " + employee);
		} else {
			log.info("***수정에 실패했거나, 수정하려는 empid가 없습니다.");
		}
		
		return "redirect:/employee/list";
	}	//modify

	
	@PostMapping("remove")
	public String remove(String empid, RedirectAttributes rttrs) {
		log.info("remove(empid, rttrs) invoked...");
		
		Objects.requireNonNull(empid);
		
		if(employeeService.remove(empid)) {	//sql을 실행한다.(들어가보면 boolean값이다.)
			rttrs.addFlashAttribute("result", "success");
			log.info("***삭제에 성공했습니다.");
		} else{
			log.info("***삭제에 실패했거나, 삭제하려는 empid가 없습니다.");
		}	//if else
		
		return "redirect:/employee/list";
	}	//remove
		
	
	//=============================================================//
	
	@Override
	public void afterPropertiesSet() throws Exception {
		log.info("afterPropertiesSet()");
		
		Objects.requireNonNull(employeeService);
		
		log.info(">>>employeeService: " + employeeService);
	}	//afterPropertiesSet

}	//end class
