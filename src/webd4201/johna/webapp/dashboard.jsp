<!-- 
Created By: AKhil John Sunny
Date : March 09 2023 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "webd4201johnsunnya.*" %>
<%
	
	Student aStudent = (Student)session.getAttribute("student");
	if (aStudent == null) { response.sendRedirect("./login.jsp"); }
	else {
%>
		<%    
			
			String message = (String)session.getAttribute("message");
			
			if(message == null)
				message="";

		%>	


	<jsp:include page="./inc/header.jsp">
		<jsp:param name="title" value="Student Dashboard" />
	</jsp:include>
		
		<div id="contentContainer">
			<h2>Welcome <%= aStudent.getFirstName() + ' ' + aStudent.getLastName() %></h2>
			<p>The current date and time is: <%= new java.util.Date() %></p>
			<p>You are successfully  logged in!</p>
			<p style="color: red;"><%= message %></p>
			
		</div>
	
		<jsp:include page="./inc/footer.jsp">
			<jsp:param name="footerTitle" value="User Dashboard" />
		</jsp:include>
		<% } %>
	</div>

</body>
</html>