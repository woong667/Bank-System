<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
 request.setCharacterEncoding("UTF-8");
 String id=request.getParameter("id");
 String pw=request.getParameter("pw");
 String name=request.getParameter("name");
 String phone=request.getParameter("phone");
 int age=Integer.parseInt(request.getParameter("age"));
 String url="jdbc:oracle:thin:@localhost:1521:XE";
 String uid="travis"; String pass="scott";
 String sql =  "insert into bankmember_ values('" + id + "','" + pw + "','" + name + "','" + phone + "'," + age + ", 0, sysdate)"; 
    try{
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection conn=DriverManager.getConnection(url,uid,pass);
    Statement cre=conn.createStatement();
    cre.executeUpdate(sql);
    session.invalidate(); //새로 로그인화면으로 이동하기 전에 기존 로그인 있다면 비활성화
    %>
    <script>
    alert("환영합니다, <%=id%>님!!(로그인 화면으로 이동합니다.)");
    location.href="login.jsp";
    </script>
<%} catch(Exception e) { 
      out.print("회원등록 중 문제 발생.<br>빠른 해결위해 노력하겠습니다!! <p>"+e.getMessage()+"<p>");%>
      <img src="C:\Users\User\Desktop\kk.jpg" width="300" height="200" alt="화난 뚱보">
      <%} %>


    