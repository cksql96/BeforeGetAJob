<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>


<html lang='ko'>

<head>
	<meta charset="UTF-8">
	<title>Modify Delete</title>
	
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>

<body>

	<script>
				
		$(function() {
			
			var formObj = $("form");
			
			$('button').on('click', function(e){
		
				e.preventDefault();
				
				var oper = $(this).data("oper");		//button들의 data-oper
				
				switch(oper) {
					case "modify":
						formObj.attr("action", "modify");
						break;
						
					case "remove":
						formObj.attr("action", "/employee/remove");
						
						formObj.find("input[name='position']").remove();
						formObj.find("textarea[name='name']").remove();
						formObj.find("input[name='phone']").remove();
						formObj.find("input[name='email']").remove();
						break;
						
					case "list":
						formObj.attr("action", "/employee/list");
						formObj.attr("method", "get");
						
						formObj.find("input[name='position']").remove();
						formObj.find("textarea[name='name']").remove();
						formObj.find("input[name='phone']").remove();
						formObj.find("input[name='email']").remove();					
						break;
					default:
						return;
				}	//switch(oper)
				
				formObj.submit();
			
			});	//.on
			
		});	//jQuery
	</script>

    <h1>수정 및 삭제</h1>
    
    <form role="form" action="#" method="post">
	    <table border="1">
	    	<tr>
	            <td>직원번호</td>
	            <td>직급</td>
	            <td>이름</td>
	            <td>번호</td>
	            <td>이메일</td>
	        </tr>
	        
	    	<tr>	    		
				<td>
					<input 
						name="empid" 
						value='<c:out value="${employee.empid}" />'
						readonly="readonly"
						style="background-color:gray">
				</td>
				
		        <td>
		        	<input
		        		name="position"
		        		value='<c:out value="${employee.position}" />'>
		        </td>
		        
		        <td>
		        	<input
		        		name="name"
		        		value='<c:out value="${employee.name}" />'>
		        </td>
		        
		        <td>
		        	<input
		        		name="phone"
		        		value='<c:out value="${employee.phone}" />'>
		        </td>
		        
		        <td>
		        	<input
		        		name="email"
		        		value='<c:out value="${employee.email}" />'>
		        </td>
	        </tr>
	    </table>
    </form>
    
	<button data-oper="modify"> 수정하기 </button>
		
	<button data-oper="remove"> 삭제하기 </button>
		
	<button data-oper="list"> 목록보기 </button>

</body>

</html>