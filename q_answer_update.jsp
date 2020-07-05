<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 
<% 
request.setCharacterEncoding("UTF-8"); 
String id = (String)session.getAttribute("id"); 
String seq = request.getParameter("seq"); 
String answer = request.getParameter("answer"); 
String url = "jdbc:oracle:thin:@localhost:1521:XE"; 
String uid = "travis";  String pass = "scott"; 
String sql = "select * from  bankqa_ where seq=?"; 
String sql2 = "update bankqa_ set answer=?,adate=sysdate where seq=?"; 
try{ 
	Class.forName("oracle.jdbc.driver.OracleDriver"); 
	Connection conn = DriverManager.getConnection(url, uid, pass); 
	PreparedStatement pre = conn.prepareStatement(sql); 
	pre.setString(1,seq); 
	ResultSet rs = pre.executeQuery(); /* 해당 seq 있는지 select */ 
	if(rs.next()){
		pre = conn.prepareStatement(sql2); 
		pre.setString(1, answer); 
		pre.setString(2,seq); 
		pre.executeUpdate(); /* 답변update */ 
		response.sendRedirect("question.jsp"); } 
	else {%> 
	<script> 
	alert("seq 번호를 확인하세요!"); 
	location.href="question.jsp"; 
	</script> <%} } 
catch (Exception e) { out.print("답변 작성 중 오류 : <p>" + e.getMessage()); } %>
    