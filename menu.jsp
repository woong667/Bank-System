<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
request.setCharacterEncoding("UTF-8");
String id = (String)session.getAttribute("id");
String url = "jdbc:oracle:thin:@localhost:1521:XE"; 
String uid = "travis";  String pass = "scott";
String sql="select to_char(balance,'9,999,999,999,999') from bankmember_ where id=?";
String sql2="select max(tradedate) from banktrade_ where id=?";
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn=DriverManager.getConnection(url,uid,pass);
	PreparedStatement pre = conn.prepareStatement(sql); 
	pre.setString(1,id); 
	ResultSet rs = pre.executeQuery();
	rs.next(); String balance = rs.getString(1); 
	session.setAttribute("balance",balance);
	pre = conn.prepareStatement(sql2); pre.setString(1,id); 
	rs = pre.executeQuery(); 
	rs.next(); String last = rs.getString(1); 
	
%> 
<body style="background-image: url('https://i.pinimg.com/originals/a2/fa/86/a2fa86facb9e9ac867fd07fdd3ceeddf.jpg'); ">
 <h1>MENU</h1> 
 <hr> 
 <span style="color:blue">
 <%=id%>
 </span>님, 어떤 업무를 하시겠습니까?(잔액:<%=balance%>원) <span style="color:gray; font-size:small">최근거래일시: <%=last%></span><br><hr><p>
 <ul> 
 <li><a href="ipkeum.jsp">입금</a></li>
 <li><a href="chulkeum.jsp">출금</a></li>
 <li><a href="iche.jsp">이체</a></li>
 <li><a href="mytradelist.jsp">나의거래내역</a></li>
 <li><a href = "check_pw.jsp">회원정보 조회 및 변경 </a> </li>
 <li><a href = "tal_select.jsp">회원탈퇴</a> </li>
 <li><a href="question.jsp">질문과답변</a></li>
 <li><a href = "logout.jsp">로그아웃</a> </li>
 <%if(id!=null){
	 if(id.equals("admin")) {%>
	 <li><a href="alldatalist.jsp">전체데이터(관리자용)</a>
 <%}} %>
 </ul></body>
 <%} catch (Exception e) { out.print("잔액 조회 중 문제 발생ㅠ 고객센터로 연락주세요~ <p>" + e.getMessage()); }%>
</html>
