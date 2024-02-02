<!-- 
Created By: AKhil John Sunny
Date : March 09 2023 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "webd4201johnsunnya.*" %>
<%
	//Session variables 
	String studentId = (String)session.getAttribute("ID");
	String firstName = (String)session.getAttribute("FirstName");
	String lastName = (String)session.getAttribute("LastName");
	String programCode = (String)session.getAttribute("ProgramCode");
	String programDescription = (String)session.getAttribute("ProgramDescription");
	String year = (String)session.getAttribute("Year");
	String email = (String)session.getAttribute("Email");

	if (studentId == null)
		studentId = "";

	if (firstName == null)
		firstName = "";

	if (lastName == null)
		lastName = "";

	if (programCode == null)
		programCode = "";

	if (programDescription == null)
		programDescription = "";

	if (email == null)
		email = "";

%>

<% String title = "Register"; %>

	
	<jsp:include page="./inc/header.jsp">
		<jsp:param name="title" value="<%=title %>" />
	</jsp:include>

<%
// Get the errors from the page
String errors = (String)session.getAttribute("errors");
if (errors == null) { errors = ""; }
Student aStudent = (Student)session.getAttribute("student");
if(!(aStudent == null))
{
	
	session.setAttribute("message", "Please log off to register as another Student.");
	response.sendRedirect("./dashboard.jsp");
} else {
	session.setAttribute("message", "");	
	session.setAttribute("errors", "");
}	
%>

	<div id="contentContainer">
			<p style="color: red;"><%= errors %></p>
			
			<h2>Please Register Below</h2>
			<p>The current date and time is: <%= new java.util.Date() %></p>
			
<!-- From https://getbootstrap.com/docs/5.3/forms/layout/ -->

  <div class="container">
    <h2>Registration Form</h2>
    <form name="Input" method="post" action="./Register">
      <div class="form-group">
        <label for="studentId">Student ID:</label>
        <input type="text" class="form-control" id="studentId" name="ID" value = "<%= studentId %>" placeholder="Enter student ID" required >
      </div>
      <div class="form-group">
        <label for="firstName">First Name:</label>
        <input type="text" class="form-control" id="firstName" name="FirstName" value="<%= firstName %>" placeholder="Enter first name" required>
      </div>
      <div class="form-group">
        <label for="lastName">Last Name:</label>
        <input type="text" class="form-control" id="lastName" name="LastName" value="<%= lastName %>" placeholder="Enter last name" required>
      </div>
      <div class="form-group">
        <label for="programCode">Program Code:</label>
        <input type="text" class="form-control" id="programCode" name="ProgramCode" value="<%= programCode %>" placeholder="Enter program code" required >
      </div>
      <div class="form-group">
        <label for="programDescription">Program Description:</label>
        <input type="text" class="form-control" id="programDescription" name="ProgramDescription" value="<%= programDescription %>" placeholder="Enter program description" required >
      </div>
      <div class="form-group">
        <label for="year">Year:</label>
        <input type="number" class="form-control" id="year" name="Year" value="<%= year %>" placeholder="Enter year" required>
      </div>
      <div class="form-group">
        <label for="email">Email:</label>
        <input type="email" class="form-control" id="email" name="Email" value="<%= email %>" placeholder="Enter email" required >
      </div>
      <div class="form-group">
        <label for="password">Password:</label>
        <input type="password" class="form-control" id="password" name="Password"  placeholder="Password" required>
      </div>
      <div class="form-group">
        <label for="confirmpassword">Confirm Password:</label>
        <input type="password" class="form-control" id="cpassword" name="ConfirmPassword"  placeholder="Confirm Password" required>
      </div>
      
      <button type="submit" class="btn btn-primary">Submit</button>
    </form>
  </div>	
	
	</div>
	
<%@ include file = "./inc/footer.jsp" %>
		
	</div>

</body>
</html>