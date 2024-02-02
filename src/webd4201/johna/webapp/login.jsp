<!-- 
Created By: AKhil John Sunny
Date : March 09 2023 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String pageTitle = "User Authentication";
String errors = (String)session.getAttribute("errors");
if (errors == null) { errors = ""; }

%>
	<jsp:include page="./inc/header.jsp">
		<jsp:param name="title" value="<%=pageTitle %>" />
	</jsp:include>
		
		<div id="contentContainer">
			<p style="color: red;"><%= errors %></p>
			<h2>Please Login Below</h2>
			<p>The current date and time is: <%= new java.util.Date() %></p>
			
			<form method="post" action="./Login">
                 <label class="fixedlabel">Username</label>
                 <input name="username" type="text"><br/>
                 <label class="fixedlabel">Password</label>
                 <input name="password" type="password"><br/>
                 <label class="fixedlabel"></label>
                 <button type="submit">Login</button>
             </form>
             
		</div>
	
		<jsp:include page="./inc/footer.jsp">
			<jsp:param name="footerTitle" value="<%=pageTitle %>" />
		</jsp:include>
		
	</div>

</body>
</html>