<!-- 
Created By: AKhil John Sunny
Date : March 09 2023 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String pageTitle = "Update";
String errMsg = (String)session.getAttribute("errors");
if (errMsg == null) { errMsg = ""; }

%>
	<jsp:include page="./inc/header.jsp">
		<jsp:param name="title" value="<%=pageTitle %>" />
	</jsp:include>
	
	
	<!-- 
Form for updating student and faculty goes here, But I was not able to identify how to distinguish between student and faculty -->
	
	
<jsp:include page="./inc/footer.jsp">
			<jsp:param name="footerTitle" value="<%=pageTitle %>" />
		</jsp:include>
		
	</div>

</body>
</html>