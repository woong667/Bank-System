<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
 <%request.setCharacterEncoding("UTF-8"); String id = (String)session.getAttribute("id");
 String pw = request.getParameter("pw"); String name = request.getParameter("name"); 
 String age = request.getParameter("age"); String phone = request.getParameter("phone"); 
 String url = "jdbc:oracle:thin:@localhost:1521:XE";
 String uid = "travis";  String pass = "scott"; 
 String sql =  "update bankmember_ set pw=?,name=?,age=?,phone=? where id=?"; 
 try{ 
	 Class.forName("oracle.jdbc.driver.OracleDriver"); 
	 Connection conn = DriverManager.getConnection(url, uid, pass); 
	 PreparedStatement pre = conn.prepareStatement(sql); // 3p 
	 pre.setString(1,pw); pre.setString(2,name); 
	 pre.setString(3,age); pre.setString(4,phone); pre.setString(5,id); 
	 pre.executeUpdate(); // 3p니까 4번에는 sql 없음 
	 %> 
	 <script> 
	 alert("<%=id%>님의 정보가 수정 완료되었습니다.");
	 location.href="myinfo.jsp"; 
	 </script> <%
	 } catch (Exception e) { 
		 out.print("something wrongㅠ 고객센터로 연락주세요~ <p>" + e.getMessage());
		 }%>
    