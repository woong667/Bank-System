<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
 <% 
 request.setCharacterEncoding("UTF-8"); 
 int a=Integer.parseInt(request.getParameter("del"));
 int b;
 String url = "jdbc:oracle:thin:@localhost:1521:XE"; 
 String uid = "travis";  String pass = "scott"; 
 String sql = "select max(seq) from bankqa_"; 
 String sql2 ="delete from bankqa_ where seq=?";
 String sql3="update bankqa_ set seq=seq-1 where seq=?";
 try{ 
	 Class.forName("oracle.jdbc.driver.OracleDriver"); 
	 Connection conn = DriverManager.getConnection(url, uid, pass); 
	 PreparedStatement pre = conn.prepareStatement(sql); 
	 ResultSet rs = pre.executeQuery(); 
	 rs.next(); /* 현재 가장 높은 seq 찾은 후 */ 
	 b=rs.getInt(1); //b는 max seq이다
	 pre = conn.prepareStatement(sql2); 
	 pre.setInt(1,a);
	 pre.executeUpdate();
	 pre=conn.prepareStatement(sql3);
	 if(a<b)
	 {
	   for(int i=a+1;i<=b;i++)
	   {
		   pre.setInt(1,i);
		   pre.executeUpdate();
	   }
	 }
	 response.sendRedirect("question.jsp"); %> 
	 <%} 
 catch (Exception e) { out.print("질문 삭제 중 오류 : <p>" + e.getMessage()); } %>