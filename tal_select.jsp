<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="java.sql.*" %>
   <%
    request.setCharacterEncoding("UTF-8");
    String id=(String)session.getAttribute("id");
    String url = "jdbc:oracle:thin:@localhost:1521:XE"; 
    String uid = "travis";  String pass = "scott"; 
    String sql =  "select * from bankmember_ where id='"+id+"'"; 
    try{
    	Class.forName("oracle.jdbc.driver.OracleDriver"); 
    	Connection conn = DriverManager.getConnection(url, uid, pass);
    	Statement cre = conn.createStatement();
    	ResultSet rs = cre.executeQuery(sql);
    	rs.next();
    	if(rs.getInt("balance")>0){
    	%>
    <span style="color:blue"><%=id%></span>님의 잔액이 아직 <%=rs.getInt("balance")%>원 남아있습니다.
    <%  }}catch (Exception e) { out.print("거래내역 조회 중 문제 발생. 고객센터로 연락바랍니다. <p>" + e.getMessage()); }%>
       <h2>정말 탈퇴를 원하십니까?</h2>
       <a href="menu.jsp">취소(메뉴로 돌아가기)</a> &nbsp;&nbsp;
       <a href="tal_deleteinsert.jsp">탈회 처리 즉시 진행 요청</a>

