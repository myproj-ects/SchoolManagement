<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- 
Created By: AKhil John Sunny
Date : March 09 2023 -->
<!--Include cdn for bootstrap-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
<!--Scripts for bootstrap-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
<head>
<%@ page import = "java.util.*" %>
<%@ page import = "webd4201johnsunnya.*" %>


<%    
			//Student aStudent = (Student)session.getAttribute("student");

			String message = (String)session.getAttribute("message");
			
			if(message == null)
				message="";

		%>	
<meta charset="UTF-8">
<title>${ param.title }</title>
<link rel="stylesheet" href="./css/theme.css"/>
</head>
<body>

	<div id="container">
		
		<header>
			<p class="header">
				<!-- <a href="./dashboard.jsp">Dashboard</a> -->
			    <a href="./index.jsp">Home</a> 
		
				<% 
					Student aStudent = (Student)session.getAttribute("student");
				    if (aStudent == null) { 
				%>
				        <a href="./register.jsp">Register</a>
				        <a href="./login.jsp">Login</a>
				<%
				    } else {
				%>
				        <a href="./Logout">Logout</a>
				        <a href="./update.jsp">Update</a>
				<%
				    }
				%>
				
			</p>
		<img  height="300px" width="100%" src="./images/java.jpg" alt="Java Banner" /> 
			<h1><%= request.getParameter("title") %></h1>
		</header>