<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
  request.setCharacterEncoding("UTF-8");
  String id=request.getParameter("id");
  String pw=request.getParameter("pw");
  String name=request.getParameter("name");
  String phone=request.getParameter("phone");
  int age=Integer.parseInt(request.getParameter("age"));
  String url = "jdbc:oracle:thin:@localhost:1521:XE";
  String uid = "travis";  String pass = "scott";
  String sql="select * from bankmember_ where id=?";
  String sql2="select * from bankmember_tal where id=?";
  try{
    	Class.forName("oracle.jdbc.driver.OracleDriver"); 
    	Connection conn = DriverManager.getConnection(url, uid, pass);
    	PreparedStatement pre = conn.prepareStatement(sql);
    	pre.setString(1,id);
    	ResultSet rs = pre.executeQuery();
    	if(rs.next()) //있으면 if문 안으로.
    	{  %>
    	<script>
    	alert("중복된 아이디입니다.");
    	location.href="member.html";
    	</script>
    	<%} else{
    	pre = conn.prepareStatement(sql2);
    	pre.setString(1,id);
    	rs = pre.executeQuery();
    	if(rs.next()) //있으면 if문 안으로.
    	{  %>
    	<script>
    	alert("탈퇴회원과 중복된 아이디입니다.");
    	location.href="member.html";
    	</script>
    	<%} else{
    	response.sendRedirect("member_insert.jsp?id="+id+"&pw="+pw+"&name="+name+"&phone="+phone+"&age="+age); //get방식으로 넘겨주었다.
    	}}
	 } catch (Exception e) { out.print("아이디 중복 체크 진행 중 오류가 발생했습니다. 긴급문의: 000-1111-9999 <p>" + e.getMessage()); } %>
    		

    	   
  