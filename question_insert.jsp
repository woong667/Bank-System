<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
 <% 
 request.setCharacterEncoding("UTF-8"); 
 String id = (String)session.getAttribute("id"); 
 String question = request.getParameter("question"); 
 String url = "jdbc:oracle:thin:@localhost:1521:XE"; 
 String uid = "travis";  String pass = "scott"; 
 String sql = "select max(seq) from bankqa_"; 
 String sql2 = "insert into bankqa_ values(?,?,?,sysdate,'(답변준비중)',null)"; 
 try{ 
	 Class.forName("oracle.jdbc.driver.OracleDriver"); 
	 Connection conn = DriverManager.getConnection(url, uid, pass); 
	 PreparedStatement pre = conn.prepareStatement(sql); 
	 ResultSet rs = pre.executeQuery(); 
	 rs.next(); /* 현재 가장 높은 seq 찾은 후 */ 
	 pre = conn.prepareStatement(sql2); 
	 pre.setInt(1,rs.getInt(1)+1);  /* seq에 1 추가*/ 
	 pre.setString(2,id); 
	 pre.setString(3,question); 
	 pre.executeUpdate(); /* 질문 insert */ 
	 response.sendRedirect("question.jsp"); %> 
	 <%} 
 catch (Exception e) { out.print("질문 등록 중 오류 : <p>" + e.getMessage()); } %>