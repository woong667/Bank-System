<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import ="java.sql.*" %> 

   <%
    String url = "jdbc:oracle:thin:@localhost:1521:XE";
    String uid = "travis";  String pass = "scott"; 
    int count;
    int balance;
    try{ 
    	Class.forName("oracle.jdbc.driver.OracleDriver"); 
    	Connection conn = DriverManager.getConnection(url, uid, pass);
    	String sql =  "select count(*),sum(balance) from bankmember_";
    	PreparedStatement pre = conn.prepareStatement(sql); 
    	ResultSet rs = pre.executeQuery();
    	rs.next();
    	count=rs.getInt(1);
    	balance=rs.getInt(2);
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KKW은행</title>
</head>
<body style="background-image: url('https://i.pinimg.com/originals/a2/fa/86/a2fa86facb9e9ac867fd07fdd3ceeddf.jpg'); ">
<small><span style="color:gray">총 회원:<%=count%>명<br> 총잔액: <%=balance%>원</span></small>
 <%} catch(Exception e) { 
            out.print("문제 발생<br>빠른 해결위해 노력하겠습니다!! <p>"+e.getMessage()+"<p>");%>
            <img src="C:\Users\User\Desktop\kk.jpg" width="300" height="200" alt="화난 뚱보">
            <%} %>
<div align="center">
<h1>KKW Bank</h1>
<form method="post" action="check_id_select.jsp">

ID:<input type="text" name="id"/><p>
<input type="submit" value="login"/> &nbsp;&nbsp;
<a href="member.html"> 회원가입</a><p>
</form>
 <img src="https://thumbs.dreamstime.com/b/money-money-money-9435686.jpg" width="300" height="360" alt="외계인">
</div>
</body>
</html>