<%@page import="java.util.List
           " 
%><%@taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"
%><%@taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"
%><%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"
%><%@taglib prefix="spring" uri="http://www.springframework.org/tags"
%><%
	response.setHeader("Pragma", "No-cache");
	response.setDateHeader("Expires", 0);
	response.setHeader("Cache-Control", "no-cache");
	
%><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Manage Car List</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
    	$("a.modify").click( function() {
			var tr = this.parentNode.parentNode;
			var tds = tr.getElementsByTagName("td");
			
			var frm1 = document.frm1;
			frm1.carId.value = tds[0].innerText;
			frm1.make.value = tds[1].innerText;
			frm1.model.value = tds[2].innerText;
			frm1.description.value = tds[3].innerText;
		});
	});

</script>
<style>
	table, th, td {
               border: 1px solid black;
               border-spacing: 0px;
            }
            th, td {
                padding: 10px;
            }
</style>
</head>
<body>
<h2>Car List</h2>
<table>
	<thead>
		<th>Id</th>
		<th>Make</th>
		<th>Model</th>
		<th>Description</th>
		<th>Modify</th>
		<th>Delete</th>
	</thead>
	<tbody>
	<c:if test="${carList eq null || carList.size() eq 0 }">
	<tr><td colspan="5">Car List is Empty!!!</td></tr>
	</c:if>
	<c:if test="${carList ne null && carList.size() ge 0 }">
	<c:forEach items="${carList }" var="car">
	<tr>
		<td>${car.id }</td>
		<td>${car.make }</td>
		<td>${car.model }</td>
		<td>${car.description }</td>
		<td><a href="javascript:" class="modify">modify</a></td>
		<td><a href="/delete.do?id=${car.id }">delete</a></td>
	</tr>
	</c:forEach>
	</c:if>
	</tbody>
</table>
<br />
        <h2>Add Car</h2>
        <form name="frm1" action="/addCar.do" method="POST">
        	<input type="text" id="carId" name="carId" />
            Make <input type="text" id="make" name="make" /><br />
            Model <input type="text" id="model" name="model" /><br />
            Description <textarea rows="5" cols="70" id="description" name="description"></textarea>
            <input type="submit" />
        </form>
        <h2>Search for cars</h2>
        <form action="/search.do" method="GET">
            <input type="text" name="search" id="search" th:value="${search}" />
            <input type="submit" value="Search" />
        </form>
</body>
</html>