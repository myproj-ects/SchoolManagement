<!-- 
Created By: AKhil John Sunny
Date : April 09 2023 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "webd4201johnsunnya.*" %>
<%@ page import="java.util.Vector" %>
<%@ page import="java.sql.*" %>

<%	// Connect to database
	Connection c = DatabaseConnect.initialize();
	User.initialize(c);
	//create a user object
	Vector<User> users = User.retrieveAll();
	User.terminate();
%>
		


	<jsp:include page="./inc/header.jsp">
		<jsp:param name="title" value="Admin Dashboard" />
	</jsp:include>
		
		<div id="mainBody">
		<table border="1" cellspacing="0" cellpadding="3">
			<thead>
				<tr>
					<th>Edit</th>
					<th>User ID</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Last Access</th>
					<th>Enrol Date</th>
					<th>Type</th>
					<th>Delete</th>
				</tr>
			<thead>
			<tbody>
			<%
			// Iterating theough the size of users to get the all the users
				for (int i = 0; i < users.size(); i++) {
					User aUser = users.get(i);
				// Create a table with user elements	
			%>
				<tr>
				    <!-- Link for edit page -->
					<td><a href="./update.jsp?<%=aUser.getId() %>">edit</a></td>
					<td><%=aUser.getId() %></td>
					<td><%=aUser.getFirstName() %></td>
					<td><%=aUser.getLastName() %></td>
					<td><%=aUser.getEmailAddress() %></td>
					<td><%=aUser.getLastAccess() %></td>
					<td><%=aUser.getEnrolDate() %></td>
					<td><%=aUser.getType() %></td>
					<!-- Calls the UserDelete servlet if clicked -->
					<td><a href="./UserDelete?id=<%=aUser.getId() %>">delete</a></td>
				</tr>
			<% } %>
			</tbody>			
		</table>
	</div>
	
		<jsp:include page="./inc/footer.jsp">
			<jsp:param name="footerTitle" value="User Dashboard" />
		</jsp:include>
		
	</div>

</body>
</html>