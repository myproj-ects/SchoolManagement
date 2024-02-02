<!-- 
Created By: AKhil John Sunny
Date : March 09 2023 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="./inc/header.jsp">
		<jsp:param name="title" value="Student Home Page" />
	</jsp:include>
		
		<div id="contentContainer">
			<h2>Summary</h2>
			<p>The current date and time is: <%= new java.util.Date() %></p>
			<p>This is a webpage to create student mark tracking site for Durham college students.</p>
		</div>
	
		<jsp:include page="./inc/footer.jsp">
			<jsp:param name="footerTitle" value="Main Homepage" />
		</jsp:include>
		
	</div>

</body>
</html>