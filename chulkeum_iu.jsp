<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %> 
<%
request.setCharacterEncoding("UTF-8"); 
String id = (String)session.getAttribute("id"); 
int deposit = Integer.parseInt(request.getParameter("chul_money")); 
String url = "jdbc:oracle:thin:@localhost:1521:XE";
String uid = "travis";  String pass = "scott";
String sql = "insert into banktrade_ values(?,sysdate,0,?,0,'*')"; 
String sql2 = "update bankmember_ set balance=balance-? where id=?";
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection(url, uid, pass);
	PreparedStatement pre = conn.prepareStatement(sql); 
	pre.setString(1,id);pre.setInt(2,deposit);
	pre.executeUpdate();
	pre = conn.prepareStatement(sql2);
	pre.setInt(1,deposit); pre.setString(2,id);
	pre.executeUpdate();  
	%>
	 <script> 
	 alert("<%=deposit%>원이 출금완료 되었습니다. (메뉴로 이동합니다.)");
	 location.href="menu.jsp";
	 </script> 
	 <%
	 } catch (Exception e) { out.print("출금 진행 중 오류가 발생했습니다. 긴급문의: 000-1111-9999 <p>" + e.getMessage()); } %>
    