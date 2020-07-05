<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String[] members = {"a","b","c","d","james"}; 
for(String m: members) { 
	if (id.equals(m)){
	session.setAttribute("id", id);
	session.setMaxInactiveInterval(60*60);  // 테스트 편의 위해 1시간 
	response.sendRedirect("menu.jsp"); 
	}
}%>  <%--for문이 끝나도록 menu.jsp로 넘어가지 않았다면. --%>
 <script> 
 alert("미등록 아이디입니다~  문의전화: 051)123-4567");
 location.href="login.html"; 
 </script>


</body>
</html>