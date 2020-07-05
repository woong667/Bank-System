<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %> 
<%request.setCharacterEncoding("UTF-8"); 
String id = request.getParameter("id");
String url = "jdbc:oracle:thin:@localhost:1521:XE";
String uid = "travis";  String pass = "scott"; 
String sql =  "select * from bankmember_ where id = '" + id + "'"; 
try{ 
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection(url, uid, pass); 
	Statement cre = conn.createStatement();
	ResultSet rs = cre.executeQuery(sql);
	if(rs.next()) 
	{ 
		session.setAttribute("id", id);
		session.setMaxInactiveInterval(60*60);
		response.sendRedirect("menu.jsp"); 
		}
	else { %>
	 <script> 
	 alert("미등록 아이디입니다~  문의전화: 02)111-1234"); 
	 location.href="login.jsp";
	 </script> <% } // else
		 } 
    catch (Exception e) { 
			 out.print("아이디 체크 문제.. 고객 센터로 연락주세요~ <p>" + e.getMessage()); 
			 } 
			 %>
