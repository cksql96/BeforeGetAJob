<%@ page 
	language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>


<html lang='ko'>

<head>
	<meta charset="UTF-8">
	<title>Employee List</title>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>

<body>

	<script>
		$(document).ready(function(){
			$("#inp").on("keyup", function() {
				var value = $(this).val().toLowerCase();
				
				$("#gosearch ").filter(function() {
					$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
				});	//filter
			});	//on
		});	//Jquery	
		
		function lpad(empid, length, str) {
			var result = "";
			str = str.toString();
			empid = empid.toString();
			
			if (empid.length < length) {
				for (var i = 0; i < length - empid.length; i++)
				result += str;
			}	//if
			
			return result + empid;
		}	//lpad
		
		class ToCSV {
			
			constructor() {
		        // CSV 버튼에 이벤트 등록
		        document.
		        	querySelector('#btn_csv').
		        	addEventListener('click', e => {
							            e.preventDefault();
							            this.getCSV('직원리스트.csv');
				        			}
		        	)	//Listenr
		    }	//constructor

		    downloadCSV(csv, filename) {
		        let csvFile;
		        let downloadLink;
		        
		        const BOM = "\uFEFF";
		        csv = BOM + csv

		        csvFile = new Blob([csv], {type: "text/csv"})

		        downloadLink = document.createElement("a")
		        downloadLink.download = filename;
		        downloadLink.href = window.URL.createObjectURL(csvFile)
		        downloadLink.style.display = "none"
		        document.body.appendChild(downloadLink)

		        downloadLink.click()
		    }	//downloadCSV

		    getCSV(filename) {
		        const csv = []
		        const rows = document.querySelectorAll("#tbl tr")

		        for (let i = 0; i < rows.length; i++) {
		            const row = [], cols = rows[i].querySelectorAll("td, th")

		            for (let j = 0; j < cols.length; j++)
		                row.push(cols[j].innerText)

		            csv.push(row.join(","))
		        }

		        this.downloadCSV(csv.join("\n"), filename)
		    }	//getSCV
		}	//ToCSV

		document.addEventListener('DOMContentLoaded', e => new ToCSV())
		
		
	</script>

	
    <h1>직원 리스트</h1>

    <table border="1" id="tbl">
        <tr>
            <td colspan="4">
                <input id="inp" placeholder="검색 기능입니다.">
            </td>
            
            <td colspan="2">
            	<button id="btn_csv">CSV다운</button>
            </td>
        </tr>

        <tr>
            <td>직원번호</td>
            <td>직급</td>
            <td>이름</td>
            <td>번호</td>
            <td>이메일</td>
            <td>수정 및 삭제</td>
        </tr>

    	<c:forEach items = "${list}" var="employee">
	        <tr id = 'gosearch'>
	            <td>
	            	<script>
	            		document.write(lpad(${employee.empid},3,0));
	            	</script>	            	
	            </td>
	            <td>${employee.position}</td>
	            <td>${employee.name}</td>
	            <td>${employee.phone}</td>
	            <td>${employee.email}</td>
	            <td>	
					<a href='get?empid=<c:out value="${employee.empid}" />'>
					수정 및 삭제
					</a>
				</td>
					            
	        </tr>
    	</c:forEach>       

    </table>

<a href="register">추가하기</a>
		

</body>


</html>