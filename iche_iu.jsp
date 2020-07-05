<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %> 
<%
request.setCharacterEncoding("UTF-8"); 
String id = request.getParameter("name");    //수신인
String login_id=(String)session.getAttribute("id"); //발신인
int money = Integer.parseInt(request.getParameter("money")); 
String url = "jdbc:oracle:thin:@localhost:1521:XE";
String uid = "travis";  String pass = "scott";
String sql = "insert into banktrade_ values(?,sysdate,?,0,2,?)";  //돈들어오는 sql
String sql2="insert into banktrade_ values(?,sysdate,0,?,1,?)";   //돈 빠지는 sql
String sql3 = "update bankmember_ set balance=balance+? where id=?"; //수신인
String sql4="update bankmember_ set balance=balance-? where id=?";   //발신인
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection(url, uid, pass);
	PreparedStatement pre = conn.prepareStatement(sql); pre.setString(1,id);pre.setInt(2,money);pre.setString(3,login_id);
	pre.executeUpdate();
	pre=conn.prepareStatement(sql2);pre.setString(1,login_id);pre.setInt(2,money);pre.setString(3,id);
	pre.executeUpdate();
	pre = conn.prepareStatement(sql3);
	pre.setInt(1,money); pre.setString(2,id);
	pre.executeUpdate();  
	pre = conn.prepareStatement(sql4);
	pre.setInt(1,money); pre.setString(2,login_id);
	pre.executeUpdate();  
	%>
	 <script> 
	 alert("<%=money%>원이 이체 완료 되었습니다. (메뉴로 이동합니다.)");
	 location.href="menu.jsp";
	 </script> 
	 <%
	 } catch (Exception e) { out.print("이체 진행 중 오류가 발생했습니다. 긴급문의: 000-1111-9999 <p>" + e.getMessage()); } %>
    