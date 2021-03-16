<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>


<html lang='ko'>

<head>
	<meta charset="UTF-8">
	<title>Create</title>
	
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>

<body>

	<h1>추가하기</h1>

   	<form role="form" action="/employee/register" method="post" id='frm'>
    
        직급<input type="text" name="position" id="position"><br />
        이름<input type="text" name="name" id="name"><br />
        번호<input type="text" name="phone" id="phone"><br />
        이메일<input type="text" name="email" id="email"><br />

        <!-- <input type="submit" value="추가"> -->
        <input type="button" id="sub" value="추가">
    </form>

 	<a href="list">목록보기</a>


	<script>
	
		$("#sub").click(function javascript_onclick(){
			Check();
		});
	
	
	    function Check() {
    		var checkPosition = document.getElementById("position").value;
    		var checkName = document.getElementById("name").value;
	      	var checkPhone = document.getElementById("phone").value;
	      	var checkEmail = document.getElementById("email").value;	      	
	      	
	      	var emailRegExp = /[a-zA-Z0-9_\.\-]+@[a-zA-Z0-9_\-]+\.[a-zA-Z0-9_\-]+$/;
	      	var phoneRegExp = /[0-9]{8,15}$/;
	
		    if(checkPosition == "" || checkName == "" || checkPhone == "" || checkEmail == ""){
		      	alert("적지 않은 목록이 있습니다.");
		    }
		    else if(!emailRegExp.test(checkEmail)){
		      	alert("이메일 양식이 틀렸습니다.");
		    }
		    else if(!phoneRegExp.test(checkPhone)){
		    	alert("핸드폰 번호가 틀렸습니다.");
		    }
		    else {
		    	alert("가입되었습니다.");
		    	document.getElementById('frm').submit();
		    }	//if-else
	      
	    }	//SignupCheck
	    
  	</script>


</body>

</html>